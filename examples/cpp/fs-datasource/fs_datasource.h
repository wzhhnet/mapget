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
#include "mapget/http-datasource/datasource-server.h"
#include "mapget/log.h"

namespace mapget
{

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

    using RulesRoadRangeAttrMap = ::nds::core::attributemap::AttributeMap<
        ::nds::road::reference::types::RoadReference,
        ::nds::road::reference::types::RoadRangeValidity,
        ::nds::rules::attributes::RulesRoadRangeAttributeType,
        ::nds::rules::attributes::RulesRoadRangeAttributeValue,
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
        if (layer.roadRangeAttributeMaps) {
            fillByAttrMapList(tile, *layer.roadRangeAttributeMaps);
        }
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
                           const AttrMapList<REF, VAL, ATTR_T, ATTR_V, PROP_T,
                                             PROP_V> &attrMapList)
    {
        for (const auto &attrMap : attrMapList.maps) {
            fillByAttrMap(tile, attrMap);
        }
    }

    void fillByAttrMap(TileFeatureLayer::Ptr const &tile,
                       const RulesRoadRangeAttrMap &attrMap)
    {
        using namespace ::nds::rules::attributes;
        using namespace ::nds::core::attributemap;
        auto attrCode = static_cast<size_t>(attrMap.attributeTypeCode);
        auto attrName =
            zserio::EnumTraits<RulesRoadRangeAttributeType>().names[attrCode];
        for (FeatureIterator i = 0; i < attrMap.feature; ++i) {
            const auto &featRef = attrMap.featureReferences[i];
            if (featRef.roadId) {
                auto feat = tile->find(
                    "Road", KeyValueViewPairs{{"tileId", getTileId(tile)},
                                              {"roadId", featRef.roadId->id}});
                model_ptr<AttributeLayer> attrLayer;
                feat->attributeLayers()->forEachLayer([&](std::string_view name, model_ptr<AttributeLayer> const& layer)->bool {
                    if (name == "RoadRulesLayer") {
                        attrLayer = layer;
                        return true;
                    }
                    return false;
                });
                if (!attrLayer)
                    attrLayer = feat->attributeLayers()->newLayer("RoadRulesLayer");
                auto attr = attrLayer->newAttribute(attrName);
                const auto &attrIt = attrMap.featureValuePtr[i];
                const auto &attrVal = attrMap.attributeValues[attrIt];
                auto valJsonStr = zserio::toJsonString(attrVal, 0);
                log().info("valJsonStr={}", valJsonStr);
                auto valJson = nlohmann::json::parse(valJsonStr);
                auto it = valJson.find("attributeValue");
                if (it != valJson.end()) {
                    auto subit = it.value().begin();
                    for (; subit !=it.value().end(); ++subit)
                        attr->addField(subit.key(), subit.value().dump());
                }
            }
        }
    }

    void fillAttrByJson(model_ptr<Attribute> &attr, nlohmann::json const &j)
    {
        //
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
};

} // namespace mapget
