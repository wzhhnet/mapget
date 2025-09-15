/*!

# Rules Types

This package defines types that are reused in other packages of the Rules module.

**Dependencies**

!*/

package rules.types;

import core.types.*;
import core.geometry.*;
import core.conditions.*;
import lane.reference.types.*;
import signs.warning.*;

/*!

## Rules for Regions

The following types describe rules for regions.

!*/

/**
  * Specifies the maximum allowed blood alcohol concentration (BAC) by mass. The
  * unit is mg/g, corresponding to 0.1 per mille. For example, a value of 5 equals
  * 0.5 mg of alcohol per 1 g of blood.
  */
subtype uint8 BloodAlcoholContentLimit;

/**
  * Indicates the legal requirement to carry a warning triangle in case of an
  * emergency.
  */
subtype Flag WarningTriangleRequired;

/**
  * Indicates the legal requirement to carry a first-aid kit in case of an
  * emergency.
  */
subtype Flag FirstAidKitRequired;

/**
  * Indicates the legal requirement to carry a high-visibility reflective safety
  * vest in case of an emergency.
  */
subtype Flag SafetyVestsRequired;

/**
  * Indicates the legal requirement to carry a breathalyzer, that is, a device
  * for estimating the blood alcohol content from a breath sample.
  */
subtype Flag BreathalizerRequired;

/** Defines whether lights must be switched on during daylight hours. */
subtype bool DaytimeRunningLight;

/**
  * Specifies the administrative speed limit defaults for a region in
  * kilometers per hour.
  *
  * Used in combination with conditions that indicate the
  * speed limits for certain road types, vehicles, etc.
  */
subtype SpeedKmh AdminSpeedLimitKmh;

/**
  * Specifies the administrative speed limit defaults for a region in
  * miles per hour.
  *
  * Used in combination with conditions that indicate the speed limits
  * for certain road types, vehicles, etc.
  */
subtype SpeedMph AdminSpeedLimitMph;

/**
  * Indicates that the administrative speed limit is a hard limit and is not
  * overruled by explicit speed limits, for example, posted signs.
  */
subtype Flag AdminSpeedLimitHardLimit;

/** Flag to override the hard limit of the administrative speed limit. */
subtype Flag AdminSpeedLimitHardLimitOverride;


/**
  * Specifies the administrative minimum speed defaults for a region in
  * kilometers per hour.
  *
  * Used in combination with conditions that indicate the minimum speed
  * for certain road types, vehicles, etc.
  */
subtype SpeedKmh AdminMinimumSpeedKmh;

/**
  * Specifies the administrative minimum speed defaults for a region in
  * miles per hour.
  *
  * Used in combination with conditions that indicate the minimum speed
  * for certain road types, vehicles, etc.
  */
subtype SpeedMph AdminMinimumSpeedMph;

/**
  * Specifies the administrative advisory speed limit defaults for a region in
  * kilometers per hour.
*
  * Used in combination with conditions that indicate the advisory speed
  * limits for certain road types, vehicles, etc.
  */
subtype SpeedKmh AdminAdvisorySpeedLimitKmh;

/**
  * Specifies the administrative advisory speed limit defaults for a region in
  * miles per hour.
  *
  * Used in combination with conditions that indicate the advisory speed
  * limits for certain road types, vehicles, etc.
  */
subtype SpeedMph AdminAdvisorySpeedLimitMph;

/**
  * Indicates that the conditions that are grouped with this attribute
  * define vignette information.
  */
subtype Flag TollVignetteInfo;

/** Stores a list of currencies. */
subtype Currencies RegionCurrencies;

/** Driving rules that are valid in the region. */
struct RegionDrivingRules
{
  /** Specifies what rules are defined. */
  DrivingRulesContent content;

  /** Legal requirement to use the lane closest to the curb except for passing. */
  bool stayCurbside if isset(content, DrivingRulesContent.STAY_CURBSIDE);

  /**
    * Default color of temporary lane boundary markings that overrule regular lane
    * boundary markings, for example, in case of roadworks.
    */
  MarkingColor temporaryLaneMarkingColor
          if isset(content, DrivingRulesContent.TEMPORARY_LANE_MARKING_COLOR);

  /** Defines whether passing on a lane closer to the curb is allowed. */
  bool curbsidePassingAllowed
          if isset(content, DrivingRulesContent.CURBSIDE_PASSING);

  /** Rules for emergencies. */
  EmergencyRules emergencyRules
          if isset(content, DrivingRulesContent.EMERGENCY_RULES);

  /**
    * Defines whether vehicles must yield to oncoming traffic when crossing the
    * oncoming lane during a turn, for example, when turning left in right-hand
    * traffic.
    */
  bool yieldOncoming
          if isset(content, DrivingRulesContent.YIELD_RULES);

  /**
    * Defines whether vehicles must yield to traffic coming from curbside direction,
    * for example, traffic coming from the right at an intersection in right-hand
    * traffic.
    */
  bool yieldCurbSide
          if isset(content, DrivingRulesContent.YIELD_RULES);

  /** Defines whether crossing solid lines is allowed. */
  bool alwaysAllowed
          if isset(content, DrivingRulesContent.SOLID_LINE_RULES);

  /** Rules for when solid lines may be crossed. */
  SolidLineCrossingRules solidLineCrossingRules
      if isset(content, DrivingRulesContent.SOLID_LINE_RULES) && !alwaysAllowed;

  /** Rules for on-street parking. */
  RoadSideParkingRules roadSideParkingRules
      if isset(content, DrivingRulesContent.ROADSIDE_PARKING_RULES);

  /** Rules for lane merge situations. */
  LaneMergeRules laneMergeRules
      if isset(content, DrivingRulesContent.LANE_MERGE_RULES);

  /**
    * Default color, type, and width of regular lane boundary markings on normal lanes.
    * Does not apply to markings that indicate special use like "no parking"
    * or "no stopping".
    */
  RegularLaneMarking regularLaneMarkings[]
      if isset(content, DrivingRulesContent.REGULAR_LANE_MARKINGS);
};

/** Specifies which rules are defined. */
bitmask varuint32 DrivingRulesContent
{
  STAY_CURBSIDE,
  TEMPORARY_LANE_MARKING_COLOR,
  CURBSIDE_PASSING,
  EMERGENCY_RULES,
  YIELD_RULES,
  SOLID_LINE_RULES,
  ROADSIDE_PARKING_RULES,
  LANE_MERGE_RULES,
  REGULAR_LANE_MARKINGS,
};

/*!

## Regular Lane Markings

Regular lane markings describe the default color, type, and width of regular
lane boundary markings on normal lanes and do not apply to markings that
indicate special use like, for example, parking prohibitions.

The flag `isRoadCenterMarking` can be used for road center markings if these
differ from other lane boundary markings. This is shown in the following image:

![Road center marking](assets/road-center-marking.jpg)

The flag can also be used in cases where the road center marking is placed next
to a physical divider or road median as shown in the following image:

![Physical divider and road median](assets/road-median-physical-divider.jpeg)

!*/

/** Color, type, and width of regular lane boundary markings. */
struct RegularLaneMarking
{
  /** Road type to which the regular lane boundary markings apply. */
  RoadType roadType;

  /** Color of lane boundary markings. */
  MarkingColor color;

  /**
    * Set to `true` if lane boundary marking is the road center marking
    * between opposing driving directions.
    */
  bool isRoadCenterMarking;

  /** Type of lane boundary markings. */
  optional RegularMarkingType type;

  /** Width of lane boundary markings. */
  optional WidthCentimeters width;
};

/** Type of regular lane boundary markings. */
enum bit:7 RegularMarkingType
{
  /** Dashed line. */
  DASHED_LINE,

  /** Solid line. */
  SOLID_LINE,
};

/** Rules for emergencies. */
struct EmergencyRules
{

  /** Requirement to form an emergency corridor in traffic jams. */
  bool buildEmergencyCorridor;

  /**
    * Defines whether vehicles must change lanes when passing a stationary
    * emergency vehicle.
    */
  bool changeLanes;

  /**
    * Defines whether vehicles must slow down when passing a stationary emergency
    * vehicle.
    */
  bool slowDown;
};

/** Defines situations in which a vehicle is allowed to cross a solid line. */
struct SolidLineCrossingRules
{
  /** Crossing solid lines is allowed during emergencies. */
  bool duringEmergencies;

  /** Crossing solid lines is allowed to enter and exit drivable shoulder lanes. */
  bool enterShoulderLane;

  /**
    * Crossing solid lines is allowed for public buses and taxis to enter and
    * exit bus lanes.
    */
  bool enterBusLane;

  /**
    * Crossing solid lines is allowed to overtake slow traffic, such as bicycles
    * or pedestrians.
    */
  bool overtakeSlowTraffic;

  /** Crossing solid lines is allowed to enter adjoining premises or side roads. */
  bool enterPremisesOrSideRoads;

  /** Crossing solid lines is allowed to avoid obstacles on the road. */
  bool avoidObstacles;
};

/** Defines where on-street parking is allowed. */
struct RoadSideParkingRules
{
  /** On-street parking is allowed on both sides in one-way streets. */
  bool bothSidesOfOneWay;

  /** On-street parking is allowed in opposite direction to the travel direction. */
  bool oppositeDirection;
};

/** Defines how vehicles must behave in lane merge situations. */
struct LaneMergeRules
{
  /**
    * When merging lanes are separated by a dashed divider, vehicles on the ending
    * lane must yield.
    */
  bool yieldToOngoingLane;

  /**
    * When merging lanes are separated by a dashed divider, vehicles must yield
    * to traffic on the curbside.
    */
  bool yieldToCurb;

  /**
    * When merging lanes are not separated by a dashed divider, vehicles must yield
    * to traffic that is ahead.
    */
  bool yieldToTrafficAhead;

  /**
    * When merging lanes are not separated by a dashed divider, vehicles must yield
    * to traffic on the curbside.
    */
  bool noDividerYieldToCurb;
};

/**
  * Driving side.
  * Set to `true` for right-hand traffic, for example, in China, USA, or France.
  * Set to `false` for left-hand traffic, for example, in Japan, India, or the
  * United Kingdom.
  */
subtype bool RightHandTraffic;

/** System of measurement. */
enum bit:1 SystemOfMeasurement
{
  /**
    * All units of attribute values, for example, speed limit values, use the
    * imperial system.
    */
  IMPERIAL,

  /**
    * All units of attribute values, for example, speed limit values, use the
    * metric system.
    */
  METRIC,
};

/** Conditions for switching on the vehicle lights. */
struct VehicleLightConditions
{
    /** Lights must always be switched on. */
    bool alwaysRequired;

    /** After sunset until half an hour before sunrise. */
    bool afterSunset if !alwaysRequired;

    /** When windshield wipers are switched on. */
    bool withWindshieldWipers if !alwaysRequired;

    /** When visibility is low. */
    bool lowVisibility if !alwaysRequired;
};

/**
  * Indicates that the toll on motorways or inside city boundaries
  * in the region requires payment with registration of the individual vehicle.
  */
subtype Flag RequiresTollRegistration;

/** Defines the winter season of the region. */
subtype DateRangeOfYear WinterSeason;

/** Indicates that there is a legal requirement to use winter tires on the vehicle. */
subtype Flag WinterTiresRequired;

/**
  * Indicates that there is a legal requirement to carry a fire extinguisher
  * along for cases of emergency.
  */
subtype Flag FireExtinguisherRequired;

/**
  * Indicates that there is a legal requirement to carry a tow rope along for
  * cases of emergency.
  */
subtype Flag TowRopeRequired;

/** Official languages of the region. */
struct OfficialLanguages
{
  /**
    * Language codes of the official languages. The first entry in the list
    * is considered to be the default official language of the region.
    */
  LanguageCode officialLanguages[];
};

/*!

## Rules for Transitions and Intersections

The following types describe rules for transitions and intersections.
They can also be used for lanes in intersection lane groups.

!*/

/**
  * Specifies right-of-way regulations at intersections and transitions or
  * on lanes of intersection lane groups.
  */
enum uint8 RightOfWayType
{
  /**
    * Indicates that the right-of-way regulation was captured by field survey,
    * but that there is no sign. Used to describe a right-before-left or
    * left-before-right situation.
    */
  NO_SIGN,

  /**
    * Vehicles that pass an intersection on a transition or lane with this attribute
    * value have the right-of-way if they go straight or if they follow a
    * priority transition, such as a protected green light or priority sign.
    */
  RIGHT_OF_WAY,

  /**
    * Vehicles that pass an intersection on a transition or lane with this attribute
    * value must yield to traffic from other directions.
    */
  GIVE_WAY,

  /**
    * Vehicles that pass an intersection on a transition or lane with this attribute
    * value must stop and yield to traffic from other directions.
    */
  STOP_GIVE_WAY,

  /**
    * Vehicles that pass an intersection on a transition or lane with this attribute
    * value must stop and yield to traffic from other directions unless they
    * arrive at the intersection before all other oncoming traffic.
    */
  ALL_WAY_STOP,
};

/** Right-of-way regulations for lanes. */
struct LaneRightOfWayRegulation
{
  /** Lane ID of the other lane. */
  LaneId otherLane;

  /** Range on the other lane that the right-of-way regulation is valid for. */
  LaneGeometryRange otherLaneRange;

  /** Type of the right-of-way regulation. */
  RightOfWayType type;
};

/**
  * Identifies one or more ranges of other lanes that
  * have priority over the lane to which this attribute is assigned.
  */
struct LaneTrafficPriority
{
  /** Reason why the other lanes have priority over the current lane. */
  LaneTrafficPriorityReason reason;

  /** Number of other lanes that have priority over the current lane. */
  varsize numLanes;

  /** Lane IDs of the other lanes. */
  LaneId otherLanes[numLanes];

  /** Range on the other lanes that the priority is valid for. */
  LaneGeometryRange range[numLanes];
};

/** Detailed reason why other lanes have priority. */
enum uint8 LaneTrafficPriorityReason
{
  /**
    * The current lane has an unprotected green light.
    *
    * Example: The current lane represents a left-turn lane in an intersection.
    * If the traffic light for that left-turn lane shows green, the
    * oncoming traffic from the lanes in opposite direction still has
    * priority over the current lane.
    */
  UNPROTECTED_GREEN,

  /**
    * A traffic sign or other traffic rule overrides the normal rules.
    *
    * Example: Oncoming traffic has priority on an adjacent lane if the lanes
    * are too narrow to allow traffic in both directions at the same time.
    */
  TRAFFIC_RULE,

  /**
    * The left-turn lane from the opposite direction overlaps the current lanes
    * and has priority.
    */
  OPPOSING_LEFT_TURN,
};

/** Specifies whether turning on a red traffic light is allowed. */
subtype bool TurnOnRedAllowed;

/** Specifies which is the preferred transition for a U-turn in an intersection. */
subtype Flag PreferredUTurn;

/*!

## Rules for Ranges of Roads and Lanes

The following types describe rules for ranges of roads and lanes.

!*/

/** Indicates that the passage of a feature is prohibited. */
subtype Flag ProhibitedPassage;

/** Indicates that a transition is prohibited. */
subtype Flag ProhibitedTransition;

/**
  * Indicates that U-turns are prohibited along the feature, because a sign
  * with a U-turn prohibition is located next to the road.
  */
subtype Flag ProhibitedUTurn;

/** Indicates that overtaking is prohibited. */
subtype Flag OvertakingProhibition;

/** Maximum speed in kilometers per hour. */
subtype SpeedKmh SpeedLimitKmh;

/** Maximum speed in miles per hour. */
subtype SpeedMph SpeedLimitMph;

/** Minimum speed in kilometers per hour. */
subtype SpeedKmh MinimumSpeedKmh;

/** Minimum speed in miles per hour. */
subtype SpeedMph MinimumSpeedMph;

/**
  * Advisory speed limit in kilometers per hour.
  * An advisory speed limit is a speed limit that is recommended by a governing
  * body but is not enforced.
  */
subtype SpeedKmh AdvisorySpeedLimitKmh;

/**
  * Advisory speed limit in miles per hour.
  * An advisory speed limit is a speed limit that is recommended by a governing
  * body but is not enforced.
  */
subtype SpeedMph AdvisorySpeedLimitMph;

/** Maximum allowed speed that a cruise control system may be set to in kilometers per hour. */
subtype SpeedKmh MaxCruiseControlSpeedKmh;

/** Maximum allowed speed that a cruise control system may be set to in miles per hour. */
subtype SpeedMph MaxCruiseControlSpeedMph;

/**
  * Defines a traffic enforcement zone.
  *
  * A traffic enforcement zone shall contain both a `TRAFFIC_ENFORCEMENT_ZONE_ENTRY`
  * camera and a `TRAFFIC_ENFORCEMENT_ZONE_EXIT` camera.
  */
struct TrafficEnforcementZone
{
   /** Type of traffic enforcement zone.*/
   TrafficEnforcementZoneType trafficEnforcementZoneType;

   /**
    * Maximum distance in meters from the start of the feature or validity range
    * to which the attribute is assigned to the end of the traffic
    * enforcement zone.
    */
   LengthMeters zoneLength;
};

/**
  * Traffic zone representing an area with special traffic conditions, for example,
  * low-emission zones that can only be entered by vehicles with low emission
  * profiles.
  */
enum uint8 TrafficZone
{
    /**
     * Zone with a special set of rules or name that does not match one of
     * the other definitions.
     */
    OTHER,

    /**
     * Environmental zone, especially in Germany with three differently colored
     * labels (red, amber/yellow, green).
     */
    ENVIRONMENT_ZONE,

    /** Area for which a toll must be payed when entering. */
    TOLL_ZONE,

    /** Living street, primarily built for pedestrians and cyclist. */
    LIVING_STREET,

    /**
     * Area where all roads have the same speed limit and where the speed limit
     * is not automatically revoked at an intersection.
     */
    SPEED_LIMIT_ZONE,

    /** Area near a school. */
    SCHOOL_ZONE,

    /**
     * Area restricted to vehicles with a very low emission profile, for example,
     * electrical vehicles only.
     */
    LOW_EMISSION_ZONE,

    /** Area with high traffic density. */
    CONGESTION_ZONE,

    /** Area where autonomous driving is allowed. */
    AUTONOMOUS_DRIVING_ZONE,

    /** Area where autonomous driving is prohibited. */
    NON_AUTONOMOUS_DRIVING_ZONE,

    /** Area where only residential vehicles are allowed. */
    RESIDENTIAL_AREA,

    /**
     * Area that can only be entered through a gate and for which a special
     * permission is required.
     */
    GATED_AREA,

    /** Area where cyclists have priority. */
    CYCLIST_ROAD,

    /** Area with special parking regulations. */
    RESTRICTED_PARKING_ZONE,

    /** Area with special halt or stopping rules or restrictions. */
    NO_STOPPING_ZONE,

    /**
     * Area where lanes cross each other without visible lane boundaries,
     * for example, in front of toll stations.
     */
    NO_BOUNDARY_MARKINGS_ZONE,

    /** Port area. */
    PORT_AREA,

    /** Airport area. */
    AIRPORT_AREA,

    /** Industrial zone. */
    INDUSTRIAL_ZONE,

    /** Freight distribution center area. */
    FREIGHT_DISTRIBUTION_CENTER,

    /** Geofenced area without further specification. */
    GEOFENCED_AREA,
};

/** Description of a geofenced area. */
subtype string TrafficZoneGeofencedAreaDetails;

/** Traffic on the feature is managed by a traffic management system. */
subtype Flag TrafficManaged;

/**
  * Indicates that a road or mountain pass is closed in certain seasons,
  * for example, always closed in winter. Such a time restriction can be
  * evaluated so that the system can calculate alternative routes or at least
  * output a warning that the route might be closed.
  */
subtype Flag SeasonalClosed;


/** Indicates a no-stop zone. */
subtype Flag DontStopZone;

/**
  * Parking is not allowed on the road that is represented by the feature the
  * attribute is assigned to.
  */
subtype Flag ProhibitedParking;

/**
  * Stopping is not allowed on the road that is represented by the feature the
  * attribute is assigned to.
  */
subtype Flag ProhibitedStopping;

/**
  * Indicates that the driving side of a feature deviates from the default.
  * For example, if the region metadata defines right-hand traffic
  * but some features in a tile have left-hand traffic, then this attribute
  * is assigned to those features.
  */
subtype Flag NonDefaultDrivingSide;

/**
  * ADR tunnel categories, defined according to the European Agreement
  * concerning the International Carriage of Dangerous Goods by Road.
  * Despite the name of the agreement, ADR categories may be
  * used outside Europe.
  */
enum uint8 AdrTunnelCategory
{
    /** ADR tunnel category A. */
    A,

    /** ADR tunnel category B. */
    B,

    /** ADR tunnel category C. */
    C,

    /** ADR tunnel category D. */
    D,

    /** ADR tunnel category E. */
    E,
};

/** Restriction based on the license plate of a vehicle. */
struct LicensePlateRestriction
{
    /** Type of license plate restriction. */
    LicensePlateRestrictionType  licensePlateRestrictionType;

    /** Specifies the rule of the license plate restriction. */
    LicensePlateRestrictionRule  licensePlateRestrictionRule;

    /** Human-readable description of the license plate restriction. */
    string  licensePlateRestrictionDescription;
};

/** Defines where the license plate restriction applies. */
enum bit:2 LicensePlateRestrictionType
{
  /** Restriction applies to a specific area, for example, to the whole city
    * or to a city district.
    */
  AREA    = 0,

  /** Restriction applies to a specific road. */
  ROAD    = 1
};

/** Rule specifying the license plate restriction. */
struct LicensePlateRestrictionRule
{
  /**
    * Restriction applies to vehicles that do not have a special permit paper. */
  bool    noPermitPaper;

    /** Restriction applies to specific license plates only. */
    bool    isSpecificPlates;

    /** Restricts license plates by judging the first digit of the license plate. */
    bool    isFirstDigitRule;

    /** Restricts license plates by judging the last digit of the license plate. */
    bool    isLastDigitRule;

    /** Type of rule based on the first digit of a license plate. */
    LicensePlateDigitRuleType firstDigitRuleType if isFirstDigitRule == true;

    /** Number of first special digits that are affected by the rule. */
    uint8       numFirstSpecialDigits if isFirstDigitRule == true && firstDigitRuleType == LicensePlateDigitRuleType.SPECIAL_DIGIT;

    /** List of first special digits that are affected by the rule. */
    string  firstSpecialDigit[numFirstSpecialDigits] if isFirstDigitRule == true && firstDigitRuleType == LicensePlateDigitRuleType.SPECIAL_DIGIT;

    /** Type of rule based on the last digit of a license plate. */
    LicensePlateDigitRuleType lastDigitRuleType if isLastDigitRule == true;

    /** Number of last special digits that are affected by the rule. */
    uint8       numLastSpecialDigits if isLastDigitRule == true && lastDigitRuleType == LicensePlateDigitRuleType.SPECIAL_DIGIT;

    /** List of last special digits that are affected by the rule. */
    string  lastSpecialDigit[numLastSpecialDigits] if isLastDigitRule == true && lastDigitRuleType == LicensePlateDigitRuleType.SPECIAL_DIGIT;

    /** Number of specific license plates that are affected by the rule. */
    uint8       numSpecificPlates if isSpecificPlates == true;

    /** List of specific license plates that are affected by the rule. */
    string  specificPlates[numSpecificPlates] if isSpecificPlates == true;
};

/** Type of rule based on the first or last digit of a license plate. */
enum bit:2 LicensePlateDigitRuleType
{
    /** Digit is an odd number. */
    ODD_NUMBER  = 0,

    /** Digit is an even number. */
    EVEN_NUMBER = 1,

    /** The rule determines special treatment for certain predefined digits. */
    SPECIAL_DIGIT = 2
};

/*!

## Rules for Positions on Roads and Lanes

The following types describe rules for positions on roads and lanes.

!*/

/** Indicates the existence of a traffic light. */
subtype Flag TrafficLights;

/** Indicates the existence of a traffic enforcement camera. */
subtype TrafficEnforcementCameraType TrafficEnforcementCamera;

/**
  * Indicates the existence of a long-term traffic light.
  *
  * In contrast to the `TrafficLights` attribute, this attribute is only used
  * to model traffic lights that have very long cycles, for example, blocking
  * tunnels or bridges.
  */
subtype Flag TrafficLightsLongterm;

/**
  * Indicates the existence of a warning sign that can be moved over time.
  * Movable warning signs are usually metal signs with a stand, which can be
  * put up where needed.
  */
subtype WarningSign MovableWarningSign;

/**
  * Defines the position of a traffic signal (warning sign or traffic light)
  * relative to the road. Multiple positions can be defined, for example,
  * if the signal is placed on both sides of the road.
  */
bitmask uint8 SignalPosition
{
  /** Signal is on the left side of the road. */
  LEFT,

  /** Signal is on the right side of the road. */
  RIGHT,

  /** Signal is above the road. */
  OVERHEAD,

  /** Signal is on the road. */
  ROAD_SURFACE,
};


/*!

## Modeling Travel Direction and Prohibitions for Roads and Lanes

The travel direction is defined using prohibitions only.
If there is no prohibition on one of the directions of a feature, the feature
is open for traveling in that direction. If no prohibition at all is present,
the traffic can travel in all directions on roads.

The effective travel direction on a road or lane is determined by iterating
through all prohibitions.
There are unconditional prohibitions and conditional prohibitions:

- Unconditional prohibitions are used if there is only one travel direction on
   a road in general, for example, on a motorway. In this case, traveling in
   the other direction is explicitly prohibited.
- Conditional prohibitions are restrictions that only apply if a combination of
  conditions is met, for example, by combining a vehicle type with a weather
  condition and a time range.

Global prohibitions such as "no pedestrians are allowed on highways" are
modeled using the region rules layer, by assigning `PROHIBITED_PASSAGE`
to a set of road combined with the relevant conditions.

__Note:__
See the section Using NDS.Live > Concepts and Use Cases on the NDS.Live
Developer Portal for extended examples on using the `PROHIBITED_PASSAGE` attribute.


## ISO Details

ISO codes according to ISO 3166 can be used to identify regions across different
services and map data to country specifics within an application.
The ISO details consist of ISO 3166-1 country codes and ISO 3166-2 subdivision
codes.

!*/

subtype Iso3166Codes IsoDetails;

/*!

## Region Validity

Region validity describes for which roads region attributes are applicable.
When region validity is used in attribute maps, the condition list and the property
list of the attribute map can be used to further detail under what conditions
a region-wide rule applies. For example, a rule can apply to a specific vehicle
type, when it rains, or at a certain time.

__Note:__
The road type set in `RegionValidity` contains boolean values for all
road character types, which allow to define validities for roads that
are not inside the set. This is similar to using the `isInclusive` value for conditions.

**Example**

When it is raining, the administrative maximum speed on outside urban roads
that have a minimum of 2 lanes plus a shoulder lane is to be set to 55 mph.

The corresponding attribute map contains the following:

````
RegionValidity.roads = { form = ANY
                         characteristics[0]:
                            { character = URBAN ; value = false }
                         characteristics[1]:
                            { character = HAS_SHOULDER_LANE ; value = true }
                        }
RegionValidity.attributes[0]:
                        { type = MIN_LANES; value = 2 }

Condition = { type = WEATHER; value = RAIN}
Attribute = { type = ADMIN_SPEED_LIMIT_IMPERIAL; value = 55}
````

!*/

/**
  * Validity for defined roads in a region based on the road type and optional
  * attributes of the roads.
  */
struct RegionValidity(CoordShift shift)
{
  /** Set of road types to which the region attributes apply. */
  RoadTypeSet roads;

  /** Optional attributes that further describe the roads in the road type set. */
  optional RegionValidityAttribute attributes[];
};

/** Attribute that further describes roads with region attributes. */
struct RegionValidityAttribute
{
  /** Type of attribute. */
  RegionValidityType type;

  /** Attribute value. */
  RegionValidityValue(type) value;
};

/** Attributes that describe the type of region validity. */
enum uint8 RegionValidityType
{
  /** Validity for roads with an exact number of lanes. */
  NUM_LANES,

  /** Validity for roads with a minimum number of lanes. */
  MIN_LANES,

  /**
    * Validity for paved or unpaved roads. Set to `true` for paved roads, set to
    * `false` for unpaved roads.
    */
  PAVED,

  /** Validity for traffic zone types. */
  TRAFFIC_ZONE,

  /** Validity for dedicated priority road class. */
  PRIORITY_ROAD_CLASS,

  /** Validity for beginner drivers. */
  BEGINNER,

  /** Validity for roads that have no road markings. */
  NO_MARKINGS,

  /** Validity for roads with a minium width. */
  ROAD_MINIMUM_WIDTH,

  /** Validity for roads with a maximum width. */
  ROAD_MAXIMUM_WIDTH,

  /** Validity for roads that have street lights. */
  HAS_STREET_LIGHTS,

  /** Validity for roads without sidewalks, no pedestrian zone. */
  SHARED_ROAD_SURFACE_WITH_PEDESTRIANS,

  /** Validity for roads in business districts. */
  IN_BUSINESS_DISTRICT,
};

choice RegionValidityValue(RegionValidityType type) on type
{
  case NUM_LANES:
    varuint16 numLanes;
  case MIN_LANES:
    varuint16 minLanes;
  case PAVED:
    bool paved;
  case TRAFFIC_ZONE:
    TrafficZone trafficZone;
  case PRIORITY_ROAD_CLASS:
    PriorityRoadClass priorityRoadClass;
  case BEGINNER:
    ;
  case NO_MARKINGS:
    ;
  case ROAD_MINIMUM_WIDTH:
    MetricRoadWidth roadMinimumWidth;
  case ROAD_MAXIMUM_WIDTH:
    MetricRoadWidth roadMaximumWidth;
  case HAS_STREET_LIGHTS:
    ;
  case SHARED_ROAD_SURFACE_WITH_PEDESTRIANS:
    ;
  case IN_BUSINESS_DISTRICT:
    ;
};

/** Width of the road in centimeters. */
subtype WidthCentimeters MetricRoadWidth;

/** Language-specific text on supplementary warning signs. */
struct SupplementaryWarningSignText
{
  /** Language code of the supplementary warning sign text. */
  optional LanguageCode languageCode;

  /** Text on the warning sign. */
  string text;
};

/** Levels of automated driving based on SAE J3016. */
enum bit:3 AutomatedDrivingClearance
{
  /**
    * Driver Assistance: The driving mode-specific execution by a driver
    * assistance system of either steering or acceleration/deceleration
    * using information about the driving environment and with the
    * expectation that the human driver perform all remaining
    * aspects of the dynamic driving task.
    */
  SAE_LEVEL_1,

  /**
    * Partial Driving Automation: The driving mode-specific execution by one
    * or more driver assistance systems of both steering and acceleration/
    * deceleration using information about the driving
    * environment and with the expectation that the human
    * driver perform all remaining aspects of the dynamic driving task.
    */
  SAE_LEVEL_2,

  /**
    * Conditional Driving Automation: The driving mode-specific performance by an
    * automated driving system of all aspects of the dynamic driving task
    * with the expectation that the human driver will respond
    * appropriately to a request to intervene.
    */
  SAE_LEVEL_3,

  /**
    * High Driving Automation: The driving mode-specific performance by an
    * automated driving system of all aspects of the dynamic driving task,
    * even if a human driver does not respond appropriately to a
    * request to intervene.
    */
  SAE_LEVEL_4,

  /**
    * Full Driving Automation: The full-time performance by an automated driving
    * system of all aspects of the dynamic driving task under all roadway
    * and environmental conditions that can be managed by a human driver.
    */
  SAE_LEVEL_5,
};

/**
  * Indicates roadworks on a road or lane.
  * `ROADWORKS` does not indicate that the referenced road or lane is blocked.
  * If the road or lane is blocked by roadworks, `PROHIBITED_PASSAGE` is used
  * additionally. If `ROADWORKS` is used without `PROHIBITED_PASSAGE`, there is
  * a slight detour only, for example, with different markings.
  */
subtype Flag Roadworks;

/** Detailed information about the type of roadworks. */
enum uint8 RoadworksType
{
  /** Long-term roadworks. */
  LONG_TERM_ROADWORKS,

  /**
    * Road construction work.
    * `CONSTRUCTION_WORK` is only used for roads or lanes that are newly built
    * or that are demolished and does not include maintenance work on existing
    * roads or lanes.
    */
  CONSTRUCTION_WORK,

  /** Bridge maintenance. */
  BRIDGE_MAINTENANCE_WORK,

  /** Road resurfacing work. */
  RESURFACING_WORK,

  /**
    * Major roadworks.
    * Roadworks that have a long duration or that require a road closure.
    */
  MAJOR_ROADWORKS,

  /** Road maintenance. */
  MAINTENANCE_ROADWORKS,

  /**
    * Used for roadworks where traffic is alternately
    * directed over one single lane.
    */
  ROADWORKS_SINGLE_LINE_TRAFFIC_ALTERNATE_DIRECTIONS,
};

/** Language-specific time zone name. */
struct TimeZoneName
{
    /** Language code of the time zone name. */
    LanguageCode languageCode;

    /** Language-specific name string of the time zone. */
    string nameString;
};

/** Time zone definition, including UTC offset, daylight saving time, and names. */
struct TimeZone
{
    /**
      * Identifier from IANA Time Zone Database. Examples: America/New_York or Europe/Paris.
      * See also https://www.iana.org/time-zones.
      */
    optional string olsonId;

    /**
      * Only one time zone configuration is valid at a time, that is, the entry
      * where `validFromDate` is less than or equal to the current date.
      */
    TimeZoneConfiguration timeZoneConfigurations[]: lengthof(timeZoneConfigurations) >= 1;
};

 /**
  * Defines the time configuration aspects of a time zone such as
  * validity date, UTC offset, and daylight saving time.
  *
  * `validFromDate` allows to model time zone changes that have to be applied starting
  * on a specific date. Examples: Changing summer time rules in Brazil or
  * the redefinition of time zones in Samoa 2011/12.
  */
struct TimeZoneConfiguration
{
    /**
     * Defines the date from which this time zone configuration is valid.
     * Default value is 1/1/1970.
     */
    DayOfYear validFromDate;

    /** Time offset in quarter hour units relative to UTC (Universal Time Coordinated). */
    QuarterHourTimeOffset utcOffset;

    /**
     * Optional names for the time zone.
     * Describe the time zone excluding daylight saving time.
     */
    optional TimeZoneName timeZoneNames[];

    /**
     * Optional abbreviations for the time zone.
     * Describe the time zone excluding daylight saving time.
     */
    optional TimeZoneName timeZoneAbbreviations[];

    /**
     * If set to `true`, the time zone uses daylight saving time.
     * Example: Switch from winter time to summer time in the Northern Hemisphere.
     */
    optional DayLightSavingTime dayLightSavingTime;

};

/** Daylight saving time configuration of a time zone. */
struct DayLightSavingTime
{
    /**
     * Time offset in quarter hour units relative to UTC during daylight
     * saving time.
     */
    QuarterHourTimeOffset utcOffset;

    /**
     * Optional names for the time zone.
     * These names shall describe the time zone including daylight saving time.
     */
    optional TimeZoneName names[];

    /**
     * Optional names for the time zone.
     * Describe the time zone including daylight saving time.
     */
    optional TimeZoneName abbreviationNames[];

    /**
      * Point in time within a day at which daylight saving time begins.
      * Described in UTC without offset.
      */
    TimeOfDay startTimeOfDay;

    /** Weekday in a month where daylight saving time begins. */
    WeekdayInMonth startWeekdayInMonth;

    /** Month of year where daylight saving time begins. */
    MonthOfYear startMonthOfYear;

    /**
      * Point in time within a day at which daylight saving time ends.
      * Described in UTC without offset.
      */
    TimeOfDay endTimeOfDay;

    /** Weekday in a month where daylight saving time ends. */
    WeekdayInMonth endWeekdayInMonth;

    /** Month of year where daylight saving time ends. */
    MonthOfYear endMonthOfYear;
};

/*!

## Evaluation of Speed Limit Values

Speed limits are provided on multiple levels:

- Regions:
    - Administrative speed limit defaults (admin speed limits) are defined using
      the `ADMIN_SPEED_LIMIT_*` attribute in region validities. Different admin
      speed limits can be provided for different situations. A situation
      includes road types, vehicle types, or other road characteristics and
      conditions, for example, weather conditions. For more information, see
      [Region Validity](#region-validity).
    - The attribute property `ADMIN_SPEED_LIMIT_HARD_LIMIT` is used when an admin
      speed limit cannot be overridden by an explicit speed limit, unless that
      speed limit has assigned the attribute property
      `ADMIN_SPEED_LIMIT_HARD_LIMIT_OVERRIDE`.
- Roads, road locations, lanes, or display lines:
    - Explicit speed limits can be assigned to a complete feature or ranges on
      a feature using the attribute `SPEED_LIMIT_*`. These speed limits are
      often derived from posted signs.
    - The attribute property `ADMIN_SPEED_LIMIT_HARD_LIMIT_OVERRIDE` is used
      on explicit speed limits to override the admin speed limit.

To determine the actual speed limit on any given road or lane, an application
has to evaluate all applicable speed limits following specific rules to avoid
ambiguities. The following steps ensure that the lowest valid speed limit
applies.

**Preparation**

1. From the rules attributes that are relevant for the given road, lane, or
   display line, get the following:
    1. The lowest soft admin speed limit (`ADMIN_SPEED_LIMIT_*` without
       attribute property `ADMIN_SPEED_LIMIT_HARD_LIMIT`) that applies to the
       current situation. Keep this value as "A".
    2. The lowest hard admin speed limit (`ADMIN_SPEED_LIMIT_*` +
       `ADMIN_SPEED_LIMIT_HARD_LIMIT`) that applies to the current situation.
       Keep this value as "H".
2. From all `SPEED_LIMIT_*` values that apply to the road, lane, or display line
   in question, get the lowest value that applies to the current situation. Keep
   this value as "SL". __Note__: Take into account that dynamic signs might have
   priority over posted signs.

**Evaluation**

Determine the actual speed limit that is valid for the current situation on the
given road, lane, or display line:

1. No explicit speed limit is available ("SL" does not exist):
    1. If both a hard admin speed limit ("H") and a soft admin speed limit ("A")
       exist, the actual speed limit = min(H, A).
    2. If only a hard admin speed limit ("H") or a soft admin speed limit ("A")
       exists, this is the actual speed limit.
    3. Else, the speed limit is unknown.
2. An explicit speed limit is available ("SL" exists):
    1. If both of the following conditions apply, then the
       actual speed limit = min(SL, H):
       - A hard admin speed limit ("H") exists.
       - The speed limit in "SL" does NOT have the attribute property
         `ADMIN_SPEED_LIMIT_HARD_LIMIT_OVERRIDE` assigned.
    2. Else, the actual speed limit is the value of the explicit speed limit
       ("SL").

**Example**

An attribute map for region validities defines the following admin speed
limits:

- Urban roads:
    - `ADMIN_SPEED_LIMIT_METRIC` = 50
    - `RoadCharacter.URBAN`
- General speed limit for trucks:
    - `ADMIN_SPEED_LIMIT_METRIC` = 80
    - `FrequentlyUsedVehicleTypes.TRUCK` with `isInclusive` = `true`
    - `ADMIN_SPEED_LIMIT_HARD_LIMIT`
- General speed limit on motorways:
    - `ADMIN_SPEED_LIMIT_METRIC` = 110
    - `ADMIN_SPEED_LIMIT_HARD_LIMIT`


If the current vehicle is a truck, the following applies:

- On an urban road, the values 50 and 80 apply to the truck. The actual
  speed limit is set to the lower value, that is, 50.
- On a motorway, the values 80 and 110 apply to the truck. The actual
  speed limit is set to the lower value, that is, 80.

Sign 1: There is a posted sign with the following values:

- `SPEED_LIMIT_METRIC` = 90
- `FrequentlyUsedVehicleTypes.TRUCK` with `isInclusive` = `true`
- `ADMIN_SPEED_LIMIT_HARD_LIMIT_OVERRIDE`

Because this sign overrides the general speed limit for the truck, the actual
speed limit on this road is 90.

Sign 2: There is a posted sign with the following value:

- `SPEED_LIMIT_METRIC` = 90

This sign does not override the admin speed limit for the truck because
`ADMIN_SPEED_LIMIT_HARD_LIMIT` is set. The sign does apply to other vehicle
types such as passenger cars.
!*/

/*!

## Traffic Lights

Traffic lights are assigned to a specific position on a road or lane.
The relevant position is the stopping position, not the actual position of the
traffic signal head. Multiple traffic lights for a location can be
combined in one attribute, provided that they have the same layout and
switching cycles.

Attribute properties describe traffic lights in more detail, for example, to
define the type of traffic light that is described, to determine the direction
in which a traffic light is facing, or to provide more information about the
types of traffic light lenses.

### Traffic Light Layouts and Traffic Light Faces

A traffic light layout provides information about the construction type of a traffic
light, as well as details about the traffic light lenses, for example, their color
or inlay type. Every `TRAFFIC_LIGHTS` attribute may only have one `TRAFFIC_LIGHTS_LAYOUT`
attribute property. A traffic light layout may be valid for multiple physical traffic
lights that are facing in the same direction, have the same layout, and
switching cycles.

A traffic light face describes the side of a single traffic light that is facing
the traffic. The traffic light face provides information about the shape of the
traffic light housing and, optionally, the exact positions of the traffic light
lenses.
To find out in which direction the traffic light is facing, the
surface normal of the corresponding bounding polygon is used.
If two or more traffic light faces have the same traffic light layout, they are
stored together in the same traffic light face list as a single attribute
property of the `TRAFFIC_LIGHTS` attribute.

The following figure shows a typical scenario at an intersection with three
lanes. The traffic lights for the two lanes on the left have the same traffic
light layout and are therefore stored in the same `TRAFFIC_LIGHTS` attribute.
Both traffic lights have a separate entry in the traffic face list.
The traffic light on the right has an additional green arrow for turning right.
This traffic light has a separate traffic light layout with a single traffic
light face and is stored in a separate `TRAFFIC_LIGHTS` attribute at the same
position as the traffic light on the left.

![Overhead traffic lights](assets/traffic_light_layouts_and_faces.png)


!*/

/** List of traffic light faces that all have the same layout. */
struct TrafficLightFaceList
{
  /** Set to `true` if traffic light faces have detailed 3D positions of lenses. */
  bool hasLensPositions;

  /** Traffic light faces that are stored in the list. */
   TrafficLightFace(hasLensPositions) faces[];
};

/** A single face of a traffic light housing with optional positions of lenses. */
struct TrafficLightFace(bool hasLensPositions)
{
  /**
    * Traffic light face described by a planar 3D bounding polygon.
    * The surface normal of the polygon describes in which direction
    * the traffic light is facing.
    */
  BoundingPolygon3D(0,0) face;

  /**
    * List of lens positions. The lenses are ordered the same way as in the
    * traffic light layout.
    */
  Position3D(0,0) lensPositions[];
};

/** Layout definition of a traffic light. */
struct TrafficLightLayout
{
  /**
    * Construction type of the traffic light, for example, a vertical or a
    * horizontal traffic light.
    */
  TrafficLightConstructionType constructionType;

  /**
    * Number of lenses of the traffic light. Lenses are counted from
    * top to bottom for vertical and left to right for horizontal construction
    * types.
    * Lenses in a doghouse traffic light are counted as follows:
    * Start in the left column and count from top to bottom, then continue with
    * the right column and count from top to bottom.
    */
  bit:4 numLenses;

  /** Provides information about the lenses of a traffic light. */
  TrafficLightLens lensValue[numLenses];
};

/** Identifier of a group of lenses that switch state together. */
subtype bit:4 TrafficLightLensGroup;

/** Description of a single traffic light lens. */
struct TrafficLightLens
{
  /**
    * Set to `true` for a lens that is part of a group of lenses that switch
    * state together.
    * Set to `false` for a single switching lens with on and off state.
    */
  bool groupedLens;

  /** Lens group identifier. */
  TrafficLightLensGroup group if groupedLens;

  /** Lens type. */
  TrafficLightLensType lensType;

  /** Lens details for simple and animated lenses. */
  TrafficLightLensDetails lensDetails if lensType != TrafficLightLensType.MIXED;

  /** Lens details for mixed lenses. */
  TrafficLightLensDetails lensDetailList[] if lensType == TrafficLightLensType.MIXED;
};

/** Details of a single traffic light lens. */
struct TrafficLightLensDetails
{
  /** Defines the color of a traffic light lens.*/
  TrafficLightLensColor color;

  /**
   * Defines if the inlay of a lens has an inverted lighting.
   * Set to `true` if the symbol is black on a colored background.
   * Set to `false` if the symbol is lit up on a dark background.
   */
  bool isInverted;

  /** Defines the inlay type of a lens. */
  TrafficLightInlayType inlayType;
};

/** Defines the color of a lens. */
enum bit:3 TrafficLightLensColor
{
  /** Lens color is unknown. */
  UNKNOWN,

  /** Lens color is red. */
  RED,

  /** Lens color is amber. */
  AMBER,

  /** Lens color is green. */
  GREEN,

  /** Lens color is white. */
  WHITE,

  /** Lens color is blue. */
  BLUE,

  /** Lens has a different color, which is known but not defined in NDS.Live. */
  OTHER_COLOR
};

/*!

The following figure gives an overview of the available inlay types:

![Traffic light inlay types](assets/traffic_light_inlays.png)

!*/


/** Type of inlay that is displayed on a lens. */
enum uint8 TrafficLightInlayType
{
  /** Inlay type is not known. */
  UNKNOWN,

  /** Lens has no inlay. */
  NONE,

  /** Lens has an inlay with an up arrow. */
  ARROW_UP,

  /** Lens has an inlay with a down arrow. */
  ARROW_DOWN,

  /** Lens has an inlay with a left arrow. */
  ARROW_LEFT,

  /** Lens has an inlay with an up-left arrow. */
  ARROW_UP_LEFT,

  /** Lens has an inlay with a down-left arrow. */
  ARROW_DOWN_LEFT,

  /** Lens has an inlay with a right arrow. */
  ARROW_RIGHT,

  /** Lens has an inlay with an up-right arrow. */
  ARROW_UP_RIGHT,

  /** Lens has an inlay with a down-right arrow. */
  ARROW_DOWN_RIGHT,

  /** Lens has an inlay with a U-turn arrow. */
  ARROW_U_TURN,

  /** Lens has an inlay with a left-right arrow. */
  ARROW_LEFT_RIGHT,

  /** Lens has an inlay with a straight left arrow. */
  ARROW_STRAIGHT_LEFT,

  /** Lens has an inlay with a straight right arrow. */
  ARROW_STRAIGHT_RIGHT,

  /** Lens has an inlay with a straight left-right arrow. */
  ARROW_STRAIGHT_LEFT_RIGHT,

  /**
   * Lens has an inlay with a symbol of a pedestrian of any gender or variations
   * that are recognizable as pedestrians.
   */
  PEDESTRIAN,

  /** Lens has an inlay with a symbolic bicycle without a cyclist. */
  BICYCLE,

  /** Lens has an inlay with the symbols of a pedestrian and a bicycle at the same time. */
  PEDESTRIAN_BICYCLE,

  /** Lens has an inlay with a symbolic hand. */
  HAND,

  /** Lens has an inlay with a symbol of a tram or train. */
  TRAM,

  /** Lens has an inlay with a symbol of a bus. */
  BUS,

  /**
   * Lens has an inlay with a countdown showing the remaining time before the
   * signal changes to another phase. For example, the value changes every second
   * or minute.
   */
  COUNTDOWN,

  /**
    * Lens has an inlay with a symbol of a horizontal bar, for example, a tram
    * signal indicating to stop.
    */
  BAR_HORIZONTAL,

  /**
    * Lens has an inlay with a symbol of a straight vertical bar, for example,
    * a tram signal indicating to go straight.
    */
  BAR_STRAIGHT,

  /**
    * Lens has an inlay with a symbol of a bar that is slanted to the left,
    * for example, a tram signal indicating to turn left.
    */
  BAR_LEFT,

  /**
    * Lens has an inlay with a symbol of a bar that is slanted to the right,
    * for example, a tram signal indicating to turn right.
    */
  BAR_RIGHT,

  /** Lens has an inlay with two vertical bars. */
  BAR_DOUBLE_STRAIGHT,

  /**
    * Lens has an inlay with a triangle symbol, for example, a tram signal
    * indicating that the tram is allowed to go.
    */
  TRIANGLE,

  /**
    * Lens has an inlay with a circle symbol, for example, a tram signal
    * indicating that a halt is expected.
    */
  CIRCLE,

  /** Lens has an inlay with a plus symbol. */
  PLUS,

  /** Lens has an inlay with a cross symbol. */
  CROSS,

  /** Lens has an inlay with a ring of circles.  */
  CIRCLE_RING,

  /** Lens has an inlay with a matrix of circles. */
  CIRCLE_MATRIX,

  /** Lens has an inlay with a one or more characters that have a special meaning. */
  LETTER,

  /**
   * Lens has an inlay with a meaningful text, for example, a pedestrian together
   * with the text "Don't Walk".
   */
  TEXT,

  /**
   * Lens has an inlay with a numbers, for example, the optimal speed to catch
   * the next traffic light during the green phase. The numbers do not
   * changing at regular intervals.
   */
  NUMBERS,

  /** Lens has another type of inlay.  */
  OTHER,
};


/** Lens type with regards to animation and inlays. */
enum bit:3 TrafficLightLensType
{
  /** Simple switching lens with on and off state. */
  SIMPLE,

  /**
    * Lens is part of a doghouse construction and is shared between the housings.
    * Often, the red light is shared.
    */
  DOGHOUSE_SHARED,

  /** Lens shows an animated inlay in the on phase of a switching cycle. */
  ANIMATED,

  /**
    * Lens has different inlays that are switched for different phases of a
    * switching cycle.
    */
  MIXED,
};

/** Construction type of a traffic light.*/
enum bit:2 TrafficLightConstructionType
{
  /** Horizontal construction. */
  HORIZONTAL,

  /** Vertical construction. */
  VERTICAL,

  /**
    * Horizontal doghouse construction, that is, the columns are ordered horizontally
    * from top to bottom, and there are shared lights between the columns.
    * Also used for other combinations of horizontal multi-column traffic lights,
    * for example, 5-section traffic lights.
    */
  DOGHOUSE_HORIZONTAL,

  /**
    * Vertical doghouse construction, that is, the columns are ordered vertically
    * from left to right, and there are shared lights between the columns.
    * Also used for other combinations of vertical multi-column traffic lights,
    * for example, 5-section traffic lights.
    */
  DOGHOUSE_VERTICAL,
};

/*!

### Other Traffic Light Properties


The following figures illustrate different usage types for traffic lights:

![Traffic lights at an intersection](assets/TrafficLight-Intersection.jpg)

![Traffic lights for lane control](assets/TrafficLight-LaneControl.jpg)

![Traffic light indicating the recommended speed](assets/TrafficLight-RecommendedSpeedSign.jpg)

!*/



/** Usage type of traffic lights. */
enum uint8 TrafficLightUsageType
{
  /** Traffic light at an intersection.
    * Is also used if there is a pedestrian crossing at an intersection.
    */
  INTERSECTION,

  /** Traffic light for controlling traffic flow entering motorways. */
  RAMP_METER,

  /** Traffic light at a toll booth. */
  TOLL_BOOTH,

  /**
   * Traffic light for vehicles at a pedestrian crossing.
   * If there is a pedestrian crossing at an intersection, the usage type
   * `INTERSECTION` is used. Lights warning vehicles to
   * look out for pedestrians use `WARNING_LIGHT`.
   */
  PEDESTRIAN_CROSSING,

  /**
   * Traffic light that signals to stop for crossing bicycles.
   * Lights warning vehicles to look out for bicycles use `WARNING_LIGHT`.
   */
  BICYCLE_CROSSING,

  /** Traffic light for controlling traffic when entering a tunnel. */
  TUNNEL,

  /** Traffic light for controlling traffic when entering a bridge. */
  BRIDGE,

  /**
   * Traffic light controlling lane usage, usually indicated with "open",
   * "leave", or "closed".
   */
  LANE_CONTROL,

  /**
   * Traffic light at a railway crossing, warning the vehicles not to
   * cross the tracks.
   */
  RAILWAY_CROSSING,

  /**
   * Traffic light at a tram crossing, warning the vehicles not to
   * cross the tracks. Lights warning vehicles to look out for trams
   * use `WARNING_LIGHT`.
   */
  TRAM_CROSSING,

  /**
   * Traffic light that shows the recommended speed to approach the next traffic
   * light in its green phase.
   */
  SPEED_SIGN,

  /** Warning light indicating a general warning. */
  WARNING_LIGHT,

  /**
    * Warning light in advance of another traffic light, mostly used to
    * inform drivers of an intersection traffic light ahead. The advance
    * warning light does not regulate traffic.
    */
  ADVANCE_WARNING_LIGHT,

  /** Traffic light that applies to pedestrians. */
  PEDESTRIAN,
};


/** Target group for whom a traffic light is valid. */
bitmask varuint16 TrafficLightTargetGroup
{
  /** Traffic light for vehicles, for example, a truck, a car, or a motorcycle. */
  VEHICLE,

  /** Traffic light for pedestrians only. */
  PEDESTRIAN,

  /** Traffic light for bicycles only. */
  BICYCLE,

  /** Special traffic light for public transport, for example, trams or buses. */
  PUBLIC_TRANSPORT,

  /** Traffic light for trains only. */
  RAILWAY,
};

/** Cycle of traffic light phases. */
struct TrafficLightCycle
{
  /** Number of total lenses of the traffic light. */
  bit:4 numLenses;

  /** Phases of the traffic light cycle in order of appearance. */
  TrafficLightPhase(numLenses) phases[];
};

/** Phase of a traffic light that relates a meaning to a set of active lenses. */
struct TrafficLightPhase(bit:4 numLenses)
{
  /**
    * Set all lenses to `true` that are active, that is, lit.
    * Set all lenses to `false` that are off or blinking.
    */
  bool activeLense[numLenses];

  /**
    * Set all lenses to `true` that are blinking.
    * Set all lenses to `false` that are either off or lit.
    */
  bool blinkingLense[numLenses];

  TrafficLightPhaseMeaning meaning;
};

/** Meaning of a traffic light phase. */
enum uint8 TrafficLightPhaseMeaning
{
  /**
    * Lights are switched off.
    * May also be used for amber light flashing or similar situations.
    */
  OFF,

  /** Stop and wait for next phase, typically indicated with a red light. */
  STOP_WAIT,

  /**
    * Traffic light indicates that it can be passed, but oncoming traffic might
    * have right-of-way, typically indicated with a green light.
    */
  GO,

  /**
    * Traffic light indicates that it can be passed.
    * Oncoming traffic has to wait, typically indicated with a a green arrow for
    * protected left.
    */
  PROTECTED_GO,

  /** Next phase is `STOP_WAIT`, typically indicated with an amber light. */
  STOP_WAIT_EXPECTED,

  /** Next phase is `GO`, typically indicated with red and amber light. */
  PREPARE_TO_GO,

  /**
    * The traffic light can be passed, after the vehicle stopped at the location,
    * typically indicated with a flashing ramp meter.
    */
  STOP_GO,
};
