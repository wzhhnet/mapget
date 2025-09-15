/*!

# Road Lane Attributes

This package defines the relationship between lane group and road.

**Dependencies**

!*/
package ext.lane.attributes;

import ext.road.types.*;
import ext.lane.types.*;

/** 3d object id related with 2d lanegroup id .*/
enum varuint16 ThreeD2LaneRelationAttributeType
{

  /** lanegroup IDs. */
  LANEGROUP_REFERENCES = 0,

};

choice ThreeD2LaneRelationAttributeValue(ThreeD2LaneRelationAttributeType type) on type
{
  case LANEGROUP_REFERENCES:
          LaneGroupReferenceList laneGroupReferenceList;
};


/** 2d lanegroup id related with 3d object id .*/
enum varuint16 Lane2ThreeDRelationAttributeType
{

  /** 3d object ids. */
  THREE_D_REFERENCES = 0,

};

choice Lane2ThreeDRelationAttributeValue(Lane2ThreeDRelationAttributeType type) on type
{
  case THREE_D_REFERENCES:
          ThreeDReferenceList threedReferenceList;
};

/** 2d lanegroup id related with link id.*/
enum varuint16 Lane2LinkRelationAttributeType
{

  /** Sub groups,links and source and dest types. */
  SUB_GROUPS = 0,

};

choice Lane2LinkRelationAttributeValue(Lane2LinkRelationAttributeType type) on type
{
  case SUB_GROUPS:
          SubGroupList subGroupList;
};
/*************************************************************************************/
enum varuint16 CharacsLaneRangeExAttributeType
{
  LANE_GEO_CONNECT_TYPE = 0,
};

choice CharacsLaneRangeExAttributeValue(CharacsLaneRangeExAttributeType type) on type
{
  case LANE_GEO_CONNECT_TYPE:
          LaneGeoConnectType connectType;
};

enum varuint16 CharacsLanePositionExAttributeType
{
  RESERVED = 0,
};

choice CharacsLanePositionExAttributeValue(CharacsLanePositionExAttributeType type) on type
{
  case RESERVED:
          ;
};
