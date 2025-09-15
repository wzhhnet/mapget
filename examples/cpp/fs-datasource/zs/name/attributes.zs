/*!

# Name Attributes

This package defines the attributes that are available in the Name module.
Names can be defined for roads and for lanes.

**Dependencies**

!*/

package name.attributes;

import core.types.*;

import name.types.*;


/*!

## Name Attributes for Roads

Name attributes for roads describe names of transitions and intersections, of
ranges on a road, and of positions on a road.

!*/

/** Name attributes for transitions. */
enum varuint16 NameTransitionAttributeType
{
  /** Name of the intersection. */
  INTERSECTION_NAME,
};

/** Name attributes for road ranges. */
enum varuint16 NameRoadRangeAttributeType
{

  /** Name of the road. */
  ROAD_NAME,

  /** Name of a bridge that the road is located on. */
  BRIDGE_NAME,

  /** Name of a tunnel that the road passes. */
  TUNNEL_NAME,

  /**
    * Name used to indicate that the road is part of a named route.
    * Example: "S Van Ness Ave" is part of "United States Highway 101 N" (San Francisco).
    */
  ROUTE_NAME,

  /** Road number. */
  ROAD_NUMBER,

  /** Administrative hierarchy of the area where the road is located. */
  ADMINISTRATIVE_HIERARCHY,

  /** Range of house numbers along a road range. */
  HOUSE_NUMBER_RANGE,

  /** Service area name. */
  SERVICE_AREA_NAME,

  /** Intersection name. */
  INTERSECTION_NAME,

  /** Exit name to be assigned to ramps. */
  EXIT_NAME,

  /** Exit number to be assigned to ramps. */
  EXIT_NUMBER,
};

/** Name attributes for road positions. */
enum varuint16 NameRoadPositionAttributeType
{
  /** Individual house number at a road position. */
  HOUSE_NUMBER,

  /** Name of a toll station. */
  TOLL_STATION_NAME,
};

choice NameTransitionAttributeValue(NameTransitionAttributeType type) on type
{
  case INTERSECTION_NAME:
          IntersectionName intersectionName;
};

choice NameRoadRangeAttributeValue(NameRoadRangeAttributeType type) on type
{
  case ROAD_NAME:
          RoadName roadName;
  case BRIDGE_NAME:
          BridgeName bridgeName;
  case TUNNEL_NAME:
          TunnelName tunnelName;
  case ROUTE_NAME:
          RouteName routeName;
  case ROAD_NUMBER:
          RoadNumber roadNumber;
  case ADMINISTRATIVE_HIERARCHY:
          AdministrativeHierarchy administrativeHierarchy;
  case HOUSE_NUMBER_RANGE:
          HouseNumberRange houseNumberRange;
  case SERVICE_AREA_NAME:
          ServiceAreaName serviceAreaName;
  case INTERSECTION_NAME:
          IntersectionName intersectionName;
  case EXIT_NAME:
          ExitName exitName;
  case EXIT_NUMBER:
          ExitNumber exitNumber;
};

choice NameRoadPositionAttributeValue(NameRoadPositionAttributeType type) on type
{
  case HOUSE_NUMBER:
    HouseNumber houseNumber;
  case TOLL_STATION_NAME:
    TollStationName tollStationName;
};

/*!

## Name Attributes for Lanes

Name attributes for lanes describe names of lane ranges or lane positions.
Names can be assigned to individual lanes, complete lane groups, or parts of
lane groups. Names that are assigned to lane groups correspond to road names.

!*/

/** Name attributes for lane ranges. Can be assigned to lanes or lane groups. */
enum varuint16 NameLaneRangeAttributeType
{
  /** Name of the road to which the lane or lanes belong. */
  ROAD_NAME,

  /** Name of a bridge that the road or lane is located on. */
  BRIDGE_NAME,

  /** Name of a tunnel that the road or lane passes. */
  TUNNEL_NAME,

  /**
    * Name used to indicate that the road to which the lane or lanes belong is
    * part of a named route.
    * Example: "S Van Ness Ave" is part of "United States Highway 101 N" (San Francisco).
    */
  ROUTE_NAME,

  /** Road number. */
  ROAD_NUMBER,

  /** Administrative hierarchy of the area where the road or lane is located. */
  ADMINISTRATIVE_HIERARCHY,

 /** Range of house numbers along a lane range. */
  HOUSE_NUMBER_RANGE,

  /** Service area name. */
  SERVICE_AREA_NAME,

  /** Intersection name. */
  INTERSECTION_NAME,

  /** Exit name to be assigned to ramps. */
  EXIT_NAME,

  /** Exit number to be assigned to ramps. */
  EXIT_NUMBER,
};

/** Name attributes for lane positions. Can be assigned to lanes or lane groups. */
enum varuint16 NameLanePositionAttributeType
{
  /** Individual house number at a position on the road or lane. */
  HOUSE_NUMBER,

  /** Name of a toll station. */
  TOLL_STATION_NAME,
};

choice NameLaneRangeAttributeValue(NameLaneRangeAttributeType type) on type
{
  case ROAD_NAME:
          RoadName roadName;
  case BRIDGE_NAME:
          BridgeName bridgeName;
  case TUNNEL_NAME:
          TunnelName tunnelName;
  case ROUTE_NAME:
          RouteName routeName;
  case ROAD_NUMBER:
          RoadNumber roadNumber;
  case ADMINISTRATIVE_HIERARCHY:
          AdministrativeHierarchy administrativeHierarchy;
  case HOUSE_NUMBER_RANGE:
          HouseNumberRange houseNumberRange;
  case SERVICE_AREA_NAME:
          ServiceAreaName serviceAreaName;
  case INTERSECTION_NAME:
          IntersectionName intersectionName;
  case EXIT_NAME:
          ExitName exitName;
  case EXIT_NUMBER:
          ExitNumber exitNumber;
};

choice NameLanePositionAttributeValue(NameLanePositionAttributeType type) on type
{
  case HOUSE_NUMBER:
    HouseNumber houseNumber;
  case TOLL_STATION_NAME:
    TollStationName tollStationName;
};


/*!

## Name Attributes for Display Features

Name attributes provide labels for display features, that is, lines, areas,
and points.


!*/

/** Name attributes for ranges on display line features. */
enum varuint16 NameDisplayLineRangeAttributeType
{
  /** Name of a road. */
  ROAD_NAME,

  /** Name of a bridge. */
  BRIDGE_NAME,

  /** Name of a tunnel. */
  TUNNEL_NAME,

  /**
    * Name used to indicate that the road that corresponds to the display line
    * is part of a named route.
    * Example: "S Van Ness Ave" is part of "United States Highway 101 N" (San Francisco).
    */
  ROUTE_NAME,

  /** Road number. */
  ROAD_NUMBER,

  /** Administrative hierarchy of the area where the line is located. */
  ADMINISTRATIVE_HIERARCHY,

  /** Generic label for a display line without further details. */
  LINE_LABEL_NAME,

  /** Label for all lines representing water, for example, rivers or creeks. */
  WATER_NAME,

  /**
    * Label for lines representing public transport, for example, railway tracks
    * or tram tracks.
    */
  PUBLIC_TRANSPORT_NAME,

  /**
    * Label for lines representing borders, for example, country borders or
    * sea borders. */
  BORDER_NAME,

  /** Service area name. */
  SERVICE_AREA_NAME,

  /** Intersection name. */
  INTERSECTION_NAME,

  /** Exit name to be assigned to ramps. */
  EXIT_NAME,

  /** Exit number to be assigned to ramps. */
  EXIT_NUMBER,
};

choice NameDisplayLineRangeAttributeValue(NameDisplayLineRangeAttributeType type) on type
{
  case ROAD_NAME:
          RoadName roadName;
  case BRIDGE_NAME:
          BridgeName bridgeName;
  case TUNNEL_NAME:
          TunnelName tunnelName;
  case ROUTE_NAME:
          RouteName routeName;
  case ROAD_NUMBER:
          RoadNumber roadNumber;
  case ADMINISTRATIVE_HIERARCHY:
          AdministrativeHierarchy administrativeHierarchy;
  case LINE_LABEL_NAME:
          LabelName labelName;
  case WATER_NAME:
          LabelName waterName;
  case PUBLIC_TRANSPORT_NAME:
          LabelName publicTransportName;
  case BORDER_NAME:
          LabelName borderName;
  case SERVICE_AREA_NAME:
          ServiceAreaName serviceAreaName;
  case INTERSECTION_NAME:
          IntersectionName intersectionName;
  case EXIT_NAME:
          ExitName exitName;
  case EXIT_NUMBER:
          ExitNumber exitNumber;
};

/** Name attributes for display area features. */
enum varuint16 NameDisplayAreaAttributeType
{
  /** Name of a road. */
  ROAD_NAME,

  /** Name of a bridge. */
  BRIDGE_NAME,

  /** Name of a tunnel. */
  TUNNEL_NAME,

  /** Generic label for a display area. */
  AREA_LABEL_NAME,

  /** Name of a building. */
  BUILDING_NAME,

  /** Name of a nature area, for example, a forest, wetlands, or an agricultural area. */
  NATURE_AREA_NAME,

  /** Name of a water area, for example, an ocean, lake, or river. */
  WATER_NAME,

  /** Name of an administrative area, for example, a city or country. */
  ADMINISTRATIVE_AREA_NAME,

  /** Administrative hierarchy of the display area feature. */
  ADMINISTRATIVE_HIERARCHY,

  /** Service area name. */
  SERVICE_AREA_NAME,

  /** Intersection name. */
  INTERSECTION_NAME,
};

choice NameDisplayAreaAttributeValue(NameDisplayAreaAttributeType type) on type
{
  case ROAD_NAME:
          RoadName roadName;
  case BRIDGE_NAME:
          BridgeName bridgeName;
  case TUNNEL_NAME:
          TunnelName tunnelName;
  case AREA_LABEL_NAME:
          LabelName areaName;
  case BUILDING_NAME:
          LabelName buildingName;
  case NATURE_AREA_NAME:
          LabelName natureAreaName;
  case WATER_NAME:
          LabelName waterName;
  case ADMINISTRATIVE_AREA_NAME:
          LabelName administrativeAreaName;
  case ADMINISTRATIVE_HIERARCHY:
          AdministrativeHierarchy administrativeHierarchy;
  case SERVICE_AREA_NAME:
          ServiceAreaName serviceAreaName;
  case INTERSECTION_NAME:
          IntersectionName intersectionName;
};

/** Name attributes for display point features. */
enum varuint16 NameDisplayPointAttributeType
{
  /** Generic label for a display point. */
  POINT_LABEL_NAME,

  /** Name of the center of an administrative area, for example, a city or country. */
  ADMINISTRATIVE_AREA_CENTER_NAME,

  /** Name of a mountain peak. */
  MOUNTAIN_NAME,

  /** Name of an island. */
  ISLAND_NAME,

  /** Name of a toll station. */
  TOLL_STATION_NAME,
};

choice NameDisplayPointAttributeValue(NameDisplayPointAttributeType type) on type
{
  case POINT_LABEL_NAME:
          LabelName pointName;
  case ADMINISTRATIVE_AREA_CENTER_NAME:
          LabelName administrativeAreaCenterName;
  case MOUNTAIN_NAME:
          LabelName mountainName;
  case ISLAND_NAME:
          LabelName islandName;
  case TOLL_STATION_NAME:
          TollStationName tollStationName;
};

/*!

## Name Attributes for POI Features

Name attributes provide names and addresses for POI features.


!*/

/** Name attributes for POI features. */
enum varuint16 NamePoiAttributeType
{
  /** Name of a POI. */
  NAME,

  /** Administrative hierarchy of the POI. */
  ADMINISTRATIVE_HIERARCHY,

  /** Road name that is part of the POI address. */
  ROAD_NAME,

  /** House number that is part of the POI address. */
  HOUSE_NUMBER,

  /** Name of the building in which the POI is located. */
  BUILDING_NAME,

  /** Designation of the floor on which the POI is located. */
  FLOOR_NAME,
};

choice NamePoiAttributeValue(NamePoiAttributeType type) on type
{
  case NAME:
        PoiName poiName;
  case ADMINISTRATIVE_HIERARCHY:
        AdministrativeHierarchy administrativeHierarchy;
  case ROAD_NAME:
        RoadName roadName;
  case HOUSE_NUMBER:
        HouseNumber houseNumber;
  case BUILDING_NAME:
        BuildingName buildingName;
  case FLOOR_NAME:
        FloorName floorName;
};