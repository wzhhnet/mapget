/*!

# Relation Layer

This package defines the relationship between road and lane group. 

!*/

package ext.road.layer;

import system.types.*;
import core.geometry.*;
import ext.road.instantiations.*;
import characteristics.metadata.*;

/** Layer containing lane group info for road. */
struct RoadLaneLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  LaneRoadRangeAttributeMapList(shift) roadRangeAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};


/** Layer containing road info related with lane group. */
struct LaneRoadLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for lane range attributes. */
  RoadLaneRangeAttributeMapList(shift) laneRangeAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};


/** Layer containing road characteristics that cannot be modeled by standard format.  */

/** Characteristics attribute layer for roads using direct references. */
struct RoadCharacteristicsLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadCharacsLayerContent content;

  /** Attribute maps for road range attributes. */
  CharacsRoadRangeExAttributeMapList(shift) characsRoadRangeMaps
              if (content & RoadCharacsLayerContent.ROAD_RANGE_MAPS) == RoadCharacsLayerContent.ROAD_RANGE_MAPS;

  /** Attribute maps for road position attributes. */
  CharacsRoadPositionExAttributeMapList(shift) characsRoadPositionMaps
              if (content & RoadCharacsLayerContent.ROAD_POSITION_MAPS) == RoadCharacsLayerContent.ROAD_POSITION_MAPS;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};


/** Layer containing relationship between parking facility and road. */
struct ParkingFacilityRoadRelationLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  ParkingFacilityRoadRangeAttributeMapList(shift)  parkingFacilityRoadRangeAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/** Layer containing road characteristics that cannot be modeled by standard format.  */

/** Characteristics attribute layer for roads using direct references. */
struct RoadCharacteristicsExtendLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  CharacsRoadRangeExtendAttributeMapList(shift) characsRoadRangeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};


/** Layer containing intersection id related with other tiles intersection id. */
struct IntersectionRelationLayer
{
  /** Coordinate shift. */
  CoordShift shift;
  
  /** Attribute maps for intersection to other tiles intersection id attributes. */
  IntersectionRelationAttributeMapList(shift) intersectionRelationAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/** The ID relationship between the slogans of the preceding and succeeding ends of the Lane associated with the lane group. */
struct LaneGroupLaneProtInfoLayer
{
  /** Coordinate shift. */
  CoordShift shift;
  
  /** Attribute maps for LaneProtInfo to laneGroup ids attributes. */
  LaneGroupLaneProtAttributeMapList(shift) LaneGroup2LaneProtInfoAttributeMapList;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/** Layer containing  info for road. */
struct RoadConnectLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road ids attributes. */
  RoadConnectAttributeMapList(shift) roadConnectAttributeMapList;
  
  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};
