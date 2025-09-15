/*!

# POI Metadata

This package defines POI metadata, for example, information about the content of
the POI attribute layers as well as metadata for a search service.

**Dependencies**

!*/

package poi.metadata;

import core.icons.*;
import core.language.*;
import core.types.*;
import core.location.*;
import core.vehicle.*;
import poi.attributes.*;
import poi.instantiations.*;
import poi.reference.types.*;
import poi.types.*;

/*!

## POI Layer Metadata

The metadata of the POI layer provides information about the content of the
layer.

!*/

rule_group PoiLayerMetadataRules
{
  /*!
  POI Category Without Scale Range:

  If no scale range is referenced for a POI category, the category shall be visible
  at all scales.
  !*/

  rule "poi-u3mgx2";

  /*!
  Metadata of POI Layer:

  `PoiLayerMetadata` shall be used for `PoiLayer`.
  !*/

  rule "poi-sf7335";

  /*!
  Global Icon Sets of POI Layer:

  If `PoiLayerMetadata.globalIconSetReferences` is set to `true`, then at least
  one referenced icon set in the POI layer shall be a global icon set, that is,
  its icon set ID is greater than 65535.
  !*/

  rule "poi-1x7j5k";
};

/** Metadata of the POI layer. */
struct PoiLayerMetadata
{
  /** Supported POI categories. */
  PoiCategory categories[];

  /** Supported scales. */
  ScaleRangeList scales;

  /** Available languages for POIs. */
  AvailableLanguages availableLanguages;

  /**
    * Set to `true` if at least one referenced icon set in the layer is a
    * global icon set. That is, the icon set is stored in a different smart
    * layer container than the referencing POI and the smart layer object
    * service is of class `GLOBAL_ICONS`.
    *
    * A value of `true` does not mean that global icon set references are used
    * exclusively. An application still needs to check for local icon set
    * references as well.
    */
  bool globalIconSetReferences;

  /** Road types for which POIs are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which POIs are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevision;
};

/** Definition of a POI category. */
struct PoiCategory
{
  /** Identifier of the POI category. */
  PoiCategoryId categoryId;

  /** Standard POI category. */
  PoiStandardCategory           standardCategory;

  /** Names of the category. */
  NameStringCollection          categoryNameStringCollection;

  /** Indicates whether the category is shown as a first-level selection entry. */
  bool selectionEntry;

  /** Indicates whether the category is shown in a selection user interface. */
  bool showInSearchTree;

  /** Indicates whether the category is a brand. */
  bool isBrand;

  /** Indicates whether this is a collective category. */
  bool isCollective;

  /**
    * Global icon set reference of the category. The corresponding icon set is
    * stored in an icon layer of a global smart layer object.
    */
  optional CategoryIconSetReference iconSetReference;

  /**
    * Optional reference to the scale ranges in which this category is
    * displayed by default.
    */
  optional ScaleRangeId scaleRangeIds[];

  /** Activation radius in meters. */
  optional uint16 activationRadius;

  /** List of parent categories. */
  optional PoiCategoryId parents[];

  /** List of child categories. */
  optional PoiCategoryId children[];
};


/*!

## Metadata of POI Attribute Layer

The metadata of the POI attribute layer stores information about the content
of the layer.

!*/

rule_group PoiAttributeLayerRules
{
  /*!
  Metadata of POI Attribute Layer:

  `PoiAttributeLayerMetadata` shall be used for `PoiAttributeLayer`.
  !*/

  rule "poi-60hzv2";

  /*! Metadata of POI Attribute Layer using Indirect References:

  `PoiAttributeLayerIndirectMetadata` shall be used for `PoiAttributeLayerIndirect`.
  !*/

  rule "poi-7hw9rk";
};

/** Metadata of the POI attribute layer. */
struct PoiAttributeLayerMetadata
{
  /** Content of the POI attribute layer. */
  PoiAttributeLayerContent content;

  AttributeValueIconMap attributeValueIconMap;

  /** Metadata for POI attributes. */
  PoiAttributeMetadata poiAttributeMetadata;

  /** Available languages for POI attributes. */
  AvailableLanguages availableLanguages;

  /**
    * Set to `true` if at least one referenced icon set in the layer is a
    * global icon set. That is, the icon set is stored in a different smart
    * layer container than the referencing POI and the smart layer object
    * service is of class `GLOBAL_ICONS`.
    *
    * A value of `true` does not mean that global icon set references are used
    * exclusively. An application still needs to check for local icon set
    * references as well.
    */
  bool globalIconSetReferences;

  /** Road types for which POI attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which POI attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevisionLanguageCodes;

  /** ISO revision of the country codes used in the layer. */
  IsoRevision isoRevisionCountryCodes;
};

/** Metadata of the POI attribute layer which uses indirect references. */
subtype PoiAttributeLayerMetadata PoiAttributeLayerIndirectMetadata;

/** This struct maps attribute enum values to icon sets.
  *
  * Example: `STAR_RATING`
  * Example: `STAR_RATING`
  * `type` | `enumValue` | `iconSetId`
  * ============================
  * `STAR_RATING` | 0 (`RATING_1_STAR`) | 8
  * `STAR_RATING` | 1 (`RATING_2_STAR`) | 9
  */
struct AttributeValueIconMap
{
  /** Number of mappings. */
  varsize numEntries;

  /** Type of POI attribute. */
  PoiAttributeType type[numEntries];

  /** Enum value that is mapped to an icon set. */
  varuint32 enumValue[numEntries];

  /** Reference to the icon set that is mapped to an enum. */
  PoiAttributeIconSetReference iconSetReference[numEntries];
};

/** Content of the POI attribute layer. */
bitmask varuint32 PoiAttributeLayerContent
{
  /** Layer contains attribute maps. */
  POI_ATTRIBUTE_MAPS,

  /** Layer contains attribute sets. */
  POI_ATTRIBUTE_SETS,
};


/*!

## POI Search

The POI module defines metadata for the POI search of a
search service that is defined in the Search module.

POI search results can be filtered based on a list of POI attribute values.
A search result is only returned if at least one match is found that corresponds
to the attribute values defined in this list.

The filtering of attribute values does not support range queries or max() queries.
If the POI attribute has integer values, the filter values shall be treated
as min().

**Example: Query for EV charging availability**

A search filter for an EV charging station that has at least one
available charger for a household connector contains the following attribute
values:

- `EvChargingAvailability.numConnectors` = 1
- `EvChargingAvailability.connectorType[0]` = `HOUSEHOLD`
- `EvChargingAvailability.chargersAvailable[0]` = 1
- All other fields are set to 0.

!*/

rule_group PoiSearchMetadataRules
{
  /*!
  Filter Categories Contained in Available Categories of POI Search:

  If POI search results are to be filtered by POI categories, then the
  categories listed in `poiSearchMetadata.filterCategories` shall be a subset
  of the POI categories that are supported by the search service as defined in
  `poiSearchMetadata.availableCategories`.
  !*/

  rule "poi-th03vt";

  /*!
  Filter Attributes Contained in Available Attributes of POI Search:

  If POI search results are to be filtered by POI categories, then the
  categories listed in `poiSearchMetadata.filterAttributes` shall be a subset
  of the POI categories that are returned by the search service as defined in
  `poiSearchMetadata.availableAttributes`.
  !*/

  rule "poi-djewmo";

  /*!
  Filtering of Search Results by POI Category:

  If POI search results are to be filtered by POI category, then the
  categories defined in `PoiSearchFilter.filterCategories` shall be present in the
  `poiSearchMetadata.filterCategories` list of the corresponding search service.
  !*/

  rule "poi-xkhiec";

  /*!
  Filtering of Search Results by POI Attribute:

  If POI search results are to be filtered by POI attribute values, then the
  attribute values defined in `PoiSearchFilter.filterAttributes` shall be present
  in the `poiSearchMetadata.filterAttributes` list of the corresponding search
  service.
  !*/

  rule "poi-cxma4j";
};

/** Metadata for use in the `poiSearchMetadata` field of a search service. */
struct PoiSearchMetadata
{
  /** Supported filter options for POI search. */
  PoiSearchFilterOptions supportedFilter;

  /** POI categories that are supported by the search service. */
  PoiCategory availableCategories[];

  /** POI attributes that are returned by the service. */
  PoiAttributeMetadata availableAttributes;

  /** Available languages for POIs. */
  AvailableLanguages availableLanguages;

  /**
    * POI categories that can be used for filtering the search. List is a subset of
    * of the POI categories that are supported by the service.
    */
  PoiCategory filterCategories[]
    if isset(supportedFilter, PoiSearchFilterOptions.CATEGORY_FILTER);

  /**
    * POI attributes that can be used for filtering the search. List is a subset
    * of the POI attributes that are returned by the service.
    */
  PoiAttributeMetadata filterAttributes
    if isset(supportedFilter, PoiSearchFilterOptions.ATTRIBUTE_FILTER);
};


/** Describes supported filter options for POI search. */
bitmask varuint16 PoiSearchFilterOptions
{
  /** Search can be filtered by POI categories. */
  CATEGORY_FILTER,

  /** Search can be filtered by POI attributes. */
  ATTRIBUTE_FILTER,
};


/** Details of POI search result. */
struct PoiSearchResultDetails
{
  /** POI category of the result. */
  PoiCategoryId categoryId;

  /** Attributes of the returned POI. */
  optional PoiFullAttribute attributes[];
};

/** Filter for refining a POI search. */
struct PoiSearchFilter
{
  /** Filter options that are used for POI search. */
  PoiSearchFilterOptions filterOptions;

  /** POI category IDs that are used to filter the search. */
  PoiCategoryId filterCategories[]
    if isset(filterOptions, PoiSearchFilterOptions.CATEGORY_FILTER);

  /** List of POI attributes to filter POI search results. */
  PoiFullAttribute filterAttributes[]
    if isset(filterOptions, PoiSearchFilterOptions.ATTRIBUTE_FILTER);
};

/*!

## Metadata of POI Relation Layer

The POI module defines metadata for the POI relation layer.

!*/

/** Metadata of the POI relation layer. */
struct PoiRelationLayerMetadata
{
  /** Content of the POI relation layer. */
  PoiRelationLayerContent content;

  /** POI relation types used in attribute maps for relations to road positions. */
  PoiRoadPositionRelationMetadata poiRoadPositionRelationMetadata
            if isset(content, PoiRelationLayerContent.ROAD_POSITION_MAPS)
            || isset(content, PoiRelationLayerContent.ROAD_INDIRECT_POSITION_MAPS)
            || isset(content, PoiRelationLayerContent.ROAD_LOCATION_POSITION_MAPS);

  /** POI relation types used in attribute maps for relations to lane positions. */
  PoiLanePositionRelationMetadata poiLanePositionRelationMetadata
            if isset(content, PoiRelationLayerContent.LANE_POSITION_MAPS)
            || isset(content, PoiRelationLayerContent.LANE_INDIRECT_POSITION_MAPS);

  /** POI relation types used in attribute maps for relations to display areas. */
  PoiDisplayAreaRelationMetadata poiDisplayAreaRelationMetadata
            if isset(content, PoiRelationLayerContent.DISPLAY_AREA_MAPS);

  /** POI relation types used in attribute maps for relations to 3D polygon meshes. */
  PoiDisplayMesh3DRelationMetadata poiDisplayMesh3DRelationMetadata
            if isset(content, PoiRelationLayerContent.DISPLAY_MESH_MAPS);

  /** Encoding of the road location IDs used in the POI relation layer. */
  RoadLocationIdDefinition roadLocationIdEncoding
            if isset(content, PoiRelationLayerContent.ROAD_LOCATION_POSITION_MAPS);
};

/** Content bitmask for the POI relation layer. */
bitmask varuint32 PoiRelationLayerContent
{
  /**
    * Layer contains attribute maps containing relations to lane positions
    * using direct references.
    */
  LANE_POSITION_MAPS,

  /**
    * Layer contains attribute maps containing relations to lane positions
    * using indirect references.
    */
  LANE_INDIRECT_POSITION_MAPS,

  /**
    * Layer contains attribute maps containing relations to road positions
    * using direct references.
    */
  ROAD_POSITION_MAPS,

  /**
    * Layer contains attribute maps containing relations to road positions
    * using indirect references.
    */
  ROAD_INDIRECT_POSITION_MAPS,

  /**
    * Layer contains attribute maps containing relations to display areas.
    */
  DISPLAY_AREA_MAPS,

  /**
    * Layer contains attribute maps containing relations to road positions
    * using road location IDs.
    */
  ROAD_LOCATION_POSITION_MAPS,

  /**
    * Layer contains attribute maps containing relations to polygon meshes
    * for 3D display.
    */
  DISPLAY_MESH_MAPS,
};