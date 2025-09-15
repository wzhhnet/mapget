/*!

# Characteristics Types

This package defines the types that are used by characteristics
attributes.

**Dependencies**

!*/

package characteristics.types;

import core.types.*;
import core.location.*;
import core.attributemap.*;
import core.properties.*;
import road.reference.types.*;
import lane.reference.types.*;

/*!

## Superelevation Class

The superelevation class describes the average superelevation over all lanes in
the same travel direction. These classes are based on the elevation angle
towards the curb and towards the middle of the road.

Superelevation can be used to predict useful driving speeds in curves.

The superelevation class does not describe the superelevation of individual
lanes. The superelevation of individual lanes is calculated from the geometry of
the lane borders, if they are available.

!*/

rule_group SuperelevationRules
{
  /*!
  Superelevation Class for Single Lanes:

  Superelevation for single lanes shall not be stored using
  `SuperElevationClass`. If lane border geometries are available, then
  superelevation of individual lanes shall be
  calculated from these geometries.
  !*/

  rule "characteristics-27tfrn";
};

/** Average superelevation over all lanes in the same travel direction. */
enum uint8 SuperElevationClass
{
    /**
      * The road is flat or almost flat. Superelevation is between 4 degrees
      * towards the curb and 4 degrees towards the middle of the road.
      */
    FLAT = 0,

    /**
      * Superelevation is more than 4 degrees towards the curb and
      * less than or equal to 6 degrees towards the middle of the road.
      */
    MORE_THAN_4_TOWARDS_CURB = 1,

    /**
      * Superelevation is more than 6 degrees towards the curb and
      * less than or equal to 8 degrees towards the middle of the road.
      */
    MORE_THAN_6_TOWARDS_CURB = 2,

    /**
      * Superelevation is more than 8 degrees towards the curb.
      */
    MORE_THAN_8_TOWARDS_CURB = 3,

    /**
      * Superelevation is more than 4 degrees towards the middle of the road
      * and less than or equal to 6 degrees towards the curb.
      */
    MORE_THAN_4_TOWARDS_MIDDLE = 4,

    /**
      * Superelevation is more than 6 degrees towards the middle of the road
      * and less than or equal to 8 degrees towards the curb.
      */
    MORE_THAN_6_TOWARDS_MIDDLE = 5,

    /**
      * Superelevation is more than 8 degrees towards the middle of the road.
      */
    MORE_THAN_8_TOWARDS_MIDDLE = 6
};

/*!

## Road Median

A road median is the area between two parallel lanes or roads if there is no
solid barrier between the lanes or roads. The two lanes or roads can have the
same travel direction or opposite travel directions.

The digitization direction determines on which side of the road or lane the road
median is located. If the attribute is assigned in positive digitization direction,
then the road median is located on the right side of the road or lane.
Likewise, if the attribute is assigned in negative digitization direction,
then the road median is located on the left side of the road or lane.

!*/

/** Area between two roads or lanes if there is no solid barrier. */
struct RoadMedian
{
    /** Width of the road median in decimeters. */
    varuint16 width;

    /** Shape of the road median. */
    RoadMedianShape shape;

    /** Surface of the road median. */
    RoadMedianSurface surface;
};

/** Shape of the road median. */
enum uint8 RoadMedianShape
{
    /** Road median is on one level. */
    FLAT = 0,

    /**
      * Road median contains a berm, for example, a raised bank, terrace, or
      * ridge.
      */
    BERM = 1,

    /** Road median contains a ditch. */
    DITCH = 2
};

/** Surface of the road median. */
enum uint8 RoadMedianSurface
{
    /** Surface of the road median is paved. */
    PAVED = 0,

    /** Surface of the road median is not paved. */
    UNPAVED = 1
};

/*!

## Multi-digitized Road

If a road has two sides that are separated by a physical divider, it can be
digitized as two separate roads. NDS.Live provides the road character `MULTI_DIGITIZED`
and `MULTI_DIGITIZED_ROAD_REFERENCE` to flag roads that are multi-digitized and
belong together.

All roads that are part of a multi-digitized road are assigned the road character type
`MULTI_DIGITIZED` in the `ROAD_TYPE` attribute.

To indicate that two separately digitized roads belong to the same
multi-digitized road, the attribute `MULTI_DIGITIZED_ROAD_REFERENCE` can be used
as follows:

- At the start or end of a multi-digitized road, `MULTI_DIGITIZED_ROAD_REFERENCE`
is assigned to the separately digitized road that is incoming to the
corresponding intersection. `multiDigitizedRoadReference` points to the
counterpart road that is outgoing from the same intersection.
- At complex intersections, `MULTI_DIGITIZED_ROAD_REFERENCE` is assigned to the
incoming roads only. `multiDigitizedRoadReference` points to the outgoing
counterpart of an incoming road, where the counterpart is the road in the opposite
travel direction. Outgoing roads do not require references to other parts of a
multi-digitized road because they are no starting point of guidance announcements.

The following figure illustrates how multi-digitized roads are modeled.
The incoming road to the simple intersection on the left as well as the
incoming roads to the complex intersections have a reference to their outgoing
counterparts. Roads 12 and 21 both have a reference to each other because they
are incoming roads to different complex intersections.

![Multi-digitized Roads](assets/multi-digitized-roads.png)

!*/

rule_group MultiDigitizedRoadRules
{
  /*!
  Multi-digitized Counterpart in Another Tile:

  If the counterpart of a multi-digitized road is located in another tile, then
  the indirect reference shall be used, that is,
  `MultiDigitizedRoadReference.isDirectReference` shall be set to `false`.
  !*/

  rule "characteristics-8xrqb5";

  /*!
  Indirect Referencing of Multi-digitized Roads:

  If the `ROAD_TYPE` attribute that is set to `MULTI_DIGITIZED` is assigned
  with an indirect reference and
  `MULTI_DIGITIZED_ROAD_REFERENCE` is used, then the counterpart shall also be
  referenced using indirect references, that is,
  `MultiDigitizedRoadReference.isDirectReference` shall be set to `false`.
  !*/

  rule "characteristics-h7gc9e";
};

/**
  * References the counterpart of a road if two separately digitized roads belong
  * to the same multi-digitized road.
  */
struct MultiDigitizedRoadReference
{
  /**
    * Indicates if the reference is direct using an ID or indirect, for example,
    * to another tile.
    */
  bool isDirectReference;

  /** Direct reference to the multi-digitized counterpart in the same tile. */
  RoadReference counterpartReference if isDirectReference;

  /** Indirect reference to the multi-digitized counterpart in an adjacent tile. */
  RoadReferenceIndirect counterpartReferenceIndirect if !isDirectReference;
};

/*!

## Multi-digitized Roads Represented as Lane Groups

A multi-digitized road can be represented as lane groups.

NDS.Live provides the attributes `MULTI_DIGITIZED` and
`MULTI_DIGITIZED_LANE_GROUP_REFERENCE` to indicate that lane groups
representing a multi-digitized road belong together.
The main use case is to prevent applications from accidentally making U-turns
onto the same road.

All lanes that are part of a lane group representing a multi-digitized road are
assigned the road type `MULTI_DIGITIZED` in the lane range attribute `LANE_TYPE`.

The attribute `MULTI_DIGITIZED_LANE_GROUP_REFERENCE` can be used to indicate
that lane groups and their counterparts belong to the same multi-digitized road.
`multiDigitizedLaneGroupReference` points to the corresponding counterpart lane
group. The attribute is assigned to road lane groups of a multi-digitized road
are directly connected to intersection lane groups, artificial intersection lane
groups, fork lane groups, or border lane groups.

The attribute `MULTI_DIGITIZED_LANE_GROUP_REFERENCE` can be assigned to road
lane groups that are connected to one of the following:

- Intersection lane groups or artificial intersection lane groups.
- Fork lane groups: If an intersection has a bypass road, the road lane
  group of the multi-digitized road is connected to a fork lane group.
- Border lane groups: If an intersection is located on the tile border, there is
  a border lane group between the intersection lane group and the road lane group.

The following figure illustrates how multi-digitized roads represented
by lane groups are modeled.

![Multi-digitized roads using lane groups ](assets/multi-digitized-lane-groups.png)

!*/

rule_group MultiDigitizedRoadRepresentedByLaneGroupRules
{
  /*!
  Multi-digitized Counterpart of a Lane Group in Another Tile:

  If the counterpart of a multi-digitized road that is represented by lane groups
  is located in another tile, then the indirect reference shall be used, that is,
  `MultiDigitizedLaneGroupReference.isDirectReference` shall be set to `false`.
  !*/

  rule "characteristics-cnvn2x-I";

  /*!
  Indirect Referencing of Multi-digitized Roads Represented by Lane Groups:

  If the `ROAD_TYPE` attribute that is set to `MULTI_DIGITIZED` is assigned
  with an indirect reference and
  `MULTI_DIGITIZED_LANE_GROUP_REFERENCE` is used, then the counterpart shall also be
  referenced using indirect references, that is,
  `MultiDigitizedLaneGroupReference.isDirectReference` shall be set to `false`.
  !*/

  rule "characteristics-xpo0fu";
};

/**
  * References the counterpart of a lane group if two separately digitized lane
  * groups belong to the same multi-digitized road.
  */
struct MultiDigitizedLaneGroupReference
{
  /**
    * Indicates if the reference is direct using an ID or indirect, for example,
    * to another tile.
    */
  bool isDirectReference;

  /** Direct reference to the multi-digitized counterpart in the same tile. */
  LaneGroupId counterpartReference if isDirectReference;

  /** Indirect reference to the multi-digitized counterpart in an adjacent tile. */
  LaneGroupReferenceIndirect counterpartReferenceIndirect if !isDirectReference;
};

/*!

## Simple Lane Information

For use cases where the lane model from the Lane module is too detailed, simplified
information can be attached to a road.

If the number of lanes is assigned with a directed reference, only the number
of lanes in the described direction is stored. If the number of lanes is
assigned with an undirected reference, the total number of lanes is stored
without indicating how many of them go in which direction.

!*/

/** Number of drivable lanes on a road. */
subtype varuint16 NumLanes;

/*!

## Complex Intersection Type

A complex intersection is composed of multiple roads or lane groups
that are handled as one real-world intersection.

All roads or lane groups that belong to the same complex intersection
have assigned a the road characteristic `COMPLEX_INTERSECTION`. Details about
the type of complex intersection can be provided using the road or lane attribute
`COMPLEX_INTERSECTION_TYPE`.

In between two complex intersections there usually is at least one road or
lane group that does not have the complex intersection road character assigned.
This way an application can determine all roads or lane groups that belong to a complex
intersection by following the topology up to the first road or lane group
that does not have the complex intersection road character assigned.

The following figures shows examples of each complex intersection type.

**Standard complex intersection**: This figure shows a complex
intersection between multi-digitized roads as well as a roundabout with
multi-digitized roads. Parts of the incoming and outgoing roads are marked as
part of the standard complex intersection using validity ranges.

![Standard Complex Intersection](assets/characteristics-standard-complex-intersection.png)

**Controlled-access intersection**: This figure shows an interchange
that uses grade separation to enable changing between motorways.

![Controlled-Access Intersection](assets/characteristics-controlled-access-intersection.png)

**Combined intersection**: This figure shows a complex intersection between a
motorway and a highway where parts are marked as a controlled-access intersection
and other parts are marked as a combined intersection.

![Combined Intersection](assets/characteristics-combined-intersection.png)

A complex intersection that contains parts marked as combined intersection can
be used to provide guidance on different levels of detail. For example, an application
can use `CONTROLLED_ACCESS_INTERSECTION` on the motorway to provide a single
guidance advice across the whole intersection in a guidance overview.
Each combined intersection is part of the controlled-access intersection
and additionally forms a separate standard complex intersection. The application
can provide detailed guidance advice when driving through the separate complex
intersection on the highway.

!*/

/** Complex intersection type. */
enum bit:2 ComplexIntersectionType
{
  /** Standard complex intersection. */
  STANDARD_INTERSECTION,

  /** Controlled-access intersection. */
  CONTROLLED_ACCESS_INTERSECTION,

  /**
    * Complex intersection is both, a standard complex intersection and a
    * controlled-access intersection.
    */
  COMBINED_INTERSECTION,
};

/*!

## Road Location Assignment to Roads and Lanes

Road locations can be assigned to roads or lanes using the location ID and
indicating whether the road location has the same digitization direction as the
road or lane group that it is assigned to.
Additionally, it is indicated whether this assignment applies to the complete
road location or only to a part of this location.

The digitization direction of a road location depends on the digitization direction
of the feature it is assigned to and the value of `sameDirectionAsSource`:

- Road location is assigned to a road feature: If `sameDirectionAsSource` is
  set to `true`, then the digitization direction of the road location is equal to
  the digitization direction of the road.

- Road location is assigned to a complete road lane group or artificial road
  lane group, that is, `LaneGroupRangeValidity.completeGroup` is set to `true`:
  If `sameDirectionAsSource`is set to `true`, then the digitization direction of
  the road location is equal to the digitization direction of the lane group.

- Road location is assigned to a part of a road lane group, artificial road
  lane group, intersection lane group, or artificial intersection lane group,
  that is, `LaneGroupRangeValidity.completeGroup` is set to `false`: If
  `sameDirectionAsSource` is set to `true`, then the the digitization direction
  of the road location is equal to the digitization direction of the lanes
  defined by the lane group range validity.
  If the lanes have different digitization directions, multiple `ROAD_LOCATION_ID`
  attributes are required.

- Road location is assigned to a complete intersection lane group or artificial
  intersection lane group and the road location does not include information
  about the individual lanes inside the intersection, that is,
  `LaneGroupRangeValidity.completeGroup` is set to `true`:
  `sameDirectionAsSource` has no meaning and should always be set
  to `true`. `startOnLocation` and `endOnLocation` still need to be set to
  indicate which part of the road location corresponds to the intersection.
  Note that in this case there might be overlapping road locations in the
  intersection lane group.


!*/

/** Assignment of a road location to roads and lanes. */
struct RoadLocationAssignment
{
  /** Identifier of the road location. */
  RoadLocationId locationId;

  /**
    * Indicates if road location has the same digitization direction as
    * the feature that it is assigned to.
    */
  bool sameDirectionAsSource;

  /**
    * Set to `true` if the complete road location fits into the assignment. If
    * only a part of the road location is assigned, then start and end on the
    * location have to be provided.
    */
  bool completeLocation;

  /** Position where the road or lane group starts on the road location. */
  LengthCentimeters startOnLocation if !completeLocation;

  /** Position where the road or lane group ends on the road location. */
  LengthCentimeters endOnLocation if !completeLocation
                                  : endOnLocation >= startOnLocation;
};

/*!

## Toll Stations

Toll roads and toll stations can be modeled as attributes on roads, lanes, or
display lines.

The `STATION` attribute is assigned to the position where the toll station is
located. On lane level, this indicates the position of an individual toll booth.
Attribute properties from the Core module or the Characteristics module are used
to provide detailed information about the available toll payment types and to
indicate whether vehicles have to stop at the toll station or toll both.

The widened area before or after a toll station where no line markings are
available, is indicated using the `ROAD_TYPE` attribute set to the `STATION_PLAZA`
characteristic. Optionally, the `STATION_PLAZA_TYPE` attribute can be added to
indicate whether the plaza serves as entry or exit of a toll station, or as both.
To indicate that toll applies to a road, lane, or display line, the `ROAD_TYPE`
attribute can be assigned and set to the `TOLL_ROAD` characteristic.

The following figure shows how toll attributes are assigned at lane level.
For each lane, the `STATION` attribute includes information about the toll payment
type and the corresponding station stop type.

![Toll attributes on lanes](assets/characteristics-toll-lane-based.png)

The following figure shows the same scenario at road level. The toll payment type
now includes all available options at the toll station. No station stop type
is indicated because it is not the same for all toll booths at the toll station.
The total number of toll booths is indicated using the `STATION_TOLL_BOOTHS`
attribute property.

![Toll attributes on a road](assets/characteristics-toll-road-based.png)

!*/

/** Stationary object on a lane, for example, a military checkpoint or a toll station. */
enum uint8 StationaryObjectType
{
    /**
      * Official checkpoint, for example, by police, military, or local
      * administration.
      */
    CHECKPOINT = 0,

    /** Toll station. */
    TOLL_STATION = 1,

    /** Porter, for example, at the entrance of a guarded area. */
    PORTER = 2
};

/**
  * Type of station plaza. Defines whether a station plaza serves as an entry or as
  * an exit of a station or both.
  */
enum uint8 StationPlazaType
{
    /**
      * Station plaza is used as entry and exit of a station and opposing traffic
      * is expected.
      */
    ENTRY_AND_EXIT = 0,

    /** Station plaza is used as entry of a station. */
    ENTRY = 1,

    /** Station plaza is used as exit of a station. */
    EXIT = 2,
};

/** Indicates that a station is only temporarily in operation. */
subtype Flag StationTemporary;

/** Number of toll booths at a toll station. */
subtype uint8 StationTollBooths;

/*!

### Toll Costs

Toll costs are provided using the toll cost table. The toll cost table is stored
in a separate layer and uses globally unique toll station IDs to reference the
toll stations. The toll cost table contains entries for pairs of toll stations,
that is, the toll between a from-station and a to-station. For each entry, the
toll cost table includes the toll cost details and the conditions under which
the toll applies.

The toll cost can be different based on the path that is used to get from the
from-station to the to-station. Via-stations can be included to provide
different toll costs for the different paths.

When toll cost tables are provided using tiles, they only include from-stations
that are located within the same tile as the toll cost table itself. To-stations
can be located in other tiles. If the toll cost table is provided using a global
smart layer object, it can include from-stations and to-stations from a larger
area.

!*/

/** Toll cost table. */
struct TollCostTable
{
  /** Provider of the toll cost table. */
  string provider;

  /** List of toll cost entries. */
  TollCostTableEntry entries[];
};

/** Toll cost between from-station and to-station. */
struct TollCostTableEntry
{
  /** From-station, start of toll cost path. */
  TollStationId fromTollStation;

  /** To-station, end of toll cost path. */
  TollStationId toTollStation;

  /**
    * Via-stations. Can be used if there are multiple paths between from-station
    * and to-station that have different toll costs.
    */
  optional TollStationId viaTollStations[];

  /** Toll cost details. */
  TollCostDetails tollCostDetails;
};

/** Toll cost details including conditions and payment method. */
struct TollCostDetails
{
  /** Toll cost. Monetary amount using currency. */
  TollCost cost;

  /** List of conditions for the toll cost, for example, vehicle types. */
  optional ConditionList conditions;

  /**
    * Payment type. Can be used if different toll costs apply for different
    * payment methods. */
  optional TollPaymentMethod paymentMethod;
};

/** Global source ID of a toll station. */
subtype GlobalSourceId TollStationId;

/** Detailed information about a toll station. */
struct TollStationDetails
{
  /** Type of toll system that is used at the toll station. */
  TollSystemType tollSystem;

  /** Type of toll gate that is available at the toll station. */
  TollGateType tollGateType;
};

/** Type of toll system that is used at a toll station. */
enum bit:2 TollSystemType
{
  /** A fixed fee must be paid to use the road. */
  FIXED_FEE,

  /** Toll is calculated based on the distance traveled. */
  DISTANCE_BASED,
};


/** Type of toll gate that is available at a toll station. */
enum bit:6 TollGateType
{
  /** Toll plaza. May include multiple toll booths with barriers and overhead gantries. */
  TOLL_PLAZA,

  /** Toll station is an overhead gantry for electronic toll collection only. */
  OVERHEAD_ETC_ONLY,

  /** Toll is collected based on GPS data. */
  GPS_BASED,

  /** Toll station is purely virtual, there is no physical toll gate. */
  VIRTUAL_GATE,
};


/**
  * DEPRECATED.
  * Payment that can be made at a toll station. Applies to a single toll booth
  * if assigned to a lane.
  */
struct TollPayment
{
  /** Type of payment that is accepted at the toll station or toll booth. */
  TollPaymentType type;

  /**
    * Accepted payment providers for the type of payment, for example, a list of
    * accepted credit cards or subscriptions.
    */
  optional TollPaymentProvider provider[];
};

/** DEPRECATED. Available types of payment for toll stations. */
enum varuint16 TollPaymentType
{
  /**
    * Payment types can change based on dynamic information, for example, to
    * avoid long waiting times in front of particular toll lanes. The actual
    * payment type is shown on a variable sign similar to dynamic speed limits.
    */
  VARIABLE,

  /** Cash can be used including coins and bills. */
  CASH_COINS_AND_BILLS,

  /** Cash can be used, but bills only, for example, a 10 Euro bill. */
  CASH_BILLS_ONLY,

  /** Cash can be used, but coins only, for example, 20 Cents. */
  CASH_COINS_ONLY,

  /** Cash can be used, but the exact amount has to be provided. */
  CASH_EXACT_CHANGE,

  /** Credit cards are accepted. */
  CREDIT_CARD,

  /** Debit cards are accepted. */
  DEBIT_CARD,

  /** Travel cards are accepted. */
  TRAVEL_CARD,

  /** Electronic toll collect either via camera or via transponder. */
  ETC,

  /** Electronic toll collect via transponder. */
  ETC_TRANSPONDER,

  /** Electronic toll collect via camera. */
  ETC_VIDEO_CAMERA,

  /** Toll is collected based on subscription, for example, with an electronic purse. */
  SUBSCRIPTION,
};

/** DEPRECATED. Name or description of the toll payment provider. */
subtype string TollPaymentProvider;

/** Detailed information about the stop type for stations. */
enum bit:4 StationStopType
{
  /** Station can be passed with normal speed. No need to slow down or stop. */
  NO_STOP,

  /** Vehicles are required to slow down at the station. */
  SLOW_DOWN,

  /** Vehicles have to stop, for example, at a barrier. */
  STOP,
};


/** Defines the type of ticket handling at a toll station. */
enum bit:4 TollTicketHandling
{
  /**
    * Ticket is obtained at this toll station, for example, pulled from a machine.
    * Transaction at this toll station does not include payment.
    */
  OBTAIN_TICKET,

  /**
    * Ticket is paid at this toll station, for example, at the last
    * toll station in a distance-based toll scenario.
    */
  PAY_TICKET,

  /**
    * Ticket is validated at this toll station, for example, by stamping.
    * Transaction at this toll station does not include payment.
    */
  VALIDATE_TICKET,
};

/*!

## Divider Type

Dividers can exist between lanes or roads. Dividers can be physical objects
that cannot be crossed by vehicles or logical objects that vehicles are
not allowed to cross. For example, an application can use the divider type to
decide in an emergency whether an evasion manuever is possible.

The divider is located on the side of the road or lane that corresponds to the
direction of the road reference or the direction of the lane group range
validity, respectively:

- If set to `IN_POSITIVE_DIRECTION`, the divider is located to the right of the
  road or lane in digitization direction.
- If set to `IN_NEGATIVE_DIRECTION`, the divider is located to the left of the
  road or lane in digitization direction.
- If undirected or set to `IN_BOTH_DIRECTIONS`, there are dividers on both sides
  of the road or lane.

At lane level, the meaning of the `DIVIDER_TYPE` attribute is as follows:

- If `completeGroup` is set to `true` in the lane group range validity, then there
  is a divider on both curbs of the road lane group and there are no additional
  dividers between the lanes inside the lane group. The attribute cannot be
  assigned to complete intersection lane groups.
- If `completeGroup` is set to `false` in the lane group range validity,
  the lane mask in `numLanes` determines how many dividers there are.
  Each lane that is closest to a divider in the corresponding direction gets
  assigned the attribute. If the attribute is assigned to multiple lanes in a
  lane group, then there are multiple dividers.

!*/

/** Divider type when lanes or roads have a divider. */
enum uint8 DividerType
{
    /** Any kind of physical barrier that prevents a vehicle from crossing the divider. */
    HAS_DIVIDER = 0,

    /** A divider exists, but it is unknown whether it can be crossed physically. */
    UNKNOWN_DIVIDER_TYPE = 1,

    /** Legal divider that can be crossed physically, for example, by emergency vehicles. */
    LEGAL_DIVIDER = 2
};

/*!

## Stop Lines and Waiting Lines

Stop lines and waiting lines are transverse markings on a road surface that
indicate where an immediate action is required by the operator of a vehicle
in compliance with a traffic signal, sign, or similar.

Stop lines indicate at which position a vehicle is required to stop, for example,
in front of a traffic light. Stop lines are usually accompanied by stop signs or
traffic lights. The following figure shows a stop line before a traffic light
in Germany.

![Stop line before traffic light (Germany)](assets/characteristics_stop_line.jpg)

Waiting lines indicate a position where vehicles are required to slow down and
give way to other traffic. Waiting lines are also called yield lines
or give-way lines. Waiting lines are often accompanied by yield signs.

![Waiting lines in an intersection](assets/intersection_yield_lines.png)

Depending on local regulations, different rules apply how to act at stop lines
and waiting lines. Also, the lines can have different shapes, widths, or colors.
For example, waiting lines are painted using a shark's teeth pattern in some
countries or as double dashed lines in others.

!*/

/** Indicates the existence of a stop line. */
subtype Flag StopLine;

/** Indicates the existence of a waiting line. */
subtype Flag WaitingLine;

/*!

## Lane Width State

The lane width state is an indicator for the vehicle that the available width of
the lane could be different from the normal lane width:

- If set to `NOT_FULLY_FORMED`, the lane is narrower than the normal lane width
  because the lane merges into another lane or splits from another lane.
- If set to `OVERLAP_RIGHT`, `OVERLAP_LEFT`, or `OVERLAP_BOTH`, the lane has the
  normal lane width, but overlaps with one or two other lanes of a different
  type. The overlap refers to the digitization direction of the lane.
  For example, `OVERLAP_RIGHT` means that the lane overlaps in positive
  digitization direction with the adjacent lane on the right. The width of the
  lane types usually varies, for example, a normal lane can partially overlap
  with a bicycle suggestion lane, which is narrower than the normal lane.
  Overlapping lanes are classified as fully formed as long as they do not split
  or merge with other lanes.

The following figure shows merge and split scenarios where the forming or
merging lanes do not have the normal lane width. All lanes are digitized from
west to east. The lane ranges where the lanes are forming or merging, have
assigned the `LANE_WIDTH_STATE` attribute set to `NOT_FULLY_FORMED`.

![Lane width state of forming or merging
lanes](assets/characteristics_lane_width_state_forming.png)

The following figure shows a bicycle suggestion lane on a one-way road, which
shares space with the normal lane. If no bicycle is present, vehicles can use
the full width of the normal lane. Both lanes are contained in the same lane
group and all lanes are digitized from west to east. The bicycle lane overlaps
with the right side of the normal lane, which also extends to the curb. Both
lanes have assigned the `LANE_WIDTH_STATE` attribute. For the normal lane the
value is set to `OVERLAP_RIGHT`, and for the bicycle suggestion lane the value
is set to `OVERLAP_LEFT`. Both lanes have different lane widths and are
classified as fully formed, even if the part that exclusively belongs to the
normal lane is not wide enough for a vehicle.

![Lane width state of overlapping lanes](assets/characteristics_lane_width_state_overlap.png)

!*/

/**
  * Lane width state indicating that the available width can differ from the
  * normal lane width.
  */
enum uint8 LaneWidthState
{
  /** The lane is not fully formed, for example, it is still forming or it is merging. */
  NOT_FULLY_FORMED,

  /**
    * The lane is fully formed but overlaps with the adjacent lane on the right
    * in digitization direction of the lane.
    */
  OVERLAP_RIGHT,

  /**
    * The lane is fully formed but overlaps with the adjacent lane on the left
    * in digitization direction of the lane.
    */
  OVERLAP_LEFT,

  /**
    * The lane is fully formed but overlaps with the adjacent lane on the left
    * and the adjacent lane on the right in digitization direction of the lane.
    */
  OVERLAP_BOTH
};


/*!

## Feature Confidence

The feature confidence describes the confidence in the trustworthiness of a
feature. This includes, but is not restricted to, confidence in the existence of
the feature, confidence in the accuracy of the feature's geometry, or confidence
in the correct values of a feature's properties. These types of confidence may
all be included in one value.

Attribute properties can describe the confidence in more detail.
If a more detailed property is assigned to the attribute, then the attribute's
value is valid only for the values set in the property.

For example, if the confidence in the trustworthiness of a lane group's boundary
types and geometries is lower than the confidence in the general trustworthiness
of a lane group, then two feature confidence attributes are required.
The first attribute describes the general trustworthiness of the lane group:

- `FEATURE_CONFIDENCE` = 80 (attribute)

The second attribute describes the confidence in the trustworthiness of the lane
group's boundary geometries and types which is expressed with an additional
attribute property:

- `FEATURE_CONFIDENCE` = 50 (attribute)
- `LANE_GROUP_CONFIDENCE_DETAILS` (property):
    - `LaneGroupConfidenceDetails.BOUNDARY_TYPES`
    - `LaneGroupConfidenceDetails.BOUNDARY_GEOMETRIES`

!*/

/**
* Describes the confidence in the trustworthiness of a feature.
* This includes, for example, confidence in the existence of the feature,
* confidence in the accuracy of the feature's geometry, or confidence in the
* correct values of a feature's properties.
*/
subtype uint8 FeatureConfidence;

/** Detailed information on the trustworthiness of a lane group's properties. */
bitmask varuint32 LaneGroupConfidenceDetails
{
  /** Confidence in the trustworthiness of the lane group's boundary types. */
  BOUNDARY_TYPES,

  /** Confidence in the trustworthiness of the lane group's boundary geometries. */
  BOUNDARY_GEOMETRIES,

  /** Confidence in the trustworthiness of the lane group's centerline geometries. */
  CENTER_LINE_GEOMETRIES,

  /** Confidence in the trustworthiness of the lane group's lane lengths. */
  LANE_LENGTHS,

  /** Confidence in the trustworthiness of the lane group's lane relations. */
  LANE_RELATIONS,

  /**
    * Confidence in the trustworthiness of the lane group's lane connectivities,
    * that is general split/merge and termination situations.
    */
  LANE_CONNECTIVITY,

  /** Confidence in the trustworthiness of the lane group's lane traversability information. */
  LANE_TRAVERSABILITY,

  /** Confidence in the trustworthiness of the lane group's split/merge priorities. */
  LANE_SPLIT_MERGE_PRIORITIES,
};


/*!

## Other Types

!*/

/** Pavement type of a road or lane. */
enum uint8 PavementType
{
    /** Pavement type is unknown.*/
    UNKNOWN = 0x00,

    /** Sandy pavement.*/
    SANDY = 0x01,

    /** Gravel pavement, such as crushed stones.*/
    GRAVEL = 0x02,

    /** Cobblestone pavement.*/
    COBBLESTONE = 0x03,

    /** Concrete pavement.*/
    CONCRETE = 0x04,

    /** Asphalt pavement.*/
    ASPHALT = 0x05,

    /** The road or lane is paved in some way, for example, with concrete or asphalt.*/
    PAVED = 0x06,

    /** The road or lane is not paved, for example, it consists of sand or gravel.*/
    UNPAVED = 0x07,

    /** The road or lane is paved, but in a poor condition, for example, with large holes.*/
    POOR_CONDITION = 0x08,

    /** The road has any other type of pavement.*/
    OTHER = 0x09
};

/** Type of ferry when a road or lane is part of a ferry connection. */
enum uint8 FerryType
{
    /** The ferry is operated by ship or hovercraft.*/
    SHIP_OR_HOVERCRAFT = 0x00,

    /** A car shuttle train, not a ship.*/
    TRAIN = 0x01,

    /** A transporter bridge operated by sky cable.*/
    SKY_CABLE_RAIL = 0x02
};

/**
  * Grade type. Describes whether a road or lane leads up or down or
  * remains level. */
enum uint8 GradeType
{
    /** The road or lane leads up. */
    UP    = 0,

    /** The road or lane remains level, its grade does not change. */
    LEVEL = 1,

    /** The road or lane leads down. */
    DOWN  = 2
};

/**
  * Railway crossing type.
  * Describes whether a railway crossing is protected by gates.
  */
enum uint8 RailwayCrossing
{
    /** The railway crossing has gates.*/
    RAILROAD_CROSSING_WITH_GATES = 1,

    /** The railway crossing has no gates.*/
    RAILROAD_CROSSING_WITHOUT_GATES = 2,

    /** It is unknown whether the railway crossing has gates.*/
    RAILROAD_CROSSING_UNKNOWN = 3
};

/**
  * Traffic calming type. Describes the type of vertical traffic calming
  * measures, for example, speed bumps.
  */
enum uint8 TrafficCalming
{
    /** General traffic calming measure.*/
    OTHER          = 0,

    /** Traffic calming measure is a speed bump.*/
    SPEED_BUMP     = 1,

    /** Traffic calming measure is a speed hump.*/
    SPEED_HUMP     = 2,

    /** Traffic calming measure is a speed cushion.*/
    SPEED_CUSHION  = 3,

    /** Traffic calming measure is a speed table.*/
    SPEED_TABLE    = 4
};

/** Indicator for the reliability of the GNSS signal. */
enum bit:3 GnssReliability
{
  /** GNSS reliability is very bad. */
  VERY_BAD,

  /** GNSS reliability is bad. */
  BAD,

  /** GNSS reliability is medium. */
  MEDIUM,

  /** GNSS reliability is good. */
  GOOD,

  /** GNSS reliability is very good. */
  VERY_GOOD,
};

/** Indicator for the signal strength of a mobile network. */
enum bit:3 MobileNetworkCoverage
{
  /** No mobile network coverage.  */
  NONE,

  /** Mobile network coverage is very bad. */
  VERY_BAD,

  /** Mobile network coverage is bad. */
  BAD,

  /** Mobile network coverage is medium. */
  MEDIUM,

  /** Mobile network coverage is good. */
  GOOD,

  /** Mobile network coverage is very good. */
  VERY_GOOD,

  /** Mobile network coverage is excellent. */
  EXCELLENT,
};

/** Information about a mobile network carrier. */
struct MobileCarrier
{
  /**
    * MCC (mobile country code) of the mobile network carrier
    * according to ITU Recommendation E.212.
    */
  string mcc;

  /**
    * MNC (mobile network code) of the mobile network carrier
    * according to ITU Recommendation E.212.
    */
  string mnc;

  /** Displayable name of the mobile network carrier. */
  optional string name;
};

/** Supported mobile communication standards. */
bitmask varuint16 MobileCommunicationStandards
{
  /** 2G mobile communication standard. */
  GSM_2G,

  /** 3G mobile communication standard. */
  UMTS_3G,

  /** 4G mobile communication standard. */
  LTE_4G,

  /** 5G mobile communication standard. */
  NR_5G,
};

/** Width of the road in centimeters. */
subtype WidthCentimeters MetricRoadWidth;

/** Width of the lane in centimeters. */
subtype WidthCentimeters MetricLaneWidth;

/** Constant width for narrow roads, used if the exact value is not known. */
const MetricRoadWidth NARROW_ROAD = 0;

/**
  * Friction coefficient between the tires of the vehicle and the road surface.
  * The type of tire can be specified by grouping the `FRICTION` attribute with
  * the condition `FREQUENTLY_USED_VEHICLE_TYPES`, for example, to distinguish
  * between truck and car tires.
  *
  */
subtype float16 FrictionCoefficient;

/** Road or lane has pedestrian crossings. */
subtype Flag PedestrianCrossing;

/** Indicates that parts of the road or lane are on a movable bridge.*/
subtype Flag MovableBridge;

/** Indicates that there is a sidewalk adjacent to the road or lane. */
subtype Flag HasSidewalk;

/** All lanes of the road are carpool lanes. */
subtype Flag CompleteCarpoolRoad;

/** Some lanes of the road are carpool lanes. */
subtype Flag PartialCarpoolRoad;

/** Some lane of the road are high-occupancy toll (HOT) lanes. */
subtype Flag PartialCarpoolAndTollRoad;

/**
  * Road is a stubble road. Describes that the digital data for a road only
  * contains the information that there is a road without providing further
  * details. This mostly happens when only major roads are digitized. Stubbles
  * are required for giving correct guidance in incomplete route networks.
  */
subtype Flag Stubble;

/**
  * Indicates that the road is not suitable for through traffic. This can be
  * due to road conditions or the areas in which the roads are located.
  * Examples are agricultural roads or dead-end streets. An application can use
  * these roads as the start point or end point of a route but must avoid them
  * for through traffic.
*/
subtype Flag StartOrDestinationRoadOnly;

/** The road or lane is illuminated by street lights. */
subtype Flag HasStreetLights;

/** The road or lane is shared with pedestrians. There is no sidewalk. */
subtype Flag SharedRoadSurfaceWithPedestrians;

/** The road or lane is located in a business district. */
subtype Flag InBusinessDistrict;

/** Detailed type information of an intersection. */
enum bit:4 IntersectionType
{
  /** Roundabout. */
  ROUNDABOUT,

  /**
    * Mini roundabout.
    * Special type of roundabout that has a fully traversable central island
    * or no central island.
    */
  MINI_ROUNDABOUT,

  /**
    * Special traffic figure.
    * Relates to constructions with an exit behavior that is similar to the exit
    * behavior of a roundabout.
    * Special traffic figures can look like a closed circular, an elongated, or
    * even a rectangular construct of roads that are not perceived as a roundabout.
    */
  SPECIAL_TRAFFIC_FIGURE,
};
