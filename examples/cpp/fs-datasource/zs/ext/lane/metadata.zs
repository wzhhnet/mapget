/*!

# Metadata

This package defines metadata for lane relation layers.

**Dependencies**

!*/

package ext.lane.metadata;

import core.types.*;
import ext.lane.instantiations.*;

/** Metadata of the LaneRelationLayer. */
struct LaneRelationLayerMetadata
{
  Lane2ThreeDRelationAttributeMetadata lane2ThreeDRelationAttributeMetadata;
  ThreeD2LaneRelationAttributeMetadata threeD2LaneRelationAttributeMetadata;
};

/** Content bitmask of the characteristics attribute layer for lanes. */
bitmask varuint32 LaneCharacsLayerExContent
{
  /** Layer contains attribute maps containing lane range attributes. */
  LANE_RANGE_MAPS,

  /** Layer contains attribute maps containing lane position attributes. */
  LANE_POSITION_MAPS,

};

struct LaneCharacteristicsLayerMetadata
{
  CharacsLaneRangeExAttributeMetadata characsLaneRangeExAttributeMetadata;
  CharacsLanePositionExAttributeMetadata characsLanePositionExAttributeMetadata;
};
