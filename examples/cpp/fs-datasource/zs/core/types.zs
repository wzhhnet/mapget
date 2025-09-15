/*!

# Core Types

This package contains definitions of basic subtypes and generic data structures,
as well as globally applicable definitions, such as
coordinates or units. It also defines data structures that are
used across modules and represent objects or properties from the
real world, such as the functional road class.

**Dependencies**

!*/

package core.types;

import system.types.*;

/*!


## Basic Subtypes

The following subtypes are used in the Core module.

!*/

rule_group SubtypeRules
{
  /*!
  Subtyping of Basic Length Types:

  The basic subtypes indicating length (`LengthCentimeters`, `LengthInch`,
  `LengthMeters`) shall be subtyped in each module that references the basic subtypes.
  !*/

  rule "core-05xx95";

  /*!
  Subtyping of Basic Width Types:

  The basic subtypes indicating width (`WidthCentimeters`, `WidthInch`) shall
  be subtyped in each module that references the basic subtypes.
  !*/

  rule "core-078nqo";

  /*!
  Subtyping of Basic Height Types:

  The basic subtypes indicating height (`HeightCentimeters`, `HeightInch`)
  shall be subtyped in each module that references the basic subtypes.
  !*/

  rule "core-07nedq";

  /*!
  Subtyping of Basic Weight Types:

  The basic subtypes indicating weight (`Weight10Kilogram`, `Weight10Lbs`)
  shall be subtyped in each module that references the basic subtypes.
  !*/

  rule "core-09svct";
};

/** Packed representation of a tile ID. */
subtype int32 PackedTileId;

/** Tile-unique identifier of a region. */
subtype varuint32 RegionId;

/** An offset from the beginning of the BLOB. */
subtype uint32 RelativeBlobOffset;

/** Internal identifier of a language. */
subtype varuint16 LanguageCode;

/** Used for texts that are not language-specific. */
const LanguageCode UNDEFINED_LANGUAGE_CODE = 0;

/** Generic type for milliseconds to be used for duration and short time ranges. */
subtype varuint32 Milliseconds;

/** Generic type for seconds to be used for duration and long time ranges.*/
subtype varuint Seconds;

/** Generic type for minutes to be used for duration and long time ranges. */
subtype varuint Minutes;

/** Generic type for hours to be used for duration and long time ranges. */
subtype varuint Hours;

/** Generic type for length in centimeters. */
subtype varuint32 LengthCentimeters;

/** Generic type for length in inches. */
subtype varuint32 LengthInch;

/** Generic type for length in meters. */
subtype varuint32 LengthMeters;

/** Generic type for width in centimeters. */
subtype varuint32 WidthCentimeters;

/** Generic type for width in inches. */
subtype varuint32 WidthInch;

/** Generic type for height in centimeters. */
subtype varuint32 HeightCentimeters;

/** Generic type for height in inches. */
subtype varuint32 HeightInch;

/** Generic type for weight in steps of 10 kilograms. */
subtype varuint32 Weight10Kilogram;

/** Generic type for weight in steps of 10 pounds. */
subtype varuint32 Weight10Lbs;

/** Distance between two geographic locations in meters. */
subtype varuint32 DistanceMeters;

/** Distance between two geographic locations in centimeters. */
subtype varuint32 DistanceCentimeters;

/** Denominator for scale definitions. */
subtype uint32 ScaleDenominator;

/** Unique identifier of a scale range. */
subtype varuint32 ScaleRangeId;

/**  Defines the version of a versioned data item, for example, a tile. */
subtype varuint VersionId;

/**
 * Definition of time offsets in quarter-hour units using values from -48 to +56.
 * The value range is according to http://en.wikipedia.org/wiki/Time_zone,
 * where time zones are defined from UTC-12 to UTC+14.
 */
subtype int8 QuarterHourTimeOffset;

/**
 * Sectors around an intersection in steps of ~1.4 degree.
 * Value 0 means pointing to north, values are increasing clockwise.
 */
subtype uint8 IntersectionSector;

/**
  * Slope value in increments of 0.2 % from 0 to 24.8 %, expressed as values from 0 to 124;
  * value 125 can be used for the following slopes: 25 % <= slope <= 30 %;
  * value 126 can be used for slopes > 30 %;
  * value 127 means up (without value);
  * inclines have positive values, declines have negative values.
  */
subtype int8 Slope;

/**
 * Defines a year according to ISO 8601.
 * Positive values indicate AD (Anno Domini); negative values indicate BC (Before Christ).
 */
subtype int16 Year;

/** Value defining infinity. The value is intended for dates without a defined year. */
const Year YEAR_INFINITY = 32767;


/*!

## Generic Data Types

The following generic data structures are used in the Core module.

!*/

/**
  * Generic 4-byte identifier that allows to keep 2^28 values within
  * 4 bytes.
  */
struct Var4ByteId
{
  /**
    * Value is restricted to 28 bits. 29 bits is payload of the varuint32
    * and one bit needs to be saved so that the signed reference works.
    */
  varuint32 id : id <= 268435455;

  function bool isUnknown()
  {
    return(id == 0) ? true : false;
  }
};

/** Directed reference to 4-byte identifier.
  * Generic directed reference to a 4-byte identifier of type `Var4ByteId`.
  * The structure provides convenience functions to check for positive or
  * negative direction of the reference and to retrieve the unsigned value of
  * the ID the reference is pointing to.
  */
struct Var4ByteDirectedReference
{
    varint32  value : (value >= -268435455 && value < 0)
                || (value > 0 && value <= 268435455);

    function bool isPositive()
    {
        return(value > 0) ? true : false;
    }

    function bool isNegative()
    {
        return(value < 0) ? true : false;
    }

    function varuint32 getId()
    {
        return(value < 0) ? (value * -1) : value;
    }
};

/** Empty struct.
  * Helper struct that is used if a service call's response or request object
  * is empty because zserio services always need to set a request and response
  * object.
  */
struct Empty
{
};

/** Flag.
  * Basic type to be used as flag. A flag does not carry any data. The
  * existence of the `Flag` type is sufficient to describe the corresponding
  * matter.
  */
struct Flag {};

/**
  * Time stamp, defined in seconds and nanoseconds since the UNIX epoch
  * 1970-01-01 00:00:00 UTC.
  */
struct TimeStamp
{
  /** Seconds since Unix epoch: 1970-01-01 00:00:00 UTC. */
  varuint seconds;

  /** Nano seconds since `TimeStamp.seconds`, that is, delta to seconds since epoch. */
  varuint nanoseconds;
};

/** Time including the time zone. */
struct TimeWithZone
{
  /** Seconds since the Unix epoch 1970-01-01 00:00:00 UTC. */
  varuint seconds;

  /** Offset to UTC in quarter-hour steps. */
  QuarterHourTimeOffset utcOffset;
};

/** List of map scale ranges. */
struct ScaleRangeList
{
  /** Number of ranges in the list. */
  varsize numEntries : numEntries > 0;

  /** Scale ranges. */
  packed ScaleRange scales[numEntries];

};

/** Map scale range defined by a minimum and maximum scale denominator. */
struct ScaleRange
{
  /** ID of the range. */
  ScaleRangeId scaleRangeId;

  /** Minimum scale denominator included in the range. */
  ScaleDenominator minScaleDenominator : minScaleDenominator > 0;

  /** Maximum scale denominator included in the range. */
  ScaleDenominator maxScaleDenominator : maxScaleDenominator > minScaleDenominator;
};

/** Electric current. */
enum bit:1 ElectricCurrent
{
  /** Alternating current (AC). */
  AC,
  /** Direct current (DC). */
  DC,
};

/*!

## Tile ID

A tile ID is a container for packed tile IDs in a service interface. Service
interface request and response objects need to be structs instead of basic types,
therefore a wrapper is needed.

!*/

/** Tile ID. */
struct TileId
{
   /** Packed tile ID. */
   PackedTileId id;
};

/** List of packed tile IDs. */
struct TileIdList
{
   /** List of packed tile IDs. */
   packed PackedTileId id[];
};

/*!

## Global Source ID

A global source ID can be attached to any feature to identify the source of
the feature.

Depending on the use case, global source IDs are not unique within the NDS.Live
data. Consider the following examples:

- A feature is generated from multiple sources. Different global source IDs are
  assigned to the same NDS.Live feature.
- NDS.Live features are generated from the same source, but the objects in the
  source data are split into multiple features, for example, because of tiling.
  The same global source ID is assigned to multiple NDS.Live features.

Because source identifiers are not unique across different data providers, a
global source ID can be prefixed with a data provider ID or similar.
For this reason, NDS.Live does not prescribe a specific format for the
global source ID and it is defined as a string.

!*/

/** Global source identifier. */
subtype string GlobalSourceId;

/*!

## Positions and Ranges

!*/

/**
  * Geographic position stored as Morton code.
  * Longitude and latitude are stored as bit-interleaved integer numbers.
  * The given coordinates are encoded according to NDS coordinate coding.
  * Both NDS longitude and NDS latitude are 32-bit integer numbers, while the
  * resulting Morton code is a 64-bit integer value.
  */
subtype int64 MortonCode;

/**
  * Range on a feature based on the feature's length.
  * Uses the same unit as the provided length parameter.
  */
struct Range(varuint32 length)
{
  /** Start position on the feature. */
  RangePosition(length) start;

  /** End position on the feature. */
  RangePosition(length) end;
};

/**
  * Range position.
  * Defines a position on a feature as a fraction of the feature's length.
  */
struct RangePosition(varuint32 length)
{
  varuint32 position : position <= length;
};


/*!

### Percentage Range

Defines a range on a feature based on a percentage of the feature geometry.
Percentages are calculated on a 2-dimensional pseudo-cartesian WGS 84 coordinate system
using the features geometry.

First, the total geometry length of the feature is broken down into resolution steps.
These steps are then used to express the percentage values.

The percentage position is calculated as follows:

* maxPosition = ((2 ^ `numBits`) - 1)
* percentage position = `positionVal` / maxPosition

**Example**

The following values are given:

* 2-dimensional pseudo-cartesian feature length: L = 120,000
* 2-dimensional pseudo-cartesian position: X = 154

The percentage position is then calculated as follows:

1. Calculate the number of bits necessary to hold maximum position: `numBits` = 17 bits
1. Calculate the position value of X: `positionVal` = floor ((154 / 120,000) * ((2 ^ 17)-1) ) = 168
1. Calculate the percentage position of X: percentage position = `positionVal` / maxPosition = 168 / ((2 ^ 17)-1) = 0.00128 = 0.128 %

!*/

/** Range on a feature based on a percentage of the feature geometry. */
struct PercentageRange
{
  /** Number of bits to store percentage value. */
  bit:5 numBits : numBits > 0;

  /** Start percentage position on the feature.*/
  bit<numBits> startPosition;

  /** End percentage position on the feature.*/
  bit<numBits> endPosition : endPosition > startPosition;

  function float64 startPercentageValue()
  {
    return (startPosition+0.0)/((1<<numBits)-1);
  }

  function float64 endPercentageValue()
  {
    return (endPosition+0.0)/((1<<numBits)-1);
  }
};

/** Defines position in percentage on a feature. */
struct PercentagePosition
{
  /** Number of bits to store percentage value. */
  bit:5 numBits : numBits > 0;

  /** Percentage position value. */
  bit<numBits> position;

  function float64 percentageValue()
  {
    return (position+0.0)/((1<<numBits)-1);
  }
};

/*!

## Direction

Indicator of a direction on a feature.

Positive direction means from the start to the end of the feature
in digitization direction.

!*/

/** Indicates the direction on a feature. */
enum bit:2 Direction
{
  /** In positive digitization direction, that is, from start to end of the feature. */
  IN_POSITIVE_DIRECTION,

  /** In negative digitization direction, that is, from end to start of the feature. */
  IN_NEGATIVE_DIRECTION,

  /** In both directions on the feature. */
  IN_BOTH_DIRECTIONS,
};

/*!

## Types for the Classification of Roads and Lanes

!*/

/**
  * Functional road class.
  * Defines the importance of a road for long-distance routes.
  * Roads with higher functional road class are likely to be used for long-distance
  * routes. A road with a lower class is likely to be used for local routes only.
  * 0 represents the highest functional road class, 7 the lowest one.
  */
subtype bit:3 FunctionalRoadClass;

/**
  * Priority road class.
  * Defines the real-world priority of a road.
  * The priority road class is used to choose the display style for the road
  * in the map. The priority road class can be used as a routing attribute
  * in addition to the functional road class.
  * 0 represents the highest priority road class, 15 the lowest one.
  */
subtype bit:4 PriorityRoadClass;


/**
  * Road type.
  * Describes properties of roads or complete road lane groups.
  * Consists of a road form and an optional list of road characteristics.
  */
struct RoadType
{
  /** Form of the road. */
  RoadForm form;

  /** List of characteristics that describe the road. */
  optional packed RoadCharacter characteristics[];
};

/** Road form. Describes the observable part of a road. */
enum uint8 RoadForm
{
  /** Special value to be used if applicable to any road form. */
  ANY,

  /** Normal road. */
  NORMAL,

  /** Road that is part of a dual carriageway. */
  DUAL_CARRIAGEWAY,

  /** Slip road of a crossing at same grade. Also known as slip lane. */
  SLIP_ROAD,

  /**
    * Road connecting two roads at different grade or entrance and
    * exits between controlled-access and non-controlled-access network.
    */
  RAMP,

  /**
    * Road linking one controlled-access road with another controlled-access
    * road at a different grade.
    */
  INTERCHANGE,

  /** Roundabout. */
  ROUNDABOUT,

  /** Interior part of a roundabout. */
  ROUNDABOUT_INTERIOR,

  /** Square. */
  SQUARE,

  /** Pedestrian way. */
  PEDESTRIAN_WAY,

  /**
    * Road that is part of a special traffic figure relating to a
    * construct with similar exit behavior to a roundabout. Special traffic figures
    * can look like a closed circular, an elongated, or even a rectangular
    * construct of roads that are not perceived as a roundabout.
    */
  SPECIAL_TRAFFIC_FIGURE,

  /** Parallel road to a normal or dual carriageway road. */
  PARALLEL_ROAD,

  /**
    * Service road, also known as frontage road. Runs adjacent to a main or
    * primary road and provides access to properties and services.
    */
  SERVICE_ROAD,

  /**
    * Part of a mini roundabout.
    * Special type of roundabout that has a fully traversable central island
    * or no central island.
    */
  MINI_ROUNDABOUT,

};

/**
  * Road character.
  * Describes a road in more detail, for example, its main usage or location.
  */
enum uint8 RoadCharacter
{
  /** Road that is part of an urban or built-up area. */
  URBAN,

  /**
    * Road that is part of a service area or special purpose property, such as
    * a golf course. Includes all entries and exits of these facilities.
    */
  SERVICE_AREA,

  /** Road that is part of a parking facility. */
  PARKING,

  /**
    * Road that is covered by an overhead structure. This may indicate
    * bad GPS reception or decreased light conditions.
    */
  COVERED,

  /** Road that is part of a motorway. */
  MOTORWAY,

  /** Limited-access road that is not a motorway. */
  EXPRESSWAY,

  /** Ferry connection. Not a real road. */
  FERRY,

  /** Road that is in a tunnel. */
  TUNNEL,

  /** Road that is on a bridge. */
  BRIDGE,

  /**
    * Multi-digitized road, that is, a real-world road that is
    * digitized as multiple separate roads. For example, this is done if the two
    * sides of the road are separated by a physical divider.
    *
    * The road character type is also used in complex intersections.
    */
  MULTI_DIGITIZED,

  /**
    * Road that is part of a complex intersection.
    * A complex intersection is composed of multiple roads that
    * are handled as one real-world intersection.
    * In between two complex intersections it is important that at least one
    * road does not have the complex intersection road character assigned.
    * This way, an application can determine all roads that belong to a complex
    * intersection by following the topology up to the first road
    * that does not have the complex intersection road character assigned.
    */
  COMPLEX_INTERSECTION,

  /**
    * Road that is elevated above other nearby roads.
    * An elevated road is usually long and spans several blocks or runs throughout
    * an entire downtown area.
    */
  IS_ELEVATED_ROAD,

  /**
    * Road on an overpass. An overpass is defined as a structure that
    * bridges over another road without significant change of grade, that is, the
    * z-level does not change and the road does not lead up or down.
    */
  OVERPASS,

  /**
    * Road on an underpass. An underpass is defined as a structure that
    * passes under another road with significant change of grade. That is, the
    * z-level does change whereas the road that it passes under keeps its grade.
    */
  UNDERPASS,

  /** Road that is part of a race track. */
  RACE_TRACK,

  /**
    * Road that is inside a city limit.
    * This information is derived from city entry or exit signs at
    * city limits in contrast to urban which is only used in built-up areas.
    * The value is also used for motorways that are located within city limits.
    */
  INSIDE_CITY_LIMITS,

  /** Road within a pedestrian zone. */
  PEDESTRIAN_ZONE,

  /** Road with controlled access, that is, an intersection-free road. */
  CONTROLLED_ACCESS,

  /**
    * Road that is physically separated from other roads. No cross traffic is to
    * be expected from other roads.
    * If a road only has one travel direction, also no incoming traffic is to be
    * expected.
    */
  PHYSICALLY_SEPARATED,

  /** Road that has a shared road surface with tram tracks. */
  TRACKS_ON_ROAD,

  /**
    * Bicycle path or bicycles highway. A bicycle path is only designed for bicycles.
    * A bicycle path is not to be confused with a cyclist road as defined in
    * traffic zone, which is an area where vehicles are allowed but cyclists have
    * priority.
    */
  BICYCLE_PATH,

  /** Road that is only used by buses. */
  BUS_ROAD,

  /** Road that is only used by horses. */
  HORSE_WAY,

  /** Road that is only used by taxis. */
  TAXI_ROAD,

  /** Road that is used only in emergency cases or by emergency vehicles. */
  EMERGENCY_ROAD,

  /** Road that is part of a truck escape ramp. */
  TRUCK_ESCAPE_RAMP,

  /**
    * All lanes of the road are express lanes.
    * An express road is a road with a limited number of entrance and exit
    * points. It is usually part of a motorway.
    * Express roads are physically separated from normal roads.
    */
  EXPRESS_ROAD,

  /**
    * Widened area before and after a station. In this area,
    * lanes are not delimited.
    */
  STATION_PLAZA,

  /** Road with a shoulder lane. */
  HAS_SHOULDER_LANE,

  /** A toll road. All lanes are subject to toll. */
  TOLL_ROAD,

  /**
    * Main or primary road. If there are adjacent roads and one is a service
    * road, this indicates which road is the main or primary road to the service
    * road.
    */
  MAIN_ROAD,

  /**
    * Road to be used for U-turns on a multi-digitized road. Example: Texas
    * U-turn.
    */
  U_TURN_ROAD,
};

/** Road character or inverse of meaning of the road character. */
struct RoadCharacterValued
{
  /** Character of the road. */
  RoadCharacter character;

  /**
    * Describes whether the road character or its inverse meaning is specified.
    * If set to `true`, then `RoadCharacterValued` describes the character
    * of a road.
    * If set to `false`, then `RoadCharacterValued` describes
    * the inverse meaning of the character of a road.
    */
  bool value;
};

rule_group RoadTypeSetRules
{
  /*!
  Fallback for Road Forms in Road Type Sets:

  If a road type set does not contain an entry for a specific road form, then
  the value defined for `RoadForm.ANY` in that road type set shall be used as fallback.
  Example: Road type set is used to define default speed limits for a region.
  The road type set does not contain explicit speed limits for
  `RoadForm.ROUNDABOUT` and `RoadCharacter.URBAN`. As fallback, the value defined
  for `RoadForm.ANY` and `RoadCharacter.URBAN` is used.
  !*/

  rule "core-07wy18";
};

/**
  * Road type set.
  * Specifies one value for more than one dedicated road type, for example,
  * to define default values for road types.
  * Combines road characteristics and their inverse meanings for a set of
  * road types, which can be used to assign attributes or metadata.
  *
  * If `RoadTypeSet.form` is set to `RoadForm.ANY` and the optional
  * `RoadTypeSet.characteristics` is not used, then the set applies to
  * all roads of any type.
  */
struct RoadTypeSet
{
  /** Form of the road. */
  RoadForm form;

  /** List of road characteristics that describe the road in more detail. */
  optional packed RoadCharacterValued characteristics[];
};

/**
  * Lane type characterized by different aspects. Defines how access to lanes
  * is regulated and the road type that the lanes are part of.
  */
struct LaneType
{
  /** Characterizes a lane by its driving function. */
  LaneFunctionalType functionalLaneType;

  /** Characterizes a lane by its access restrictions. */
  LaneAccessType accessLaneType;

  /** Road type of the lane. */
  RoadType roadType;
};

/*!

The following figures illustrate different functional lane types:

Attribute name              |Example
----------------------------|-------------------------------------------------------------------------------------|
`PARKING_LANE`              |![Parking lane](assets/Lanes_LaneTypes_Functional_Parking.jpg)                 |
`TRUCK_PARKING_LANE`        |![Truck parking lane](assets/Lanes_LaneTypes_Functional_TruckParking.jpg)      |
`WAITING_LANE`              |![Waiting lane](assets/Lanes_LaneTypes_Functional_WaitingLane.jpg)             |
`U_TURN_LANE`               |![U-turn lane](assets/Lanes_LaneTypes_Functional_UTurnLane.png)                |
`TURN_LANE`                 |![Turn lane](assets/Lanes_LaneTypes_Functional_TurnLane.png)                   |
`CENTER_TURN_LANE`          |![Center turn lane](assets/Lanes_LaneTypes_Functional_CenterTurnLane.png)      |

!*/

/** Functional type of a lane. */
enum varuint16 LaneFunctionalType
{
  /** Normal lane. */
  NORMAL_LANE,

  /** Exit lane on a controlled-access road. */
  EXIT_LANE,

  /** Entry lane on a controlled-access road. */
  ENTRY_LANE,

  /** Lane on a controlled-access road that is used as entry and exit. */
  ENTRY_AND_EXIT_LANE,

  /** REMOVED. Use values `TURN_LANE` and `CENTER_TURN_LANE` instead. */
  @removed TURNING_LANE,

  /** Parking lane for vehicles.*/
  PARKING_LANE,

  /** Parking lane for trucks.*/
  TRUCK_PARKING_LANE,

  /**
    * Waiting lane. Describes a range on a lane between two stop positions
    * where vehicles have to wait before they can continue.
    * Example: Waiting area between two stop lines inside a larger intersection.
    * After passing the first stop line, vehicles have to wait for a signal at
    * the second stop line before they can clear the intersection.
    */
  WAITING_LANE,

  /** Special value to be used if applicable to any functional lane type. */
  ANY,

  /** Lane that is used for U-turns only. */
  U_TURN_LANE,

  /** Lane that is used for turns in intersections. */
  TURN_LANE,

  /** Center turn lane. */
  CENTER_TURN_LANE,
};

/*!

The following figures illustrate different lane access types:

Attribute name                           |Example
-----------------------------------------|--------------------------------------------------------------------------------|
`EXPRESS_LANE`                           |![Express lane](assets/Lanes_LaneTypes_Express.jpg)                       |
`REGULATED_ACCESS_LANE`                  |![Regulated access lane](assets/Lanes_LaneTypes_RegulatedAccess.jpg)      |
`BICYCLE_LANE`                           |![Bicycle lane](assets/Lanes_LaneTypes_Bicycle.jpg)                       |
`BUS_LANE`                               |![Bus lane](assets/Lanes_LaneTypes_Bus.jpg)                               |
`TRAM_LANE`                              |![Tram lane](assets/Lanes_LaneTypes_Tram.jpg)                             |

In general, lane access types are always accompanied by equivalent rules,
using prohibited passage and conditions to control the lane access.
The type alone does not imply any rules for the lane access.

!*/

/** Access type of a lane. */
bitmask varuint32 LaneAccessType
{
  /** Express lane. */
  EXPRESS_LANE,

  /** Toll lane. */
  TOLL_LANE,

  /**
  * Slow lane. Slow lanes are used to facilitate slow traffic on roads with
  * long or steep uphill or downhill stretches, for example, for trucks.
  */
  SLOW_LANE,

  /** Carpool (HOV) lane. */
  CARPOOL_LANE,

  /**
  * Holding zone that is used to regulate traffic in certain time
  * intervals.
  */
  REGULATED_ACCESS_LANE,

  /** Bicycle lane.*/
  BICYCLE_LANE,

  /** Bus lane.*/
  BUS_LANE,

  /** Tram lane.*/
  TRAM_LANE,

  /**
    * Passing lane. Passing lanes occur where overtaking needs to be regulated
    * to ensure that vehicles can safely pass slow traffic, for example, on
    * steep mountain grades or on other roads.
    */
  PASSING_LANE,

  /** Drivable shoulder lane. */
  DRIVABLE_SHOULDER_LANE,

  /**
    * Soft shoulder lane. Soft shoulder lanes are shoulder lanes made of
    * materials softer than asphalt.
    */
  SOFT_SHOULDER_LANE,

  /** Emergency shoulder lane. */
  EMERGENCY_SHOULDER_LANE,

  /** Emergency shoulder parking bay lane. */
  EMERGENCY_SHOULDER_PARKING_BAY,

  /** Taxi lane. */
  TAXI_LANE,

  /**
  * Reversible or tidal flow lane. A managed lane on which traffic may travel
  * in either direction based on certain conditions.
  */
  REVERSIBLE_LANE,
};

/*!

## Speed

Speed is defined in kilometers per hour or miles per hour. Dedicated speed
values are defined from 1 to 250.

Values above 250 as well as the value 0 are reserved for const definitions.
Const definitions can be used for the following:

- To indicate that the speed limit for a road is undefined. This const value
  is used to indicate that the default speed limit does not apply to a road.
- To indicate that there is no maximum speed limit. Vehicles can travel with any
  maximum speed.
- To indicate that the speed limit is unknown because there is a variable speed
  limit sign.

**Example**

The default speed limit for non-urban roads is set to 100 km/h.
An unpaved road in a non-urban area cannot be traveled at this speed but no
explicit speed limit is defined. For this road, `Speed` is set to
`SPEED_UNDEFINED`.

!*/

rule_group SpeedSubtypeRules
{
  /*!
  No Speed Without Unit:

  The subtype `Speed` shall not be used directly. Instead, the related subtypes
  with units shall be used, that is, `SpeedKmh` and `SpeedMph`.
  !*/

  rule "core-ydhrcy";
};

/** Speed without unit. This subtype is not used directly. */
subtype uint8 Speed;

/** Speed in kilometers per hour. */
subtype Speed SpeedKmh;

/** Speed in miles per hour. */
subtype Speed SpeedMph;

/**
  * Special value to indicate that default speed limits do not apply and no
  * speed limit is defined.
*/
const Speed SPEED_UNDEFINED = 0;

/** Special value to indicate that there is no maximum speed limit. */
const Speed SPEED_UNLIMITED = 255;

/** Special value to indicate that there is a variable speed limit sign. */
const Speed SPEED_VARIABLE = 254;

/*!

## Monetary Amount

Monetary amount in a specific currency, for example, to indicate toll cost or
other fees.

amount = 1000 * value in currency

**Examples**

- 1.32 EUR = 1320
- 1294 PESO = 1294000

!*/

/** Monetary amount. */
struct MonetaryAmount
{
  /** Amount expressed as 1000 * value in currency. */
  varint amount;

  /** Currency in which the amount is expressed. */
  Currency currency;
};

/** Toll cost that is charged at a toll booth. */
subtype MonetaryAmount TollCost;

/*!

## Traffic Enforcement Information

Types to distinguish traffic enforcement cameras and traffic enforcement
zones.

!*/

/** Different types of traffic enforcement cameras. */
enum uint8 TrafficEnforcementCameraType
{
  /** Fixed speed camera. */
  FIXED_SPEED    = 0,

  /** Mobile speed camera. */
  MOBILE_SPEED   = 1,

  /** Red-light camera. */
  REDLIGHT       = 2,

  /** Toll road camera. */
  TOLLROAD       = 3,

  /** Peccancy camera. */
  PECCANCY       = 4,

  /** Special lane camera. */
  SPECIAL_LANE   = 5,

  /** Fixed speed and red-light camera. */
  FIXED_SPEED_AND_RED_LIGHT = 6,

  /** Bus lane camera. */
  BUS_LANE       = 7,

  /** Fake camera. */
  FAKE           = 8,

  /** Parking violation camera. */
  PARKING_VIOLATION =  9,

  /**
    * Camera at the entry of a traffic enforcement zone.
    * Mandatory for traffic enforcement zones.
    */
  TRAFFIC_ENFORCEMENT_ZONE_ENTRY =  10,

  /**
    * Camera at the exit of a traffic enforcement zone.
    * Mandatory for traffic enforcement zones.
    */
  TRAFFIC_ENFORCEMENT_ZONE_EXIT =  11,

  /** Marking violation camera. */
  MARKING_VIOLATION =  12,

  /** Traffic information collection camera. */
  TRAFFIC_INFORMATION_COLLECTION =  13,

  /** Fixed bus lane and speed camera. */
  BUS_LANE_AND_FIXED_SPEED =  14,

  /** Shoulder lane camera. */
  SHOULDER_LANE =  15,

  /** Merging traffic camera. */
  MERGING_TRAFFIC =  16,

  /** Ramp metering camera. */
  RAMP_METERING =  17,

  /** Camera that checks for non-motorized vehicles on the road. */
  NON_MOTORIZED_VEHICLE = 18,

  /** Camera that checks whether vehicles yield to pedestrians. */
  YIELD_TO_PEDESTRIANS = 19,

  /** Camera that checks for illegal lane occupation. */
  ILLEGAL_LANE_OCCUPATION = 20,

  /** Camera that checks whether drivers use their phone while driving. */
  PHONE_USAGE = 21,

  /** Camera that checks whether vehicle occupants wear their seat belts. */
  SEAT_BELT = 22,

  /** Camera that checks for illegal horn usage. */
  HORN_USAGE = 23,

  /** Camera that checks for illegal use of lamps such as high beam. */
  ILLEGAL_LAMP_USAGE = 24,

  /** Other camera. */
  OTHER          = 31
};

/** Different types of traffic enforcement zones. */
enum uint8 TrafficEnforcementZoneType
{
  /** Average speed zone. */
  AVERAGE_SPEED_ZONE         = 0,

  /** Speed enforcement zone. */
  SPEED_ENFORCEMENT_ZONE     = 1,

  /** Danger zone. */
  DANGER_ZONE                = 2,

  /** Mobile speed hotspot zone. */
  MOBILE_SPEED_HOTSPOT_ZONE  = 3,

  /** Accident blackspot zone. */
  ACCIDENT_BLACKSPOT_ZONE    = 4,

  /** Risk zone. */
  RISK_ZONE                  = 5
};

/*!

## ISO Country and Subdivision Codes

ISO codes according to ISO 3166 can be used to identify regions across different
services and map data to country specifics within an application.
The ISO details consist of ISO 3166-1 country codes and ISO 3166-2 country
subdivision codes.

ISO reserves some user-defined code ranges and guarantees that these are never
assigned to a new country. For example, XXX is used for machine-readable
passports to represent a person of unspecified nationality. User-defined
country codes can also be assigned to territories that do not have an official
ISO 3166-1 alpha-3 country code assigned.

!*/

rule_group Iso3166CodesRules
{
  /*!
  Country Codes:

  Country codes used in `isoCountryCode` shall conform to the list of valid
  alpha-3 codes in ISO 3166-1 or conform to the rules of user-assigned codes
  defined in ISO 3166-1. ISO country code XXX shall be used for international
  waters.
  !*/

  rule "core-vyg8hu";

  /*!
  Country Subdivision Codes:

  Subdivision codes used in `isoSubCountryCode` shall conform to the list of
  valid principal subdivisions as defined in ISO 3166-2. The subdivision code
  shall represent the second part of the ISO 3166-2 code only and shall correspond
  to the country that is defined in `isoCountryCode`.
  !*/

  rule "core-qabknu";
};

/** ISO codes according to ISO 3166. */
struct Iso3166Codes
{
  /**
    * ISO-3166-1 alpha-3 country code in three uppercase characters.
    *
    * ISO country code XXX is used for international waters.
    * User-defined codes are used for territories that do not have an
    * official ISO 3166-1 alpha-3 country code assigned.
    */
  string isoCountryCode;

  /**
    * Definition of the principal subdivisions of a country according to ISO 3166-2.
    * Only the second part of ISO 3166-2 is stored. The ISO 3166-1 country code
    * is not repeated.
    */
  optional string isoSubCountryCode;
};

/**
  * ISO-3166-1 alpha-3 country code in three uppercase characters.
  *
  * ISO country code XXX is used for international waters.
  * User-defined codes are used for territories that do not have an
  * official ISO 3166-1 alpha-3 country code assigned.
  */
subtype string IsoCountryCode;

/**
  * Definition of a geopolitical view of a disputed area.
  * Between some countries, there are disputed areas that are claimed by
  * multiple countries based on their geopolitical views.
  * One NDS.Live service always only provides one view of the disputed area. To
  * indicate which country's geopolitical view is provided, the ISO country code
  * of this country is stored.
  * The application can use this information to decide which service to use.
  *
  * The default value for the ISO country code is XXX. An application falls
  * back to this value in case its configured language code is not explicitly
  * enumerated.
  */
struct GeopoliticalView
{
  /** List of ISO codes according to ISO 3166 for which this geopolitical view is valid. */
  Iso3166Codes iso3166Codes[] : lengthof(iso3166Codes) > 0;
};

/*!

## ISO Currency Codes

ISO codes according to ISO 4217 can be used to identify currencies.

!*/

/**
  * Currency codes are expressed as ISO 4217 three-letter code in
  * three uppercase characters.
  */
enum uint8 Currency
{
  /** U A Emirates Dirhams*/
  AED,

  /** Afghanistan, Afghanis*/
  AFN,

  /**Albania, Leke*/
  ALL,

  /**Armenia, Drams*/
  AMD,

  /** Netherlands Antilles Guilders (also called Florins)*/
  ANG,

  /** Angola, Kwanza*/
  AOA,

  /** Argentina, Pesos*/
  ARS,

  /** Australia, Dollars*/
  AUD,

  /** Aruba, Guilders (also called Florins)*/
  AWG,

  /** Azerbaijan, New Manats*/
  AZN,

  /** Bosnia and Herzegovina, Convertible Marka*/
  BAM,

  /** Barbados, Dollars*/
  BBD,

  /**   Bangladesh, Taka*/
  BDT,

  /**   Bulgaria, Leva*/
  BGN,

  /**   Bahrain, Dinars*/
  BHD,

  /**   Burundi, Francs*/
  BIF,

  /**   Bermuda, Dollars*/
  BMD,

  /**   Brunei Darussalam Dollars*/
  BND,

  /**   Bolivia, Bolivianos*/
  BOB,

  /**   Brazil, Brazil Real*/
  BRL,

  /**   Bahamas, Dollars*/
  BSD,

  /**   Bhutan, Ngultrum*/
  BTN,

  /**   Botswana, Pulas*/
  BWP,

  /**   Belarus, Rubles*/
  BYR,

  /**   Belize, Dollars*/
  BZD,

  /**   Canada, Dollars*/
  CAD,

  /**   Congo/Kinshasa, Congolese Francs*/
  CDF,

  /**   Switzerland, Francs*/
  CHF,

  /**   Chile, Pesos*/
  CLP,

  /**   China, Yuan Renminbi*/
  CNY,

  /**   Colombia, Pesos*/
  COP,

  /**   Costa Rica, Colones*/
  CRC,

  /**   Cuba, Pesos*/
  CUP,

  /**   Cape Verde, Escudos*/
  CVE,

  /**   Czech Republic, Koruny*/
  CZK,

  /**   Djibouti, Francs*/
  DJF,

  /**   Denmark, Kroner*/
  DKK,

  /**   Dominican Republic Pesos*/
  DOP,

  /**   Algeria, Algeria Dinars*/
  DZD,

  /**   Estonia, Krooni*/
  EEK,

  /**   Egypt, Pounds*/
  EGP,

  /**   Eritrea, Nakfa*/
  ERN,

  /**   Ethiopia, Birr*/
  ETB,

  /**   Euro */
  EUR,

  /**   Fiji, Dollars*/
  FJD,

  /**   Falkland Islands Pounds*/
  FKP,

  /**   United Kingdom, Pounds*/
  GBP,

  /**   Georgia, Lari*/
  GEL,

  /**   Guernsey, Pounds*/
  GGP,

  /**   Ghana, Cedis*/
  GHS,

  /**   Gibraltar, Pounds*/
  GIP,

  /**   Gambia, Dalasi*/
  GMD,

  /**   Guinea, Francs*/
  GNF,

  /**   Guatemala, Quetzales*/
  GTQ,

  /**   Guyana, Dollars*/
  GYD,

  /**   Hong Kong, Dollars*/
  HKD,

  /**   Honduras, Lempiras*/
  HNL,

  /**   Croatia, Kuna*/
  HRK,

  /**   Haiti, Gourdes*/
  HTG,

  /**   Hungary, Forint*/
  HUF,

  /**   Indonesia, Rupiahs*/
  IDR,

  /**   Israel, New Shekels*/
  ILS,

  /**   Isle of Man, Pounds*/
  IMP,

  /**   India, Rupees*/
  INR,

  /**   Iraq, Dinars*/
  IQD,

  /**   Iran, Rials*/
  IRR,

  /**   Iceland, Kronur*/
  ISK,

  /**   Jersey, Pounds*/
  JEP,

  /**   Jamaica, Dollars*/
  JMD,

  /**   Jordan, Dinars*/
  JOD,

  /**   Japan, Yen*/
  JPY,

  /**   Kenya, Shillings*/
  KES,

  /**   Kyrgyzstan, Soms*/
  KGS,

  /**   Cambodia, Riels*/
  KHR,

  /**   Comoros, Francs*/
  KMF,

  /**   Korea (North), Won*/
  KPW,

  /**   Korea (South), Won*/
  KRW,

  /**   Kuwait, Dinars*/
  KWD,

  /**   Cayman Islands, Dollars*/
  KYD,

  /**   Kazakhstan, Tenge*/
  KZT,

  /**   Laos, Kips*/
  LAK,

  /**   Lebanon, Pounds*/
  LBP,

  /**   Sri Lanka, Rupees*/
  LKR,

  /**   Liberia, Dollars*/
  LRD,

  /**   Lesotho, Maloti*/
  LSL,

  /**   Lithuania, Litai*/
  LTL,

  /**   Latvia, Lati*/
  LVL,

  /**   Libya, Dinars*/
  LYD,

  /**   Morocco, Dirhams*/
  MAD,

  /**   Moldova, Lei*/
  MDL,

  /**   Madagascar, Ariary*/
  MGA,

  /**   Macedonia, Denars*/
  MKD,

  /**   Myanmar (Burma), Kyats*/
  MMK,

  /**   Mongolia, Tugriks*/
  MNT,

  /**   Macau, Patacas*/
  MOP,

  /**   Mauritania, Ouguiyas*/
  MRO,

  /**   Mauritius, Rupees*/
  MUR,

  /**   Maldives Rufiyaa*/
  MVR,

  /**   Malawi, Kwachas*/
  MWK,

  /**   Mexico, Pesos*/
  MXN,

  /**   Malaysia, Ringgits*/
  MYR,

  /**   Mozambique, Meticais*/
  MZN,

  /**   Namibia, Dollars*/
  NAD,

  /**   Nigeria, Nairas*/
  NGN,

  /**   Nicaragua, Cordobas*/
  NIO,

  /**   Norway, Krone*/
  NOK,

  /**   Nepal, Nepal Rupees*/
  NPR,

  /**   New Zealand, Dollars*/
  NZD,

  /**   Oman, Rials*/
  OMR,

  /**   Panama, Balboa*/
  PAB,

  /**   Peru, Nuevos Soles*/
  PEN,

  /**   Papua New Guinea, Kina*/
  PGK,

  /**   Philippines, Pesos*/
  PHP,

  /**   Pakistan, Rupees*/
  PKR,

  /**   Poland, Zlotych*/
  PLN,

  /**   Paraguay, Guarani*/
  PYG,

  /**   Qatar, Rials*/
  QAR,

  /**   Romania, New Lei*/
  RON,

  /**   Serbia, Dinars*/
  RSD,

  /**   Russia, Rubles*/
  RUB,

  /**   Rwanda, Rwanda Francs*/
  RWF,

  /**   Saudi Arabia, Riyals*/
  SAR,

  /**   Solomon Islands, Dollars*/
  SBD,

  /**   Seychelles, Rupees*/
  SCR,

  /**   Sudan, Pounds*/
  SDG,

  /**   Sweden, Kronor*/
  SEK,

  /**   Singapore, Dollars*/
  SGD,

  /**   Saint Helena, Pounds*/
  SHP,

  /**   Sierra Leone, Leones*/
  SLL,

  /**   Somalia, Shillings*/
  SOS,

  /**   Seborga, Luigini*/
  SPL,

  /**   Suriname, Dollars*/
  SRD,

  /**   Sao Tome and Principe, Dobras*/
  STD,

  /**   El Salvador, Colones*/
  SVC,

  /**   Syria, Pounds*/
  SYP,

  /**   Swaziland, Emalangeni*/
  SZL,

  /**   Thailand, Baht*/
  THB,

  /**   Tajikistan, Somoni*/
  TJS,

  /**   Turkmenistan, Manats*/
  TMM,

  /**   Tunisia, Dinars*/
  TND,

  /**   Tonga, Pa'anga*/
  TOP,

  /**   Turkey, New Lira*/
  TRY,

  /**   Trinidad and Tobago, Dollars*/
  TTD,

  /**   Tuvalu, Tuvalu Dollars*/
  TVD,

  /**   Taiwan, New Dollars*/
  TWD,

  /**   Tanzania, Shillings*/
  TZS,

  /**   Ukraine, Hryvnia*/
  UAH,

  /**   Uganda, Shillings*/
  UGX,

  /**   United States of America, Dollars*/
  USD,

  /**   Uruguay, Pesos*/
  UYU,

  /**   Uzbekistan, Sums*/
  UZS,

  /**   Venezuela, Bolivares Fuertes*/
  VEF,

  /**   Viet Nam, Dong*/
  VND,

  /**   Vanuatu, Vatu*/
  VUV,

  /**   Samoa, Tala*/
  WST,

  /**   Communaute Financiere Africaine BEAC, Francs*/
  XAF,

  /**   Silver, Ounces*/
  XAG,

  /**   Gold, Ounces*/
  XAU,

  /**   East Caribbean Dollars*/
  XCD,

  /**   Communaute Financiere Africaine BCEAO, Francs*/
  XOF,

  /**   Palladium Ounces*/
  XPD,

  /**   Comptoirs Francais du Pacifique Francs*/
  XPF,

  /**   Platinum, Ounces*/
  XPT,

  /**   Yemen, Rials*/
  YER,

  /**   South Africa, Rand*/
  ZAR,

  /**   Zambia, Kwacha*/
  ZMK,

  /**   Zimbabwe, Zimbabwe Dollars*/
  ZWD
};

/** Defines a list of currencies. */
struct Currencies
{
  /** Number of currencies in the list.*/
  uint8    numCurrencies;

  /** List of currencies.*/
  packed Currency currencies[numCurrencies];
};


/*!

## ISO Revision Information

If it is necessary to refer to a certain version of an ISO standard, revision
information can be included in the metadata of a layer. ISO revision information
follows a specific pattern that includes the revision year and publication date.

Example: 2023:2023-11

!*/

rule_group IsoRevisionRules
{
  /*!
  ISO Revision Information:

  The revision information for ISO codes in `IsoRevision` shall be formatted
  using the following pattern: <revision_year>:<publication_date_as_YYYY-MM>.
  Example: "2023:2023-11".
  !*/

  rule "core-nfo0i5";
};

/** Revision information for ISO codes.
  * Formatted as <revision_year>:<publication_date_as_YYYY-MM>.
  * Example: "2023:2023-11"
  */
subtype string IsoRevision;