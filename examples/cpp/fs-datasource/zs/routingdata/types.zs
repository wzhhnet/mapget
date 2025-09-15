/*!

# Routing Types

This package defines the types that are used by routing attributes.

**Dependencies**

!*/

package routingdata.types;

import core.types.*;
import core.conditions.*;
import core.location.*;
import road.reference.types.*;

/*!

## Plural Junction

Maneuvers for a plural junction can require a different explanation than the
one that can be derived from the geometry. The `PLURAL_JUNCTION` attribute indicates
how a driver will perceive such a junction.

Plural junctions are categorized by a type that is used to select appropriate
guidance instructions, for example, to suppress certain guidance instructions.

The following figures show examples of different plural junction types.

![Highway crossing with internal intersections and slip roads](assets/intersection_internal_and_maneuver.png)

![Magic roundabout in Swindon, UK](assets/magic_roundabout.png)

!*/

rule_group PluralJunctionRules
{
  /*!
  Inner Roundabouts of Magic Roundabout:

  All inner roundabouts of a magic roundabout shall have assigned the plural
  junction type `INTERSECTION_INTERNAL`.
  !*/

  rule "routingdata-gooth9";
};

/** Detailed type of a plural junction. */
enum bit:4 PluralJunction
{
  /**
    * Indicates that a road is not treated as an individual road but as a part of
    * an intersection.
    * If multiple consecutive roads have assigned this type, then the guidance
    * instruction is only given once for these consecutive roads.
    */
  INTERSECTION_INTERNAL,

  /**
    * Indicates that only one guidance instruction is given when entering
    * the road but not when leaving it, because there is only one legal possibility
    * to leave the road.
    * Example: Slip roads at complex intersections.
    */
  MANEUVER,

  /**
    * Indicates a maneuver that cannot be explained in one guidance instruction
    * or at all.
    * Example: Indirect left or right turns.
    */
  INDESCRIBABLE,

  /**
    * Indicates that a road or chain of roads connects the inner roundabouts
    * within a larger roundabout that consists of multiple smaller roundabouts,
    * also called a magic roundabout.
    * Example: Magic roundabout in Swindon, UK.
    */
  MAGIC_ROUNDABOUT,
};

/*!

## Special Transition Code

A special transition code is assigned to a transition where the most suitable
driving advice cannot be easily derived from the geometry of the roads that
are connected to the intersection, for example, in the following cases:

- Two roads leaving an intersection that are so close to each other that both
  seem to go straight ahead for the driver.
- One road is dividing into two or more streets, also known as a bifurcation.
- The main road bends slightly and a side road of minor importance leaves the
  intersection straight ahead. The driver would consider the main road to go
  straight ahead. Therefore, no guidance instruction for the main road is required,
  but the driver would expect a turn instruction for the side road.

The following figure shows a main road with a bend and a side road that goes
straight ahead. The transition for staying on the main road has assigned the
special transition code `ALONG_MAIN_ROAD`, while the transition from main road
to side road gets assigned the value `BEAR_STRAIGHT`.

![Special transition code example ](assets/special_transition_code_example.png)


!*/

/**
  * Used for transitions where no suitable driving advice can be derived from the
  * geometry of the roads that are connected to the intersection.
  */
enum bit:4 SpecialTransitionCode
{
  /**
    * Bear maneuver. Used at bifurcations if the straight direction is ambiguous
    * or the geometry of one of the roads indicates a turn, but the road is not
    * bending enough to announce a turn maneuver.
    */
  BEAR,

  /**
    * Bear at exit maneuver. Indicates that the maneuver is a fork of an exit
    * lane into an exit lane or a normal lane.
    * Also used when an entrance lane continues on as an exit lane.
    */
  BEAR_AT_EXIT,

  /** Bear straight maneuver. Used if the route follows the straight direction. */
  BEAR_STRAIGHT,

  /** Stay on main road. Used if the route follows the main road. */
  ALONG_MAIN_ROAD,

  /**
    * No guidance instruction required. For example, this can be used if only roads
    * of minor importance are crossing the route or if the road is
    * diverging and rejoining later on.
    */
  NO_ADVICE,
};

/*!

## Transition Angle

In intersection lane groups, the angle between the start of the first lane and
the end of the last lane of a lane transition can be defined in steps of ~1.4
degrees.
!*/

/**
  * Angle between start of the first lane and the end of the last lane
  * of a transition. Defined in steps of ~1.4 degrees.
  */
subtype uint8 LaneTransitionAngle;

/*!

## Eco Routing

Eco routing is an option for route calculation that minimizes fuel consumption
and emissions.

The following infrastructural factors influence the calculation of eco routes
and have to be taken into account for eco routing with NDS.Live:

- Consumption Speed Curve (CSC)
- Speed variation
- Slope

NDS.Live defines dedicated attributes that provide precalculated eco routing
data.

__Note:__
Details about calculating the attribute values for eco routing are provided
in a best practice.

!*/

rule_group EcoRoutingRules
{
  /*!
  No Vehicle-Specific Eco Routing Attributes:

  Eco routing attributes shall be based on the road infrastructure only.
  The attributes shall not define vehicle-specific values.
  !*/

  rule "routingdata-f26tj2-I";
};

/*!

### Consumption Speed Curve (CSC)

The CSC describes the speed-dependent fuel or energy consumption for a vehicle
driving at a constant height and at a distinct average speed. The CSC takes
fluctuations of normal traffic speed into consideration. Specific consumption
effects, however, which could also be derived from a map, are modeled
separately by means of the factors for speed variation and slope.

NDS.Live provides the attribute `CONSUMPTION_SPEED_DEPENDENCY` to store the
CSC. The attribute stores an array of consumption speed values.
Each consumption speed value is a tuple of an average speed value and the
percentage of the road to which the average speed applies.
The percentage factor acts as a weighting factor for the CSC calculation.

On level 13, each road has a dedicated average speed value assigned.
The application can use this value for table lookup and to calculate the
consumption value at runtime. For aggregated roads on upper routing levels,
the CSC is represented as a maximum of 256 value pairs of average speed values
and their corresponding percentage factors.

It is possible to apply the vehicle-specific CSC both on level 13 and on
aggregated (upper) levels. On the most detailed level where one road has a
dedicated average speed, this value may be directly used at runtime for
table lookup and be transformed into a consumption value.

On upper levels, having aggregated roads with an 'inside' spread of
different average speeds, these may be represented as a maximum of n = 256
value pairs of average speed values and their corresponding weight factors
wn, represented as a road percentage value.

!*/

/**
  * Definition of aggregated speed classes for consumption speed dependency curve
  * (CSC). Use on upper levels.
  */
struct ConsumptionSpeedDependencyCurve
{
  uint8 numberOfSpeedValuesAlongRoad;
  ConsumptionSpeedValue consumptionSpeedValue[numberOfSpeedValuesAlongRoad];
};


/**
  * Gives the tuple of average speed and percentage of the road for consumption
  * calculation.
  */
struct ConsumptionSpeedValue
{
  /**
    * Indicates on which percentage of the road the average speed value is
    * applicable.
    */
  PercentageIndication roadPercentage;

  /**
    * Defines the precalculated average speed on the indicated percentage of
    * the road, which can be used for consumption calculation.
    */
  SpeedKmh averageSpeed : averageSpeed > SPEED_UNDEFINED;
};

/*!

### Slope

Road slope above a specific threshold causes excessive consumption due to a
higher energy effort during uphill driving and an energy waste due to braking
when driving downhill.

NDS.Live provides the attributes `CONSUMPTION_UP_EXCESS_SLOPE`,
`CONSUMPTION_DOWN_EXCESS_SLOPE`, and `CONSUMPTION_AVERAGE_SLOPE` to store slope values.
The threshold used to calculate the excess slope is stored in the routing
metadata in `excessSlopeThreshold`.

!*/

/**
  * Defines the excess slope of a road or lane, that is, the slope that is exceeding a
  * defined threshold. Used for eco routing. Slope has no unit.
  * The slope value is scaled to 255 values with a resolution 0.1 % per bit,
  * a value of 0-25 equals 5 % excess slope.
  */
subtype uint8 ExcessSlope;

/*!

### Speed Variation

Speed variation affects fuel consumption due to changes in kinetic energy,
especially caused by braking and accelerating at curves, transitions, and intersections.

NDS.Live provides the attribute `CONSUMPTION_SPEED_VARIATION` to
store the consumption factor for speed variation.

**Road example**

If the original speed variation along a 200 m road is from 50 km/h (~13.889 m/s) to
80 km/h (~22.222 m/s), then the square difference is:

1. 22.222^2 - 13.889^2 = 493.817 - 192.904 = 300.913 [m^2/s^2]
1. scaled by 128: 300.913 * 128 = 38516.864
1. normalized to length of road (200 m): 38516.864/200 = 192.584

The resulting value is rounded to 193 and stored. If the calculated
value is higher than 255, then the value 255 is stored.

The original value is inversely recovered by multiplying the stored value
by road length in m then divided by a factor of 128 (easily done by shifts).

Because the transition factors at intersections cannot be normalized to the road
length, they are calculated by dividing by 4 (easily done by shifts).

**Transition example**

If an acceleration maneuver is from 50 km/h (~14 m/s) to
80 km/h (~22 m/s), then the square difference is:

1. (22^2 – 14^2) = (494 - 193) = 301 [m^2/s^2]
1. divided by 4: 301 / 4 = 75

The value 75 is stored.

!*/

/**
  * Defines normalized energy difference measures for kinetic energy used for
  * consumption penalties at curves, transitions, and intersections by measuring
  * squared speed differences. Used for eco routing and range calculation.
  *
  * The value range is from 0 to 255 [m/s^2] with a scale factor of 128.
  */
subtype uint8 SpeedVariation;

/*!

## Tourist Route Type

The tourist route type allows drivers to select a route based on certain
characteristics that make them attractive for tourism.

!*/

/**
  * Type of route with certain characteristics that make the route attractive
  * for tourism.
  */
enum bit:3 TouristRouteType
{
  /** A route that is generally recognized as picturesque. */
  SCENIC,

  /**
    * A route that connects two destinations and/or national highlights.
    * Example: Deutsche Ferienroute Alpen Ostsee.
    */
  NATIONAL,

  /**
    * A route that runs through a region and/or connects region-specific places of
    * interest.
    * Example: Circuit des Vosges du Nord.
    */
  REGIONAL,

  /**
    * A route that connects or runs through certain attractive natural surroundings,
    * such as national parks.
    */
  NATURAL,

  /**
    * A route that connects certain important cultural and/or historical sites.
    * Example: Viking Route.
    */
  CULTURAL_HISTORIC,
};

/*!

## Speed Profiles

Speed profiles describe time-specific driving speeds on a road range. A speed
profile is either valid for one day or for a set of days, for
example, a speed profile that covers all days of a holiday season.

Each day of the speed profile is divided into equal time intervals. The length
of an interval can be freely chosen between a few minutes and several hours and
is defined by the number of speed values in the `SpeedProfile.values` array.
Days always start at midnight. To calculate the length of a time interval, an
application divides the complete time range covered by the speed profile by the
number of speed values.

Example: A speed profile for a single day covers a time range of 1440 minutes
and contains 288 speed values, which means that each time interval has a length
of 5 minutes.

For each time interval and travel direction of a road range, the speed profile
stores a speed value that represents the average speed of the free-flow traffic
in the middle of the given interval. The first value in the
`SpeedProfile.values` array corresponds to the first time interval.

If a speed profile applies to a complete day, then the first value in the array
is valid for entry times from 0:00:00 and represents the average speed
value of that time interval. If a vehicle enters a road at a given time, then
the application can use the speed profile value of the time interval containing
this time.

!*/

rule_group SpeedProfileRules
{
  /*!
  `isInclusive` within `DaysOfWeek` for Speed Profiles:

  If `SpeedProfilesWeek` is used, then `DaysOfWeek.isInclusive` shall
  be set to `true`.
  !*/

  rule "routingdata-y3f0f5";
};

/** Defines speed profiles per week. */
struct SpeedProfilesWeek
{
  /**
    * Indicates for which days of a week a detailed speed profile is available.
    * In case of gaps in the detailed speed profiles, a default average
    * speed for the complete day is provided.
    */
  DaysOfWeek daysOfWeek;

  /** Base speed for all stored profiles. */
  SpeedKmh baseSpeed if (daysOfWeek.isSunday == true || daysOfWeek.isMonday == true ||
                         daysOfWeek.isTuesday == true || daysOfWeek.isWednesday == true ||
                         daysOfWeek.isThursday == true || daysOfWeek.isFriday == true ||
                         daysOfWeek.isSaturday == true) : baseSpeed > 0;

  /** Speed profile on Sunday. */
  SpeedProfileId profileSunday if daysOfWeek.isSunday;

  /** Average speed on Sunday in case no speed profile for that day is available. */
  SpeedKmh avgSpeedSunday if !daysOfWeek.isSunday
                        : avgSpeedSunday > 0;

  /** Speed profile on Monday. */
  SpeedProfileId profileMonday if daysOfWeek.isMonday;

  /** Average speed on Monday in case no speed profile for that day is available. */
  SpeedKmh avgSpeedMonday if !daysOfWeek.isMonday
                          : avgSpeedMonday > 0;

  /** Speed profile on Tuesday. */
  SpeedProfileId profileTuesday if daysOfWeek.isTuesday;

  /** Average speed on Tuesday in case no speed profile for that day is available. */
  SpeedKmh avgSpeedTuesday if !daysOfWeek.isTuesday
                           : avgSpeedTuesday > 0;

  /** Speed profile on Wednesday. */
  SpeedProfileId profileWednesday if daysOfWeek.isWednesday;

  /** Average speed on Wednesday in case no speed profile for that day is available. */
  SpeedKmh avgSpeedWednesday if !daysOfWeek.isWednesday
                             : avgSpeedWednesday > 0;

  /** Speed profile on Thursday. */
  SpeedProfileId profileThursday if daysOfWeek.isThursday;

  /** Average speed on Thursday in case no speed profile for that day is available. */
  SpeedKmh avgSpeedThursday if !daysOfWeek.isThursday
                            : avgSpeedThursday > 0;

  /** Speed profile on Friday. */
  SpeedProfileId profileFriday if daysOfWeek.isFriday;

  /** Average speed on Friday in case no speed profile for that day is available. */
  SpeedKmh avgSpeedFriday if !daysOfWeek.isFriday
                          : avgSpeedFriday > 0;

  /** Speed profile on Saturday. */
  SpeedProfileId profileSaturday if daysOfWeek.isSaturday;

  /** Average speed on Saturday in case no speed profile for that day is available. */
  SpeedKmh avgSpeedSaturday if !daysOfWeek.isSaturday
                            : avgSpeedSaturday > 0;
};

/**
  * Defines speed profiles for a set of days. The time condition
  * defines the specific set of days that the attribute applies to.
  */
struct SpeedProfilesDays
{
  /** Number of days for which speed profiles are defined. */
  uint8 numDays;

    /** Base speed for all profiles in `profiles[numDays]`. */
  SpeedKmh baseSpeed : baseSpeed > 0;

  /** Speed profile per day. */
  SpeedProfileId profiles[numDays];
};

/** Single speed profile. */
struct SpeedProfile
{
  /** Speed profile ID. */
  SpeedProfileId id;

  /**
    * Speed values of the speed profile in percent of the base speed. The
    * percentage value is provided in increments of 0.01 %, that is, a value of
    * 1 corresponds to 0.01 % of the base speed. This allows to encode speed
    * values in the range of 0 % to 327.67 % of the base speed.
    */
  packed varuint16 values[];
};

/** Unique identifier of a speed profile. */
subtype varuint16 SpeedProfileId;