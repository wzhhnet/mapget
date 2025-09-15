/*!

# Rules Attributes

This package defines attributes that are available in the Rules module.

**Dependencies**

!*/

package rules.attributes;

import core.types.*;
import signs.warning.*;
import rules.types.*;

/*!

## Rules Attributes for Regions

The following attributes describe rules that apply to regions.
These attributes can be assigned using the `RegionValidity`, which describes
to which road types the rules apply.

!*/

rule_group RegionRuleRules
{
  /*!
  Region Rule Applicable to Complete Region:

  If a rule applies to a complete region without further definition,
  the road type set in `RegionValidity.roads` shall only contain one entry
  with `form` set to `ANY`.
  !*/

  rule "rules-0fmmq9-I";

  /*!
  Official Languages Present in Metadata:

  All language codes that are used in the `OFFICIAL_LANGUAGES` attribute shall be
  present in the `availableLanguages` list of the region rules attribute layer's
  metadata.
  !*/

  rule "rules-0fmmu6";
};

/** Attribute types for the region rules attribute layer. */
enum varuint16 RulesRegionAttributeType
{
  /** Maximum allowed blood alcohol concentration in mg/g. */
  BLOOD_ALCOHOL_CONTENT_LIMIT,

  /** Legal requirement to carry a warning triangle. */
  WARNING_TRIANGLE_REQUIRED,

  /** Legal requirement to carry a first-aid kit. */
  FIRST_AID_KIT_REQUIRED,

  /** Legal requirement to carry a high-visibility reflective safety vest. */
  SAFETY_VESTS_REQUIRED,

  /** Legal requirement to carry a breathalyzer. */
  BREATHALIZER_REQUIRED,

  /** Turning allowed, even if a traffic light shows red. */
  TURN_ON_RED_ALLOWED,

  /** Lights must be switched on during daylight hours. */
  DAYTIME_RUNNING_LIGHT,

  /** Administrative speed limit default for the region in kilometers per hour. */
  ADMIN_SPEED_LIMIT_METRIC,

  /** Administrative speed limit default for the region in miles per hour. */
  ADMIN_SPEED_LIMIT_IMPERIAL,

  /** Administrative minimum speed default for the region in kilometers per hour. */
  ADMIN_MINIMUM_SPEED_METRIC,

  /** Administrative minimum speed default for the region in miles per hour. */
  ADMIN_MINIMUM_SPEED_IMPERIAL,

  /** Administrative advisory speed limit default for the region in kilometers per hour. */
  ADMIN_ADVISORY_SPEED_LIMIT_METRIC,

  /** Administrative advisory speed limit default for the region in kilometers per hour. */
  ADMIN_ADVISORY_SPEED_LIMIT_IMPERIAL,

  /**
    * Vignette information. The vehicle types that need a vignette are defined
    * in the conditions.
    */
  TOLL_VIGNETTE_INFO,

  /** List of currencies. */
  REGION_CURRENCIES,

  /** Driving rules that are valid in the region. */
  REGION_DRIVING_RULES,

  /** Information about when the vehicle lights must be switched on. */
  LIGHT_CONDITIONS,

  /** Toll requires payment with registration of the individual vehicle. */
  REQUIRES_TOLL_REGISTRATION,

  /** Information about when it is winter season. */
  WINTER_SEASON,

  /** Legal requirement to have winter tires on the vehicle. */
  WINTER_TIRES_REQUIRED,

  /** Legal requirement to carry a fire extinguisher. */
  FIRE_EXTINGUISHER_REQUIRED,

  /** Legal requirement to carry a tow rope. */
  TOW_ROPE_REQUIRED,

  /** Detailed designation of the region according to ISO 3166. */
  ISO_DETAILS,

  /** Driving side. */
  RIGHT_HAND_TRAFFIC,

  /** System of measurement of the region. */
  SYSTEM_OF_MEASUREMENT,

  /**
    * General travel prohibition. This attribute is combined with conditions
    * that express to whom and when the prohibition applies.
    */
  PROHIBITED_PASSAGE,

  /** Time zone of the region. */
  TIME_ZONE,

  /** Official languages of the region. */
  OFFICIAL_LANGUAGES,

  /** Maximum allowed speed to be set by cruise control systems in kilometers per hour. */
  MAX_CRUISE_CONTROL_SPEED_METRIC,

  /** Maximum allowed speed to be set by cruise control systems in miles per hour. */
  MAX_CRUISE_CONTROL_SPEED_IMPERIAL,
};

choice RulesRegionAttributeValue(RulesRegionAttributeType type) on type
{
  case BLOOD_ALCOHOL_CONTENT_LIMIT:
              BloodAlcoholContentLimit bloodAlcoholContentLimit;
  case WARNING_TRIANGLE_REQUIRED:
              WarningTriangleRequired warningTriangleRequired;
  case FIRST_AID_KIT_REQUIRED:
              FirstAidKitRequired firstAidKitRequired;
  case SAFETY_VESTS_REQUIRED:
              SafetyVestsRequired safetyVestsRequired;
  case BREATHALIZER_REQUIRED:
              BreathalizerRequired breathalizerRequired;
  case TURN_ON_RED_ALLOWED:
              TurnOnRedAllowed turnOnRedAllowed;
  case DAYTIME_RUNNING_LIGHT:
              DaytimeRunningLight daytimeRunningLight;
  case ADMIN_SPEED_LIMIT_METRIC:
              AdminSpeedLimitKmh adminSpeedLimitKmh;
  case ADMIN_SPEED_LIMIT_IMPERIAL:
              AdminSpeedLimitMph adminSpeedLimitMph;
  case ADMIN_MINIMUM_SPEED_METRIC:
              AdminMinimumSpeedKmh adminMinimumSpeedKmh;
  case ADMIN_MINIMUM_SPEED_IMPERIAL:
              AdminMinimumSpeedMph adminMinimumSpeedMph;
  case ADMIN_ADVISORY_SPEED_LIMIT_METRIC:
              AdminAdvisorySpeedLimitKmh adminAdvisorySpeedLimitKmh;
  case ADMIN_ADVISORY_SPEED_LIMIT_IMPERIAL:
              AdminAdvisorySpeedLimitMph adminAdvisorySpeedLimitMph;
  case TOLL_VIGNETTE_INFO:
              TollVignetteInfo tollVignetteInfo;
  case REGION_CURRENCIES:
              RegionCurrencies regionCurrencies;
  case REGION_DRIVING_RULES:
              RegionDrivingRules regionDrivingRules;
  case LIGHT_CONDITIONS:
              VehicleLightConditions vehicleLightConditions;
  case REQUIRES_TOLL_REGISTRATION:
              RequiresTollRegistration requiresTollRegistration;
  case WINTER_SEASON:
              WinterSeason winterSeason;
  case WINTER_TIRES_REQUIRED:
              WinterTiresRequired winterTiresRequired;
  case FIRE_EXTINGUISHER_REQUIRED:
              FireExtinguisherRequired fireExtinguisherRequired;
  case TOW_ROPE_REQUIRED:
              TowRopeRequired towRopeRequired;
  case ISO_DETAILS:
              IsoDetails IsoDetails;
  case RIGHT_HAND_TRAFFIC:
              RightHandTraffic rightHandTraffic;
  case SYSTEM_OF_MEASUREMENT:
              SystemOfMeasurement systemOfMeasurement;
  case PROHIBITED_PASSAGE:
              ProhibitedPassage prohibitedPassage;
  case TIME_ZONE:
              TimeZone timeZone;
  case OFFICIAL_LANGUAGES:
              OfficialLanguages officialLanguages;
  case MAX_CRUISE_CONTROL_SPEED_METRIC:
              MaxCruiseControlSpeedKmh maxCruiseControlSpeedKmh;
  case MAX_CRUISE_CONTROL_SPEED_IMPERIAL:
              MaxCruiseControlSpeedMph maxCruiseControlSpeedMph;
};

/*!

## Rules Attributes for Road Transitions

The following attributes describe rules applying to road transitions across
intersections.

!*/

/** Transition attribute types for roads. */
enum varuint16 RulesTransitionAttributeType
{
  /** Specifies right-of-way regulations at intersections and transitions. */
  RIGHT_OF_WAY_REGULATION,

  /** Specifies whether turning on a red traffic light is allowed. */
  TURN_ON_RED_ALLOWED,

  /** Turn is prohibited on the transition. */
  PROHIBITED_TRANSITION,

  /** Automated driving is only allowed up to the specified level. */
  AUTOMATED_DRIVING_CLEARANCE,

  /** Preferred transition for a U-turn in an intersection. */
  PREFERRED_U_TURN,
};

choice RulesTransitionAttributeValue(RulesTransitionAttributeType type) on type
{
  case RIGHT_OF_WAY_REGULATION:
              RightOfWayType rightOfWayType;

  case TURN_ON_RED_ALLOWED:
              TurnOnRedAllowed turnOnRedAllowed;

  case PROHIBITED_TRANSITION:
              ProhibitedTransition prohibitedTransition;

  case AUTOMATED_DRIVING_CLEARANCE:
              AutomatedDrivingClearance automatedDrivingClearance;

  case PREFERRED_U_TURN:
              PreferredUTurn preferredUTurn;
};

/*!

## Rules Attributes for Lane Transitions

The following attributes describe rules applying to lane transitions within
intersection lane groups.

!*/

/** Transition attribute types for lanes. */
enum varuint16 RulesLaneTransitionAttributeType
{
  /** Specifies whether turning on a red traffic light is allowed. */
  TURN_ON_RED_ALLOWED,

  /** Turn is prohibited . */
  PROHIBITED_TRANSITION,

  /** Preferred U-turn within an intersection lane group. */
  PREFERRED_U_TURN,
};

choice RulesLaneTransitionAttributeValue(RulesLaneTransitionAttributeType type) on type
{
  case TURN_ON_RED_ALLOWED:
              TurnOnRedAllowed turnOnRedAllowed;

  case PROHIBITED_TRANSITION:
              ProhibitedTransition prohibitedTransition;

  case PREFERRED_U_TURN:
              PreferredUTurn preferredUTurn;
};

/*!

## Rules Attributes for Roads

The following attributes describe rules applying to ranges or positions on a road.

!*/

/** Rules attributes applying to ranges on a road. */
enum varuint16 RulesRoadRangeAttributeType
{

  /** Passage is prohibited. */
  PROHIBITED_PASSAGE,

  /** Overtaking is prohibited. */
  OVERTAKING_PROHIBITION,

  /** Speed limit in kilometers per hour. */
  SPEED_LIMIT_METRIC,

  /** Speed limit in miles per hour. */
  SPEED_LIMIT_IMPERIAL,

  /** Minimum speed in kilometers per hour. */
  MINIMUM_SPEED_METRIC,

  /** Minimum speed in miles per hour. */
  MINIMUM_SPEED_IMPERIAL,

  /** Speed limit in kilometers per hour that is recommended by a governing body but is not enforced. */
  ADVISORY_SPEED_LIMIT_METRIC,

  /** Speed limit in miles per hour that is recommended by a governing body but is not enforced. */
  ADVISORY_SPEED_LIMIT_IMPERIAL,

  /** Traffic enforcement zone. */
  TRAFFIC_ENFORCEMENT_ZONE,

  /**
    * Indicates that the driving side of a feature deviates from the default.
    * For example, if the region metadata defines right-hand traffic
    * but some features in a tile have left-hand traffic, then this
    * attribute is assigned to those features.
    */
  NON_DEFAULT_DRIVING_SIDE,

  /** Traffic zone representing an area with special traffic conditions. */
  TRAFFIC_ZONE,

  /** European ADR tunnel category for the carriage of dangerous goods. */
  ADR_TUNNEL_CATEGORY,

  /** License plate restriction applies. */
  LICENSE_PLATE_RESTRICTION,

  /** Road or mountain pass is closed in certain seasons. */
  SEASONAL_CLOSED,

  /**
    * Parking is not allowed on the road that is represented by the feature the
    * attribute is assigned to.
    */
  PROHIBITED_PARKING,

  /**
    * Stopping is not allowed on the road that is represented by the feature the
    * attribute is assigned to.
    */
  PROHIBITED_STOPPING,

  /** Vehicles are not allowed to stop inside the zone. */
  DONT_STOP_ZONE,

  /** Automated driving is only allowed up to the specified level. */
  AUTOMATED_DRIVING_CLEARANCE,

  /** Roadworks that affect the road. */
  ROADWORKS,

  /**
    * U-turns are prohibited on the complete road, because a physical sign
    * with a U-turn prohibition is located next to the road.
    *
    * The attribute is not assigned to multi-digitized roads.
    */
  PROHIBITED_U_TURN,

  /** Traffic on the road is managed by a traffic management system. */
  TRAFFIC_MANAGED,
};

choice RulesRoadRangeAttributeValue(RulesRoadRangeAttributeType type) on type
{
  case PROHIBITED_PASSAGE:
          ProhibitedPassage prohibitedPassage;
  case OVERTAKING_PROHIBITION:
          OvertakingProhibition overtakingProhibition;
  case SPEED_LIMIT_METRIC:
          SpeedLimitKmh speedLimitKmh;
  case SPEED_LIMIT_IMPERIAL:
          SpeedLimitMph speedLimitMph;
  case MINIMUM_SPEED_METRIC:
          MinimumSpeedKmh minimumSpeedKmh;
  case MINIMUM_SPEED_IMPERIAL:
          MinimumSpeedMph minimumSpeedMph;
  case ADVISORY_SPEED_LIMIT_METRIC:
          AdvisorySpeedLimitKmh advisorySpeedLimitKmh;
  case ADVISORY_SPEED_LIMIT_IMPERIAL:
          AdvisorySpeedLimitMph advisorySpeedLimitMph;
  case TRAFFIC_ENFORCEMENT_ZONE:
          TrafficEnforcementZone trafficEnforcementZone;
  case NON_DEFAULT_DRIVING_SIDE:
          NonDefaultDrivingSide nonDefaultDrivingSide;
  case TRAFFIC_ZONE:
          TrafficZone trafficZone;
  case ADR_TUNNEL_CATEGORY:
          AdrTunnelCategory adrTunnelCategory;
  case LICENSE_PLATE_RESTRICTION:
          LicensePlateRestriction licensePlateRestriction;
  case SEASONAL_CLOSED:
          SeasonalClosed seasonalClosed;
  case PROHIBITED_PARKING:
          ProhibitedParking prohibitedParking;
  case PROHIBITED_STOPPING:
          ProhibitedStopping prohibitedStopping;
  case DONT_STOP_ZONE:
          DontStopZone dontStopZone;
  case AUTOMATED_DRIVING_CLEARANCE:
          AutomatedDrivingClearance automatedDrivingClearance;
  case ROADWORKS:
          Roadworks roadworks;
  case PROHIBITED_U_TURN:
        ProhibitedUTurn prohibitedUTurn;
  case TRAFFIC_MANAGED:
        TrafficManaged trafficManaged;
};


/** Rules attributes applying to positions on a road. */
enum varuint16 RulesRoadPositionAttributeType
{
  /**
    * Indicates the existence of one or more traffic lights valid for this
    * position. The attribute is assigned to the stopping position of a vehicle,
    * not the position where the traffic signal head itself is located.
    * Properties are used to add more detailed information about traffic lights,
    * for example, 3D positions or usage types.
    */
  TRAFFIC_LIGHTS,

  /** Indicates the existence of a traffic enforcement camera. */
  TRAFFIC_ENFORCEMENT_CAMERA,

  /** Indicates the existence of a warning sign. */
  WARNING_SIGN,

  /**
    * Indicates the existence of a warning sign that can be moved over time.
    * Movable warning signs are usually metal signs with a stand, which can be
    * put up where needed.
    */
  MOVABLE_WARNING_SIGN,
};

choice RulesRoadPositionAttributeValue(RulesRoadPositionAttributeType type) on type
{
  case TRAFFIC_LIGHTS:
            TrafficLights trafficLights;
  case TRAFFIC_ENFORCEMENT_CAMERA:
            TrafficEnforcementCamera trafficEnforcementCamera;
  case MOVABLE_WARNING_SIGN:
          MovableWarningSign movableWarningSign;
  case WARNING_SIGN:
          WarningSign warningSign;
};

/*!

## Rules Attributes for Lanes

The following attributes describe rules applying to ranges or positions on a lane.

Some attribute types do not make sense for a single lane but rather for lane
groups or parts of lane groups. When used for lane groups, these rules
resemble road rules.

!*/

rule_group LaneRuleRules
{
  /*!
  Right-of-way Regulations Within the Same Lane Group:

  All lanes that are referenced by the `LANE_RIGHT_OF_WAY_REGULATION` attribute
  shall be part of the lane group that the attribute is assigned to.
  !*/

  rule "rules-rma8cu";

  /*!
  No Combination of Right-of-way Regulation Types in One Lane Group:

  A lane group shall only contain one of the attribute types for right-of-way
  regulations, either the detailed `LANE_RIGHT_OF_WAY_REGULATION` or
  the simple `RIGHT_OF_WAY_REGULATION`.
  !*/

  rule "rules-6aigco";
};

/**
  * Rules attributes applying to ranges on lanes and lane groups.
  *
  * Includes attribute types that do not make sense for a single lane but rather
  * for lane groups or lane group parts. When used for lane groups, these rules
  * resemble road rules.
  */
enum varuint16 RulesLaneRangeAttributeType
{
  /** Passage is prohibited. */
  PROHIBITED_PASSAGE,

  /** Overtaking is prohibited. */
  OVERTAKING_PROHIBITION,

  /** Speed limit in kilometers per hour. */
  SPEED_LIMIT_METRIC,

  /** Speed limit in miles per hour. */
  SPEED_LIMIT_IMPERIAL,

  /** Minimum speed required in kilometers per hour. */
  MINIMUM_SPEED_METRIC,

  /** Minimum speed required in miles per hour. */
  MINIMUM_SPEED_IMPERIAL,

  /** Speed limit that is recommended by a governing body but is not enforced in kilometers per hour. */
  ADVISORY_SPEED_LIMIT_METRIC,

  /** Speed limit that is recommended by a governing body but is not enforced in miles per hour. */
  ADVISORY_SPEED_LIMIT_IMPERIAL,

  /** Traffic enforcement zone. */
  TRAFFIC_ENFORCEMENT_ZONE,

  /** Traffic zone representing an area with special traffic conditions. */
  TRAFFIC_ZONE,

  /** Road or mountain pass is closed in certain seasons. */
  SEASONAL_CLOSED,

  /** Vehicles are not allowed to stop inside the zone. */
  DONT_STOP_ZONE,

  /**
    * Parking is not allowed on the road that is represented by the feature the
    * attribute is assigned to.
    */
  PROHIBITED_PARKING,

  /**
    * Stopping is not allowed on the road that is represented by the feature the
    * attribute is assigned to.
    */
  PROHIBITED_STOPPING,

  //TRAFFIC_PRIORITY,

  /** Automated driving is only allowed up to the specified level. */
  AUTOMATED_DRIVING_CLEARANCE,

  /** Roadworks that affect the lane. */
  ROADWORKS,

  /**
    * Specifies right-of-way regulations between the lanes of one lane group.
    * The attribute is assigned to a range on the source lane and defines a
    * complex right-of-way regulation with relations to other lanes.
    */
  LANE_RIGHT_OF_WAY_REGULATION,

  /**
    * Identifies one or more ranges of other lanes that
    * have priority over the lane to which this attribute is assigned.
    */
  LANE_TRAFFIC_PRIORITY,

  /**
    * U-turns are prohibited in the complete lane group, because a physical sign
    * with a U-turn prohibition is located next to the road.
    */
  PROHIBITED_U_TURN,

  /** Traffic on the lane or lane group is managed by a traffic management system. */
  TRAFFIC_MANAGED,
};

choice RulesLaneRangeAttributeValue(RulesLaneRangeAttributeType type) on type
{
  case PROHIBITED_PASSAGE:
          ProhibitedPassage prohibitedPassage;
  case OVERTAKING_PROHIBITION:
          OvertakingProhibition overtakingProhibition;
  case SPEED_LIMIT_METRIC:
          SpeedLimitKmh speedLimitKmh;
  case SPEED_LIMIT_IMPERIAL:
          SpeedLimitMph speedLimitMph;
  case MINIMUM_SPEED_METRIC:
          MinimumSpeedKmh minimumSpeedKmh;
  case MINIMUM_SPEED_IMPERIAL:
          MinimumSpeedMph minimumSpeedMph;
  case ADVISORY_SPEED_LIMIT_METRIC:
          AdvisorySpeedLimitKmh advisorySpeedLimitKmh;
  case ADVISORY_SPEED_LIMIT_IMPERIAL:
          AdvisorySpeedLimitMph advisorySpeedLimitMph;
  case TRAFFIC_ENFORCEMENT_ZONE:
          TrafficEnforcementZone trafficEnforcementZone;
  case TRAFFIC_ZONE:
          TrafficZone trafficZone;
  case SEASONAL_CLOSED:
          SeasonalClosed seasonalClosed;
  case DONT_STOP_ZONE:
          DontStopZone dontStopZone;
  case PROHIBITED_PARKING:
          ProhibitedParking prohibitedParking;
  case PROHIBITED_STOPPING:
          ProhibitedStopping prohibitedStopping;
  case AUTOMATED_DRIVING_CLEARANCE:
          AutomatedDrivingClearance automatedDrivingClearance;
  case ROADWORKS:
          Roadworks roadworks;
  case LANE_RIGHT_OF_WAY_REGULATION:
          LaneRightOfWayRegulation laneRightOfWayRegulation;
  case LANE_TRAFFIC_PRIORITY:
          LaneTrafficPriority laneTrafficPriority;
  case PROHIBITED_U_TURN:
          ProhibitedUTurn prohibitedUTurn;
  case TRAFFIC_MANAGED:
          TrafficManaged trafficManaged;
};

/** Rules attributes applying to positions on a lane. */
enum varuint16 RulesLanePositionAttributeType
{
  /**
    * Indicates the existence of one or more traffic lights valid for this
    * position. The attribute is assigned to the stopping position of a vehicle,
    * not the position where the traffic signal head itself is located.
    * Properties are used to add more detailed information about traffic lights,
    * for example, 3D positions or usage types.
    */
  TRAFFIC_LIGHTS,

  /** Indicates the existence of a traffic enforcement camera. */
  TRAFFIC_ENFORCEMENT_CAMERA,

  /** Indicates the existence of a warning sign. */
  WARNING_SIGN,

  /**
    * Indicates the existence of a warning sign that can be moved over time.
    * Movable warning signs are usually metal signs with a stand, which can be
    * put up where needed.
    */
  MOVABLE_WARNING_SIGN,

  /**
    * Specifies simple right-of-way regulations at lanes that are not related to
    * other lanes. The attribute is assigned to the position where the rule applies,
    * such as a stop position.
    *
    * Use the `LANE_RIGHT_OF_WAY_REGULATION` attribute to describe complex
    * right-of-way regulations with relations to other lanes.
    */
  RIGHT_OF_WAY_REGULATION,
};

choice RulesLanePositionAttributeValue(RulesLanePositionAttributeType type) on type
{
  case TRAFFIC_LIGHTS:
          TrafficLights trafficLights;
  case TRAFFIC_ENFORCEMENT_CAMERA:
          TrafficEnforcementCamera trafficEnforcementCamera;
  case WARNING_SIGN:
          WarningSign warningSign;
  case MOVABLE_WARNING_SIGN:
          MovableWarningSign movableWarningSign;
  case RIGHT_OF_WAY_REGULATION:
          RightOfWayType rightOfWayType;
};

/*!

## Rules Attributes for Display Lines

The following attributes describe rules applying to range or positions on a
display line.

!*/

/** Rules attributes applying to ranges on a display line. */
enum varuint16 RulesDisplayLineRangeAttributeType
{

  /** Passage is prohibited. */
  PROHIBITED_PASSAGE,

  /** Overtaking is prohibited. */
  OVERTAKING_PROHIBITION,

  /** Speed limit in kilometers per hour. */
  SPEED_LIMIT_METRIC,

  /** Speed limit in miles per hour. */
  SPEED_LIMIT_IMPERIAL,

  /** Minimum speed in kilometers per hour. */
  MINIMUM_SPEED_METRIC,

  /** Minimum speed in miles per hour. */
  MINIMUM_SPEED_IMPERIAL,

  /** Speed limit in kilometers per hour that is recommended by a governing body but is not enforced. */
  ADVISORY_SPEED_LIMIT_METRIC,

  /** Speed limit in miles per hour that is recommended by a governing body but is not enforced. */
  ADVISORY_SPEED_LIMIT_IMPERIAL,

  /** Traffic enforcement zone. */
  TRAFFIC_ENFORCEMENT_ZONE,

  /**
    * Indicates that the driving side of a feature deviates from the default.
    * For example, if the region metadata defines right-hand traffic
    * but some features in a tile have left-hand traffic, then this
    * attribute is assigned to those features.
    */
  NON_DEFAULT_DRIVING_SIDE,

  /** Traffic zone representing an area with special traffic conditions. */
  TRAFFIC_ZONE,

  /** European ADR tunnel category for the carriage of dangerous goods. */
  ADR_TUNNEL_CATEGORY,

  /** License plate restriction applies. */
  LICENSE_PLATE_RESTRICTION,

  /** Road or mountain pass is closed in certain seasons. */
  SEASONAL_CLOSED,

  /**
    * Parking is not allowed on the road that is represented by the feature the
    * attribute is assigned to.
    */
  PROHIBITED_PARKING,

  /**
    * Stopping is not allowed on the road that is represented by the feature the
    * attribute is assigned to.
    */
  PROHIBITED_STOPPING,

  /** Vehicles are not allowed to stop inside the zone. */
  DONT_STOP_ZONE,

  /** Automated driving is only allowed up to the specified level. */
  AUTOMATED_DRIVING_CLEARANCE,

  /** Roadworks that affect the road. */
  ROADWORKS,

  /**
    * U-turns are prohibited on the complete road, because a physical sign
    * with a U-turn prohibition is located next to the road.
    */
  PROHIBITED_U_TURN,

  /** Traffic on the road represented as the display line is managed by a traffic management system. */
  TRAFFIC_MANAGED,
};

choice RulesDisplayLineRangeAttributeValue(RulesDisplayLineRangeAttributeType type) on type
{
  case PROHIBITED_PASSAGE:
          ProhibitedPassage prohibitedPassage;
  case OVERTAKING_PROHIBITION:
          OvertakingProhibition overtakingProhibition;
  case SPEED_LIMIT_METRIC:
          SpeedLimitKmh speedLimitKmh;
  case SPEED_LIMIT_IMPERIAL:
          SpeedLimitMph speedLimitMph;
  case MINIMUM_SPEED_METRIC:
          MinimumSpeedKmh minimumSpeedKmh;
  case MINIMUM_SPEED_IMPERIAL:
          MinimumSpeedMph minimumSpeedMph;
  case ADVISORY_SPEED_LIMIT_METRIC:
          AdvisorySpeedLimitKmh advisorySpeedLimitKmh;
  case ADVISORY_SPEED_LIMIT_IMPERIAL:
          AdvisorySpeedLimitMph advisorySpeedLimitMph;
  case TRAFFIC_ENFORCEMENT_ZONE:
          TrafficEnforcementZone trafficEnforcementZone;
  case NON_DEFAULT_DRIVING_SIDE:
          NonDefaultDrivingSide nonDefaultDrivingSide;
  case TRAFFIC_ZONE:
          TrafficZone trafficZone;
  case ADR_TUNNEL_CATEGORY:
          AdrTunnelCategory adrTunnelCategory;
  case LICENSE_PLATE_RESTRICTION:
          LicensePlateRestriction licensePlateRestriction;
  case SEASONAL_CLOSED:
          SeasonalClosed seasonalClosed;
  case PROHIBITED_PARKING:
          ProhibitedParking prohibitedParking;
  case PROHIBITED_STOPPING:
          ProhibitedStopping prohibitedStopping;
  case DONT_STOP_ZONE:
          DontStopZone dontStopZone;
  case AUTOMATED_DRIVING_CLEARANCE:
          AutomatedDrivingClearance automatedDrivingClearance;
  case ROADWORKS:
          Roadworks roadworks;
  case PROHIBITED_U_TURN:
          ProhibitedUTurn prohibitedUTurn;
  case TRAFFIC_MANAGED:
          TrafficManaged trafficManaged;
};

/** Rules attributes applying to positions on a display line. */
enum varuint16 RulesDisplayLinePositionAttributeType
{
  /**
    * Indicates the existence of one or more traffic lights valid for this
    * position. The attribute is assigned to the stopping position of a vehicle,
    * not the position where the traffic signal head itself is located.
    * Properties are used to add more detailed information about traffic lights,
    * for example, 3D positions or usage types.
    */
  TRAFFIC_LIGHTS,

  /** Indicates the existence of a traffic enforcement camera. */
  TRAFFIC_ENFORCEMENT_CAMERA,

  /** Indicates the existence of a warning sign. */
  WARNING_SIGN,

  /**
    * Indicates the existence of a warning sign that can be moved over time.
    * Movable warning signs are usually metal signs with a stand, which can be
    * put up where needed.
    */
  MOVABLE_WARNING_SIGN,
};

choice RulesDisplayLinePositionAttributeValue(RulesDisplayLinePositionAttributeType type) on type
{
  case TRAFFIC_LIGHTS:
            TrafficLights trafficLights;
  case TRAFFIC_ENFORCEMENT_CAMERA:
            TrafficEnforcementCamera trafficEnforcementCamera;
  case MOVABLE_WARNING_SIGN:
          MovableWarningSign movableWarningSign;
  case WARNING_SIGN:
          WarningSign warningSign;
};