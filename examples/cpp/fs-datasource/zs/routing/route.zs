/*!

# Routes

This package defines routes.

**Dependencies**

!*/

package routing.route;

import routing.guidance.*;
import routing.types.*;
import core.types.*;
import core.vehicle.*;
import core.location.*;
import core.geometry.*;

/*!

A route is described by a length, a route path with detailed route segments, and
travel time. A route has a reference to a road location, which describes the
path of the route. The route path consists of route points that correspond to
decision points on the road location geometry and that provide different types
of routing information.

Route points are mainly used for application purposes like map matching and
guidance generation. A route point always has a route point type and, optionally,
a waypoint type, which means that the route point is an important point on the
route selected by the driver.

For more information about the different route point types and waypoint types,
see [Route Point Types and Waypoint Types](types.zs#route-point-types-and-waypoint-types).

In addition to the route path, a list of route geometries can be added to the
route for display purposes. A route geometry contains more details than the
route path. Multiple route geometries can be provided for different scales.

!*/

rule_group RouteGeometryRules
{
  /*!
  Multiple Route Geometries:

  If more than one route geometry is provided, the `ScaleDenominator` of each
  route geometry shall be unique within the list of route geometries.
  !*/

  rule "routing-2j7d6o";
};

/** Describes a calculated route. */
struct Route
{
  /** Length of the complete route in centimeters. */
  LengthCentimeters  length;

  /** Travel time of the complete route in seconds, including delays. */
  Seconds travelTime;

  /**
    * Road location reference that describes the route.
    * Route path includes origin and destination from the request as
    * map-matched route points.
    */
  RoadLocationPath routePath;

  /**
    * List of route points on the `routePath`.
    * In case a route point is a waypoint, the time of arrival or departure is
    * added as well.
    */
  RoutePoint routePointTypes[routePath.pathGeometry.line.numPositions];

  /** Number of route segments. */
  varuint32 numRouteSegments;

  /** List of route segments. */
  RouteSegment    segments[numRouteSegments];

  /** Consumption per route segment. */
  optional RouteSegmentConsumption vehicleConsumption[numRouteSegments];

  /** Guidance instructions per route segment. */
  optional GuidanceInstructions guidance;

  /** List of route geometries. */
  optional RouteGeometry geometries[];
};

/**
  * A route point describes each point of a route path with a type and an
  * optional waypoint type in case the route point also represents a waypoint.
  */
struct RoutePoint
{
  /** Type of the route point. */
  RoutePointType type;

  /** If the route point also is a waypoint, then the waypoint type is provided. */
  optional WaypointType waypointType;

  /** Departure time at the route point. */
  optional TimeWithZone departureTime;

  /** Arrival time at the route point. */
  optional TimeWithZone arrivalTime;
};

/** Detailed geometry of the route. */
struct RouteGeometry
{
  /** Scale denominator for which the route geometry is valid. */
  ScaleDenominator scale;

  /** Used coordinate shift of the line geometry. */
  CoordShift shift;

  /** Line geometry of the route. */
  Line2D(shift) geometry;
};



/*!
## Route Segments

Route segments assign a simple meaning to parts of the route.
The route segments list describes route segments using existing line positions
on the route path. Route segments can add additional offset positions for the
start or end of a route segment.
Example: If the `startPosition` of a route segment is 0, then it points to
`routePath.pathGeometry.line.positions[0]`.

Route segments can overlap each other as long as their types differ.

The following figure shows overlapping route segments of different types.

![Road segment example](assets/route_segments_example.png)

!*/

rule_group RouteSegmentRules
{
  /*!
  Overlapping of Route Segments:

  Route segments that have the same type shall not overlap.
  !*/

  rule "routing-2k6d0m";
};

/** Route segment that describes a part of a route. */
struct RouteSegment
{
  /** Set to `true` if the start position has an offset. */
  bool hasStartOffset;

  /** Set to `true` if the end position has an offset. */
  bool hasEndOffset;

  /**
   * Start position on the route path. The start position is part of the route
   * path geometry.
   */
  LinePosition startPosition if !hasStartOffset;

  /** Start position with an offset on the route path. */
  LinePositionOffset2D(0) startPositionWithOffset if hasStartOffset;

  /**
    * End position on the route path. The end position is part of the route
    * path geometry.
    */
  LinePosition endPosition if !hasEndOffset;

  /** End position with an offset on the route path. */
  LinePositionOffset2D(0) endPositionWithOffset if hasEndOffset;

  /** Length of the route segment in centimeters. */
  LengthCentimeters length;

  /** Travel time of the route segment. */
  Seconds travelTime;

  /** Detailed type of the route segment. */
  RouteSegmentType type;

  /** Detailed information about the route segment. */
  RouteSegmentDetails(type) segmentDetails;
};

/** Detailed information for route segments depending on the type. */
choice RouteSegmentDetails(RouteSegmentType type) on type
{
  case DELAY:
          DelayInformation delay;
  /** Pollution of ferries, other...  */
  case POLLUTION:
          Pollution pollution;
  case TOLL:
          TollCost tollCost;
  case TRAFFIC_ENFORCEMENT_CAMERA:
          TrafficEnforcementCameraType trafficEnforcementCameraType;
  case TRAFFIC_ENFORCEMENT_ZONE:
          TrafficEnforcementZoneType trafficEnforcementZoneType;
  case TUNNEL:
          ;
  case BRIDGE:
          ;
  case FERRY:
          ;
  case CAR_TRAIN:
          ;
  case PUBLIC_TRANSPORT:
          ; // TODO: how to get more information about public transport?
            // e.g. URI to another service to get live public transport data.
  case MOTORWAY:
          ;
  case UNPAVED:
          ;
  case AUTOMATED_DRIVING_L3:
          ;
  case AUTOMATED_DRIVING_L4:
          ;
  case AUTOMATED_DRIVING_L5:
          ;
  case LIMITED_MOBILE_DATA_COVERAGE:
          ;
  case VIGNETTE:
          ; // TODO: how to get additional vignette info?
  case PEDESTRIAN:
          ;
  case BIKE:
          ;
  case SCOOTER:
          ;
  case ENVIRONMENT_ZONE:
          ;
  case USER_RESTRICTED_ACCESS:
          ;
  case PHYSICAL_RESTRICTED_ACCESS:
          ;
  case LEGAL_RESTRICTED_ACCESS:
          ;
  default: ;
};


/** Detailed delay information for a route segment. */
struct DelayInformation
{
  /** Duration of the delay. */
  Seconds delay;

  /** Type of the reason of the delay. */
  DelayReasonType reasonType;

  /**
    * Textual description of the delay reason in the language defined in the
    * request.
    **/
  optional string reason;
};


/**
  * Cause of delay, based on TPEG-TFP codes.
  * As a basic rule, each enum value is equal to a TPEG-TFP code.
  */
enum varuint16 DelayReasonType
{
    /** Reason for the delay is unknown. */
    UNKNOWN = 0,

    /** The capacity of that part of the road causes the delay. */
    TRAFFIC_CONGESTION = 1,

    /** An accident affects the traffic. */
    ACCIDENT = 2,

    /** Roadworks affect the traffic. */
    ROADWORKS = 3,

    /** Lanes that are narrower than usual for the given country affect the traffic. */
    NARROW_LANES = 4,

    /** The affected part of the road is impassable in general. */
    IMPASSIBILITY = 5,

    /** The road is slippery. */
    SLIPPERY_ROAD = 6,

    /** There are big areas of water on the road. */
    AQUAPLANING = 7,

    /** A fire affects the traffic. */
    FIRE = 8,

    /**
      * Natural conditions require high caution by the driver.
      * This reason is mostly expected to appear suddenly.
      */
    HAZARDOUS_DRIVING_CONDITIONS = 9,

    /** Objects affect the traffic. */
    OBJECTS_ON_THE_ROAD = 10,

    /** Animals are on the road. */
    ANIMALS_ON_ROADWAY = 11,

    /** People are walking on the road. */
    PEOPLE_ON_ROADWAY = 12,

    /** A broken-down vehicle is standing on the road. */
    BROKEN_DOWN_VEHICLES = 13,

    /** Vehicles are moving against the only allowed direction. */
    VEHICLE_ON_WRONG_CARRIAGE_WAY_GHOSTDRIVER = 14,

    /** Rescue and recovery work is in progress. */
    RESCUE_RECOVERY_IN_PROGRESS = 15,

    /** A regulatory measure affects the traffic. */
    REGULATORY_MEASURE = 16,

    /** Extreme weather conditions affect the traffic. */
    EXTREME_WEATHER_CONDITIONS = 17,

    /** Driving speed needs to be adjusted due to reduced visibility. */
    VISIBILITY_REDUCED = 18,

    /**
      * Increased precipitation, such as heavy rain, affects the traffic.
      * This reason is mostly combined with time delays.
      */
    PRECIPITATION = 19,

    /** Reckless persons affect the traffic. */
    RECKLESS_PERSONS = 20,

    /**
      * An overheight warning system trigger affects the traffic, for example,
      * a bridge is closed.
      */
    OVERHEIGHT_WARNING_SYSTEM_TRIGGERED = 21,

    /** Changed traffic regulations lead to a high risk of accidents. */
    TRAFFIC_REGULATIONS_CHANGED = 22,

    /** A major event affects the traffic. */
    MAJOR_EVENT = 23,

    /** A transport service is not operating. */
    SERVICE_NOT_OPERATING = 24,

    /**
      * A service is not usable although it is operating, for example, it is
      * overcrowded or paused.
      */
    SERVICE_NOT_USABLE = 25,

    /** Slow-moving vehicles affect the traffic. */
    SLOW_MOVING_VEHICLES = 26,

    /** A dangerous end of a queue could cause an accident. */
    DANGEROUS_END_OF_QUEUE = 27,

    /** A risk of fire exists. Open fire or glow should be extinguished. */
    RISK_OF_FIRE = 28,

    /** A time delay exists. */
    TIME_DELAY = 29,

    /**
      * The road contains a spot where vehicles are checked by the regulatory
      * authorities.
      */
    POLICE_CHECKPOINT = 30,

    /** Malfunctioning road-side equipment affects the traffic. */
    MALFUNCTIONING_ROADSIDE_EQUIPMENT = 31,

    /**
      * A serious accident with expected long-lasting rescue and recovery work
      * affects the traffic.
      */
    SERIOUS_ACCIDENT = 32,

    /** An earlier accident affects the traffic. */
    EARLIER_ACCIDENT = 33,

    /** An accident was reported. */
    ACCIDENT_REPORTED = 34,

    /** An accident investigation is in progress. */
    ACCIDENT_INVESTIGATION_WORK = 35,

    /** An accident with many involved vehicles has occurred. */
    MULTI_VEHICLE_ACCIDENT = 36,

    /** An accident involving a truck has occurred. */
    ACCIDENT_INVOLVING_LORRY = 37,

    /** An accident has occurred where traffic is directed around the accident area. */
    ACCIDENT_TRAFFIC_BEING_DIRECTED_AROUND = 38,

    /** Long-term roadworks affect the traffic. */
    LONG_TERM_ROADWORKS = 39,

    /** Road construction work affects the traffic. */
    CONSTRUCTION_WORK = 40,

    /** Bridge maintenance work affects the traffic. */
    BRIDGE_MAINTENANCE_WORK = 41,

    /** Road resurfacing work affects the traffic. */
    RESURFACING_WORK = 42,

    /** Major roadworks affect the traffic. */
    MAJOR_ROADWORKS = 43,

    /** Road maintenance work affects the traffic. */
    ROAD_MAINTENANCE_WORKS = 44,

    /** Roadworks during the night affect the traffic. */
    ROADWORKS_DURING_NIGHT = 45,

    /**
      * Roadworks where traffic is alternately directed over a single lane
      * affect the traffic.
      */
    ROADWORKS_SINGLE_LINE_TRAFFIC_ALTERNATE_DIRECTIONS = 46,

    /** Flooding water makes the road impassable. */
    FLOODING = 47,

    /** The road is slippery due to snow on the road. */
    SNOW_ON_ROAD = 48,

    /** The road is slippery due to ice on the road. */
    ICE_ON_ROAD = 49,

    /** The road is slippery due to black ice on the road. */
    BLACK_ICE_ON_ROAD = 50,

    /** A grass fire affects the traffic. */
    GRASS_FIRE = 51,

    /** A forest fire affects the traffic. */
    FOREST_FIRE = 52,

    /** An overturned vehicle is lying on the road. */
    OVERTURNED_VEHICLE = 53,

    /** A broken-down truck is standing on the road. */
    BROKEN_DOWN_LORRY = 54,

    /** A spun-around vehicle is standing on the road. */
    VEHICLE_SPUN_AROUND = 55,

    /** A burning vehicle is standing on the road. */
    VEHICLE_ON_FIRE = 56,

    /** Gusty winds, especially cross winds, affect the traffic. */
    GUSTY_WINDS = 57,

    /** Strong winds, especially cross winds, affect the traffic. */
    STRONG_WINDS = 58,

    /** A strong thunderstorm affects the traffic. */
    THUNDERSTORM = 59,

    /** The visibility is reduced due to fog. */
    VISIBILITY_REDUCED_BY_FOG = 60,

    /** The visibility is reduced due to glare from the low sun. */
    VISIBILITY_REDUCED_BY_LOW_SUN_GLARE = 61,

    /** Snowfall affects the traffic. */
    SNOW = 62,

    /** Rain affects the traffic. */
    RAIN = 63,

    /** Hail affects the traffic. */
    HAIL = 64,

    /** A sports event affects the traffic. */
    SPORTS_EVENT = 65,

    /** Traffic control signals are not functioning at all. */
    TRAFFIC_CONTROL_SIGNALS_NOT_WORKING = 66,

    /** Traffic control signals are malfunctioning. */
    TRAFFIC_CONTROL_SIGNALS_WORKING_INCORRECTLY = 67,

    /** The road is closed by the regulatory authorities. */
    CLOSURE = 68,
};

/*!

## Waypoint

A waypoint is an important point on the route that is selected by the driver,
for example, the destination or a stopover.

!*/

/** Describes an important point on the route that is selected by the driver. */
struct Waypoint
{
  /** Position of the waypoint. */
  Position2D(0) position;

  /** Road location path on which the waypoint is located. */
  optional RoadLocationPath locationPath;

  /** Identifier of the road location on which the waypoint is located. */
  optional RoadLocationId locationId;

  /**
    * Set to `true` if the waypoint is on the right side in digitization direction
    * of the road location. Set to `false` if the waypoint is on the left side.
    */
  optional bool rightSide;

  /** Type of the waypoint. */
  optional WaypointType type;

  /** Departure time at the waypoint. */
  optional TimeWithZone departureTime;

  /** Arrival time at the waypoint. */
  optional TimeWithZone arrivalTime;
};


/*!

## Weighted Route Options

!*/

/** Weighted route options to indicate preference and avoidance of a route. */
struct RouteOptions
{
  /** Set to `true` if it is an avoidance option. Set to `false` if preferred. */
  bool avoid = true;

  /**
    * Weight of the option.
    * Values shall be treated on an absolute scale when comparing weights of different
    * options.
    */
  optional uint8           weight : weight <= 100 && weight != 0;

  /** Type of route option. */
  RouteOptionType type;
};
