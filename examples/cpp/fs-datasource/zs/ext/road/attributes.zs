/*!

# Road Lane Attributes

This package defines the relationship between lane group and road.

**Dependencies**

!*/
package ext.road.attributes;

import core.types.*;
import lane.reference.types.*;
import road.reference.types.*;
import ext.road.types.*;
import ext.lane.types.*;

/*!

## lane group id for Roads

!*/
enum varuint16 LaneRoadRangeAttributeType
{

  /** lanegroup IDs. */
  LANEGROUP_REFERENCES = 0,

};

choice LaneRoadRangeAttributeValue(LaneRoadRangeAttributeType type) on type
{
  case LANEGROUP_REFERENCES:
        GlobalSourceIdReferenceList globalSourceIdReferenceList;
};

/*! ## road id related with lane group !*/
enum varuint16 RoadLaneRangeAttributeType
{

  /** road ids. */
  ROAD_REFERENCES = 0,

};

choice RoadLaneRangeAttributeValue(RoadLaneRangeAttributeType type) on type
{
  case ROAD_REFERENCES:
          GlobalSourceIdReferenceList globalSourceIdReferenceList;
          
};

/*! ## intersectionId id related with the other intersectionId !*/
enum varuint16 IntersectionRelationAttributeType
{

  /** intersection ids. */
  INTERSECTIONID_REFERENCES = 0,

};

choice IntersectionRelationAttributeValue(IntersectionRelationAttributeType type) on type
{
  case INTERSECTIONID_REFERENCES:
          IntersectionReferenceList intersectionReferenceList;
};

/*!

## characteristics attribute for Roads

!*/
enum varuint16 CharacsRoadRangeExAttributeType
{

  /** z_Level */
  ROAD_Z_LEVEL,

  /** the index  of subscales in LevelMetadata */
  SCALE_LEVEL,

  /** connection info for indoor road that connects different floors */
  CONNECTION_INFO_ACROSS_FLOORS,

  /** lane type */
  LANE_ACCESS_TYPE,

  /** floor number */
  FLOOR_NUMBER,

  /** parking info */
  PARKING,

  /** variable lanes */
  VARIABLE_LANE,

};

choice CharacsRoadRangeExAttributeValue(CharacsRoadRangeExAttributeType type) on type
{
  case ROAD_Z_LEVEL:
          int8 roadHeightLevel;
  case SCALE_LEVEL:
          int8 scaleLevel;
  case CONNECTION_INFO_ACROSS_FLOORS:
          ConnectionInfoAcrossFloors connectionInfoAcrossFloors;
  case LANE_ACCESS_TYPE:
          LaneAccessType accessLaneType;
  case FLOOR_NUMBER:
          varint16 floorNumber;
  case PARKING:
          Parking parking;
  case VARIABLE_LANE:
          bool variableLane;
};

/*!

## characteristics attribute for Roads

!*/
enum varuint16 CharacsRoadPositionExAttributeType
{

  /** z_Level */
  ROAD_Z_LEVEL,

  /** the index  of subscales in LevelMetadata */
  SCALE_LEVEL,

  /** connection info for indoor road that connects different floors */
  CONNECTION_INFO_ACROSS_FLOORS,

  /** lane type */
  LANE_ACCESS_TYPE,

  /** floor number */
  FLOOR_NUMBER,

  /** parking info */
  PARKING,
};

choice CharacsRoadPositionExAttributeValue(CharacsRoadPositionExAttributeType type) on type
{
  case ROAD_Z_LEVEL:
          int8 roadHeightLevel;
  case SCALE_LEVEL:
          int8 scaleLevel;
  case CONNECTION_INFO_ACROSS_FLOORS:
          ConnectionInfoAcrossFloors connectionInfoAcrossFloors;
  case LANE_ACCESS_TYPE:
          LaneAccessType accessLaneType;
  case FLOOR_NUMBER:
          varint16 floorNumber;
  case PARKING:
          Parking parking;
};

/*!

## characteristics attribute for Roads

!*/
enum varuint16 CharacsRoadRangeExtendAttributeType
{
  /** total lane number */
  TOTAL_LANE_NUM,

  /** lane increase or decrease in link */
  LANE_GEO_CONNECT_TYPE,

  /** Multi-digitized references. */
  MULTI_DIGITIZED_REFERENCES,
};

choice CharacsRoadRangeExtendAttributeValue(CharacsRoadRangeExtendAttributeType type) on type
{
  case TOTAL_LANE_NUM:
          int8 totalLaneNum;       
  case LANE_GEO_CONNECT_TYPE:
          LaneGeoConnectType connectType;
  case MULTI_DIGITIZED_REFERENCES:
          MultiDigitizedReferences multiDigitizedReferences;
};

/*! ## intersectionId id related with the other intersectionId !*/
enum varuint16 LaneGroupLaneProtInfoAttributeType
{

  /** LaneGroup ids. */
  LanePortInfo = 0,

};

choice LaneGroupLaneProtInfoAttributeValue(LaneGroupLaneProtInfoAttributeType type) on type
{
  case LanePortInfo:
          LaneGroupLaneProtList LaneGroupLaneProtList;
};

/*! ## road id related with lane group !*/
enum varuint16 RoadConnectAttributeType
{

  /** road ids. */
  ROAD_CONNECT_REFERENCES = 0,

};

choice  RoadConnectAttributeValue(RoadConnectAttributeType type) on type
{
  case ROAD_CONNECT_REFERENCES:
          RoadTransitionList roadTransitionList ;
};
