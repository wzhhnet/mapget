#include <filesystem>
#include <fstream>
#include <zstd.h>
#include <sqlite3.h>
#include <simfil/model/json.h>
#include <zserio/DebugStringUtil.h>
#include <zserio/BitStreamReader.h>
#include <nds/smart/tile/SmartLayerTile.h>
#include <nds/road/layer/RoadLayer.h>
#include <nds/road/layer/RoadGeometryLayer.h>
#include <nds/rules/layer/RoadRulesLayer.h>
#include <nds/characteristics/layer/RoadCharacteristicsLayer.h>
#include "mapget/http-datasource/datasource-server.h"
#include "mapget/log.h"

namespace mapget
{

template <typename VAL> struct ValidityAccessor;

template <>
struct ValidityAccessor<::nds::road::reference::types::RoadRangeValidity> {
    static auto &get(const ::nds::road::reference::types::RoadRangeValidity &v)
    {
        return v.ranges;
    }
};

template <>
struct ValidityAccessor<::nds::road::reference::types::RoadPositionValidity> {
    static auto &
    get(const ::nds::road::reference::types::RoadPositionValidity &v)
    {
        return v.positions;
    }
};

template <typename T> struct TraitAttrLayer;

template <>
struct TraitAttrLayer<::nds::rules::attributes::RulesRoadRangeAttributeType> {
    static auto
    name(const ::nds::rules::attributes::RulesRoadRangeAttributeType &v)
    {
        return "RulesRoadLayer";
    }
};

template <>
struct TraitAttrLayer<
    ::nds::rules::attributes::RulesRoadPositionAttributeType> {
    static auto
    name(const ::nds::rules::attributes::RulesRoadPositionAttributeType &v)
    {
        return "RulesRoadLayer";
    }
};

template <>
struct TraitAttrLayer<::nds::rules::attributes::RulesTransitionAttributeType> {
    static auto
    name(const ::nds::rules::attributes::RulesTransitionAttributeType &v)
    {
        return "RulesRoadLayer";
    }
};

template <>
struct TraitAttrLayer<
    ::nds::characteristics::attributes::CharacsRoadRangeAttributeType> {
    static auto
    name(const ::nds::characteristics::attributes::CharacsRoadRangeAttributeType
             &v)
    {
        return "RoadCharacteristicsLayer";
    }
};

template <>
struct TraitAttrLayer<
    ::nds::characteristics::attributes::CharacsRoadPositionAttributeType> {
    static auto name(const ::nds::characteristics::attributes::
                         CharacsRoadPositionAttributeType &v)
    {
        return "RoadCharacteristicsLayer";
    }
};

// Class to encapsulate all logic of our data source
class FileStoreDataSource
{
  private:
    DataSourceServer ds;
    std::string fn_;
    int port = 0;
    int servedTiles = 0;

  private:
    template <typename REF, typename VAL, typename ATTR_T, typename ATTR_V,
              typename PROP_T, typename PROP_V>
    using AttrMapList =
        ::nds::core::attributemap::AttributeMapList<REF, VAL, ATTR_T, ATTR_V,
                                                    PROP_T, PROP_V>;
    template <typename REF, typename VAL, typename ATTR_T, typename ATTR_V,
              typename PROP_T, typename PROP_V>
    using AttrMap =
        ::nds::core::attributemap::AttributeMap<REF, VAL, ATTR_T, ATTR_V,
                                                PROP_T, PROP_V>;

    using RulesRoadRangeAttrMap = ::nds::core::attributemap::AttributeMap<
        ::nds::road::reference::types::RoadReference,
        ::nds::road::reference::types::RoadRangeValidity,
        ::nds::rules::attributes::RulesRoadRangeAttributeType,
        ::nds::rules::attributes::RulesRoadRangeAttributeValue,
        ::nds::rules::properties::RulesPropertyType,
        ::nds::rules::properties::RulesPropertyValue>;

    using RulesRoadPositionAttMap = ::nds::core::attributemap::AttributeMap<
        ::nds::road::reference::types::RoadReference,
        ::nds::road::reference::types::RoadPositionValidity,
        ::nds::rules::attributes::RulesRoadPositionAttributeType,
        ::nds::rules::attributes::RulesRoadPositionAttributeValue,
        ::nds::rules::properties::RulesPropertyType,
        ::nds::rules::properties::RulesPropertyValue>;

    using RulesTransitionAttrMap = ::nds::core::attributemap::AttributeMap<
        ::nds::road::reference::types::TransitionReference,
        ::nds::core::attributemap::Validity,
        ::nds::rules::attributes::RulesTransitionAttributeType,
        ::nds::rules::attributes::RulesTransitionAttributeValue,
        ::nds::rules::properties::RulesPropertyType,
        ::nds::rules::properties::RulesPropertyValue>;

  public:
    // The constructor
    FileStoreDataSource(const std::string &filestore, int port)
        : ds(loadDataSourceInfoFromJson()), fn_(filestore), port(port)
    {
        // Handle tile requests
        ds.onTileFeatureRequest([this](auto &&tile) { fill(tile); });
    }

    void fill(TileFeatureLayer::Ptr const &tile)
    {
        using namespace nds::smart::tile;

        sqlite3 *db = nullptr;
        int rc = sqlite3_open_v2(fn_.c_str(), &db, SQLITE_OPEN_READONLY, NULL);
        if (rc != SQLITE_OK) {
            log().error("Cannot open filestore {}", fn_);
            if (db) sqlite3_close_v2(db);
            return;
        }

        auto pId = packedTileId(tile->tileId().sw(), tile->tileId().z());
        sqlite3_stmt *stmt = nullptr;
        std::string sql =
            "SELECT * FROM tileTable WHERE tileId = " + std::to_string(pId);
        rc = sqlite3_prepare_v2(db, sql.c_str(), sql.size(), &stmt, nullptr);
        if (rc != SQLITE_OK) {
            log().error("Failed to prepare statement: {}", sqlite3_errmsg(db));
            if (db) sqlite3_close_v2(db);
            return;
        }

        while ((rc = sqlite3_step(stmt)) == SQLITE_ROW) {
            const void *blob = sqlite3_column_blob(stmt, 1);
            int blobSize = sqlite3_column_bytes(stmt, 1);
            auto smart = zsDeserialize<SmartLayerTile>(blob, blobSize);
            fillBySmartLayerTile(tile, smart);
        }
        if (stmt) sqlite3_finalize(stmt);
        if (db) sqlite3_close_v2(db);
    }

    void fillBySmartLayerTile(TileFeatureLayer::Ptr const &tile,
                              nds::smart::tile::SmartLayerTile const &smart)
    {
        using namespace nds::road::layer;
        using namespace nds::rules::layer;
        using namespace nds::characteristics::layer;

        //* Add some ID parts that are shared by all features in the tile.
        tile->setIdPrefix({{"tileId", smart.tileId}});

        for (uint16_t i = 0; i < smart.header.numDataLayers; ++i) {
            auto &layer = smart.layers[i].layer;
            auto &target = layer.externDescriptor.target;
            auto &ld = layer.data;
            auto buf = deCompress(ld.getData().data(), ld.getByteSize());
            if (target == "road.layer.RoadLayer") {
                auto roadLayer = zsDeserialize<RoadLayer>(buf.getBuffer(),
                                                          buf.getByteSize());
                fillByRoadLayer(tile, roadLayer);
            }
            if (target == "road.layer.RoadGeometryLayer") {
                auto geomLayer = zsDeserialize<RoadGeometryLayer>(
                    buf.getBuffer(), buf.getByteSize());
                fillByRoadGeometryLayer(tile, geomLayer);
            }
            if (target == "rules.layer.RoadRulesLayer") {
                auto rulesLayer = zsDeserialize<RoadRulesLayer>(
                    buf.getBuffer(), buf.getByteSize());
                fillByRoadRulesLayer(tile, rulesLayer);
            }
            if (target == "characteristics.layer.RoadCharacteristicsLayer") {
                auto charLayer = zsDeserialize<RoadCharacteristicsLayer>(
                    buf.getBuffer(), buf.getByteSize());
                fillByRoadCharacteristicsLayer(tile, charLayer);
            }
        }
    }

    void fillByRoadLayer(TileFeatureLayer::Ptr const &tile,
                         nds::road::layer::RoadLayer const &layer)
    {
        using namespace nds::road::layer;
        auto &roads = layer.roadList.roads;
        for (const auto &road : roads) {
            auto feat = tile->newFeature("Road", {{"roadId", road.id.id}});
            feat->attributes()->addField("length",
                                         static_cast<int64_t>(road.length));
        }
        auto &inters = layer.intersectionList.intersections;
        auto shift = layer.coordShift;
        for (const auto &inter : inters) {
            auto feat = tile->newFeature("Intersection",
                                         {{"intersectionId", inter.id}});
            feat->addPoint({strun32ToDegree(inter.position.longitude << shift),
                            strun32ToDegree(inter.position.latitude << shift)});
            feat->attributes()->addBool("isArtificial", inter.isArtificial);
            feat->attributes()->addField("zLevel",
                                         static_cast<int16_t>(inter.zLevel));

            auto attrLayer =
                feat->attributeLayers()->newLayer("RoadRulesLayer");
            auto attr = attrLayer->newAttribute("IntersectionRoadReference");
            if (auto ptr = buildNode(inter.connectedRoads, tile))
                attr->addField("connectedRoads", ptr);
        }
    }

    void
    fillByRoadGeometryLayer(TileFeatureLayer::Ptr const &tile,
                            nds::road::layer::RoadGeometryLayer const &layer)
    {
        using namespace nds::road::layer;
        using namespace nds::core::geometry;
        using BuffersTag =
            zserio::detail::ChoiceTag<nds::core::geometry::Buffers>::Tag;

        auto &geomlayer = layer.roadShapes;
        auto shift = geomlayer.coordShiftXY;
        auto *lines = geomlayer.buffers.get_if<BuffersTag::lines2D>();
        if (!lines) {
            log().warn("No lines in RoadGeometryLayer");
            return;
        }
        for (::zserio::VarSize i = 0; i < lines->size(); ++i) {
            auto &line = (*lines)[i];
            uint32_t roadId = 0;
            if (geomlayer.identifier.has_value()) {
                /// ::nds::road::reference::types::RoadId
                auto var4byteId = geomlayer.identifier.value()[i];
                roadId = var4byteId.id;
            }
            /// Find a freature for each link
            auto feat = tile->find(
                "Road", KeyValueViewPairs{{"tileId", getTileId(tile)},
                                          {"roadId", roadId}});
            if (feat) {
                auto geoline = feat->geom()->newGeometry(GeomType::Line,
                                                         line.numPositions);
                for (const auto &p : line.positions) {
                    geoline->append({strun32ToDegree(p.longitude << shift),
                                     strun32ToDegree(p.latitude << shift)});
                }
            }
        }
    }

    void fillByRoadRulesLayer(TileFeatureLayer::Ptr const &tile,
                              nds::rules::layer::RoadRulesLayer const &layer)
    {
        // ::zserio::Optional<::nds::rules::instantiations::RulesRoadRangeAttributeMapList>
        if (layer.roadRangeAttributeMaps)
            fillByAttrMapList(tile, layer.shift, *layer.roadRangeAttributeMaps);

        if (layer.roadPositionAttributeMaps)
            fillByAttrMapList(tile, layer.shift,
                              *layer.roadPositionAttributeMaps);

        if (layer.transitionAttributeMaps)
            fillByAttrMapList(tile, layer.shift,
                              *layer.transitionAttributeMaps);
        // TODO
    }

    void fillByRoadCharacteristicsLayer(
        TileFeatureLayer::Ptr const &tile,
        nds::characteristics::layer::RoadCharacteristicsLayer const &layer)
    {
        // characsRoadRangeMaps
        if (layer.characsRoadRangeMaps)
            fillByAttrMapList(tile, layer.shift, *layer.characsRoadRangeMaps);

        // TODO: characsRoadPositionMaps
        // TODO:characsRoadRangeSets
        // TODO:characsRoadPositionSets
        // TODO:characsTransitionMaps
        // TODO:characsTransitionSets
    }

    // The function to load the DataSourceInfo from a JSON file
    static DataSourceInfo loadDataSourceInfoFromJson()
    {
        return DataSourceInfo::fromJson(R"(
        {
            "mapId": "Nds.live",
            "layers": {
                "RoadLayer": {
                    "featureTypes": [
                        {
                            "name": "Road",
                            "uniqueIdCompositions": [
                                [
                                    {
                                        "partId": "tileId",
                                        "description": "String which identifies the map area.",
                                        "datatype": "U32"
                                    },
                                    {
                                        "partId": "roadId",
                                        "description": "Globally Unique 32b integer.",
                                        "datatype": "U32"
                                    }
                                ]
                            ]
                        },
                        {
                            "name": "Intersection",
                            "uniqueIdCompositions": [
                                [
                                    {
                                        "partId": "tileId",
                                        "description": "String which identifies the map area.",
                                        "datatype": "U32"
                                    },
                                    {
                                        "partId": "intersectionId",
                                        "description": "Globally Unique 32b integer for intersection.",
                                        "datatype": "U32"
                                    }
                                ]
                            ]
                        }
                    ]
                }
            }
        }
    )"_json);
    }

    // The function to start the server
    void run()
    {
        ds.go("0.0.0.0", port);
        log().info("Running...");
        ds.waitForSignal();
    }

  private:
    int32_t degreeToSturn32(double deg)
    {
        return static_cast<int32_t>(deg * (1u << 31) / 180.0);
    }

    double strun32ToDegree(int32_t s32)
    {
        return static_cast<double>(s32) * 180.0 / (1u << 31);
    }

    /// Morton code = x31 y30 x30 … y1 x1 y0 x0
    uint64_t generateMortonCode(int32_t x, int32_t y)
    {
        uint64_t morton = 0;
        for (int i = 0; i < 32; ++i) {
            morton |= ((x >> i) & 1ULL) << (2 * i);
            morton |= ((y >> i) & 1ULL) << (2 * i + 1);
        }
        return morton;
    }

    uint32_t packedTileId(Point sw, uint16_t z)
    {
        int32_t sw_lon = degreeToSturn32(sw.x);
        int32_t sw_lat = degreeToSturn32(sw.y);
        uint64_t mc = generateMortonCode(sw_lon, sw_lat);
        /// most significant bits = 2n+1
        uint8_t ms = 2 * z + 1;
        return static_cast<uint32_t>((mc >> (63 - ms)) | (1ULL << (16 + z)));
    }

    zserio::BitBuffer deCompress(const void *cdata, size_t csize)
    {
        size_t const rsize = ZSTD_getFrameContentSize(cdata, csize);
        zserio::BitBuffer rbuf(rsize * 8);
        ZSTD_decompress(rbuf.getBuffer(), rsize, cdata, csize);
        return rbuf;
    }

    template <typename T> T zsDeserialize(const void *blob, int size)
    {
        T obj;
        try {
            zserio::BitStreamReader reader(
                reinterpret_cast<const uint8_t *>(blob), size * 8);
            zserio::detail::read(reader, obj);
        } catch (const std::exception &e) {
            log().error("Failed to deserialize blob: {}", e.what());
        }
        return obj;
    }

    template <typename REF, typename VAL, typename ATTR_T, typename ATTR_V,
              typename PROP_T, typename PROP_V>
    void fillByAttrMapList(TileFeatureLayer::Ptr const &tile,
                           ::nds::core::geometry::CoordShift shift,
                           const AttrMapList<REF, VAL, ATTR_T, ATTR_V, PROP_T,
                                             PROP_V> &attrMapList)
    {
        for (const auto &attrMap : attrMapList.maps) {
            fillByAttrMap(tile, shift, attrMap);
        }
    }

    template <typename REF, typename VAL, typename ATTR_T, typename ATTR_V,
              typename PROP_T, typename PROP_V>
    void fillByAttrMap(
        TileFeatureLayer::Ptr const &tile,
        ::nds::core::geometry::CoordShift shift,
        const AttrMap<REF, VAL, ATTR_T, ATTR_V, PROP_T, PROP_V> &attrMap)
    {
        using namespace ::nds::rules::attributes;
        using namespace ::nds::core::attributemap;
        auto attrCode = static_cast<size_t>(attrMap.attributeTypeCode);
        auto attrName = zserio::EnumTraits<ATTR_T>().names[attrCode];
        auto attrValNodes = buildNodeList(attrMap.attributeValues, tile);
        auto attrCondNodes = buildNodeList(attrMap.attributeConditions, tile);

        for (FeatureIterator i = 0; i < attrMap.feature; ++i) {
            const auto &featRef = attrMap.featureReferences[i];
            uint32_t roadId;
            Validity::Direction dir;
            if (featRef.isDirected) {
                zserio::View v(featRef.directedRoadReference.value());
                roadId = static_cast<uint32_t>(v.getId());
                dir = v.isPositive() ? Validity::Direction::Positive
                                     : Validity::Direction::Negative;
            } else {
                roadId = featRef.roadId->id;
            }
            auto attrLayer =
                getAttributeLayer(tile, attrMap.attributeTypeCode, "Road",
                                  KeyValueViewPairs{{"tileId", getTileId(tile)},
                                                    {"roadId", roadId}});
            if (attrLayer) {
                const auto &attrRange = attrMap.featureValidities[i];
                const auto &attrIt = attrMap.featureValuePtr[i];
                auto attr = attrLayer->newAttribute(attrName);
                if (dir != Validity::Empty) attr->validity()->newDirection(dir);
                setAttributeValidity(attr, shift, attrRange);
                attr->addField("attributeValue", attrValNodes[attrIt]);
                /// Conditions
                if (attrMap.attributeConditions[attrIt].numConditions)
                    attr->addField("conditions", attrCondNodes[attrIt]);
            }
        }
    }

    void fillByAttrMap(TileFeatureLayer::Ptr const &tile,
                       ::nds::core::geometry::CoordShift shift,
                       const RulesTransitionAttrMap &attrMap)
    {
        using namespace ::nds::rules::attributes;
        using namespace ::nds::core::attributemap;
        using namespace ::nds::road::reference::types;
        auto attrCode = static_cast<size_t>(attrMap.attributeTypeCode);
        auto attrName =
            zserio::EnumTraits<RulesTransitionAttributeType>().names[attrCode];

        auto attrValNodes = buildNodeList(attrMap.attributeValues, tile);
        auto attrCondNodes = buildNodeList(attrMap.attributeConditions, tile);

        for (FeatureIterator i = 0; i < attrMap.feature; ++i) {
            const auto &featRef = attrMap.featureReferences[i];
            auto transRefType = zserio::EnumTraits<TransitionReferenceType>()
                                    .names[static_cast<size_t>(featRef.type)];

            model_ptr<AttributeLayer> attrLayer;
            /// Transition reference to a complete intersection or a list of
            /// transitions within one intersection.
            if (featRef.intersectionTransition.has_value()) {
                auto trans = featRef.intersectionTransition.value();
                attrLayer = getAttributeLayer(
                    tile, attrMap.attributeTypeCode, "Intersection",
                    KeyValueViewPairs{
                        {"tileId", getTileId(tile)},
                        {"intersectionId", trans.intersectionId}});
                if (attrLayer) {
                    auto attr = attrLayer->newAttribute("TransitionReference");
                    if (auto ptr = buildNode(trans, tile))
                        attr->addField("intersectionTransition", ptr);
                }
            }
            /// Transition reference to a sequence of roads within the same
            /// tile.
            if (featRef.transitionPathReference.has_value()) {
                auto transPaths = featRef.transitionPathReference.value();
                if (!transPaths.numRoads) break;
                const auto &entryRoad = transPaths.roads[0];
                zserio::View v(entryRoad);
                attrLayer = getAttributeLayer(
                    tile, attrMap.attributeTypeCode, "Road",
                    KeyValueViewPairs{{"tileId", getTileId(tile)},
                                      {"roadId", v.getId()}});
                if (attrLayer) {
                    auto attr = attrLayer->newAttribute("TransitionReference");
                    if (auto ptr = buildNode(transPaths, tile))
                        attr->addField("transitionPathReference", ptr);
                }
            }
            /// TODO: transitionGeoPathReference

            /// attributeValues
            if (attrLayer) {
                const auto &attrRange = attrMap.featureValidities[i];
                const auto &attrIt = attrMap.featureValuePtr[i];
                auto attr = attrLayer->newAttribute(attrName);
                attr->addField("attributeValue", attrValNodes[attrIt]);
                /// Conditions
                if (attrMap.attributeConditions[attrIt].numConditions)
                    attr->addField("conditions", attrCondNodes[attrIt]);
            }
        }
    }

    template <typename VAL>
    void setAttributeValidity(model_ptr<Attribute> &attr,
                              ::nds::core::geometry::CoordShift shift,
                              const VAL &validity)
    {
        using namespace ::nds::road::reference::types;
        using EnumType = std::decay_t<decltype(validity.type)>;
        if (validity.type == EnumType::COMPLETE) return;

        auto &optVals = ValidityAccessor<VAL>::get(validity);
        if (!optVals.has_value()) return;
        for (const auto &val : *optVals) {
            switch (validity.type) {
            case EnumType::POSITION:
                fillRoadVilidity(attr, shift, val);
                break;

            case EnumType::LENGTH:
                fillRoadLength(attr, val);
                break;

            case EnumType::GEOMETRY:
                fillRoadGeometry(attr, val);
                break;

            default:
                break;
            }
        }
    }

    void
    fillRoadVilidity(model_ptr<Attribute> &attr,
                     ::nds::core::geometry::CoordShift shift,
                     const ::nds::road::reference::types::RoadRangeChoice &val)
    {
        using namespace ::nds::road::reference::types;
        const auto &v = val.get<RoadRangeChoice::Tag::validityRange>();
        attr->validity()->newRange(
            {strun32ToDegree(v.start.position.longitude << shift),
             strun32ToDegree(v.start.position.latitude << shift)},
            {strun32ToDegree(v.end.position.longitude << shift),
             strun32ToDegree(v.end.position.latitude << shift)});
    }

    void fillRoadVilidity(
        model_ptr<Attribute> &attr, ::nds::core::geometry::CoordShift shift,
        const ::nds::road::reference::types::RoadPositionChoice &val)
    {
        using namespace ::nds::road::reference::types;
        const auto &v = val.get<RoadPositionChoice::Tag::validityPosition>();
        attr->validity()->newPoint(
            {strun32ToDegree(v.position.longitude << shift),
             strun32ToDegree(v.position.latitude << shift)});
    }

    void
    fillRoadLength(model_ptr<Attribute> &attr,
                   const ::nds::road::reference::types::RoadRangeChoice &val)
    {
        using namespace ::nds::road::reference::types;
        const auto &v = val.get<RoadRangeChoice::Tag::lengthRange>();
        attr->validity()->newRange(
            Validity::GeometryOffsetType::RelativeLengthOffset,
            static_cast<int32_t>(v.range.start.position),
            static_cast<int32_t>(v.range.end.position));
    }

    void
    fillRoadLength(model_ptr<Attribute> &attr,
                   const ::nds::road::reference::types::RoadPositionChoice &val)
    {
        using namespace ::nds::road::reference::types;
        const auto &v = val.get<RoadPositionChoice::Tag::lengthPosition>();
        attr->validity()->newPoint(
            Validity::GeometryOffsetType::RelativeLengthOffset,
            static_cast<int32_t>(v.position.position));
    }

    void
    fillRoadGeometry(model_ptr<Attribute> &attr,
                     const ::nds::road::reference::types::RoadRangeChoice &val)
    {
        using namespace ::nds::road::reference::types;
        const auto &v = val.get<RoadRangeChoice::Tag::geometryRange>();
        attr->validity()->newRange(Validity::GeometryOffsetType::GeoPosOffset,
                                   static_cast<int32_t>(v.start),
                                   static_cast<int32_t>(v.end));
    }

    void fillRoadGeometry(
        model_ptr<Attribute> &attr,
        const ::nds::road::reference::types::RoadPositionChoice &val)
    {
        using namespace ::nds::road::reference::types;
        const auto &v = val.get<RoadPositionChoice::Tag::geometryPosition>();
        attr->validity()->newPoint(Validity::GeometryOffsetType::GeoPosOffset,
                                   static_cast<int32_t>(v));
    }

    uint32_t getTileId(TileFeatureLayer::Ptr const &tile)
    {
        if (auto prefix = tile->getIdPrefix()) {
            auto var = prefix->get("tileId")->value();
            auto *id = std::get_if<int64_t>(&var);
            return id ? *id : 0;
        }
        return 0;
    }

    template <typename ATTR_T>
    model_ptr<AttributeLayer>
    getAttributeLayer(TileFeatureLayer::Ptr const &tile, const ATTR_T &attrCode,
                      std::string_view const &type,
                      KeyValueViewPairs const &queryIdParts)
    {
        model_ptr<AttributeLayer> attrLayer;
        auto feat = tile->find(type, queryIdParts);
        if (feat) {
            auto attrName = TraitAttrLayer<ATTR_T>::name(attrCode);
            feat->attributeLayers()->forEachLayer(
                [&](std::string_view name,
                    model_ptr<AttributeLayer> const &layer) -> bool {
                    if (name == attrName) attrLayer = layer;
                    return attrLayer ? false : true; // break loop if false
                });
            if (!attrLayer)
                attrLayer = feat->attributeLayers()->newLayer(attrName);
        }
        return attrLayer;
    }

    template <typename T>
    ::zserio::Vector<simfil::ModelNode::Ptr>
    buildNodeList(const ::zserio::Vector<T> &vec,
                  TileFeatureLayer::Ptr const &tile)
    {
        ::zserio::Vector<simfil::ModelNode::Ptr> ret;
        for (const auto &v : vec) ret.push_back(buildNode(v, tile));
        return ret;
    }

    template <typename ATTR_T, typename ATTR_V>
    ::zserio::Vector<simfil::ModelNode::Ptr> buildNodeList(
        const ::zserio::Vector<
            ::nds::core::attributemap::Attribute<ATTR_T, ATTR_V>> &vec,
        TileFeatureLayer::Ptr const &tile)
    {
        ::zserio::Vector<simfil::ModelNode::Ptr> ret;
        for (const auto &attr : vec) {
            if (auto ptr = buildNode(attr.attributeValue, tile))
                ret.push_back(ptr);
        }
        return ret;
    }

    template <typename T>
    simfil::ModelNode::Ptr buildNode(const T &v,
                                     TileFeatureLayer::Ptr const &tile)
    {
        auto str = zserio::toJsonString(v, 0);
        auto j = nlohmann::json::parse(str);
        return buildNode(j, tile);
    }

    template <typename T>
    simfil::ModelNode::Ptr buildNode(const ::zserio::Vector<T> &vec,
                                     TileFeatureLayer::Ptr const &tile)
    {
        auto array = tile->newArray(vec.size());
        for (const auto &e : vec) {
            if (auto ptr = buildNode(e, tile)) array->append(ptr);
        }
        return array;
    }

    simfil::ModelNode::Ptr buildNode(const nlohmann::json &j,
                                     TileFeatureLayer::Ptr const &tile)
    {
        using namespace nlohmann;

        switch (j.type()) {
        case json::value_t::null:
            return {};
        case json::value_t::boolean:
            return tile->newSmallValue(j.get<bool>());
        case json::value_t::number_float:
            return tile->newValue(j.get<double>());
        case json::value_t::number_unsigned:
            return tile->newValue((int64_t)j.get<uint64_t>());
        case json::value_t::number_integer:
            return tile->newValue(j.get<int64_t>());
        case json::value_t::string:
            return tile->newValue(
                (StringId)tile->strings()->emplace(j.get<std::string>()));
        default:
            break;
        }

        if (j.is_object()) {
            auto object = tile->newObject(j.size());
            for (auto &&[key, value] : j.items()) {
                if (auto ptr = buildNode(value, tile))
                    object->addField(key, ptr);
            }
            return object;
        }

        if (j.is_array()) {
            auto array = tile->newArray(j.size());
            for (const auto &value : j) {
                if (auto ptr = buildNode(value, tile)) array->append(ptr);
            }
            return array;
        }

        return {};
    }
};

} // namespace mapget
