/*!

# Routing Types

This package defines basic types that are used in the Routing module.

**Dependencies**

!*/

package routing.types;

import core.vehicle.*;
import core.geometry.*;

/*!

## Route Point Types and Waypoint Types

Route points describe each point of a calculated route. Route points
are mainly used for application purposes like map matching and guidance generation.

The following route point types are available:

- **Maneuver**: At this point a guidance instruction is required because
  the route does not follow the main course of the road.
- **Decision**: A point along the route where there is an intersection with more than
  one outgoing path but no guidance instruction is required.
  This is the case when the route follows the main course of the road.
- **Reconstruction**: A point that is mainly used for reconstructing the route
  in cases that additional points are required to correctly do so. The route
  point does not lie on an intersection.

For map-matching purposes, all route point types have to be considered.

Waypoints are important points on a route that are selected by the driver, for
example, origin and destination, stopovers, or a home location.

**Example**

The following figure shows a route with the following route points:

1. The first route point is the origin of the route.
1. The second route point has the route point type `MANEUVER`
   because the driver needs to decide which road to take in the fork scenario.
1. The third route point has the route point type `DECISION` because the driver
   simply stays on the main road and needs no guidance instruction. The route point
   additionally has the waypoint type `VIA` because the driver specifically
   chose a route that passes through this location.
1. The fourth route point has the type `MANEUVER` because the driver needs to turn
   off the main road. A guidance instruction is required.
1. The last route point is the destination of the route.

![Route points and waypoints](assets/route_point_types.png "test")

!*/

/** Types of route points. */
enum uint8 RoutePointType
{
  /** Decision point on the route. */
  DECISION,

  /** Maneuver point on the route. */
  MANEUVER,

  /** Additional route point for map matching and route reconstruction. */
  RECONSTRUCTION,
};

/**
  * Types of waypoints, that is, important points on a route that are selected
  * by the driver.
  */
enum uint8 WaypointType
{
  /**
    * Last waypoint of a route that is located on the road network.
    * Can be followed by a waypoint of type `DESTINATION_FINAL`.
    */
  DESTINATION,

  /** Waypoint is the origin of a route. */
  ORIGIN,

  /** Waypoint is stopover location. */
  STOPOVER,

  /** Waypoint is a via on the route. */
  VIA_POINT,

  /** Waypoint is an EV charging facility. */
  EV_RECHARGE,

  /** Waypoint is a refueling facility. */
  REFUEL,

  /** Waypoint is a rest stop. */
  REST_STOP,

  /** Waypoint is the driver's home location. */
  HOME,

  /** Waypoint is the driver's work location. */
  WORK,

  /** Custom waypoint defined by the driver. */
  USER,

  /**
    * Waypoint that is used in addition to `DESTINATION` when the destination
    * is off the road network, for example, a POI or an address point location.
    * Allows to indicate on which side of the road the final destination is
    * located.
   */
  DESTINATION_FINAL,
};



/*!

## Other Route-Related Types

!*/


/**
  * Describes properties of a route that are used to prefer the route over
  * another or to avoid routes with this property.
  */
enum uint8 RouteOptionType
{
  /** Prefer or avoid scenic roads. */
  SCENIC,

  /** Prefer or avoid motorways. */
  MOTORWAY,

  /** Prefer or avoid roads where autonomous driving is possible. */
  AUTONOMOUS_DRIVING,

  /** Avoid turns that are difficult, dangerous, or impossible to take for trucks. */
  DIFFICULT_TURNS,

  /** Avoid tunnels. */
  TUNNEL,

  /** Prefer or avoid ferries. */
  FERRY,

  /** Prefer or avoid roads which are only accessible with a vignette. */
  VIGNETTE,

  /** Prefer or avoid toll roads. */
  TOLL,

  /** Prefer or avoid roads with HOV lanes or complete HOV roads. */
  HOV,

  /** Prefer or avoid unpaved roads. */
  UNPAVED,

  /** Prefer or avoid local roads. */
  LOCAL_ROADS,

  /**
    * Prefer or avoid challenging roads. Challenging roads
    * have high windingness and hilliness.
    */
  CHALLENGING,
};

/** Consumption prediction details for a route segment. */
struct RouteSegmentConsumption
{
  /** Predicted fuel consumption. */
  FuelLiters fuelConsumption;

  /** Predicted battery consumption. */
  WattHrs batteryConsumption;
};

/** Information about carbon dioxide pollution. */
struct Pollution
{
  /** Carbon dioxide in g/km. */
  varuint carbonDioxide;
};

/** Type of route. */
enum uint8 RouteType
{
  /** Fastest route. */
  FASTEST,

  /** Shortest route. */
  SHORTEST,

  /** Eco route, that is, route with the least fuel or energy consumption. */
  ECO,

  /** Green route, that is, route with the least overall pollution. */
  GREEN,
};


/** Driver profile. */
struct DriverProfile
{
  /**
    * Describes the driving style on a scale from 0-100, where 100 is a very
    * aggressive driving style.
    * Used for fuel consumption calculation.
   */
  optional uint8 aggressiveness;

  // optional avoidance areas
  // TODO: List of poly areas (reuse from NDS 2.5.4)
  // TODO: List of strings for street/city/places to avoid

  /** Driver is disabled. */
  optional bool isDisabledPerson;

  /** Driver's home address. */
  optional Position2D(0) homeAddress;

  /** Driver's work address. */
  optional Position2D(0) workAddress;

  // TODO: Add more information for route prediction services
  // (e.g. predict where driver will go to right now)
};

/**
  * Route segments are categorized by predefined types.
  *
  * TODO: Check and extend the code comments below.
  */
enum uint8 RouteSegmentType
{
  /** Route segment causes a delay on the route. */
  DELAY,

  /** TODO: Add description. */
  POLLUTION,

  /** Route segment is a tunnel. */
  TUNNEL,

  /** Route segment is a bridge. */
  BRIDGE,

  /** Route segment is a ferry connection. */
  FERRY,

  /** Route segment is a car shuttle train. */
  CAR_TRAIN,

  /** Route segment is to be traveled using public transport. */
  PUBLIC_TRANSPORT,

  /** Route segment is a motorway. */
  MOTORWAY,

  /** Route segment is unpaved. */
  UNPAVED,

  /** Route segment supports autonomous driving level 3. */
  AUTOMATED_DRIVING_L3,

  /** Route segment supports autonomous driving level 4. */
  AUTOMATED_DRIVING_L4,

  /** Route segment supports autonomous driving level 5. */
  AUTOMATED_DRIVING_L5,

  /** Route segment has limited availability of mobile data. */
  LIMITED_MOBILE_DATA_COVERAGE,

  /** Route segment includes a traffic enforcement camera. */
  TRAFFIC_ENFORCEMENT_CAMERA,

  /** Route segment is a traffic enforcement zone. */
  TRAFFIC_ENFORCEMENT_ZONE,

  /** Route segment is a toll area. */
  TOLL,

  /** Route segment requires a vignette. */
  VIGNETTE,

  /** Route segment is to be traveled on foot. */
  PEDESTRIAN,

  /** Route segment is to be traveled by bicycle. */
  BIKE,

  /** Route segment is to be traveled by scooter. */
  SCOOTER,

  /** Route segment is an environmental zone. */
  ENVIRONMENT_ZONE,

  /** Access to the route segment is restricted by a user. */
  USER_RESTRICTED_ACCESS,

  /** Route segment is physically inaccessible. */
  PHYSICAL_RESTRICTED_ACCESS,

  /** Access to the route segment is forbidden by the authorities. */
  LEGAL_RESTRICTED_ACCESS,
};

/** Type of range projection request, described using a bitmask. */
bitmask uint8 RangeProjectionType
{
  /** Range is calculated based on a given distance. */
  DISTANCE,

  /** Range is calculated based on a given time budget. */
  TIME,

  /** Range is calculated based on a fuel budget. */
  FUEL,

  /** Range is calculated based on a battery energy budget. */
  BATTERY,
};

/**
  * Guidance codes define which type of guidance instruction is given to the
  * driver.
  */
enum uint8 GuidanceCode
{
  /** Continue straight. */
  STRAIGHT,

  /** Bear left. */
  BEAR_LEFT,

  /** Bear right. */
  BEAR_RIGHT,

  /** Turn left. */
  LEFT,

  /** Turn right. */
  RIGHT,

  /** Make a slight left turn. */
  SLIGHT_LEFT,

  /** Make a slight right turn. */
  SLIGHT_RIGHT,

  /** Make a sharp left turn. */
  SHARP_LEFT,

  /** Make a sharp right turn. */
  SHARP_RIGHT,

  /** Make a U-turn to the left on a single-carriage road. */
  UTURN_LEFT,

  /** Make a U-turn to the right on a single-carriage road. */
  UTURN_RIGHT,

  /** Make a U-turn to the left on a dual-carriage road. */
  UTURN_LEFT_DUAL,

  /** Make a U-turn to the right on a dual-carriage road. */
  UTURN_RIGHT_DUAL,

  /** Keep left at a bifurcation on a multi-lane road. */
  KEEP_LEFT,

  /** Keep right at a bifurcation on a multi-lane road. */
  KEEP_RIGHT,

  /** Keep left at a bifurcation on a single-lane road. */
  KEEP_LEFT_SINGLE,

  /** Keep right at a bifurcation on a single-lane road. */
  KEEP_RIGHT_SINGLE,

  /**
    * Entering a roundabout when driving on the right
    * (vehicle makes a right turn into the roundabout).
   */
  ROUNDABOUT,

  /**
    * Entering a roundabout when driving on the left
    * (vehicle makes a left turn into the roundabout).
   */
  ROUNDABOUT_REVERSED,

  /** Exit motorway to the left. */
  MOTORWAY_EXIT_LEFT,

  /** Exit motorway to the right. */
  MOTORWAY_EXIT_RIGHT,

  /** Boarding a ferry. */
  BOARD_FERRY,

  /** Leaving a ferry. */
  LEAVE_FERRY,

  /** Boarding a car shuttle train. */
  BOARD_CAR_SHUTTLE_TRAIN,

  /** Leaving a car shuttle train. */
  LEAVE_CAR_SHUTTLE_TRAIN,

  /** Arrive at destination. */
  ARRIVE,

  /** Depart from origin or stopover point. */
  DEPART,

  /** Head north. */
  HEAD_NORTH,

  /** Head northeast. */
  HEAD_NORTH_EAST,

  /** Head east. */
  HEAD_EAST,

  /** Head southeast. */
  HEAD_SOUTH_EAST,

  /** Head south. */
  HEAD_SOUTH,

  /** Head southwest. */
  HEAD_SOUTH_WEST,

  /** Head west. */
  HEAD_WEST,

  /** Head northwest. */
  HEAD_NORTH_WEST,
};

/*!

## Basic Subtypes and Constants

!*/

/** Guidance instructions given to the driver. */
subtype string ExtGuidanceCode;

/** Turn left at the end of the road. Fallback guidance code: `LEFT`. */
const ExtGuidanceCode LEFT_END = "LEFT_END";

/** Turn right at the end of the road. Fallback guidance code: `RIGHT`. */
const ExtGuidanceCode RIGHT_END = "RIGHT_END";

/** Turn left through a slip road. Fallback guidance code: `LEFT`. */
const ExtGuidanceCode LEFT_SLIP = "LEFT_SLIP";

/** Turn right through a slip road. Fallback guidance code: `RIGHT`. */
const ExtGuidanceCode RIGHT_SLIP = "RIGHT_SLIP";

/** Keep left onto a ramp leading to the motorway. Fallback guidance code: `KEEP_LEFT`. */
const ExtGuidanceCode KEEP_LEFT_ENTER_MOTORWAY = "KEEP_LEFT_ENTER_MOTORWAY";

/** Keep right onto a ramp leading to the motorway. Fallback guidance code: `KEEP_RIGHT`. */
const ExtGuidanceCode KEEP_RIGHT_ENTER_MOTORWAY = "KEEP_RIGHT_ENTER_MOTORWAY";

/** Turn left onto a ramp leading to the motorway. Fallback guidance code: `LEFT`. */
const ExtGuidanceCode LEFT_ENTER_MOTORWAY = "LEFT_ENTER_MOTORWAY";

/** Turn right onto a ramp leading to the motorway. Fallback guidance code: `RIGHT`. */
const ExtGuidanceCode RIGHT_ENTER_MOTORWAY = "RIGHT_ENTER_MOTORWAY";

/**
  * Make a slight left turn onto a ramp leading to the motorway.
  * Fallback guidance code: `SLIGHT_LEFT`.
  */
const ExtGuidanceCode SLIGHT_LEFT_ENTER_MOTORWAY = "SLIGHT_LEFT_ENTER_MOTORWAY";

/**
  * Make a slight right turn onto a ramp leading to the motorway.
  * Fallback guidance code: `SLIGHT_RIGHT`.
  */
const ExtGuidanceCode SLIGHT_RIGHT_ENTER_MOTORWAY = "SLIGHT_RIGHT_ENTER_MOTORWAY";

/**
  * Make a sharp left turn onto a ramp leading to the motorway.
  * Fallback guidance code: `SHARP_LEFT`.
  */
const ExtGuidanceCode SHARP_LEFT_ENTER_MOTORWAY = "SHARP_LEFT_ENTER_MOTORWAY";

/** Make a sharp right turn onto a ramp leading to the motorway.
  * Fallback guidance code: `SHARP_RIGHT`.
  */
const ExtGuidanceCode SHARP_RIGHT_ENTER_MOTORWAY = "SHARP_RIGHT_ENTER_MOTORWAY";

/**
  * Make a left U-turn at an explicitly given position along a road segment.
  * The position is indicated by lane marking and lane arrow. Probably only in Korea.
  * Fallback guidance code: `UTURN_LEFT_DUAL`.
  */
const ExtGuidanceCode UTURN_LEFT_EXPLICIT = "UTURN_LEFT_EXPLICIT";

/**
  * Make a right U-turn at an explicitly given position along a road segment.
  * Position indicated by lane marking and lane arrow. Probably only in Korea.
  * Fallback guidance code: `UTURN_RIGHT_DUAL`.
  */
const ExtGuidanceCode UTURN_RIGHT_EXPLICIT = "UTURN_RIGHT_EXPLICIT";

/** Make a hook turn to the right. Fallback guidance code: `RIGHT`. */
const ExtGuidanceCode HOOK_TURN_RIGHT = "HOOK_TURN_RIGHT";

/** Turn left directly onto a service road on the right. Fallback guidance code: `LEFT`. */
const ExtGuidanceCode TURN_LEFT_SERVICE_ROAD_RIGHT = "TURN_LEFT_SERVICE_ROAD_RIGHT";

/** Turn left directly onto a service road on the left. Fallback guidance code: `LEFT`. */
const ExtGuidanceCode TURN_LEFT_SERVICE_ROAD_LEFT = "TURN_LEFT_SERVICE_ROAD_LEFT";

/** Turn right directly onto a service road on the left. Fallback guidance code: `RIGHT`. */
const ExtGuidanceCode TURN_RIGHT_SERVICE_ROAD_LEFT = "TURN_RIGHT_SERVICE_ROAD_LEFT";

/** Turn right directly onto a service road on the right. Fallback guidance code: `RIGHT`. */
const ExtGuidanceCode TURN_RIGHT_SERVICE_ROAD_RIGHT = "TURN_RIGHT_SERVICE_ROAD_RIGHT";

/** Enter the service road to the left. Fallback guidance code: `KEEP_LEFT`. */
const ExtGuidanceCode SERVICE_ROAD_ENTER_LEFT = "SERVICE_ROAD_ENTER_LEFT";

/** Enter the service road to the right. Fallback guidance code: `KEEP_RIGHT`. */
const ExtGuidanceCode SERVICE_ROAD_ENTER_RIGHT = "SERVICE_ROAD_ENTER_RIGHT";

/** Leave the service road to the left. Fallback guidance code: `KEEP_LEFT`. */
const ExtGuidanceCode SERVICE_ROAD_LEAVE_LEFT = "SERVICE_ROAD_LEAVE_LEFT";

/** Leave the service road to the right. Fallback guidance code: `KEEP_RIGHT`. */
const ExtGuidanceCode SERVICE_ROAD_LEAVE_RIGHT = "SERVICE_ROAD_LEAVE_RIGHT";

/** Enter the forming service road to the left. Fallback guidance code: `KEEP_LEFT`. */
const ExtGuidanceCode SERVICE_ROAD_BEGIN_LEFT = "SERVICE_ROAD_BEGIN_LEFT";

/** Enter the forming service road to the right. Fallback guidance code: `KEEP_RIGHT`. */
const ExtGuidanceCode SERVICE_ROAD_BEGIN_RIGHT = "SERVICE_ROAD_BEGIN_RIGHT";

/** Leave the merging service road to the left. Fallback guidance code: `KEEP_LEFT`. */
const ExtGuidanceCode SERVICE_ROAD_END_LEFT = "SERVICE_ROAD_END_LEFT";

/** Leave the merging service road to the right. Fallback guidance code: `KEEP_RIGHT`. */
const ExtGuidanceCode SERVICE_ROAD_END_RIGHT = "SERVICE_ROAD_END_RIGHT";

/** Keep left onto an underpass. Fallback guidance code: `KEEP_LEFT`. */
const ExtGuidanceCode UNDERPASS_LEFT = "UNDERPASS_LEFT";

/** Keep right onto an underpass. Fallback guidance code: `KEEP_RIGHT`. */
const ExtGuidanceCode UNDERPASS_RIGHT = "UNDERPASS_RIGHT";

/** Keep left onto an overpass. Fallback guidance code: `KEEP_LEFT`. */
const ExtGuidanceCode OVERPASS_LEFT = "OVERPASS_LEFT";

/** Keep right onto an overpass. Fallback guidance code: `KEEP_RIGHT`. */
const ExtGuidanceCode OVERPASS_RIGHT = "OVERPASS_RIGHT";

/**
  * Turn left in the roundabout when driving on the right.
  * Fallback guidance code: `ROUNDABOUT`.
  */
const ExtGuidanceCode ROUNDABOUT_EXIT_LEFT = "ROUNDABOUT_EXIT_LEFT";

/**
  * Turn right in the roundabout when driving on the right.
  * Fallback guidance code: `ROUNDABOUT`.
  */
const ExtGuidanceCode ROUNDABOUT_EXIT_RIGHT = "ROUNDABOUT_EXIT_RIGHT";

/**
  *Go straight in the roundabout when driving on the right.
  * Fallback guidance code: `ROUNDABOUT`.
  */
const ExtGuidanceCode ROUNDABOUT_STRAIGHT = "ROUNDABOUT_STRAIGHT";

/**
  * Turn left in the roundabout when driving on the left.
  * Fallback guidance code: `ROUNDABOUT_REVERSED`.
  */
const ExtGuidanceCode ROUNDABOUT_REVERSED_EXIT_LEFT = "ROUNDABOUT_REVERSED_EXIT_LEFT";

/**
  * Turn right in the roundabout when driving on the left.
  * Fallback guidance code: `ROUNDABOUT_REVERSED`.
  */
const ExtGuidanceCode ROUNDABOUT_REVERSED_EXIT_RIGHT = "ROUNDABOUT_REVERSED_EXIT_RIGHT";

/**
  * Go straight in the roundabout when driving on the left.
  * Fallback guidance code: `ROUNDABOUT_REVERSED`.
  */
const ExtGuidanceCode ROUNDABOUT_REVERSED_STRAIGHT = "ROUNDABOUT_REVERSED_STRAIGHT";

/**
  * Enter the tunnel.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode ENTER_TUNNEL = "ENTER_TUNNEL";

/**
  * Leave the tunnel.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode LEAVE_TUNNEL = "LEAVE_TUNNEL";

/**
  * Continue straight onto the motorway.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode STRAIGHT_ONTO_MOTORWAY = "STRAIGHT_ONTO_MOTORWAY";

/**
  * Continue straight at the end of the motorway.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode STRAIGHT_END_MOTORWAY = "STRAIGHT_END_MOTORWAY";

/**
  * Pass a toll station.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode PASS_TOLL_STATION = "PASS_TOLL_STATION";

/**
  * Lane is merging from the left.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode LANE_MERGE_LEFT = "LANE_MERGE_LEFT";

/**
  * Lane is merging from the right.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode LANE_MERGE_RIGHT = "LANE_MERGE_RIGHT";

/**
  * Lanes are merging from the right and the left.
  * Fallback guidance code: `STRAIGHT`.
  */
const ExtGuidanceCode LANE_MERGE_LEFT_RIGHT = "LANE_MERGE_LEFT_RIGHT";

/**
  * Arrive at destination. Destination is on the left.
  * Fallback guidance code: `ARRIVE`.
  */
const ExtGuidanceCode ARRIVE_LEFT = "ARRIVE_LEFT";

/**
  * Arrive at destination. Destination is on the right.
  * Fallback guidance code: `ARRIVE`.
  */
const ExtGuidanceCode ARRIVE_RIGHT = "ARRIVE_RIGHT";

/**
  * Arrive at waypoint.
  * Fallback guidance code: none.
  */
const ExtGuidanceCode ARRIVE_WAYPOINT = "ARRIVE_WAYPOINT";

/**
  * Arrive at waypoint. Waypoint is on the left.
  * Fallback guidance code: none.
  */
const ExtGuidanceCode ARRIVE_WAYPOINT_LEFT = "ARRIVE_WAYPOINT_LEFT";

/**
  * Arrive at waypoint. Waypoint is on the right.
  * Fallback guidance code: none.
  */
const ExtGuidanceCode ARRIVE_WAYPOINT_RIGHT = "ARRIVE_WAYPOINT_RIGHT";

/**
  * General information point, triggered when entering a settlement, state, or country.
  * Fallback guidance code: none.
  */
const ExtGuidanceCode GENERAL_INFORMATION = "GENERAL_INFORMATION";

/**
  * Take the left lane in a trifurcation.
  * Fallback guidance code: `KEEP_LEFT`
  */
const ExtGuidanceCode TRIFURCATION_LEFT = "TRIFURCATION_LEFT";

/**
  * Take the left lane going up in a trifurcation.
  * Fallback guidance code: `KEEP_LEFT`
  */
const ExtGuidanceCode TRIFURCATION_LEFT_UP = "TRIFURCATION_LEFT_UP";

/**
  * Take the left lane going down in a trifurcation.
  * Fallback guidance code: `KEEP_LEFT`
  */
const ExtGuidanceCode TRIFURCATION_LEFT_DOWN = "TRIFURCATION_LEFT_DOWN";

/**
  * Take the middle lane in a trifurcation.
  * Fallback guidance code: `STRAIGHT`
  */
const ExtGuidanceCode TRIFURCATION_MIDDLE = "TRIFURCATION_MIDDLE";

/**
  * Take the middle lane going up in a trifurcation.
  * Fallback guidance code: `STRAIGHT`
  */
const ExtGuidanceCode TRIFURCATION_MIDDLE_UP = "TRIFURCATION_MIDDLE_UP";

/**
  * Take the middle lane going down in a trifurcation.
  * Fallback guidance code: `STRAIGHT`
  */
const ExtGuidanceCode TRIFURCATION_MIDDLE_DOWN = "TRIFURCATION_MIDDLE_DOWN";

/**
  * Take the right lane in a trifurcation.
  * Fallback guidance code: `KEEP_RIGHT`
  */
const ExtGuidanceCode TRIFURCATION_RIGHT = "TRIFURCATION_RIGHT";

/**
  * Take the right lane going up in a trifurcation.
  * Fallback guidance code: `KEEP_RIGHT`
  */
const ExtGuidanceCode TRIFURCATION_RIGHT_UP = "TRIFURCATION_RIGHT_UP";

/**
  * Take the right lane going down in a trifurcation.
  * Fallback guidance code: `KEEP_RIGHT`
  */
const ExtGuidanceCode TRIFURCATION_RIGHT_DOWN = "TRIFURCATION_RIGHT_DOWN";