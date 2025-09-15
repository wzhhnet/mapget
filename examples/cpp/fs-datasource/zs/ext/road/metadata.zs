/*!

# Metadata

This package defines metadata for road layers.

**Dependencies**

!*/

package ext.road.metadata;

import core.types.*;
import ext.road.instantiations.*;

/** Metadata of the RoadLaneLayer. */
struct RoadLaneLayerMetadata
{
  /** Metadata for road range attributes. */
  LaneRoadRangeAttributeMetadata roadRangeAttributeMetadata;
  
};

/** Metadata of the LaneRoadLayer. */
struct LaneRoadLayerMetadata
{
  /** Metadata for lane range attributes. */
  RoadLaneRangeAttributeMetadata laneRangeAttributeMetadata;
  
};

struct RoadCharacteristicsLayer
{
  CharacsRoadRangeExAttributeMetadata characsRoadRangeExAttributeMetadata;
  CharacsRoadPositionExAttributeMetadata characsRoadPositionExAttributeMetadata;
};

struct RoadCharacteristicsExtendLayerMetadata
{
  CharacsRoadRangeExtendAttributeMetadata characsRoadRangeExtendAttributeMetadata;
};

/** Metadata of the ParkingFacilityRoadRelationLayer. */
struct ParkingFacilityRoadRelationLayerMetadata
{
  ParkingFacilityRoadRangeAttributeMetadata roadRangeAttributeMetadata;
  
};

/** Metadata of the IntersectionRelationLayer. */
struct IntersectionRelationLayerMetadata
{
  
};

/** Metadata of the LaneGroupLaneProtLayer. */
struct LaneGroupLaneProtLayerMetadata
{
  
};

/** Metadata of the RoadConnectLayer. */
struct RoadConnectLayerMetadata
{
  
};
