/*!

# Routing Attributes

This package defines the attributes that are available in the
routing attribute layers.

**Dependencies**

!*/

package routingdata.attributes;

import core.types.*;
import routingdata.types.*;

/*!

## Routing Attributes for Roads

These attributes provide additional information for ranges on a road
that are used for routing use cases, for example, to determine the route with
the least energy consumption.

!*/

/** Routing attributes that provide additional information for ranges on a road. */
enum varuint16 RoutingRoadRangeAttributeType
{
  /** Road is part of a plural junction. */
  PLURAL_JUNCTION,

  /**
    * Effect on consumption due to climbing a slope. Describes the amount of slope
    * that is above the `excessSlopeThreshold` as defined in the metadata.
    */
  CONSUMPTION_UP_EXCESS_SLOPE,

  /**
    * Effect on consumption due to breaking on an extreme down slope. Describes the
    * amount of slope that is below the `excessSlopeThreshold` as defined in the
    * metadata.
    */
  CONSUMPTION_DOWN_EXCESS_SLOPE,

  /**
    * Effect on consumption due to breaking and accelerating at unusual sharp
    * curves or intersections. Describes changes in kinetic energy due to speed
    * variations.
    */
  CONSUMPTION_SPEED_VARIATION,

  /**
    * Effect on consumption due to breaking and accelerating because of different
    * speed values along the road.
    */
  CONSUMPTION_SPEED_DEPENDENCY,

  /** Average slope on a road. Used to calculate the required energy consumption. */
  CONSUMPTION_AVERAGE_SLOPE,

  /** Road is part of a tourist route of a certain type. */
  TOURIST_ROUTE_TYPE,

  /**
    * Number of toll stations on a road.
    * Excludes start of road and includes end of road.
    */
  NUM_TOLL_GATES,

  /**
    * Number of traffic lights on a road.
    * Excludes start of road and includes end of road.
    */
  NUM_TRAFFIC_LIGHTS,

  /**
    * Number of positions on a road where rules for giving way apply.
    * Excludes start of road and includes end of road.
    */
  NUM_GIVE_RIGHT_OF_WAY,

  /**
    * Number of speed cameras on a road.
    * Excludes start of road and includes end of road.
    */
  NUM_SPEED_CAMERAS,

  /** Number of speed zones on a road.
    * Excludes start of road and includes end of road.
    */
  NUM_SPEED_ZONES,

  /**
    * Number of railway crossings on a road.
    * Excludes start of road and includes end of road.
    */
  NUM_RAILWAY_CROSSINGS,

  /**
    * Number of stationary objects on a road.
    * Excludes start of road and includes end of road.
    */
  NUM_STATIONS,

  /** Speed profile information for each day of the week. */
  SPEED_PROFILES_WEEK,

  /**
    * Speed profile information for a set of days. Requires time conditions
    * that define the exact days to which the speed profile applies.
    */
  SPEED_PROFILES_DAYS,

  /**
    * Number of lanes on a road that are relevant for routing, excluding exit
    * and entry lanes. Includes lanes for turning maneuvers on roads with
    * intersections, especially in urban scenarios.
    */
  NUM_NORMAL_LANES,

  /**
    * Number of entry and exit lanes on a road. Does not include lanes for
    * turning maneuvers on roads with intersections, especially in urban
    * scenarios.
    */
  NUM_ENTRY_EXIT_LANES,
};

choice RoutingRoadRangeAttributeValue(RoutingRoadRangeAttributeType type) on type
{
  case PLURAL_JUNCTION:
            PluralJunction pluralJunction;
  case CONSUMPTION_UP_EXCESS_SLOPE:
            ExcessSlope upExcessSlope;
  case CONSUMPTION_DOWN_EXCESS_SLOPE:
            ExcessSlope downExcessSlope;
  case CONSUMPTION_SPEED_VARIATION:
            SpeedVariation speedVariation;
  case CONSUMPTION_SPEED_DEPENDENCY:
            ConsumptionSpeedDependencyCurve consumptionSpeedDependencyCurve;
  case CONSUMPTION_AVERAGE_SLOPE:
            Slope averageSlope;
  case TOURIST_ROUTE_TYPE:
            TouristRouteType touristRouteType;
  case NUM_TOLL_GATES:
            varuint16 numTollGates;
  case NUM_TRAFFIC_LIGHTS:
            varuint16 numTrafficLights;
  case NUM_GIVE_RIGHT_OF_WAY:
            varuint16 numGiveRightOfWay;
  case NUM_SPEED_CAMERAS:
            varuint16 numSpeedCameras;
  case NUM_SPEED_ZONES:
            varuint16 numSpeedZones;
  case NUM_RAILWAY_CROSSINGS:
            varuint16 numRailwayCrossings;
  case NUM_STATIONS:
            varuint16 numStations;
  case SPEED_PROFILES_WEEK:
            SpeedProfilesWeek speedProfilesWeek;
  case SPEED_PROFILES_DAYS:
            SpeedProfilesDays speedProfilesDays;
  case NUM_NORMAL_LANES:
            uint8 numNormalLanes;
  case NUM_ENTRY_EXIT_LANES:
            uint8 numEntryExitLanes;
};

/*!

## Routing Attributes for Transitions

These attributes apply to one or more transitions of an intersection or a
transition path and are used for routing use cases, for example, to determine
the effect on consumption due to performing a transition.

!*/

/**
  * Routing attributes that apply to one or more transitions of an intersection
  * or a transition path.
  */
enum varuint16 RoutingRoadTransitionAttributeType
{
  /**
    * Assigns a special code to transitions in cases where the most suitable driving
    * advice cannot easily be derived from the geometry of the roads that are part
    * of the transition.
    */
  SPECIAL_TRANSITION_CODE,

  /** Effect on consumption due to breaking and accelerating during transitions. */
  CONSUMPTION_SPEED_VARIATION,

  /** Average time that a vehicle needs to perform transitions. */
  TRANSITION_DURATION,
};

choice RoutingRoadTransitionAttributeValue(RoutingRoadTransitionAttributeType type) on type
{
  case SPECIAL_TRANSITION_CODE:
            SpecialTransitionCode specialTransitionCode;
  case CONSUMPTION_SPEED_VARIATION:
            SpeedVariation speedVariation;
  case TRANSITION_DURATION:
            Seconds TransitionDuration;
};

/*!

## Routing Attributes for Lanes

These attributes provide additional information for ranges on lanes
that are used for routing use cases, for example, to determine the route with
the least energy consumption.

!*/

/** Routing attributes that provide additional information for ranges on lanes. */
enum varuint16 RoutingLaneRangeAttributeType
{
  /** Lane is part of a plural junction. */
  PLURAL_JUNCTION,

  /**
    * Effect on consumption due to climbing a slope. Describes the amount of slope
    * that is above the `excessSlopeThreshold` as defined in the metadata.
    */
  CONSUMPTION_UP_EXCESS_SLOPE,

  /**
    * Effect on consumption due to breaking on an extreme down slope. Describes the
    * amount of slope that is below the `excessSlopeThreshold` as defined in the
    * metadata.
    */
  CONSUMPTION_DOWN_EXCESS_SLOPE,

  /**
    * Effect on consumption due to breaking and accelerating at unusual sharp
    * curves or intersections. Describes changes in kinetic energy due to speed
    * variations.
    */
  CONSUMPTION_SPEED_VARIATION,

  /**
    * Effect on consumption due to breaking and accelerating because of different
    * speed values along the lane.
    */
  CONSUMPTION_SPEED_DEPENDENCY,

  /** Average slope on a lane. Used to calculate the required energy consumption. */
  CONSUMPTION_AVERAGE_SLOPE,

  /** The road to which the lane belongs is part of a tourist route of a certain type. */
  TOURIST_ROUTE_TYPE,

  /**
    * Number of toll stations on a lane.
    * Excludes start of lane and includes end of lane.
    */
  NUM_TOLL_GATES,

  /**
    * Number of traffic lights on a lane.
    * Excludes start of lane and includes end of lane.
    */
  NUM_TRAFFIC_LIGHTS,

  /**
    * Number of positions on a lane where rules for giving way apply.
    * Excludes start of lane and includes end of lane.
    */
  NUM_GIVE_RIGHT_OF_WAY,

  /**
    * Number of speed cameras on a lane.
    * Excludes start of lane and includes end of lane.
    */
  NUM_SPEED_CAMERAS,

  /** Number of speed zones on a lane.
    * Excludes start of lane and includes end of lane.
    */
  NUM_SPEED_ZONES,

  /**
    * Number of railway crossings on the road to which the lane belongs.
    * Excludes start of lane and includes end of lane.
    */
  NUM_RAILWAY_CROSSINGS,

  /**
    * Number of stationary objects on a lane.
    * Excludes start of lane and includes end of lane.
    */
  NUM_STATIONS,

  /** Speed profile information for each day of the week. */
  SPEED_PROFILES_WEEK,

  /**
    * Speed profile information for a set of days. Requires time conditions
    * that define the exact days to which the speed profile applies.
    */
  SPEED_PROFILES_DAYS,
};

choice RoutingLaneRangeAttributeValue(RoutingLaneRangeAttributeType type) on type
{
  case PLURAL_JUNCTION:
            PluralJunction pluralJunction;
  case CONSUMPTION_UP_EXCESS_SLOPE:
            ExcessSlope upExcessSlope;
  case CONSUMPTION_DOWN_EXCESS_SLOPE:
            ExcessSlope downExcessSlope;
  case CONSUMPTION_SPEED_VARIATION:
            SpeedVariation speedVariation;
  case CONSUMPTION_SPEED_DEPENDENCY:
            ConsumptionSpeedDependencyCurve consumptionSpeedDependencyCurve;
  case CONSUMPTION_AVERAGE_SLOPE:
            Slope averageSlope;
  case TOURIST_ROUTE_TYPE:
            TouristRouteType touristRouteType;
  case NUM_TOLL_GATES:
            varuint16 numTollGates;
  case NUM_TRAFFIC_LIGHTS:
            varuint16 numTrafficLights;
  case NUM_GIVE_RIGHT_OF_WAY:
            varuint16 numGiveRightOfWay;
  case NUM_SPEED_CAMERAS:
            varuint16 numSpeedCameras;
  case NUM_SPEED_ZONES:
            varuint16 numSpeedZones;
  case NUM_RAILWAY_CROSSINGS:
            varuint16 numRailwayCrossings;
  case NUM_STATIONS:
            varuint16 numStations;
  case SPEED_PROFILES_WEEK:
            SpeedProfilesWeek speedProfilesWeek;
  case SPEED_PROFILES_DAYS:
            SpeedProfilesDays speedProfilesDays;
};

/*!

## Routing Attributes for Lane Transitions

These attributes apply to lane transitions and are used for
routing use cases, for example, to cover the angles between lanes in
route calculations.

!*/

/** Routing attributes that apply to lane transitions. */
enum varuint16 RoutingLaneTransitionAttributeType
{
  /**
    * Assigns a special code to transitions in cases where the most suitable driving
    * advice cannot easily be derived from the geometry of the lanes that are part
    * of the transition.
    */
  SPECIAL_TRANSITION_CODE,

  /** Effect on consumption due to breaking and accelerating during transitions. */
  CONSUMPTION_SPEED_VARIATION,

  /** Average time that a vehicle needs to perform transitions. */
  TRANSITION_DURATION,

  /** Angle between start of the first lane and the end of the last lane. */
  TRANSITION_ANGLE,
};

choice RoutingLaneTransitionAttributeValue(RoutingLaneTransitionAttributeType type) on type
{
  case SPECIAL_TRANSITION_CODE:
            SpecialTransitionCode specialTransitionCode;
  case CONSUMPTION_SPEED_VARIATION:
            SpeedVariation speedVariation;
  case TRANSITION_DURATION:
            Seconds transitionDuration;
  case TRANSITION_ANGLE:
            LaneTransitionAngle transitionAngle;
};
