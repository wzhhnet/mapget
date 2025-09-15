/*!

# Routing Data Metadata

This package defines the metadata of the routing attribute layers. The metadata
provides information about the content of the attribute layers.

**Dependencies**

!*/

package routingdata.metadata;

import core.types.*;
import core.vehicle.*;
import routingdata.instantiations.*;
import routingdata.types.*;


/** Metadata of the routing attribute layer for roads. */
struct RoadRoutingLayerMetadata
{
  /** Content of the routing attribute layer for roads. */
  RoadRoutingLayerContent content;

  /** Metadata for road range attributes. */
  RoutingRoadRangeAttributeMetadata roadRangeAttributeMetadata
        if isset(content, RoadRoutingLayerContent.ROAD_RANGE_MAPS)
        || isset(content, RoadRoutingLayerContent.ROAD_RANGE_SETS);

  /** Metadata for transition attributes. */
  RoutingRoadTransitionAttributeMetadata roadTransitionAttributeMetadata
        if isset(content, RoadRoutingLayerContent.ROAD_TRANSITION_MAPS)
        || isset(content, RoadRoutingLayerContent.ROAD_TRANSITION_SETS);

  /** Road types for which routing attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Defines the existence of eco attributes in the layer. */
  bool hasEcoRoutingAttributes;

  /** Threshold that was used to calculate excess slope. */
  ExcessSlope excessSlopeThreshold if hasEcoRoutingAttributes;

  /** Vehicle specifications for which routing attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};


/** Content bitmask of the routing attribute layer for roads. */
bitmask varuint32 RoadRoutingLayerContent
{
  /** Layer contains attribute maps containing road range attributes. */
  ROAD_RANGE_MAPS,

  /** Layer contains attribute sets containing road range attributes. */
  ROAD_RANGE_SETS,

  /** Layer contains attribute maps containing transition attributes. */
  ROAD_TRANSITION_MAPS,

  /** Layer contains attribute sets containing transition attributes. */
  ROAD_TRANSITION_SETS,

  /** Layer contains speed profiles. */
  SPEED_PROFILES,
};


/** Metadata of the routing attribute layer for lanes. */
struct LaneRoutingLayerMetadata
{
  /** Content of the routing attribute layer for lanes. */
  LaneRoutingLayerContent content;

  /** Metadata for lane range attributes. */
  RoutingLaneRangeAttributeMetadata laneRangeAttributeMetadata
        if isset(content, LaneRoutingLayerContent.LANE_RANGE_MAPS)
        || isset(content, LaneRoutingLayerContent.LANE_RANGE_SETS);
  
  /** Metadata for transition attributes. */
  RoutingLaneTransitionAttributeMetadata laneTransitionAttributeMetadata
        if isset(content, LaneRoutingLayerContent.LANE_TRANSITION_MAPS)
        || isset(content, LaneRoutingLayerContent.LANE_TRANSITION_SETS);

  /** Lane types for which routing attributes are provided. */
  LaneType coveredLaneTypes[];

  /** Defines the existence of eco attributes in the layer. */
  bool hasEcoRoutingAttributes;

  /** Threshold that was used to calculate excess slope. */
  ExcessSlope excessSlopeThreshold if hasEcoRoutingAttributes;

  /** Vehicle specifications for which routing attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};


/** Content bitmask of the routing attribute layer for lanes. */
bitmask varuint32 LaneRoutingLayerContent
{
  /** Layer contains attribute maps containing lane range attributes. */
  LANE_RANGE_MAPS,

  /** Layer contains attribute sets containing lane range attributes. */
  LANE_RANGE_SETS,

  /** Layer contains attribute maps containing lane transition attributes. */
  LANE_TRANSITION_MAPS,

  /** Layer contains attribute sets containing lane transition attributes. */
  LANE_TRANSITION_SETS,

  /** Layer contains speed profiles. */
  SPEED_PROFILES,
};
