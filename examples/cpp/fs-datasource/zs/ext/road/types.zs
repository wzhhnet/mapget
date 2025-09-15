/*!

# RoadCharacteristicsLayer Types

This package defines the types that are used for RoadCharacteristicsLayer attributes
and attribute properties.

**Dependencies**

!*/

package ext.road.types;
import core.location.*;
import core.types.*;

/**
  * A reference to one or multiple normal lanes of a road (numbering is dependent on 
  * the traffic sense).
  */
struct LaneMask
{
  bool	isFirstLane;
  bool	isSecondLane;
  bool	isThirdLane;
  bool	isFourthLane;
  bool	isFifthLane;
  bool	isSixthLane;
  bool	isSeventhLane;
  bool	isEigthsLane;
  bool	isNinethLane;
  bool	isTenthLane;
  bool	isEleventhLane;
  bool	isTwelfthLane;
  bool	isThirteenthLane;
  bool	isFourteenthLane;
  bool	isFifteenthLane;
  bool	notUsed;
};

/** Indicates if the link is an entrance or exit of the parking facility. */
enum bit:2 ParkingInOutType
{	 	
  PARKING_INTERNAL	= 0x0,
  PARKING_ENTRANCE	= 0x1,
  PARKING_EXIT	= 0x2,
  PARKING_ENTRANCE_EXIT	= 0x3
};

/** The type of a parking facility the link belongs to. */
enum bit:3 ParkingFacilityType
{
  UNKNOWN_PARKING_TYPE	= 0,
  OPEN_PARKING_SPACE	= 1,
  MULTI_STOREY_CAR_PARK	= 2,
  UNDERGROUND_PARKING	= 3,
  ON_STREET_PARALLEL_PARKING	= 4,
  ON_STREET_PERPENDICULAR_PARKING	= 5,
  ON_STREET_45_DEGREE_PARKING	= 6,
  ON_STREET_UNSTRUCTURED	= 7
};

/** Properties of links belonging to parking facilities. */
struct Parking
{
  /** The type of a parking facility the link belongs to. */
  ParkingFacilityType	facilityType;	

  /** Entrance or exit of the parking facility. */	
  ParkingInOutType	inOutType;	
};

/**
  * connection info for indoor road that connects different floors.
  */
struct ConnectionInfo
{
  /** from floor.*/
  varint16 fromFloor;

  /** to floor.*/
  varint16 toFloor;
};

/**
  * connection info for indoor road that connects different floors.Use list to 
  * ensure that a road can travel to multi floors in same direction.
  * Eg. In some indoor parkings -1 can both travel to -2 and -3 directly.
  */
struct ConnectionInfoAcrossFloors
{
  /** Number of connections across floors.*/
  uint8    numConnections;

  /** List of connections.*/
  ConnectionInfo connectionInfo[numConnections];
};

/**
  * Lane group referenced links.
  * With intersection lane group, no detail validity range info for covered links.
  */
struct RoadReferenceList
{
  /** Number of related links.*/
  uint8    numRoads;

  /** Road locations.*/
  RoadLocationId roadLocation[numRoads];
};

/**
  * Referenced feature list.
  */
struct GlobalSourceIdReferenceList
{
  /** Number of related features.*/
  uint8    numCnt;

  /** Feature info.*/
  GlobalSourceId globalSourceIdList[numCnt];
};


/**
  * Road info.
  */
struct MultiDigitizedRoadInfo
{
  /**road tile id and feature id .*/
  RoadLocationId roadLocationId;

  /** Start position.*/
  int32 startPosition;

  /** Offset length.*/
  int32 offset;
};


/** Multi-digitized references. */
struct MultiDigitizedReferences
{
  bool leftSide;
  bool rightSide;
  uint8    numLeftRoads if leftSide == true;
  uint8    numRightRoads if rightSide == true;
  MultiDigitizedRoadInfo leftRoadList[numLeftRoads] if leftSide == true;
  MultiDigitizedRoadInfo rightRoadList[numRightRoads] if rightSide == true;
};

/**
  * Intersection referenced other tiles Intersection.
  */
struct IntersectionReferenceList
{
  /** Number of related intersections.*/
  uint8    numIntersections;

  /** Road locations.*/
  RoadLocationId intersectionLocation[numIntersections];
};

/**
  * Globally unique identifier of a lane group location.
  * 16 Byte, RFC4122 version 5, plus a 1 byte branch identifier.
  */
struct LaneGroupLocationId
{
  /** Byte array that stores the UUID in network byte order. */
  uint8 value[16];

  /**
    * Identifier of the branch of this lane group location. If the lane group location does not
    * have branches, the branch ID is set to 0. This is the default value.
    */
  LaneGroupLocationBranchId branchId = NO_BRANCH;
};

/**
  * Identifier of a lane group location branch. The branch ID is unique within a
  * lane group location and part of the lane group location ID.
  */
subtype uint8 LaneGroupLocationBranchId;

/** Default branch ID value for road locations that do not have branches. */
const LaneGroupLocationBranchId NO_BRANCH = 0;

/**
  * Link referenced lane groups.
  */
struct LaneGroupReferenceList
{
  /** Number of related lanegroups.*/
  uint8    numLaneGroups;

  /** Road locations.*/
  LaneGroupLocationId laneGroupLocation[numLaneGroups];
};

/**
  * connectLanePortInfo
  */
struct LanePortInfo
{
  /** Number of related Lane.*/
  uint8    numConnectLane;

  /** connectLaneGroupLocationId. */
  LaneGroupLocationId laneGroupLocation[numConnectLane];

  /** connectLaneId. */
  uint32 laneId[numConnectLane];

};

/**
  * LaneGroupLaneRelation
  */
struct LaneGroupLaneRelation
{
  /** laneId.*/
  uint32 laneId;

  /**
  * pre Port number
  */
  RoadLocationId prePortId;

  /**
  * next Port number
  */
  RoadLocationId nextPortId;

  /** PrePort.*/
  LanePortInfo preLaneConnectLaneInfo[];

  /** nextPort.*/
  LanePortInfo nextLaneConnectLaneInfo[];
};

/**
  * LanePortId referenced LaneGroupId.
  */
struct LaneGroupLaneProtList
{
  /** LaneGroupLaneRelationList.*/
  LaneGroupLaneRelation laneGroupLane[];
};


/**
  * RoadConnect referenced other tiles roadids.
  */
struct RoadConnectReferenceList
{
  /** Number of Roads.*/
  uint8    numRoads;

  /** List of road paths. This list only stores the topology of roads, no geometries. */
  RoadLocationId id[numRoads];
};

/**
  * 
  */
struct RoadTransitionList
{
  /** roadConnectReferenceList. */
  RoadConnectReferenceList roadConnectReferenceList[];
};
