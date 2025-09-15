/*!

# Traffic Metadata

This package defines the metadata of the traffic attribute layers. The metadata
provides information about the content of the attribute layers.

**Dependencies**

!*/

package traffic.metadata;

import core.types.*;
import core.location.*;
import core.vehicle.*;
import traffic.instantiations.*;

/*!

## Traffic Attribute Layers for Roads

!*/

rule_group RoadTrafficLayerMetadataRules
{
  /*!
  Metadata of Traffic Attribute Layer for Roads Using Direct References:

  `RoadTrafficLayerMetadata` shall be used for `RoadTrafficLayer`.
  !*/

  rule "traffic-xxdjej";

  /*!
  Metadata of Traffic Attribute Layer for Roads Using Indirect References:

  `RoadTrafficLayerIndirectMetadata` shall be used for `RoadTrafficLayerIndirect`.
  !*/

  rule "traffic-4vhij5";
};


/** Metadata of the traffic attribute layer for roads using direct references. */
struct RoadTrafficLayerMetadata
{
  /** Contained attribute maps or sets. */
  RoadTrafficLayerContent content;

  /** Attribute types contained in the attribute maps/sets for road range attributes. */
  TrafficRoadRangeAttributeMetadata roadRangeAttributeMetadata
        if isset(content, RoadTrafficLayerContent.ROAD_RANGE_MAPS)
        || isset(content, RoadTrafficLayerContent.ROAD_RANGE_SETS);

  /** Attribute types contained in the attribute maps/sets for transition attributes. */
  TrafficTransitionAttributeMetadata transitionAttributeMetadata
        if isset(content, RoadTrafficLayerContent.TRANSITION_MAPS)
        || isset(content, RoadTrafficLayerContent.TRANSITION_SETS);

  /** Road types for which traffic attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which traffic attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};


/** Metadata of the traffic attribute layer for roads using indirect references. */
struct RoadTrafficLayerIndirectMetadata
{
  /** Contained attribute maps or sets. */
  RoadTrafficLayerContent content;

  /** Attribute types contained in the attribute maps for road range attributes. */
  TrafficRoadRangeAttributeMetadata roadRangeAttributeMetadata
        if isset(content, RoadTrafficLayerContent.ROAD_RANGE_MAPS)
        || isset(content, RoadTrafficLayerContent.ROAD_RANGE_SETS);

  /** Attribute types contained in the attribute maps for transition attributes. */
  TrafficTransitionAttributeMetadata transitionAttributeMetadata
        if isset(content, RoadTrafficLayerContent.TRANSITION_MAPS)
        || isset(content, RoadTrafficLayerContent.TRANSITION_SETS);

  /** Road types for which traffic attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which traffic attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Content bitmask for the traffic attribute layers for roads. */
bitmask varuint32 RoadTrafficLayerContent
{
  /** Layer contains attribute maps for road range attributes. */
  ROAD_RANGE_MAPS,

 /** Layer contains attribute sets for road range attributes. */
  ROAD_RANGE_SETS,

  /** Layer contains attribute maps for transition attributes. */
  TRANSITION_MAPS,

  /** Layer contains attribute sets for transition attributes. */
  TRANSITION_SETS,
};

/*!

## Traffic Attribute Layer for Road Locations

!*/

rule_group RoadLocationTrafficLayerMetadataRules
{
  /*!
  Metadata of Traffic Attribute Layer for Road Locations:

  `RoadLocationTrafficLayerMetadata` shall be used for `RoadLocationTrafficLayer`.
  !*/

  rule "traffic-74ised";
};


/** Metadata of the traffic attribute layer for road locations. */
struct RoadLocationTrafficLayerMetadata
{
  /** Contained attribute maps or sets. */
  RoadLocationTrafficLayerContent content;

  /** Attribute types contained in the attribute maps/sets for road range attributes. */
  TrafficRoadRangeAttributeMetadata roadRangeAttributeMetadata
        if isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_MAPS)
        || isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_SETS);

  /** Attribute types contained in the attribute maps/sets for transition attributes. */
  TrafficTransitionAttributeMetadata transitionAttributeMetadata
        if isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_TRANSITION_MAPS)
        || isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_TRANSITION_SETS);

  /** Road types for which traffic attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Encoding of the road location IDs used in the road location traffic layer. */
  RoadLocationIdDefinition roadLocationIdEncoding;

  /** Vehicle specifications for which traffic attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Content bitmask for the traffic attribute layer for road locations. */
bitmask varuint32 RoadLocationTrafficLayerContent
{
  /** Layer contains attribute maps for road range attributes assigned to road locations. */
  ROAD_LOCATION_MAPS,

 /** Layer contains attribute sets for road range attributes assigned to road locations. */
  ROAD_LOCATION_SETS,

  /** Layer contains attribute maps for transition attributes assigned to road locations. */
  ROAD_LOCATION_TRANSITION_MAPS,

  /** Layer contains attribute sets for transition attributes assigned to road locations. */
  ROAD_LOCATION_TRANSITION_SETS,
};

/*!

## Traffic Attribute Layers for Lanes

!*/

rule_group LaneTrafficLayerMetadataRules
{
  /*!
  Metadata of Traffic Attribute Layer for Lanes Using Direct References:

  `LaneTrafficLayerMetadata` shall be used for `LaneTrafficLayer`.
  !*/

  rule "traffic-aib5py";

  /*!
  Metadata of Traffic Attribute Layer for Lanes Using Indirect References:

  `LaneTrafficLayerIndirectMetadata` shall be used for `LaneTrafficLayerIndirect`.
  !*/

  rule "traffic-7g3qmj";
};


/** Metadata of the traffic attribute layer for lanes using direct references. */
struct LaneTrafficLayerMetadata
{
  /** Contained attribute maps or sets. */
  LaneTrafficLayerContent content;

  /** Attribute types contained in the attribute maps/sets for lane range attributes. */
  TrafficLaneRangeAttributeMetadata laneRangeAttributeMetadata
        if isset(content, LaneTrafficLayerContent.LANE_RANGE_MAPS)
        || isset(content, LaneTrafficLayerContent.LANE_RANGE_SETS);

  /** Lane types for which traffic attributes are provided. */
  LaneType coveredLaneTypes[];

  /** Vehicle specifications for which traffic attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Metadata of the traffic attribute layer for lanes using indirect references. */
struct LaneTrafficLayerIndirectMetadata
{
  /** Contained attribute maps or sets. */
  LaneTrafficLayerContent content;

  /** Attribute types contained in the attribute maps/sets for lane range attributes. */
  TrafficLaneRangeAttributeMetadata laneRangeAttributeMetadata
        if isset(content, LaneTrafficLayerContent.LANE_RANGE_MAPS)
        || isset(content, LaneTrafficLayerContent.LANE_RANGE_SETS);

  /** Lane types for which traffic attributes are provided. */
  LaneType coveredLaneTypes[];

  /** Vehicle specifications for which traffic attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Content bitmask for the traffic attribute layers for lanes. */
bitmask varuint32 LaneTrafficLayerContent
{
  /** Layer contains attribute maps for lane range attributes. */
  LANE_RANGE_MAPS,

  /** Layer contains attribute sets for lane range attributes. */
  LANE_RANGE_SETS,
};

/*!

## Traffic Attribute Layer for Display Lines

!*/

rule_group DisplayLineTrafficLayerMetadataRules
{
  /*!
  Metadata of Traffic Attribute Layer for Display Lines Using Direct References:

  `DisplayLineTrafficLayerMetadata` shall be used for `DisplayLineTrafficLayer`.
  !*/

  rule "traffic-osscgf";
};


/** Metadata of the traffic attribute layer for display lines using direct references. */
struct DisplayLineTrafficLayerMetadata
{
  /** Contained attribute maps or sets. */
  DisplayLineTrafficLayerContent content;

  /** Attribute types contained in the attribute maps or sets for display line range attributes. */
  TrafficDisplayLineRangeAttributeMetadata displayLineRangeAttributeMetadata
        if isset(content, DisplayLineTrafficLayerContent.DISPLAY_LINE_RANGE_MAPS)
        || isset(content, DisplayLineTrafficLayerContent.DISPLAY_LINE_RANGE_SETS);

  /** Road types for which traffic attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which traffic attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Content bitmask for the traffic attribute layers for display lines. */
bitmask varuint32 DisplayLineTrafficLayerContent
{
  /** Layer contains attribute maps for display line range attributes. */
  DISPLAY_LINE_RANGE_MAPS,

  /** Layer contains attribute sets for display line range attributes. */
  DISPLAY_LINE_RANGE_SETS,
};