/*!

# LaneRelationLayer Types

This package defines the types that are used for LaneRelationLayer attributes
and attribute properties.

**Dependencies**

!*/

package ext.lane.types;

import core.location.*;
import display.reference.types.*;
import display.types.*;


/**
  * 3d objects info.
  */
struct ThreeDLocationId
{
  int32    tileid;
  DisplayMesh3dId objectId;
  DisplayMesh3dType type;
};

/**
  * Lane group referenced 3d objects lists. 
  * 3d lane object id range:0-65535. 
  * Across tile 3d lane object id range:over 65535.
  * So if you get an object id less than 65535,tile id must be combined to identify the unique id.
  */
struct ThreeDReferenceList
{
  /** Number of related objects.*/
  uint8    numObjects;

  /** threed infos.*/
  ThreeDLocationId objects[numObjects];
};

/**
  * Road info.
  */
struct RoadInfo
{
  /**road tile id and feature id .*/
  RoadLocationId roadLocationId;

  /** Source feature, dest feature, normal feature.*/
  uint8 refRoadType;
};

/**
  * Link relationship with lanegroups,mainly aiming at source/dest feature. 
  */
struct SubGroupList
{
  /** Number of related objects.*/
  uint8    subGroupId;
  uint8    numRoads;
  RoadInfo roadList[numRoads];
};

/** Types of connection. */
enum uint8 LaneGeoConnectType
{
  NORMAL         = 0,
  LEFT_INCREASE  = 1,
  LEFT_DECREASE  = 2,
  RIGHT_INCREASE = 3,
  RIGHT_DECREASE = 4,
  UNKNOWN        = 5,
};
