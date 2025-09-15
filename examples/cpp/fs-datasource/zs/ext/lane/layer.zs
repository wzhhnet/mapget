/*!

# Relation Layer

This package defines the relationship between 2DLaneGroup ID and 3D Lane ObjectID. 

!*/

package ext.lane.layer;

import system.types.*;
import core.geometry.*;
import ext.lane.instantiations.*;
import ext.lane.metadata.*;
import characteristics.metadata.*;

/** Layer containing lane group info for road. */
struct LaneRelationLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps. */
  Lane2ThreeDRelationAttributeMapList(shift) lane2ThreeDRelationAttributeMaps;

  ThreeD2LaneRelationAttributeMapList(shift) threeD2LaneRelationAttributeMaps;

  Lane2LinkRelationAttributeMapList(shift) lane2LinkRelationAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/** Extended lane characteristics. */
struct LaneCharacteristicsLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneCharacsLayerExContent content;

  /** Attribute maps for road range attributes. */
  CharacsLaneRangeExAttributeMapList(shift) characsLaneRangeMaps
              if (content & LaneCharacsLayerExContent.LANE_RANGE_MAPS) == LaneCharacsLayerExContent.LANE_RANGE_MAPS;

  /** Attribute maps for road position attributes. */
  CharacsLanePositionExAttributeMapList(shift) characsLanePositionMaps
              if (content & LaneCharacsLayerExContent.LANE_POSITION_MAPS) == LaneCharacsLayerExContent.LANE_POSITION_MAPS;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

