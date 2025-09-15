/*!

# Core Conditions

This package defines conditions. Conditions are mainly used to constrain the
application of attributes to a certain time, weather, or other constraining
domain. Conditions are represented as a type and a value. Some conditions are
stored in bitmasks.

## Using the `isInclusive` Value

Sometimes it is easier to describe a condition by specifying objects or actors
that are not affected. For example, it is easier to express that a passage is
prohibited for all vehicles that are not passenger cars rather than listing all
the vehicles that are prohibited from passing through. This also has the
advantage that the condition covers any vehicle types that are not explicitly
listed.

The `isInclusive` does exactly that. The value inverts a condition as follows:

- If `isInclusive` is set to `true`, then the statement expressed by the
  condition value is left unaltered.
- If `isInclusive` is set to `false`, then the statement expressed by the
  condition is inverted. The condition applies to all objects except the ones
  defined in the condition.

**Example**

The bit `TRUCK` in the condition `FREQUENTLY_USED_VEHICLE_TYPES` is set:

- If `isInclusive` is set to `true`, the condition applies to all vehicles that
  are trucks.
- If `isInclusive` is set to `false`, the condition applies to all vehicles that
  are not trucks.

## Using Bitmasks in Conditions

If the conditions that are used in an attribute are modeled using bitmasks, the
following is important:

- If a bit is set, the corresponding value is evaluated. The condition applies
  if that value matches the corresponding vehicle.
- The results of the bit evaluation are connected by a logical OR. If multiple
  bits are set, the condition applies if at least one of the values matches the
  corresponding vehicle.
- If a bit is not set, the corresponding value is ignored.

NDS.Live uses the disjunctive normal form of logical expressions to check
whether a condition applies to the individual vehicle.

The following figure describes the evaluation of attributes with conditions that
are modeled in bitmasks, taking into account the `isInclusive` value. The
following steps describe the evaluation of the bitmask:

1. For each bit, use logical AND to check whether the bit value in the map
   matches the individual vehicle property.
1. Connect the results of the AND operation by a logical OR.
1. Apply the `isInclusive` value.

![Evaluation of attribute
conditions](assets/attribute_map_conditions_formula.png)

For conditions that are not stored in bitmasks, only one condition value (n = 1)
is evaluated before applying the `isInclusive` value.

The truth values of conditions within the conditions list of an attribute map
are logically combined with AND after the `isInclusive` value has been applied.
The result is the truth value of the conditions list.

**Example**

To determine if the passage on a road is prohibited for a truck, an application
needs to evaluate all `PROHIBITED_PASSAGE` attributes until one of the following
applies:
- At least one attribute has conditions that evaluate to `true` for trucks. The
  prohibition applies.
- All conditions for all `PROHIBITED_PASSAGE` attributes assigned to the road
  evaluate to `false`. None of the `PROHIBITED_PASSAGE` attributes are relevant
  for trucks.

For more information on using attributes with conditions including examples, see
[Using NDS.Live > Concepts and Use Cases > Attributes and
Conditions](https://developer.nds.live/using-nds.live/concepts-and-use-cases/attributes).

**Dependencies**

!*/

package core.conditions;

import core.vehicle.*;
import core.types.*;



/** Condition Type Code. */
enum uint16 ConditionTypeCode
{
  /** Condition specifies a range of start and end tuples of hour and minute. */
  TIME_RANGE_OF_DAY,

  /** Condition specifies a period within a week by start time and end time. */
  TIME_RANGE_OF_WEEK,

  /** Condition specifies a range of start and end tuples of dates. */
  DATE_RANGE_OF_YEAR,

  /** Condition specifies for each day of a week if the attribute is valid. */
  DAYS_OF_WEEK,

  /** Condition specifies for each day of a month if the attribute is valid. */
  DAYS_OF_MONTH,

  /** Condition specifies one day in the year by selecting a month and a day. */
  DAY_OF_YEAR,

  /** Condition specifies one or multiple months of the year. */
  MONTHS_OF_YEAR,

  /** Condition specifies a week in a month. */
  WEEK_IN_MONTH,

  /**
    * Condition specifies a weekday in a month counted in forward or backward
    * direction.
    */
  WEEKDAY_IN_MONTH,

  /** Condition specifies a calendar weekday according to ISO 8601. */
  CALENDAR_WEEK,

  /** Condition specifies a time duration in years, months, and days. */
  TIME_DURATION,

  /**
    * Condition specifies if a certain restriction applies on odd days only
    * or on even days only.
    */
  ODD_OR_EVEN_DAYS,

  /**
    * Condition specifies a time domain that is not controlled by dates but
    * by certain events that are hard to grasp, therefore fuzzy. */
  FUZZY_TIME_DOMAIN,

  /** Condition is weather-related. */
  WEATHER,


  /**
    * Condition applies to vehicle types that are presumed to be the most
    * frequently used types in a map. */
  FREQUENTLY_USED_VEHICLE_TYPES,

  /**
    * Condition applies to non-motorized road users or road users with a
    * low-power engine or low maximum speed.
    */
  SLOW_ROAD_USERS,

  /** Condition applies to trucks, buses, and other big vehicles. */
  BIG_VEHICLES,

  /** Condition applies to vehicle types for public service vehicles. */
  PUBLIC_SERVICE_VEHICLES,

  /** Condition applies to special vehicles for emergency or military. */
  EMERGENCY_MILITARY_DETAILS,

  /** Condition evaluates extra equipment that is necessary on a vehicle. */
  EQUIPMENT,

  /**
    * Condition evaluates the authorization status of a vehicle. Authorization
    * is useful to express prohibitions.
    */
  AUTHORIZATION,

  /** Condition evaluates vehicle load types. */
  LOAD,

  /**
    * Condition provides a numerical value for the maximum number of axles
    * that is allowed.
    */
  NUM_AXLES,

  /**
    * Condition is related to the occupancy of a vehicle, that is, the number
    * of persons in a vehicle.
    */
  OCCUPANCY,

  /**
    * Condition provides a numerical value for the maximum vehicle length in
    * centimeters.
    */
  LENGTH_METRIC,

  /** Condition provides a numerical value for the maximum vehicle length in inch. */
  LENGTH_IMPERIAL,

 /**
    * Condition provides a numerical value for the maximum vehicle height in
    * centimeters.
    */
  VEHICLE_HEIGHT_METRIC,

  /** Condition provides a numerical value for the maximum vehicle height in inch. */
  VEHICLE_HEIGHT_IMPERIAL,

 /**
    * Condition provides a numerical value for the maximum vehicle width in
    * centimeters.
    */
  VEHICLE_WIDTH_METRIC,

  /** Condition provides a numerical value for the maximum vehicle width in inch. */
  VEHICLE_WIDTH_IMPERIAL,

  /**
    * Condition provides a numerical value in increments of 10 kg that
    * represents vehicles heavier than the given numerical value.
    */
  WEIGHT_METRIC,

  /**
    * Condition provides a numerical value in increments of 10 pounds that
    * represents vehicles heavier than the given numerical value.
    */
  WEIGHT_IMPERIAL,

  /**
    * Condition provides a numerical value in increments of 10 kg that
    * represents vehicles with a higher load per axle than the given numerical
    * value.
    */
  WEIGHT_PER_AXLE_METRIC,

  /**
    * Condition provides a numerical value in increments of 10 pounds that
    * represents vehicles with a higher load per axle than the given numerical
    * value.
    */
  WEIGHT_PER_AXLE_IMPERIAL,

  /**
    * Condition provides a numerical value in increments of 10 kg that
    * represents vehicles with a higher load per tandem axle than the given
    * numerical value.
    */
  WEIGHT_PER_TANDEM_AXLE_METRIC,

  /**
    * Condition provides a numerical value in increments of 10 pounds that
    * represents vehicles with a higher load per tandem axle than the given
    * numerical value.
    */
  WEIGHT_PER_TANDEM_AXLE_IMPERIAL,

  /**
    * Condition provides a numerical value in increments of 10 kg that
    * represents vehicles with a higher load per tridem axle than the given
    * numerical value.
    */
  WEIGHT_PER_TRIDEM_AXLE_METRIC,

  /**
    * Condition provides a numerical value in increments of 10 pounds that
    * represents vehicles with a higher load per tridem axle than the given
    * numerical value.
    */
  WEIGHT_PER_TRIDEM_AXLE_IMPERIAL,

  /** Condition specifies a time range of day for each day of the week. */
  TIME_RANGE_OF_WEEKDAYS,

  /**
    * Condition specifies the visibility on the road in predefined ranges of
    * meters.
    */
  VISIBILITY,

  /** Condition applies based on road or lane surface conditions. */
  SURFACE,

  /** Condition specifies the Euro emission class of a vehicle's engine. */
  EURO_EMISSION_CLASS,

  /**
    * Condition specifies a time duration in hours and minutes to describe
    * validities.
    */
  TIME_DURATION_HOURS,

  /** Condition specifies a range of start and end dates and times within a year. */
  TIME_RANGE_OF_YEAR,

  /** Condition specifies the exact or maximum number of trailers allowed on a vehicle. */
  NUM_TRAILERS,

  /** Condition specifies the minimum or maximum length of a single trailer in centimeters. */
  TRAILER_LENGTH_METRIC,

  /** Condition specifies the minimum or maximum length of a single trailer in inch. */
  TRAILER_LENGTH_IMPERIAL,

  /**
    * Condition provides a numerical value in cubic centimeters that
    * represents vehicles with an engine displacement greater than or equal to
    * the given numerical value.
    */
  ENGINE_DISPLACEMENT,

  /** Condition applies to a specific engine energy type of the vehicle. */
  ENERGY_TYPE,

  /** Condition applies to braked or unbraked trailers. */
  BRAKED_TRAILER,

  /** Condition specifies public buses in more detail. */
  PUBLIC_BUS_TYPE,
};

choice ConditionValue(ConditionTypeCode code) on code
{
  case TIME_RANGE_OF_DAY:
              TimeRangeOfDay timeRangeOfDay;
  case TIME_RANGE_OF_WEEK:
              TimeRangeOfWeek timeRangeOfWeek;
  case DATE_RANGE_OF_YEAR:
              DateRangeOfYear dateRangeOfYear;
  case DAYS_OF_WEEK:
              DaysOfWeek daysOfWeek;
  case DAYS_OF_MONTH:
              DaysOfMonth daysOfMonth;
  case DAY_OF_YEAR:
              DayOfYear dayOfYear;
  case MONTHS_OF_YEAR:
              MonthsOfYear monthsOfYear;
  case WEEK_IN_MONTH:
              WeekInMonth weekInMonth;
  case WEEKDAY_IN_MONTH:
              WeekdayInMonth weekdayInMonth;
  case CALENDAR_WEEK:
              CalendarWeek calendarWeek;
  case TIME_DURATION:
              TimeDuration timeDuration;
  case ODD_OR_EVEN_DAYS:
              OddOrEvenDays oddOrEvenDays;
  case FUZZY_TIME_DOMAIN:
              FuzzyTimeDomainCondition fuzzyTimeDomain;
  case WEATHER:
              WeatherCondition weather;
  case FREQUENTLY_USED_VEHICLE_TYPES:
              FrequentlyUsedVehicleTypesCondition frequentlyUsedVehicles;
  case SLOW_ROAD_USERS:
            SlowRoadUsersCondition slowRoadUsers;
  case BIG_VEHICLES:
              BigVehiclesCondition bigVehicles;
  case PUBLIC_SERVICE_VEHICLES:
              PublicServiceVehiclesCondition publicServiceVehicles;
  case EMERGENCY_MILITARY_DETAILS:
              EmergencyMilitaryDetailCondition emergencyMilitaryDetails;
  case EQUIPMENT:
              EquipmentCondition equipment;
  case AUTHORIZATION:
              AuthorizationCondition authorization;
  case LOAD:
              LoadCondition load;
  case NUM_AXLES:
              NumAxles numAxles;
  case OCCUPANCY:
              Occupancy occupancy;
  case LENGTH_METRIC:
              LengthCentimeters vehicleLengthMetric;
  case LENGTH_IMPERIAL:
              LengthInch vehicleLengthImperial;
  case VEHICLE_HEIGHT_METRIC:
              HeightCentimeters vehicleHeightMetric;
  case VEHICLE_HEIGHT_IMPERIAL:
              HeightInch vehicleHeightImperial;
  case VEHICLE_WIDTH_METRIC:
              WidthCentimeters vehicleWidthMetric;
  case VEHICLE_WIDTH_IMPERIAL:
              WidthInch vehicleWidthImperial;
  case WEIGHT_METRIC:
              Weight10Kilogram weightMetric;
  case WEIGHT_IMPERIAL:
              Weight10Lbs weightImperial;
  case WEIGHT_PER_AXLE_METRIC:
              Weight10Kilogram weightPerAxleMetric;
  case WEIGHT_PER_AXLE_IMPERIAL:
              Weight10Lbs weightPerAxleImperial;
  case WEIGHT_PER_TANDEM_AXLE_METRIC:
              Weight10Kilogram weightPerTandemAxleMetric;
  case WEIGHT_PER_TANDEM_AXLE_IMPERIAL:
              Weight10Lbs weightPerTandemAxleImperial;
  case WEIGHT_PER_TRIDEM_AXLE_METRIC:
              Weight10Kilogram weightPerTridemAxleMetric;
  case WEIGHT_PER_TRIDEM_AXLE_IMPERIAL:
              Weight10Lbs weightPerTridemAxleImperial;
  case TIME_RANGE_OF_WEEKDAYS:
              TimeRangeOfWeekDays timeRangeOfWeekDays;
  case VISIBILITY:
              Visibility visibility;
  case SURFACE:
              Surface surface;
  case EURO_EMISSION_CLASS:
              EuroEmissionClassCondition euroEmissionClass;
  case TIME_DURATION_HOURS:
              TimeDurationHours timeDurationHours;
  case TIME_RANGE_OF_YEAR:
              TimeRangeOfYear timeRangeOfYear;
  case NUM_TRAILERS:
              NumTrailersCondition numTrailers;
  case TRAILER_LENGTH_METRIC:
              TrailerLengthMetricCondition trailerLengthMetric;
  case TRAILER_LENGTH_IMPERIAL:
              TrailerLengthImperialCondition trailerLengthImperial;
  case ENGINE_DISPLACEMENT:
              EngineDisplacement engineDisplacement;
  case ENERGY_TYPE:
              EnergyTypeCondition energyType;
  case BRAKED_TRAILER:
              BrakedTrailer brakedTrailer;
  case PUBLIC_BUS_TYPE:
              PublicBusTypeCondition publicBusTypes;
};

/*!

## Time-Based Conditions

Conditions can be assigned based on time periods or dates.

### Time Range of Day

This condition describes a range of start and end tuples of hour and minute.
The minimum range that can be defined is 1 minute. The range contains all times
between start and end time.

If the start time is larger than the end time, then the period goes across midnight.

**Examples**

- A time range with `startTime` = `{7,0}`, `endTime` = `{15,30}`, and
   `isInclusive` = `true`, starts at 07:00:00 and ends at 15:29:59.9.
- A time range with `startTime` = `{21,50}`, `endTime` = `{06:45}`, and
  `isInclusive` = `true`, is from 0:00:00 until 06:44.59.9 and from 21:50:00
  until 23:59:59.9.
- A time range with `startTime` = `{7,0}`, `endTime` = `{15,30}`, and
  `isInclusive` = `false`, is from 0:00:00 until 06:59.59.9 and from 15:30:00
  until 23:59:59.9.

!*/

/**
  * Defines a range of start and end tuples of hour and minute.
  * Minimum range is 1 minute.
  */
struct TimeRangeOfDay
{
    /** Start time. Included if `isInclusive` is `true`. */
    TimeOfDay startTime;

    /** End time. Excluded if `isInclusive` is `true`. */
    TimeOfDay endTime;

    /**
     * If set to `true`, then the specified time range is valid.
     * If set to `false`, then the inverted time range is valid.
     */
    bool isInclusive;
};

/** Defines a point of time in terms of hours and minutes. */
struct TimeOfDay
{
    /** Hours from 0 to 23. */
    uint8 hours : hours <= 23;

    /** Minutes from 0 to 59. */
    uint8 minutes : minutes <= 59;
};

/** Specifies a time range of day for each day of the week. */
struct TimeRangeOfWeekDays
{
  /** A time range for each week day, in order from Monday to Sunday. */
  TimeRangeOfDay rangeOfWeekDay[7];
};

/*!

### Time Range of Week

Specifies a period within a week by start time and end time. The time is
measured in minutes that have passed since the beginning of Monday at 0:00.
The start time is included in the time range while the end time is excluded.

If the start time is larger than the end time, then the
period goes across the night from Sunday to Monday.

**Example**

A time range of week with `startTime` = 0 and `endTime` = 1 has a duration of one
minute. The time range starts at 0:00:00 on Monday and ends at 0:00:59.9.

!*/

/** Defines a time range within a week. */
struct TimeRangeOfWeek
{
    /** Start time in minutes relative to Monday, 0:00. This time is included. */
    TimeOfWeek startTime;

    /** End time in minutes relative to Monday, 0:00. This time is excluded. */
    TimeOfWeek endTime;
};

/** Measure of time in minutes, relative to Monday, 0:00. */
subtype bit:14 TimeOfWeek;

/*!

### Date Range of Year

This condition describes a range of start and end tuples of dates.
The minimum range that can be defined is 1 day. The range contains all times
between start and end time including the start time and the end time.

If a year is given and the end date is before the start date, the range is invalid.
If `YEAR_INFINITY` is used and the end date is before the start date, the period
goes across the beginning of the year.

**Examples**

- A date range of year with `startDay` = `{ year = 2020, month = 7, day = 1 }`,
  `endDay` = `{ year = 2022, month = 3, day = 31 }`, and `isInclusive` = `true`
  defines a range starting on the 1st of July 2020 (included) and ends on the
  31st of March 2022 (included).
- A date range of year with `startDay` = `{ year = YEAR_INFINITY, month = 3, day = 1 }`,
  `endDay` = `{ year = YEAR_INFINITY, month = 3, day = 15 }`, and `isInclusive` =
  `true` defines a period from the first of March until the 15th of March
  each year, both days included.
- A date range of year with `startDay` = `{ year = YEAR_INFINITY, month = 12, day = 24 }`,
  `endDay` = `{ year = YEAR_INFINITY, month = 1, day = 6 }`, and `isInclusive` =
  `true` defines a period from the 24th of December to the 6th of January, both days included.
- A date range of year `startDay` = `{ year = YEAR_INFINITY, month = 12, day = 25 }`,
  `endDay` = `{ year = YEAR_INFINITY, month = 12, day = 26 }`, and `isInclusive` =
  `false` defines a period that covers the whole year except the 25th and 26th of December.

!*/

rule_group DateRangeOfYearRules
{
  /*!
  `isInclusive` within `DateRangeOfYear`:

  The `isInclusive` values within the substructures shall be set to `true`.
  For example, `startDay.isInclusive` is always set to `true` within `DateRangeOfYear`.
  !*/

  rule "core-0ah2bi";
};

/** Defines a range of start and end tuples of dates. Minimum range is 1 day. */
struct DateRangeOfYear
{
  /** Start day. This day is included. */
  DayOfYear startDay;

  /** End day. This day is included. */
  DayOfYear endDay;

  /**
   * If set to `true`, then the specified date range is valid.
   * If set to `false`, then the inverted date range is valid.
   */
  bool isInclusive;
};

/*!

### Time Range of Year

This condition describes a range of start and end tuples of dates and times.
The range contains all times between start and end time including the start time
and the end time.

If a year is given and the end date and time is before the start date and time,
the range is invalid. If `YEAR_INFINITY` is used and the end date is before
the start date, the period goes across the beginning of the year.

**Example**

A time range of year with `startDay` = `{ year = 2020, month = 12, day = 24 }`,
`startTime` = `{15,0}`, `endDay` = `{ year = 2021, month = 1, day = 6 }`,
`endTime` = `{12,0}`, and `isInclusive` = `true` defines a period from the
24th of December 2020, 15:00:00, to the 6th of January 2021, 12:00:00.

!*/

rule_group TimeRangeOfYearRules
{
  /*!
  `isInclusive` within `TimeRangeOfYear`:

  The `isInclusive` values within the substructures shall be set to `true`.
  For example, `startDay.isInclusive` is always set to `true` within `TimeRangeOfYear`.
  !*/

  rule "core-bjx9ab";
  };

/** Defines a range of start and end tuples of dates and times. */
struct TimeRangeOfYear
{
  /** Start day. This day is included. */
  DayOfYear startDay;

  /** Start time. This time is included. */
  TimeOfDay startTime;

  /** End day. This day is included. */
  DayOfYear endDay;

  /** End time. This time is excluded. */
  TimeOfDay endTime;

  /**
   * If set to `true`, then the specified time range is valid.
   * If set to `false`, then the inverted time range is valid.
   */
  bool isInclusive;
};

/*!

### Days, Weeks, Months

Conditions can be defined for specific days in a week, month, or year.

!*/

/**
  * Days of week.
  * Specifies for each day of a week if the attribute is valid. Multiple days
  * can be selected at the same time.
  */
struct DaysOfWeek
{
  /** Sunday. */
  bool isSunday;

  /** Monday. */
  bool isMonday;

  /** Tuesday. */
  bool isTuesday;

  /** Wednesday. */
  bool isWednesday;

  /** Thursday. */
  bool isThursday;

  /** Friday. */
  bool isFriday;

  /** Saturday. */
  bool isSaturday;

  /**
   * If set to `true`, then the specified days of the week are valid.
   * If set to `false`, then the remaining days of the week are valid.
   */
  bool isInclusive;
};

/**
  * Days of month.
  * Specifies for each day of a month if the attribute is valid. Multiple days
  * can be selected at the same time.
  */
struct DaysOfMonth
{
  /** 1st day of month. */
  bool isDay1;

  /** 2nd day of month. */
  bool isDay2;

  /** 3rd day of month. */
  bool isDay3;

  /** 4th day of month. */
  bool isDay4;

  /** 5th day of month. */
  bool isDay5;

  /** 6th day of month. */
  bool isDay6;

  /** 7th day of month. */
  bool isDay7;

  /** 8th day of month. */
  bool isDay8;

  /** 9th day of month. */
  bool isDay9;

  /** 10th day of month. */
  bool isDay10;

  /** 11th day of month. */
  bool isDay11;

  /** 12th day of month. */
  bool isDay12;

  /** 13th day of month. */
  bool isDay13;

  /** 14th day of month. */
  bool isDay14;

  /** 15th day of month. */
  bool isDay15;

  /** 16th day of month. */
  bool isDay16;

  /** 17th day of month. */
  bool isDay17;

  /** 18th day of month. */
  bool isDay18;

  /** 19th day of month. */
  bool isDay19;

  /** 20th day of month. */
  bool isDay20;

  /** 21st day of month. */
  bool isDay21;

  /** 22nd day of month. */
  bool isDay22;

  /** 23rd day of month. */
  bool isDay23;

  /** 24th day of month. */
  bool isDay24;

  /** 25th day of month. */
  bool isDay25;

  /** 26th day of month. */
  bool isDay26;

  /** 27th day of month. */
  bool isDay27;

  /** 28th day of month. */
  bool isDay28;

  /** 29th day of month. */
  bool isDay29;

  /** 30th day of month. */
  bool isDay30;

  /** 31st day of month. */
  bool isDay31;

  /**
    * If set to `true`, then the specified days of the month are valid.
    * If set to `false`, then the remaining days of the month are valid.
    */
  bool isInclusive;
};

/** Day of year.
  * Defines one day in the year by selecting a month and a day.
  */
struct DayOfYear
{
  /**
    * Defines the year.
    * If set to `YEAR_INFINITY`, then the condition is valid  each year.
    */
  Year year;

  /** Defines the month of the given year. */
  MonthOfYear month;

  /** Defines the day of the given month. */
  DayOfMonth day;

  /**
   * If set to `true`, then the specified days of the month are valid.
   * If set to `false`, then the remaining days of the month are valid.
   */
  bool isInclusive;
};

/**
 * Defines a month of the year in numerical values. Valid values are 1 to 12.
 * 0 is used for durations where months are not applicable.
 */
subtype bit:4 MonthOfYear;

/**
 * Defines a single day within a month. Valid values are 1 to 31.
 * Further validity depends on the month, for example, there is no 31st in June.
 */
subtype bit:5 DayOfMonth;

/** Months of year.
  * Specifies one or multiple months of the year.
  */
struct MonthsOfYear
{
  /** January. */
  bool january;

  /** February. */
  bool february;

  /** March. */
  bool march;

  /** April. */
  bool april;

  /** May. */
  bool may;

  /** June. */
  bool june;

  /** July. */
  bool july;

  /** August. */
  bool august;

  /** September. */
  bool september;

  /** October. */
  bool october;

  /** November. */
  bool november;

  /** December. */
  bool december;

  /**
    * If set to `true`, then the specified months are valid.
    * If set to `false`, then the remaining months are valid.
    */
  bool isInclusive;
};

/*!

Conditions can be defined for a specific week in a month, which can be counted
in forward or backward direction. Each week of a month starts on a Monday.

The first week of a month is the week that contains the first Thursday of that
month. Example: If a Friday is the first day of a month, then the first week of
that month starts on the following Monday. The first Friday, Saturday, and
Sunday belong to the last week of the previous month.

The last week of a month is the week that contains the last Thursday of that
month. Example: If a Wednesday is the last day of a month, then the last week
ends on the Sunday before that Wednesday. The last Monday, Tuesday, and
Wednesday of that month belong to the first week of the following month.

The weeks that belong to a month are numbered consecutively. If
`countBackwardWeekInMonth` is set to `false`, then the weeks are counted in
forward direction. For example, `nThWeekInMonth` = 0 applies to the first week
and `nThWeekInMonth` = 4 applies to the last week. If `countBackwardWeekInMonth`
is set to `true`, then the numbering is inverted.

**Examples from the year 2023**

In February, the first day of the month is a Wednesday. Because that week
contains the first Thursday of the month, the first week of February starts on
January 30. Because the month ends on a Tuesday, the last week of February ends
on February 26. February 27 and 28 belong to the first week of March.

![Week in month example February 2023](assets/week_in_month_example_feb.png)

In September, the first day of the month is a Friday. Because that week does not
contain the first Thursday of the month, the first week of September starts on
September 4. Because the month ends on a Saturday, the last week of September
ends on October 1.

![Week in month example September 2023](assets/week_in_month_example_sep.png)

!*/

/** Week in month.
  * Specifies a week in a month. Each week starts on a Monday. The first week
  * of a month is the one whose Thursday is the first Thursday in that month.
  * The weeks in a month can be counted forwards or backwards.
  */
struct WeekInMonth
{
  /**
   * If set to `true`, then the weeks are counted backwards.
   * If set to `false`, then the weeks are counted forwards.
   */
  bool countBackwardWeekInMonth;

  /**
   * The ordinal number of the given week in a month counted forwards
   * or backwards. The first week of a month has the ordinal number 0.
   */
  bit:3 nThWeekInMonth;
};

/** Weekday in month.
  * Specifies a weekday in a month counted in forward or backward direction.
  * Examples: 3rd Wednesday of the month or 2nd-last Tuesday of the month.
  * The first week of a month has the ordinal number 0.
 */
struct WeekdayInMonth
{
  /**
    * Defines a day of the week, starting with Sunday. Valid values are from
    * 0 to 6.
    */
  bit:4 dayOfWeek : dayOfWeek <= 6;

  /**
    * If set to `true`, then the weekdays are counted backwards.
    * If set to `false`, then the weekdays are counted forwards.
    */
  bool countBackwardWeekdayInMonth;

  /** Counts the number of the given weekday in a month. */
  bit:3 nThWeekdayInMonth;
};


/** Calendar week.
  * Specifies a calendar weekday according to ISO 8601. Each calendar week
  * starts on a Monday. Calendar week one is the week with the year's first
  * Thursday. The value zero is not valid.
  */
struct CalendarWeek
{
  bit:6 week : week > 0 && week <= 53;
};

/** Odd or even days.
  * Specifies if a certain restriction applies on odd days only or on even days
  * only.
  *
  * If set to `true`, then the condition applies on odd days only.
  * If set to `false`, then the condition applies on even days only.
  */
subtype bool OddOrEvenDays;

/*!

### Time Duration

The time duration conditions specify for how long something is
valid, for example, a vignette.

**Example:**

- 10 days duration: `TimeDuration` { `days` = 10, `months` = 0, `years` = 0 }
- 1 year duration: `TimeDuration` { `days` = 0, `month` = 0, `years` = 1 }
- 1.5 hours duration: `TimeDurationHours`{ `hours` = 1, `minutes` = 30 }

!*/

/** Time duration in years, months, and days. */
struct TimeDuration
{
  /** Up to 30 days. If more days are needed, use months. */
  uint8 days : days <= 30;

  /**
   * Up to 12 months, assuming months with 30 days.
   * If more months are needed, use years.
   */
  uint8 months : months <= 12;

  /** Is valid for this number of years. */
  uint8 years;
};

/** Time duration in hours and minutes to describe validities. */
struct TimeDurationHours
{
  /** Time duration in hours. */
  uint8 hours;

  /** Time duration in minutes. */
  uint8 minutes : minutes < 60;
};

/*!

### Fuzzy Time Domain

A time domain that is not controlled by dates but by certain events that
are hard to grasp, therefore fuzzy.
These events are either well known to the public or observable by signs or other
means.

!*/

/** Supported values for the fuzzy time condition. */
enum uint8 FuzzyTimeDomain
{
    /**
     * Period controlled by an external device.
     * Example 1: Devices in the Korean city of Kwatchen that use digital
     * signs to control flow of traffic.
     * Example 2: Ramps that regulate access by means centralized traffic
     * control in the US.
     */
    EXTERNAL,

    /** Time that marks the beginning of twilight before sunrise. Lasts until sunrise. */
    DAWN,

    /** Time that marks the beginning of twilight after sunset. Lasts until night. */
    DUSK,

    /** Any school period (date and hour) */
    SCHOOL,

    /** Holiday period. */
    HOLIDAY,

    /** Winter. */
    WINTER,

    /** Spring. */
    SPRING,

    /** Summer. */
    SUMMER,

    /** Autumn.*/
    AUTUMN,

    /** Time when water rises to its highest level. */
    HIGH_TIDE,

    /** Time when water stops falling. */
    LOW_TIDE,

    /** Water height above average. */
    HIGH_WATER,

    /** Water height below average. */
    LOW_WATER,

    /** Rainy season. */
    WET,

    /** Dry season. */
    DRY,

    /**
     * Peak hours include rush hour and activity-based or scheduled-event-based
     * times. These times vary by location and by season. Peak hours apply to
     * road networks as well as ferries.
     * Example 1: Activities like shopping, beach going, and skiing.
     * Example 2: Scheduled events like parades, sporting events, concerts, or
     * conventions.
     */
    PEAK_HOURS,

    /** Opposite to peak hours. */
    OFF_PEAK_HOURS,

    /** Morning. */
    MORNING ,

    /** Time of high traffic during the evening. */
    EVENING_RUSH_HOUR ,

    /** Time of high traffic during the morning. */
    MORNING_RUSH_HOUR ,

    /** The opposite of NIGHT. */
    DAY ,

    /** Night begins 30 minutes after sunset and ends 30 minutes before sunrise.
     *  Local deviations are possible.
     */
    NIGHT ,

    /** Time outside regular school hours. */
    NON_SCHOOL_HOURS ,

    /** Time during regular school hours. */
    SCHOOL_HOURS ,

    /** When children are present. */
    WHEN_CHILDREN_ARE_PRESENT ,

    /** Time from sunrise to sunset. */
    SUNRISE_TILL_SUNSET ,

    /** Time from sunset to sunrise. */
    SUNSET_TILL_SUNRISE ,

    /** Afternoon. */
    AFTERNOON ,

    /** Time during a certain (unspecified) event. */
    EVENT ,

    /** Time when there is a market. */
    MARKET_HOURS ,

    /** Undefined occasion. */
    UNDEFINED_OCCASION ,

    /** Time during race days. */
    RACE_DAYS ,

    /** Time during high pollution. */
    POLLUTION ,

    /** Evening. */
    EVENING ,

    /** Business hours. */
    BUSINESS_HOURS ,

    /** Time during ski season. */
    SKI_SEASON ,

    /** Time during tourist season. */
    TOURIST_SEASON ,

    /** Time during church hours. */
    CHURCH_HOURS ,

    /** Time during summer school. */
    SUMMER_SCHOOL ,

    /** When there is a funeral ongoing. */
    FUNERAL ,

    /** Hunting season. */
    HUNTING_SEASON ,

    /** Time during military exercise. */
    MILITARY_EXERCISE,
};

/** Values for the fuzzy time condition with inclusive/exclusive indicator. */
struct FuzzyTimeDomainCondition
{
    /** Defines a fuzzy time condition. */
    FuzzyTimeDomain fuzzyTime;

    /**
      * If set to `true`, then the specified fuzzy time value is valid.
      * If set to `false`, then the opposite value is valid.
      */
    bool isInclusive;
};

/*!

## Environmental Conditions

!*/

/** Weather-related condition. */
struct WeatherCondition
{
  /** Weather. */
  Weather weather;

  /**
    * If set to `true`, then the specified weather condition is valid.
    * If set to `false`, then the specified weather condition is absent. */
  bool isInclusive;
};

/** Indicator of the weather condition. */
enum uint8 Weather
{
    SNOW,
    RAIN,
    SUNSHINE,
    FOG,
    THAW,
    STRONG_WIND,
    AVALANCHE,
    /** Value can be assigned to features that are weather independent. */
    INDEPENDENT,
    ICE
};

/** Road visibility conditions.
  * Define the visibility on the road in predefined ranges of meters.
  */
enum uint8 Visibility
{
  /** Clear visibility. */
  CLEAR,

  /** Visibility is less than 5 meters. */
  LESS_THAN_5M,

  /** Visibility is less than 25 meters. */
  LESS_THAN_25M,

  /** Visibility is less than 50 meters. */
  LESS_THAN_50M,

  /** Visibility is less than 100 meters. */
  LESS_THAN_100M,
};

/** Road or lane surface conditions. */
enum uint8 Surface
{
    /** Road surface is clear. */
    CLEAR,

    /** Road surface is covered with snow. */
    SNOW_COVERED,

    /** Road surface is covered with a solid layer of ice. */
    ICE,

    /** Road surface is covered with rain. */
    RAIN_COVERED,

    /** Hazardous road surface conditions. */
    HAZARDOUS,

    /** Road surface is flooded. */
    FLOODING,

    /** Risk of aquaplaning. */
    AQUAPLANING,

    /** Hazards because of water on the road surface. */
    SURFACE_WATER_HAZARD,

    /** Road is slippery. */
    SLIPPERY_ROAD,

    /** Road surface is covered with mud. */
    MUD_ON_ROAD,

    /** Road surface is covered with gravel or stone fragments. */
    LOOSE_CHIPPINGS,

    /** Road surface is covered with oil. */
    OIL_ON_ROAD,

    /** Road surface is covered with petrol. */
    PETROL_ON_ROAD,

    /** Road surface is covered with black ice, that is, a thin and transparent layer of ice. */
    BLACK_ICE,

    /** Snow drifts are present on the road. */
    SNOW_DRIFTS,

    /** Icy patches on the road surface. */
    ICY_PATCHES,

    /** Objects on the road surface. */
    OBJECTS_ON_ROAD,

    /** Shed loads on the road surface, that is, one or more vehicles have lost their load. */
    SHED_LOADS,

    /** Fallen trees lie on the road. */
    FALLEN_TREES,

    /** An avalanche is going down or went down and is covering the road. */
    AVALANCHES,

    /** Rocks are falling or have fallen and are covering the road. */
    ROCKS,

    /** A landslide is going down or went down and is covering the road. */
    LANDSLIPS,

    /** Animals are present on the road. */
    ANIMALS_ON_ROAD,

    /** People are present on the road. */
    PEOPLE_ON_ROAD,

    /** Children are present on the road. */
    CHILDREN_ON_ROAD,

    /** Cyclists are present on the road. */
    CYCLISTS_ON_ROAD,

    /** Large animals are present on the road. */
    LARGE_ANIMALS_ON_ROAD,

    /** A herd of animals is present on the road. */
    HERD_OF_ANIMALS_ON_ROAD,

    /** Stone-throwing people are present along the road. */
    STONE_THROWING_PERSONS,

    /** Broken down vehicles are present on the road. */
    BROKEN_DOWN_VEHICLES,
};


/*!

## Vehicle-Specific Conditions

Conditions can be assigned to specific groups of vehicles or vehicles with
specific properties or types of equipment.

!*/

/** Frequently used vehicle types.
  * This condition applies to vehicle types that are presumed to be the most
  * frequently used types in a map.
  */
struct FrequentlyUsedVehicleTypesCondition
{
  /** Frequently used vehicle types. */
  FrequentlyUsedVehicleTypes vehicleTypes;

  /**
   * If set to `true`, then the condition is valid for all specified vehicle types.
   * If set to `false`, then the condition is valid for all vehicles types
   * except the specified ones.
   */
  bool isInclusive;
};

/** Slow road users.
  * This condition applies to non-motorized road users or road users with a
  * low-power engine or low maximum speed.
  */
struct SlowRoadUsersCondition
{
  /** Slow road user types. */
  SlowRoadUserTypes slowRoadUsers;

  /**
   * If set to `true`, then the condition is valid for all specified vehicle types.
   * If set to `false`, then the condition is valid for all vehicles types
   * except the specified ones.
   */
  bool isInclusive;
};

/** Big vehicles.
  * This condition applies to trucks, buses, and other big vehicles.
  */
struct BigVehiclesCondition
{
    /** Big vehicle types. */
    BigVehicleTypes bigVehicles;

  /**
   * If set to `true`, then the condition is valid for all specified vehicle types.
   * If set to `false`, then the condition is valid for all vehicles types
   * except the specified ones.
   */
  bool isInclusive;
};

/** Public service vehicles.
  * This condition applies to vehicle types for public service vehicles.
  */
struct PublicServiceVehiclesCondition
{
  /** Public service vehicle types. */
  PublicServiceVehicleTypes vehicles;

  /**
   * If set to `true`, then the condition is valid for all specified vehicle types.
   * If set to `false`, then the condition is valid for all vehicles types
   * except the specified ones.
   */
  bool isInclusive;
};

/** Emergency and military vehicle detail types.
  * This condition applies to special vehicles for emergency or military.
  */
struct EmergencyMilitaryDetailCondition
{
  /** Emergency and military vehicle detail types. */
  EmergencyMilitaryDetailTypes vehicles;

  /**
  * If set to `true`, then the condition is valid for all specified vehicle types.
  * If set to `false`, then the condition is valid for all vehicles types
  * except the specified ones.
  */
  bool isInclusive;
};

/** Equipment.
  * This condition evaluates extra equipment that is necessary on a vehicle.
  */
struct EquipmentCondition
{
  /** Equipment of a vehicle. */
  Equipment equipment;

  /**
   * If set to `true`, then the condition is valid for all specified vehicle types.
   * If set to `false`, then the condition is valid for all vehicles types
   * except the specified ones.
   */
  bool isInclusive;
};

/** Authorization.
  * This condition evaluates the authorization status of a vehicle.
  * Authorization is useful to express prohibitions.
  */
struct AuthorizationCondition
{
  /** Authorization definition for vehicles. */
  Authorization authorization;

  /**
   * If set to `true`, then the condition is valid for all specified authorized vehicle types.
   * If set to `false`, then the condition is valid for all vehicles types
   * except the specified ones.
   */
  bool isInclusive;
};

/** Vehicle load.
  * This condition evaluates vehicle load types.
  */
struct LoadCondition
{
  /** Load of the vehicle. */
  LoadType load;

  /**
   * If set to `true`, then the condition is valid for all specified load types.
   * If set to `false`, then the condition is valid for all load types
   * except the specified ones.
   */
  bool isInclusive;
};


/** Number of axles.
  * This condition provides a numerical value for the maximum number of axles
  * that is allowed.
  */
subtype uint8 NumAxles;


/** Occupancy.
  * Specifies conditions related to the occupancy of a vehicle, that is, the
  * number of persons in a vehicle.
  */
struct Occupancy
{
    /** Occupancy count of vehicles. */
    OccupancyCount occupancyCount;

    /**
     * If set to `true`, then the condition is valid for the specified occupancy count.
     * If set to `false`, then the condition is valid for any occupancy count except the specified one. */
    bool isInclusive;
};

/** Definition of occupancy count of vehicles. */
enum bit:3 OccupancyCount
{
    /** At least two persons are in the vehicle. */
    TWO_PERSONS,

    /** At least three persons are in the vehicle. */
    THREE_PERSONS,

    /** At least four persons are in the vehicle. */
    FOUR_PERSONS,

    /** At least five persons are in the vehicle. */
    FIVE_PERSONS,

    /** At least six persons are in the vehicle. */
    SIX_PERSONS,

    /** At least seven persons are in the vehicle. */
    SEVEN_PERSONS,

    /** At least eight persons are in the vehicle. */
    EIGHT_PERSONS,
};

/** Euro emission class of a vehicle's engine.
  * Set all bits in the mask to which the condition applies.
  */
subtype VehicleEuroEmissionClass EuroEmissionClassCondition;

rule_group NumTrailerRules
{
  /*!
  Usage Of `NUM_TRAILERS`:

  `NUM_TRAILERS` shall only be used in combination with the condition
  `EQUIPMENT.TRAILER.`
  !*/

  rule "core-3zyb0x";
};

/** Condition representing the number of trailers of a vehicle. */
struct NumTrailersCondition
{
  /** Number of trailers. */
  NumTrailers numTrailers;

  /**
    * If set to `true`, then the condition is valid for the specified number of
    * trailers and more. If set to `false`, then the condition is valid for less
    * trailers than the specified number.
    */
  bool isInclusive;
};

/** Condition for trailer lengths in centimeters. */
struct TrailerLengthMetricCondition
{
  /**
    * Number of the trailer the condition is valid for.
    * Counting starts at 0 for the first trailer.
    */
  bit:2 trailerNumber;

  /** Length of the trailer. */
  TrailerLengthMetric length;

  /**
    * If set to `true`, then the condition is valid for the minimum length of
    * the respective trailer. If set to `false`, then the condition is valid for
    * the maximum length of the respective trailer.
    */
  bool isInclusive;
};

/** Condition for trailer lengths in inches. */
struct TrailerLengthImperialCondition
{
  /**
    * Number of the trailer the condition is valid for.
    * Counting starts at 0 for the first trailer.
    */
  bit:2 trailerNumber;

  /** Length of the trailer. */
  TrailerLengthImperial length;

  /**
    * If set to `true`, then the condition is valid for the minimum length of
    * the respective trailer. If set to `false`, then the condition is valid for
    * the maximum length of the respective trailer.
    */
  bool isInclusive;
};

/** Condition describing the energy type of the vehicle's engine. */
struct EnergyTypeCondition
{
  /** The energy type of the engine. */
  EnergyType energyType;

  /**
   * If set to `true`, then the condition is valid for all specified energy types.
   * If set to `false`, then the condition is valid for all energy types
   * except the specified ones.
   */
  bool isInclusive;
};

/**
  * Condition for vehicles with braked trailers.
  * If set to `true`, then the condition is valid for vehicles equipped with
  * braked trailers. If set to `false`, then the condition is valid for vehicles
  * equipped with unbraked trailers.
  */
subtype bool BrakedTrailer;

/** Condition describing public bus types in more detail. */
struct PublicBusTypeCondition
{
  /** Type of public bus. */
  PublicBusType type;

  /**
   * If set to `true`, then the condition is valid for all specified public bus
   * types. If set to `false`, then the condition is valid for all public bus
   * types except the specified ones.
   */
  bool isInclusive;
};
