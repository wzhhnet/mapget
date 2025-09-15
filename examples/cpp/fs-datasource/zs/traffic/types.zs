/*!

# Traffic Types

This package defines types that are used in other packages of the Traffic module.

**Dependencies**

!*/

package traffic.types;

import system.types.*;
import core.types.*;
import core.location.*;

/** Globally unique identifier of a traffic event using an integer number. */
subtype varuint TrafficEventId;

/** Globally unique identifier of a traffic event using a UUID. */
subtype UUID TrafficEventUuid;

/** Globally unique identifier of a traffic event using a string. */
subtype string TrafficEventIdString;

/**
  * Traffic event that is assigned to a range on a road, lane, or display line.
  * Includes a reason for the event and the expected delay.
  * Can be used in combination with properties like event advice or
  * a globally unique traffic event ID.
  */
struct TrafficEvent
{
  /** Reason for the traffic event. */
  TrafficEventReason reason;

  /** Expected duration of the delay in seconds. */
  Seconds delay;

  /** Set to `true` if the passage is blocked by the traffic event. */
  bool blockedPassage;
};

/** Reason for a traffic event. */
enum varuint16 TrafficEventReason
{
    /** Reason for the traffic event is unknown. */
    UNKNOWN,

    /** The capacity of that part of the road causes the traffic event. */
    TRAFFIC_CONGESTION,

    /** An accident affects the traffic. */
    ACCIDENT,

    /** Roadworks affect the traffic. */
    ROADWORKS,

    /** Lanes that are narrower than usual for the given country affect the traffic. */
    NARROW_LANES,

    /** The affected part of the road is impassable in general. */
    IMPASSIBILITY,

    /** The road is slippery. */
    SLIPPERY_ROAD,

    /** There are big areas of water on the road. */
    AQUAPLANING,

    /** A fire affects the traffic. */
    FIRE,

    /**
     * Natural conditions require high caution by the driver.
     * This reason is mostly expected to appear suddenly.
     */
    HAZARDOUS_DRIVING_CONDITIONS,

    /** Objects affect the traffic. */
    OBJECTS_ON_THE_ROAD,

    /** Animals are on the road. */
    ANIMALS_ON_ROADWAY,

    /** People are walking on the road. */
    PEOPLE_ON_ROADWAY,

    /** A broken-down vehicle is standing on the road. */
    BROKEN_DOWN_VEHICLES,

    /** Vehicles are moving against the only allowed direction. */
    VEHICLE_ON_WRONG_CARRIAGE_WAY_GHOSTDRIVER,

    /** Rescue and recovery work is in progress. */
    RESCUE_RECOVERY_IN_PROGRESS,

    /** A regulatory measure affects the traffic. */
    REGULATORY_MEASURE,

    /** Extreme weather conditions affect the traffic. */
    EXTREME_WEATHER_CONDITIONS,

    /** Driving speed needs to be adjusted due to reduced visibility. */
    VISIBILITY_REDUCED,

    /**
      * Increased precipitation, such as heavy rain, affects the traffic.
      * This reason is mostly combined with time delays.
      */
    PRECIPITATION,

    /** Reckless persons affect the traffic. */
    RECKLESS_PERSONS,

    /**
      * An overheight warning system trigger affects the traffic, for example,
      * a bridge is closed.
      */
    OVERHEIGHT_WARNING_SYSTEM_TRIGGERED,

    /** Changed traffic regulations lead to a high risk of accidents. */
    TRAFFIC_REGULATIONS_CHANGED,

    /** A major event affects the traffic. */
    MAJOR_EVENT,

    /** A transport service is not operating. */
    SERVICE_NOT_OPERATING,

    /**
      * A service is not usable although it is operating, for example, it is
      * overcrowded or paused.
      */
    SERVICE_NOT_USABLE,

    /** Slow-moving vehicles affect the traffic. */
    SLOW_MOVING_VEHICLES,

    /** A dangerous end of a queue could cause an accident. */
    DANGEROUS_END_OF_QUEUE,

    /** A risk of fire exists. Open fire or glow should be extinguished. */
    RISK_OF_FIRE,

    /** A time delay exists. */
    TIME_DELAY,

    /**
      * The road contains a spot where vehicles are checked by the regulatory
      * authorities.
      */
    POLICE_CHECKPOINT,

    /** Malfunctioning road-side equipment affects the traffic. */
    MALFUNCTIONING_ROADSIDE_EQUIPMENT,

    /**
      * A serious accident with expected long-lasting rescue and recovery work
      * affects the traffic.
      */
    SERIOUS_ACCIDENT,

    /** An earlier accident affects the traffic. */
    EARLIER_ACCIDENT,

    /** An accident was reported. */
    ACCIDENT_REPORTED,

    /** An accident investigation is in progress. */
    ACCIDENT_INVESTIGATION_WORK,

    /** An accident with many involved vehicles has occurred. */
    MULTI_VEHICLE_ACCIDENT,

    /** An accident involving a truck has occurred. */
    ACCIDENT_INVOLVING_LORRY,

    /** An accident has occurred where traffic is directed around the accident area. */
    ACCIDENT_TRAFFIC_BEING_DIRECTED_AROUND,

    /** Long-term roadworks affect the traffic. */
    LONG_TERM_ROADWORKS,

    /** Road construction work affects the traffic. */
    CONSTRUCTION_WORK,

    /** Bridge maintenance work affects the traffic. */
    BRIDGE_MAINTENANCE_WORK,

    /** Road resurfacing work affects the traffic. */
    RESURFACING_WORK,

    /** Major roadworks affect the traffic. */
    MAJOR_ROADWORKS,

    /** Road maintenance work affects the traffic. */
    ROAD_MAINTENANCE_WORKS,

    /** Roadworks during the night affect the traffic. */
    ROADWORKS_DURING_NIGHT,

    /**
      * Roadworks where traffic is alternately directed over a single lane
      * affect the traffic.
      */
    ROADWORKS_SINGLE_LINE_TRAFFIC_ALTERNATE_DIRECTIONS,

    /** Flooding water makes the road impassable. */
    FLOODING,

    /** The road is slippery due to snow on the road. */
    SNOW_ON_ROAD,

    /** The road is slippery due to ice on the road. */
    ICE_ON_ROAD,

    /** The road is slippery due to black ice on the road. */
    BLACK_ICE_ON_ROAD,

    /** A grass fire affects the traffic. */
    GRASS_FIRE,

    /** A forest fire affects the traffic. */
    FOREST_FIRE,

    /** An overturned vehicle is lying on the road. */
    OVERTURNED_VEHICLE,

    /** A broken-down truck is standing on the road. */
    BROKEN_DOWN_LORRY,

    /** A spun-around vehicle is standing on the road. */
    VEHICLE_SPUN_AROUND,

    /** A burning vehicle is standing on the road. */
    VEHICLE_ON_FIRE,

    /** Gusty winds, especially cross winds, affect the traffic. */
    GUSTY_WINDS,

    /** Strong winds, especially cross winds, affect the traffic. */
    STRONG_WINDS,

    /** A strong thunderstorm affects the traffic. */
    THUNDERSTORM,

    /** The visibility is reduced due to fog. */
    VISIBILITY_REDUCED_BY_FOG,

    /** The visibility is reduced due to glare from the low sun. */
    VISIBILITY_REDUCED_BY_LOW_SUN_GLARE,

    /** Snowfall affects the traffic. */
    SNOW,

    /** Rain affects the traffic. */
    RAIN,

    /** Hail affects the traffic. */
    HAIL,

    /** A sports event affects the traffic. */
    SPORTS_EVENT,

    /** Traffic control signals are not functioning at all. */
    TRAFFIC_CONTROL_SIGNALS_NOT_WORKING,

    /** Traffic control signals are malfunctioning. */
    TRAFFIC_CONTROL_SIGNALS_WORKING_INCORRECTLY,

    /** The road is closed by the regulatory authorities. */
    CLOSURE,
};

enum varuint16 TrafficEventAdvice
{
  /** Vehicles are requested to form an emergency corridor. */
    GIVE_WAY_TO_VEHICLE_FROM_BEHIND,
};

/** Information about the current state of traffic flow. */
enum uint8 TrafficFlow
{
  /** Traffic is stationary. Vehicles are fully stopped for periods of time. */
  JAM,

  /** Traffic is queuing. */
  QUEUEING_TRAFFIC,

  /** Traffic is slow. */
  SLOW_TRAFFIC,

  /** Traffic is lighter than normal. */
  TRAFFIC_LIGHTER_THAN_NORMAL,

  /** Current situation has no impact on normal traffic flow. */
  FREE_FLOW,

  /** Traffic is heavy. */
  HEAVY_TRAFFIC,

  /** Traffic is heavier than normal. */
  TRAFFIC_HEAVIER_THAN_NORMAL,

  /** Traffic is building up. */
  TRAFFIC_BUILDING_UP,
};

rule_group CurrentRoadConditionRules
{
  /*!
  Valid Conditions for `CURRENT_ROAD_CONDITION`:

  Only the conditions `VISIBILITY`, `WEATHER`, and `SURFACE` from the Core
  module shall be used with the attribute `CURRENT_ROAD_CONDITION`.
  !*/

  rule "traffic-chtfd7";
};

/**
  * Flag for current road conditions.
  * The actual conditions are described in the corresponding attribute condition.
  *
  * Example: To describe the current weather on a road, the attribute
  * `CURRENT_ROAD_CONDITION` is used. The condition `WEATHER` is stored with
  * the attribute and describes the current weather on the road.
  */
subtype Flag CurrentRoadCondition;

/*!

## Parking Availability

Availability information for on-street parking can be stored at road or
lane level. The relevant parking spots are located on the side of the road or
lane that corresponds to the direction of the road reference or the direction of
the lane group range validity, respectively:

- If set to `IN_POSITIVE_DIRECTION`, the on-street parking is located to the right
  of the road or lane in digitization direction.
- If set to `IN_NEGATIVE_DIRECTION`, the on-street parking is located to the left of
  the road or lane in digitization direction.
- If undirected or set to `IN_BOTH_DIRECTIONS`, there is on-street parking on both
  sides of the road or lane.

At lane level, the meaning of the `PARKING_AVAILABILITY` attribute is as
follows:

- If `completeGroup` is set to `true` in the lane group range validity, then
  there is on-street parking on both curbs of the road lane group. The attribute
  cannot be assigned to complete intersection lane groups.
- If `completeGroup` is set to `false` in the lane group range validity, then
  the lane mask in `numLanes` determines next to which lanes on-street parking
  is available. Each lane that is closest to an on-street parking in the
  corresponding direction gets assigned the attribute. If the attribute is
  assigned to multiple lanes in a lane group, then there are multiple on-street
  parkings between lanes.

!*/

/**
  * Availability of on-street parking on the side of a road or lane.
  *
  * Set to `true` if on-street parking is available.
  * Set to `false` if on-street parking is not available, for example, because
  * all parking spots are occupied.
  */
subtype bool ParkingAvailability;
