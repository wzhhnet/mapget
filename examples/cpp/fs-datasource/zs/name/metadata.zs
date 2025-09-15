/*!

# Name Metadata

This package defines the metadata of the Name module, for example,
information about the content of the name attribute layers for roads and lanes
as well as metadata for a search service.

**Dependencies**

!*/

package name.metadata;

import core.types.*;
import core.language.*;
import core.vehicle.*;
import name.instantiations.*;
import name.types.*;


/*!

## Metadata of Name Attribute Layers

The Name module defines metadata for the attribute layers that are used to
assign names to roads, lanes, and display features.


!*/

rule_group NameAttributeLayerMetadata
{
  /*!

  Metadata of Name Attribute Layer for Roads:

  `RoadNameLayerMetadata` shall be used for `RoadNameLayer`.
  !*/

  rule "name-i2yowo";

  /*!
  Metadata of Name Attribute Layer for Lanes:

  `LaneNameLayerMetadata` shall be used for `LaneNameLayer`.
  !*/

  rule "name-vix9xi";

  /*!
  Metadata of Name Attribute Layer for Display Features:

  `DisplayNameLayerMetadata` shall be used for `DisplayNameLayer`.
  !*/

  rule "name-edw7ou";
};


/** Metadata of the name attribute layer for roads. */
struct RoadNameLayerMetadata
{
  /** Contained attribute maps or sets. */
  RoadNameLayerContent content;

  /** Attribute types contained in the attribute maps or sets for road range attributes. */
  NameRoadRangeAttributeMetadata roadRangeAttributeMetadata
        if isset(content, RoadNameLayerContent.ROAD_RANGE_MAPS)
        || isset(content, RoadNameLayerContent.ROAD_RANGE_SETS);

  /** Attribute types contained in the attribute maps or sets for road position attributes. */
  NameRoadPositionAttributeMetadata roadPositionAttributeMetadata
        if isset(content, RoadNameLayerContent.ROAD_POSITION_MAPS)
        || isset(content, RoadNameLayerContent.ROAD_POSITION_SETS);

  /** Attribute types contained in the attribute maps or sets for transition attributes. */
  NameTransitionAttributeMetadata transitionAttributeMetadata
        if isset(content, RoadNameLayerContent.TRANSITION_MAPS)
        || isset(content, RoadNameLayerContent.TRANSITION_SETS);

  /** Available languages used in the road name layer. */
  AvailableLanguages availableLanguages;

  /** Road types for which name attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which name attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevision;
};

/** Content bitmask of the name attribute layer for roads. */
bitmask varuint32 RoadNameLayerContent
{
  /** Layer contains attribute maps for road range attributes. */
  ROAD_RANGE_MAPS,

  /** Layer contains attribute sets for road range attributes. */
  ROAD_RANGE_SETS,

  /** Layer contains attribute maps for road position attributes. */
  ROAD_POSITION_MAPS,

  /** Layer contains attribute sets for road position attributes. */
  ROAD_POSITION_SETS,

  /** Layer contains attribute maps for transition attributes. */
  TRANSITION_MAPS,

  /** Layer contains attribute sets for transition attributes. */
  TRANSITION_SETS,

  /** Layer contains administrative hierarchy definitions. */
  ADMIN_HIERARCHY,

  /** Layer contains one or more address format definitions. */
  ADDRESS_FORMAT,
};

/** Metadata of the name attribute layer for lanes. */
struct LaneNameLayerMetadata
{
  /** Contained attribute maps or sets. */
  LaneNameLayerContent content;

  /** Attribute types contained in the attribute maps or sets for lane range attributes. */
  NameLaneRangeAttributeMetadata laneRangeAttributeMetadata
        if isset(content, LaneNameLayerContent.LANE_RANGE_MAPS)
        || isset(content, LaneNameLayerContent.LANE_RANGE_SETS);

  /** Attribute types contained in the attribute maps or sets for lane position attributes. */
  NameLanePositionAttributeMetadata lanePositionAttributeMetadata
        if isset(content, LaneNameLayerContent.LANE_POSITION_MAPS)
        || isset(content, LaneNameLayerContent.LANE_POSITION_SETS);

  /** Available languages used in the lane name layer. */
  AvailableLanguages availableLanguages;

  /** Road types for which name attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which name attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevision;
};

/** Content bitmask of the name attribute layer for lanes. */
bitmask varuint32 LaneNameLayerContent
{
  /** Layer contains attribute maps for lane range attributes. */
  LANE_RANGE_MAPS,

  /** Layer contains attribute sets for lane range attributes. */
  LANE_RANGE_SETS,

  /** Layer contains attribute maps for lane position attributes. */
  LANE_POSITION_MAPS,

  /** Layer contains attribute sets for lane position attributes. */
  LANE_POSITION_SETS,

  /** Layer contains administrative hierarchy definitions. */
  ADMIN_HIERARCHY,

  /** Layer contains one or more address format definitions. */
  ADDRESS_FORMAT,
};


/** Metadata of the name attribute layer for display features. */
struct DisplayNameLayerMetadata
{
  /** Contained attribute maps or sets. */
  DisplayNameLayerContent content;

  /**
    * Attribute types contained in the attribute maps or sets for name
    * attributes assigned to ranges on display lines.
    */
  NameDisplayLineRangeAttributeMetadata displayLineRangeAttributeMetadata
        if(content & DisplayNameLayerContent.DISPLAY_LINE_RANGE_MAPS)
          == DisplayNameLayerContent.DISPLAY_LINE_RANGE_MAPS
       || (content & DisplayNameLayerContent.DISPLAY_LINE_RANGE_SETS)
          == DisplayNameLayerContent.DISPLAY_LINE_RANGE_SETS;

  /**
    * Attribute types contained in the attribute maps or sets for name
    * attributes assigned to display areas.
    */
  NameDisplayAreaAttributeMetadata displayAreaAttributeMetadata
        if isset(content, DisplayNameLayerContent.DISPLAY_AREA_MAPS)
        || isset(content, DisplayNameLayerContent.DISPLAY_AREA_SETS);

  /**
    * Attribute types contained in the attribute maps or sets for name
    * attributes assigned to display points.
    */
  NameDisplayPointAttributeMetadata displayPointAttributeMetadata
        if isset(content, DisplayNameLayerContent.DISPLAY_POINT_MAPS)
        || isset(content, DisplayNameLayerContent.DISPLAY_POINT_SETS);

  /** Available languages used in the lane name layer. */
  AvailableLanguages availableLanguages;

  /** Road types for which name attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which name attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevision;
};

/** Content bitmask of the name attribute layer for display features. */
bitmask varuint32 DisplayNameLayerContent
{
  /**
    * Layer contains attribute maps for name attributes assigned to ranges on
    * display lines.
    */
  DISPLAY_LINE_RANGE_MAPS,

  /** Layer contains attribute maps for name attributes assigned to display areas. */
  DISPLAY_AREA_MAPS,

  /** Layer contains attribute maps for name attributes assigned to display points. */
  DISPLAY_POINT_MAPS,

  /**
    * Layer contains attribute sets for name attributes assigned to ranges on
    * display lines.
    */
  DISPLAY_LINE_RANGE_SETS,

  /** Layer contains attribute sets for name attributes assigned to display areas. */
  DISPLAY_AREA_SETS,

  /** Layer contains attribute maps for name attributes assigned to display points. */
  DISPLAY_POINT_SETS,

  /** Layer contains administrative hierarchy definitions. */
  ADMIN_HIERARCHY,

  /** Layer contains one or more address format definitions. */
  ADDRESS_FORMAT,
};


/*!

## Address Search

The Name module defines metadata for the address search of a
search service that is defined in the Search module.

!*/

rule_group AddressSearchMetadataRules
{
  /*!
  Filtering of Search Results by Address Format ID:

  If address search results are to be filtered by address format ID, then the
  ID defined in `AddressSearchFilter.addressFormatId` shall be present in the
  `addressSearchMetadata.addressformats` list of the corresponding search service.
  !*/

  rule "name-4xjbta";
};

/** Metadata for use in the `addressSearchMetadata` field of a search service. */
struct AddressSearchMetadata
{
  /** Supported filter options for address search. */
  AddressSearchFilterOptions supportedFilter;

  /** Address formats in which the results can be returned. */
  AddressFormat addressFormats[];
};

/** Filter options for address search. */
bitmask varuint16 AddressSearchFilterOptions
{
  /** Search can be filtered by administrative hierarchy elements. */
  ADMINISTRATIVE_HIERARCHY_FILTER,

  /** Search can be filtered by address format IDs. */
  ADDRESS_FORMAT_FILTER,
};

/** Details of address search result. */
struct AddressSearchResultDetails
{
  /** Content that is included in an address search result. */
  AddressSearchResultDetailsContent content;

  /**
    * All name attributes and the corresponding attribute properties that
    * are relevant for the address search result.
    */
  NameRoadRangeFullAttribute nameAttributes[]
    if isset(content, AddressSearchResultDetailsContent.ATTRIBUTES);

  /**
    * Administrative hierarchy elements of the address search result.
    * Ordered from lowest to highest.
    */
  AdministrativeHierarchyElement adminElements[]
    if isset(content, AddressSearchResultDetailsContent.ADMINISTRATIVE_HIERARCHY);

  /** Identifier of the address format that is used for detailed display. */
  AddressFormatId addressFormatId
    if isset(content, AddressSearchResultDetailsContent.ADDRESS_FORMAT_ID);
};

/** Types of content included in address search result. */
bitmask varuint16 AddressSearchResultDetailsContent
{
  /** Result includes additional names. */
  ATTRIBUTES,

  /** Result includes administrative hierarchy information. */
  ADMINISTRATIVE_HIERARCHY,

  /** Result uses the address format that is specified in the search metadata. */
  ADDRESS_FORMAT_ID,
};

/** Filter for refining an address search. */
struct AddressSearchFilter
{
  /** Filter options that are used for address search. */
  AddressSearchFilterOptions filterOptions;

  /**
    * Address results are to be filtered according to the listed administrative
    * hierarchy element types.
    * Searches can be performed on a single hierarchy element type or across
    * multiple hierarchy element types.
    * For example, a search can be filtered for cities only or include cities
    * well as city districts.
    */
  AdminHierarchyElementType adminHierarchyElementType[]
    if isset(filterOptions, AddressSearchFilterOptions.ADMINISTRATIVE_HIERARCHY_FILTER);

  /** Address results are to be filtered by a dedicated address format. */
  AddressFormatId addressFormatId
    if isset(filterOptions, AddressSearchFilterOptions.ADDRESS_FORMAT_FILTER);
};

/** Metadata of the name attribute layer for POIs. */
struct PoiNameLayerMetadata
{
  /** Contained attribute maps or sets. */
  PoiNameLayerContent content;

  /**
    * Attribute types contained in the attribute maps or sets for name
    * attributes assigned to POIs.
    */
  NamePoiAttributeMetadata poiAttributeMetadata
        if isset(content, PoiNameLayerContent.POI_MAPS)
        || isset(content, PoiNameLayerContent.POI_SETS);

  /** Address formats used in the layer. */
  AddressFormat addressFormats[];

  /** Available languages used in the layer. */
  AvailableLanguages availableLanguages;

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevision;
};

/** Content bitmask of the name attribute layer for POIs. */
bitmask varuint32 PoiNameLayerContent
{
  /** Layer contains attribute maps for name attributes assigned to POIs. */
  POI_MAPS,

  /** Layer contains attribute sets for name attributes assigned to POIs. */
  POI_SETS,

  /** Layer contains one or more address format definitions. */
  ADDRESS_FORMAT,

  /** Layer contains administrative hierarchy definitions. */
  ADMIN_HIERARCHY,
};