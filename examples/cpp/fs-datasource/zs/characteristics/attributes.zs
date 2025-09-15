/*!

# Characteristics Attributes

This package defines the attributes that are available in the
characteristics layers.

**Dependencies**

!*/

package characteristics.attributes;

import core.types.*;
import core.geometry.*;
import characteristics.types.*;


/*!

## Characteristics Attributes for Roads

These attributes describe characteristics that correspond to points and ranges
on a road, for example, stop lines or the width of the road.

The validities of multiple `ROAD_TYPE` attributes may overlap by using the road form `ANY`.
This enables having road characteristics with different validities without
splitting the road. The application is responsible for merging overlapping characteristics.

The following figure shows an example of a dual carriageway with a bridge.
Some characteristics are valid for the complete length of the road.
The `BRIDGE` characteristic is only valid for a small section of the road.

![Overlapping road type: Bridge on a dual carriageway](assets/characteristics-overlap-road-types-bridge.png)

The following figure shows an example of a normal road. Some characteristics
are valid for the complete length of the road. The characteristic
`INSIDE_CITY_LIMITS` is only valid for a small section in the opposite
travel direction because city limit signs are often placed in different locations
for the two travel directions.

![Overlapping road type: City limits on a normal road](assets/characteristics-overlap-road-types-city-limit.png)

!*/

rule_group RoadCharacteristicRules
{
  /*!
  Non-Usage of Middle Divider:

  For dividers between individual lanes, dividers on the curbside of the road,
  or dividers between the individual directions of multi-digitized roads,
  the `MIDDLE_DIVIDER_TYPE` attribute shall not be used. Instead, the
  `DIVIDER_TYPE` attribute shall be used.
  !*/

  rule "characteristics-29uc6h";

  /*!
  Road Stubbles and Routing:

  Roads with the `STUBBLE` attribute shall not be used for routing.
  !*/

  rule "characteristics-2a3vk0-I";

  /*!
  Overlapping of Road Types:

  If overlapping `RoadType.characteristics` are present for a validity range
  on a road, the application shall combine these characteristics, provided
  that the following is true:
  One attribute has `RoadType.form` set to a value other than `ANY`.
  All other overlapping attributes have `RoadType.form` set to `ANY`.
  !*/

  rule "characteristics-02dxwj";
};

/** Characteristics that correspond to a point on a road. */
enum varuint16 CharacsRoadPositionAttributeType
{
  /** The road has a stop line. */
  STOP_LINE,

  /** The road has a waiting line. */
  WAITING_LINE,

  /** There is a stationary object on the road, for example, a toll station. */
  STATION,

  /** The road has a crossing for slow road users. */
  SLOW_ROAD_USER_CROSSING,
};

choice CharacsRoadPositionAttributeValue(CharacsRoadPositionAttributeType type) on type
{
  case STOP_LINE:
    StopLine stopLine;
  case WAITING_LINE:
    WaitingLine waitingLine;
  case STATION:
    StationaryObjectType stationaryObjectType;
  case SLOW_ROAD_USER_CROSSING:
    Line2D(0) slowRoadUserCrossing;
};

/** Characteristics that correspond to a range on a road. */
enum varuint16 CharacsRoadRangeAttributeType
{
  /** All lanes of the road are carpool lanes. */
  COMPLETE_CARPOOL_ROAD,

  /** Some lanes of the road are carpool lanes. */
  PARTIAL_CARPOOL_ROAD,

  /** Width of the road in centimeters. */
  PHYSICAL_WIDTH_METRIC,

  /** Surface of the road. */
  TYPE_OF_PAVEMENT,

  /** The road is part of a ferry connection. */
  FERRY_TYPE,

  /** Physical divider to the right or left of the road. */
  DIVIDER_TYPE,

  /** Describes whether the road leads up or down or remains level. */
  GRADE_TYPE,

  /**
  * Describes that the digital data for the road only contains the information
  * that the road exists without further details.
  * This mostly happens when only major roads are digitized. Such road stubbles are
  * required for giving correct guidance in incomplete route networks.
  */
  STUBBLE,

  /** Type of railway crossing on the road. */
  RAILWAY_CROSSING,

  /** The road has pedestrian crossings. */
  PEDESTRIAN_CROSSING,

  /** Type of vertical traffic calming measure on the road. */
  TRAFFIC_CALMING,

  /** Parts of the road are on a movable bridge. */
  MOVABLE_BRIDGE,

  /** Average superelevation of the road. */
  SUPERELEVATION,

  /** Area between two roads if there is no solid barrier. */
  ROAD_MEDIAN,

  /** There is a sidewalk adjacent to the road. */
  HAS_SIDEWALK,

  /** Friction coefficient between the tires of the vehicle and the road surface. */
  FRICTION,

  /**
  * Defines a type for the widened area before and after a station. In this area,
  * lanes are not delimited.
  */
  STATION_PLAZA_TYPE,

  /** Divider between the different travel directions in the middle of the road. */
  MIDDLE_DIVIDER_TYPE,

  /** Average speed on the road. */
  AVERAGE_SPEED,

  /**
  * Functional road class of the road. The functional road class defines the
  * importance of the road for long distance routes. Higher-class roads are more
  * likely to be used for long distance routes. Lower-class roads are more
  * likely to be used for local routes only.
  * 0 represents the highest functional road class, 7 the lowest one.
  */
  FUNCTIONAL_ROAD_CLASS,

  /**
  * Reflects the real-world priority of the road. The priority road class is
  * used for choosing the display style in the map. It can be used as an
  * additional routing attribute to the functional road class.
  * 0 represents the highest priority road class, 15 the lowest one.
  */
  PRIORITY_ROAD_CLASS,

  /** Type of the road. Describes the road in more detail. */
  ROAD_TYPE,

  /** Indicates which roads belong to the same multi-digitized road. */
  MULTI_DIGITIZED_ROAD_REFERENCE,

  /** Number of drivable lanes on the road. */
  NUM_LANES,

  /** Type of the complex intersection that the road is part of. */
  COMPLEX_INTERSECTION_TYPE,

  /** Indicates that the road is only used as start or destination of a route. */
  START_OR_DESTINATION_ROAD_ONLY,

  /** Road location ID corresponding to the road. */
  ROAD_LOCATION_ID,

  /** The road is illuminated by street lights. */
  HAS_STREET_LIGHTS,

  /** The road is shared with pedestrians. There is no sidewalk.  */
  SHARED_ROAD_SURFACE_WITH_PEDESTRIANS,

  /** The road is located within a business district. */
  IN_BUSINESS_DISTRICT,

  /** Global source ID of the road. */
  GLOBAL_SOURCE_ID,

  /**
    * Confidence in the trustworthiness of a road feature expressed
    * in percent (0-100%).
    */
  FEATURE_CONFIDENCE,

  /** Reliability of the GNSS data. */
  GNSS_RELIABILITY,

  /** Some lanes of the road are high-occupancy toll (HOT) lanes. */
  PARTIAL_CARPOOL_AND_TOLL_ROAD,

  /** Indicates the quality of the mobile network coverage on that road. */
  MOBILE_NETWORK_COVERAGE,
};

choice CharacsRoadRangeAttributeValue(CharacsRoadRangeAttributeType type) on type
{
  case COMPLETE_CARPOOL_ROAD:
    CompleteCarpoolRoad completeCarpoolRoad;
  case PARTIAL_CARPOOL_ROAD:
    PartialCarpoolRoad partialCarpoolRoad;
  case PHYSICAL_WIDTH_METRIC:
    MetricRoadWidth metricRoadWidth;
  case TYPE_OF_PAVEMENT:
    PavementType pavementType;
  case FERRY_TYPE:
    FerryType ferryType;
  case DIVIDER_TYPE:
    DividerType dividerType;
  case GRADE_TYPE:
    GradeType gradeType;
  case STUBBLE:
    Stubble stubble;
  case RAILWAY_CROSSING:
    RailwayCrossing railwayCrossing;
  case PEDESTRIAN_CROSSING:
    PedestrianCrossing pedestrianCrossing;
  case TRAFFIC_CALMING:
    TrafficCalming trafficCalming;
  case MOVABLE_BRIDGE:
    MovableBridge movableBridge;
  case SUPERELEVATION:
    SuperElevationClass superElevation;
  case ROAD_MEDIAN:
    RoadMedian roadMedian;
  case HAS_SIDEWALK:
    HasSidewalk hasSidewalk;
  case FRICTION:
    FrictionCoefficient frictionCoefficient;
  case STATION_PLAZA_TYPE:
    StationPlazaType stationPlazaType;
  case MIDDLE_DIVIDER_TYPE:
    DividerType middleDividerType;
  case AVERAGE_SPEED:
    SpeedKmh   averageSpeed;
  case FUNCTIONAL_ROAD_CLASS:
    FunctionalRoadClass functionalRoadClass;
  case PRIORITY_ROAD_CLASS:
    PriorityRoadClass priorityRoadClass;
  case ROAD_TYPE:
    RoadType roadType;
  case MULTI_DIGITIZED_ROAD_REFERENCE:
    MultiDigitizedRoadReference multiDigitizedRoadReference;
  case NUM_LANES:
    NumLanes numLanes;
  case COMPLEX_INTERSECTION_TYPE:
    ComplexIntersectionType complexIntersectionType;
  case START_OR_DESTINATION_ROAD_ONLY:
    StartOrDestinationRoadOnly startOrDestinationRoadOnly;
  case ROAD_LOCATION_ID:
    RoadLocationAssignment roadLocationId;
  case HAS_STREET_LIGHTS:
    HasStreetLights hasStreetLights;
  case SHARED_ROAD_SURFACE_WITH_PEDESTRIANS:
    SharedRoadSurfaceWithPedestrians sharedRoadSurfaceWithPedestrians;
  case IN_BUSINESS_DISTRICT:
    InBusinessDistrict inBusinessDistrict;
  case GLOBAL_SOURCE_ID:
    GlobalSourceId globalSourceId;
  case FEATURE_CONFIDENCE:
    FeatureConfidence featureConfidence : featureConfidence <= 100;
  case GNSS_RELIABILITY:
    GnssReliability gnssReliability;
  case PARTIAL_CARPOOL_AND_TOLL_ROAD:
    PartialCarpoolAndTollRoad partialCarpoolAndTollRoad;
  case MOBILE_NETWORK_COVERAGE:
    MobileNetworkCoverage mobileNetworkCoverage;
};

/*!

## Characteristics Attributes for Transitions

These attributes describe characteristics that correspond to transitions or to
complete intersections. The `INTERSECTION_TYPE` attribute defines the type of
intersection and is used on transitions of type
`TransitionReferenceType.INTERSECTION` only.

!*/

rule_group TransitionCharacteristicRules
{
  /*!
  Usage of `INTERSECTION_TYPE`:

  The attribute `INTERSECTION_TYPE` shall only be used on transitions
  of type `TransitionReferenceType.INTERSECTION`.
  !*/

  rule "characteristics-89uc6h";
};

/** Characteristics that correspond to an intersection or transition. */
enum varuint16 CharacsTransitionAttributeType
{
  /** Type of intersection. */
  INTERSECTION_TYPE,
};

choice CharacsTransitionAttributeValue(CharacsTransitionAttributeType type) on type
{
  case INTERSECTION_TYPE:
    IntersectionType intersectionType;
};

/*!

## Characteristics Attributes for Lanes

These attributes describe characteristics that correspond to points and ranges
on a lane, for example, stop lines or the width of the lane.

!*/

rule_group LaneCharacteristicRules
{
  /*!
  Shared Priority Road Classification:

  If `PRIORITY_ROAD_CLASS` is used for routing, then the same classification
  shall be used for basic map display and routing. The priority road
  classification shall be consistent on upper levels.
  !*/

  rule "characteristics-29k6oa";

  /*!
  Lane Stubbles and Routing:

  Lanes with the `STUBBLE` attribute shall not be used for routing.
  !*/

  rule "characteristics-qpeh0b-I";


  /*!
  Usage of Middle Divider for Lane Groups:

  The `MIDDLE_DIVIDER_TYPE` attribute shall only be assigned to complete
  artificial road lane groups, that is, the lane group type shall be
  `ArtificialRoadLaneGroup` and `LaneGroupRangeValidity.completeGroup` shall be
  set to `true`.

  !*/

  rule "characteristics-xxdn29";

  /*!
  Usage of Divider Type for Lane Groups:

  If the `DIVIDER_TYPE` attribute is assigned with `LaneGroupRangeValidity.completeGroup`
  set to `true`, then the referenced lane group shall be a road lane group or
  artificial road lane group. If the `DIVIDER_TYPE` is assigned with
  `LaneGroupRangeValidity.completeGroup` set to `false`, then the referenced
  lane group can be a road lane group, artificial road lane group, intersection
  lane group, or artificial intersection lane group.
  !*/

  rule "characteristics-ucjzhp";
};

/** Characteristics that correspond to a point on a lane. The characteristics
  * attributes can be assigned to one or more lanes. If the whole road is affected,
  * the attributes are assigned to the complete lane group.
  */
enum varuint16 CharacsLanePositionAttributeType
{
  /** The lane has a stop line. */
  STOP_LINE,

  /** The lane has a waiting line. */
  WAITING_LINE,

  /** The lane has a crossing for slow road users. */
  SLOW_ROAD_USER_CROSSING,

  /** There is a stationary object on the lane, for example, a toll station. */
  STATION,
};

choice CharacsLanePositionAttributeValue(CharacsLanePositionAttributeType type) on type
{
  case STOP_LINE:
    StopLine stopLine;
  case SLOW_ROAD_USER_CROSSING:
    Line3D(0,0) slowRoadUserCrossing;
  case WAITING_LINE:
    WaitingLine waitingLine;
  case STATION:
    StationaryObjectType stationaryObjectType;
};


/**
  * Characteristics that correspond to a range on a lane. The characteristics
  * attributes can be assigned to one or more lanes. If the whole road is affected,
  * the attributes are assigned to the complete lane group.
  */
enum varuint16 CharacsLaneRangeAttributeType
{
  /** Lane type characterized by different aspects. */
  LANE_TYPE,

  /**
    * Width of the lane in centimeters, that is, the width between the inner
    * edges of the innermost lane boundary markings.
    */
  PHYSICAL_WIDTH_METRIC,

  /** Surface of the lane. */
  TYPE_OF_PAVEMENT,

  /** Describes whether the lane leads up or down or remains level. */
  GRADE_TYPE,

  /** Type of railway crossing on the lane. */
  RAILWAY_CROSSING,

  /** The lane has pedestrian crossings. */
  PEDESTRIAN_CROSSING,

  /** Physical divider to the right or left of the lane. */
  DIVIDER_TYPE,

  /** Average superelevation of the lane. */
  SUPERELEVATION,

  /** Average speed on the lane. */
  AVERAGE_SPEED,

  /**
  * Functional road class of the road that the lane is part of. The functional
  * road class defines the importance of a road for long distance routes.
  * Higher-class roads are more likely to be used for long distance routes.
  * Lower-class roads are more likely to be used for local routes only.
  * 0 represents the highest functional road class, 7 the lowest one.
  */
  FUNCTIONAL_ROAD_CLASS,

  /**
  * Reflects the real-world priority of the road that the lane is part of. The
  * priority road class is used for choosing the display style in the map.
  * The priority road class can be used as an additional routing attribute to
  * the functional road class.
  * 0 represents the highest priority road class, 15 the lowest one.
  */
  PRIORITY_ROAD_CLASS,

  /**
  * Defines a type for the widened area before and after a station. In this area,
  * lanes are not delimited.
  */
  STATION_PLAZA_TYPE,

  /** Type of vertical traffic calming measure. */
  TRAFFIC_CALMING,

  /** Parts of the lane are on a movable bridge. */
  MOVABLE_BRIDGE,

  /** Area between two lanes if there is no solid barrier. */
  ROAD_MEDIAN,

  /** There is a sidewalk adjacent to the lane. */
  HAS_SIDEWALK,

  /** Friction coefficient between the tires of the vehicle and the road surface. */
  FRICTION,

  /** Areas where the lane is not fully formed or overlaps with other lanes. */
  LANE_WIDTH_STATE,

  /** Type of the complex intersection that the lane is part of. */
  COMPLEX_INTERSECTION_TYPE,

  /**
    * Indicates that the road to which the lane belongs is only used as start
    * or destination of a route.
    */
  START_OR_DESTINATION_ROAD_ONLY,

  /** Road location ID corresponding to the road that the lane belongs to. */
  ROAD_LOCATION_ID,

  /** The road or lane is illuminated by street lights. */
  HAS_STREET_LIGHTS,

  /** The road or lane is shared with pedestrians. There is no sidewalk. */
  SHARED_ROAD_SURFACE_WITH_PEDESTRIANS,

  /** The road or lane is located within a business district. */
  IN_BUSINESS_DISTRICT,

  /** The road to which the lane belongs is part of a ferry connection. */
  FERRY_TYPE,

  /**
  * Describes that the digital data for the road that the lane belongs to only
  * contains the information that the road exists without further details.
  * This mostly happens when only major roads are digitized. Such road stubbles
  * are required for giving correct guidance in incomplete route networks.
  */
  STUBBLE,

  /** Divider between the different travel directions in the middle of the road. */
  MIDDLE_DIVIDER_TYPE,

  /** Indicates which lane group belongs to the same multi-digitized road. */
  MULTI_DIGITIZED_LANE_GROUP_REFERENCE,

  /** Global source ID of the lane. */
  GLOBAL_SOURCE_ID,

  /**
    * Confidence in the trustworthiness of a lane group expressed
    * in percent (0-100%)
    */
  FEATURE_CONFIDENCE,

  /** Reliability of the GNSS data. */
  GNSS_RELIABILITY,

  /** Indicates the quality of the mobile network coverage on the lane group or lane. */
  MOBILE_NETWORK_COVERAGE,
};

choice CharacsLaneRangeAttributeValue(CharacsLaneRangeAttributeType type) on type
{
  case LANE_TYPE:
    LaneType laneType;
  case PHYSICAL_WIDTH_METRIC:
    MetricLaneWidth metricLaneWidth;
  case TYPE_OF_PAVEMENT:
    PavementType pavementType;
  case DIVIDER_TYPE:
    DividerType dividerType;
  case GRADE_TYPE:
    GradeType gradeType;
  case RAILWAY_CROSSING:
    RailwayCrossing railwayCrossing;
  case PEDESTRIAN_CROSSING:
    PedestrianCrossing pedestrianCrossing;
  case TRAFFIC_CALMING:
    TrafficCalming trafficCalming;
  case MOVABLE_BRIDGE:
    MovableBridge movableBridge;
  case SUPERELEVATION:
    SuperElevationClass superElevation;
  case ROAD_MEDIAN:
    RoadMedian roadMedian;
  case HAS_SIDEWALK:
    HasSidewalk hasSidewalk;
  case FRICTION:
    FrictionCoefficient frictionCoefficient;
  case STATION_PLAZA_TYPE:
    StationPlazaType stationPlazaType;
  case AVERAGE_SPEED:
    SpeedKmh   averageSpeed;
  case FUNCTIONAL_ROAD_CLASS:
    FunctionalRoadClass functionalRoadClass;
  case PRIORITY_ROAD_CLASS:
    PriorityRoadClass priorityRoadClass;
  case LANE_WIDTH_STATE:
    LaneWidthState laneWidthState;
  case COMPLEX_INTERSECTION_TYPE:
    ComplexIntersectionType complexIntersectionType;
  case START_OR_DESTINATION_ROAD_ONLY:
    StartOrDestinationRoadOnly startOrDestinationRoadOnly;
  case ROAD_LOCATION_ID:
    RoadLocationAssignment roadLocationId;
  case HAS_STREET_LIGHTS:
    HasStreetLights hasStreetLights;
  case SHARED_ROAD_SURFACE_WITH_PEDESTRIANS:
    SharedRoadSurfaceWithPedestrians sharedRoadSurfaceWithPedestrians;
  case IN_BUSINESS_DISTRICT:
    InBusinessDistrict inBusinessDistrict;
  case FERRY_TYPE:
    FerryType ferryType;
  case STUBBLE:
    Stubble stubble;
  case MIDDLE_DIVIDER_TYPE:
    DividerType middleDividerType;
  case MULTI_DIGITIZED_LANE_GROUP_REFERENCE:
    MultiDigitizedLaneGroupReference multiDigitizedLaneGroupReference;
  case GLOBAL_SOURCE_ID:
    GlobalSourceId globalSourceId;
  case FEATURE_CONFIDENCE:
    FeatureConfidence featureConfidence : featureConfidence <= 100;
  case GNSS_RELIABILITY:
    GnssReliability gnssReliability;
  case MOBILE_NETWORK_COVERAGE:
    MobileNetworkCoverage mobileNetworkCoverage;
};

/** Characteristics that correspond to a range on a display line. */
enum varuint16 CharacsDisplayLineRangeAttributeType
{
  /**
    * Type of the road that the display line represents. Describes the road in
    * more detail.
    */
  ROAD_TYPE,

  /** Width in centimeters of the road or lane that the display line represents. */
  PHYSICAL_WIDTH_METRIC,

  /** Surface of the road or lane that the display line represents. */
  TYPE_OF_PAVEMENT,

  /** Average speed on the road or lane that the display line represents. */
  AVERAGE_SPEED,

  /**
    * Functional road class of the road that the display line represents. The functional
    * road class defines the importance of a road for long distance routes.
    * Higher-class roads are more likely to be used for long distance routes.
    * Lower-class roads are more likely to be used for local routes only.
    * 0 represents the highest functional road class, 7 the lowest one.
    */
  FUNCTIONAL_ROAD_CLASS,

  /**
    * Reflects the real-world priority of the road that the display line represents.
    * The priority road class is used for choosing the display style in the map.
    * The priority road class can be used as an additional routing attribute to
    * the functional road class.
    * 0 represents the highest priority road class, 15 the lowest one.
    */
  PRIORITY_ROAD_CLASS,

  /**
    * Type of the widened area before and after a station on the feature that
    * the display line represents. In the station plaza, lanes are not delimited.
    */
  STATION_PLAZA_TYPE,

  /** Parts of the display line are on a movable bridge. */
  MOVABLE_BRIDGE,

  /** There is a sidewalk adjacent to the display line. */
  HAS_SIDEWALK,

  /** Type of the complex intersection that the display line is part of. */
  COMPLEX_INTERSECTION_TYPE,

  /**
    * Road location ID corresponding to the road that the display line
    * represents.
    */
  ROAD_LOCATION_ID,

  /** The road that the display line represents is illuminated by street lights. */
  HAS_STREET_LIGHTS,

  /**
    * The road or lane that the display line represents is shared with pedestrians.
    * There is no sidewalk.
    */
  SHARED_ROAD_SURFACE_WITH_PEDESTRIANS,

  /**
    * The road or lane that the display line represents is located within a
    * business district.
    */
  IN_BUSINESS_DISTRICT,

  /** All lanes of the road that the display line represents are carpool lanes. */
  COMPLETE_CARPOOL_ROAD,

  /** Some lanes of the road that the display line represents are carpool lanes. */
  PARTIAL_CARPOOL_ROAD,

  /** The display line is part of a ferry connection. */
  FERRY_TYPE,

  /** Global source ID of the road that the display line represents. */
  GLOBAL_SOURCE_ID,

  /**
    * Confidence in the trustworthiness of a display line feature expressed in
    * percent (0-100%).
    */
  FEATURE_CONFIDENCE,

  /** Some lanes of the display line are high-occupancy toll (HOT) lanes. */
  PARTIAL_CARPOOL_AND_TOLL_ROAD,

  /** Indicates the quality of the mobile network coverage on the display line. */
  MOBILE_NETWORK_COVERAGE,
};

choice CharacsDisplayLineRangeAttributeValue(CharacsDisplayLineRangeAttributeType type) on type
{
  case PHYSICAL_WIDTH_METRIC:
    MetricLaneWidth metricLaneWidth;
  case TYPE_OF_PAVEMENT:
    PavementType pavementType;
  case MOVABLE_BRIDGE:
    MovableBridge movableBridge;
  case HAS_SIDEWALK:
    HasSidewalk hasSidewalk;
  case STATION_PLAZA_TYPE:
    StationPlazaType stationPlazaType;
  case AVERAGE_SPEED:
    SpeedKmh   averageSpeed;
  case FUNCTIONAL_ROAD_CLASS:
    FunctionalRoadClass functionalRoadClass;
  case PRIORITY_ROAD_CLASS:
    PriorityRoadClass priorityRoadClass;
  case COMPLEX_INTERSECTION_TYPE:
    ComplexIntersectionType complexIntersectionType;
  case ROAD_LOCATION_ID:
    RoadLocationAssignment roadLocationId;
  case HAS_STREET_LIGHTS:
    HasStreetLights hasStreetLights;
  case SHARED_ROAD_SURFACE_WITH_PEDESTRIANS:
    SharedRoadSurfaceWithPedestrians sharedRoadSurfaceWithPedestrians;
  case IN_BUSINESS_DISTRICT:
    InBusinessDistrict inBusinessDistrict;
  case ROAD_TYPE:
    RoadType roadType;
  case COMPLETE_CARPOOL_ROAD:
    CompleteCarpoolRoad completeCarpoolRoad;
  case PARTIAL_CARPOOL_ROAD:
    PartialCarpoolRoad partialCarpoolRoad;
  case FERRY_TYPE:
    FerryType ferryType;
  case GLOBAL_SOURCE_ID:
    GlobalSourceId globalSourceId;
  case FEATURE_CONFIDENCE:
    FeatureConfidence featureConfidence : featureConfidence <= 100;
  case PARTIAL_CARPOOL_AND_TOLL_ROAD:
    PartialCarpoolAndTollRoad partialCarpoolAndTollRoad;
  case MOBILE_NETWORK_COVERAGE:
    MobileNetworkCoverage mobileNetworkCoverage;
};

/** Characteristics that correspond to a point on a display line. */
enum varuint16 CharacsDisplayLinePositionAttributeType
{
  /** The display line has a stop line. */
  STOP_LINE,

  /** The display line has a waiting line. */
  WAITING_LINE,

  /** There is a stationary object on the display line, for example, a toll station. */
  STATION,
};

choice CharacsDisplayLinePositionAttributeValue(CharacsDisplayLinePositionAttributeType type) on type
{
  case STOP_LINE:
    StopLine stopLine;
  case WAITING_LINE:
    WaitingLine waitingLine;
  case STATION:
    StationaryObjectType stationaryObjectType;
};
