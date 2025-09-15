/*!

# Traffic Attributes

This package defines attributes that are available in the Traffic module.

**Dependencies**

!*/

package traffic.attributes;

import core.types.*;
import traffic.types.*;

/*!

## Traffic Attributes for Transitions

The following attributes describe traffic-related information for intersections
and transitions.

!*/

/** Traffic attributes for transitions. */
enum varuint16 TrafficTransitionAttributeType
{
  /** Traffic flow on the transition. */
  TRAFFIC_FLOW,

  /** Indicates that current road conditions are available for the transition. */
  CURRENT_ROAD_CONDITION,
};

choice TrafficTransitionAttributeValue(TrafficTransitionAttributeType type) on type
{
  case TRAFFIC_FLOW:
          TrafficFlow trafficFlow;
  case CURRENT_ROAD_CONDITION:
          CurrentRoadCondition currentRoadCondition;
};

/*!

## Traffic Attributes for Roads

The following attributes describe traffic-related information applying to
road ranges.

!*/

/** Traffic attributes for road ranges. */
enum varuint16 TrafficRoadRangeAttributeType
{
  /** Traffic event that affects the range on the road. */
  TRAFFIC_EVENT,

  /** Traffic flow on the road range. */
  TRAFFIC_FLOW,

  /** Indicates that current road conditions are available for the road range. */
  CURRENT_ROAD_CONDITION,

  /** Availability of on-street parking on the side of the road. */
  PARKING_AVAILABILITY,
};

choice TrafficRoadRangeAttributeValue(TrafficRoadRangeAttributeType type) on type
{
  case TRAFFIC_EVENT:
          TrafficEvent trafficEvent;
  case TRAFFIC_FLOW:
          TrafficFlow trafficFlow;
  case CURRENT_ROAD_CONDITION:
          CurrentRoadCondition currentRoadCondition;
  case PARKING_AVAILABILITY:
          ParkingAvailability parkingAvailability;
};


/*!

## Traffic Attributes for Lanes

The following attributes describe traffic-related information applying to
lane ranges or lane positions.

!*/

/** Traffic attributes for lane ranges. */
enum varuint16 TrafficLaneRangeAttributeType
{
  /** Traffic event that affects the range on a lane or lane group. */
  TRAFFIC_EVENT,

  /** Traffic flow on the lane or lane group. */
  TRAFFIC_FLOW,

  /** Indicates that current road conditions are available for the lane or lane group. */
  CURRENT_ROAD_CONDITION,

  /** Availability of on-street parking on the side of the lane or lane group. */
  PARKING_AVAILABILITY,
};

choice TrafficLaneRangeAttributeValue(TrafficLaneRangeAttributeType type) on type
{
  case TRAFFIC_EVENT:
        TrafficEvent trafficEvent;
  case TRAFFIC_FLOW:
        TrafficFlow trafficFlow;
  case CURRENT_ROAD_CONDITION:
        CurrentRoadCondition currentRoadCondition;
  case PARKING_AVAILABILITY:
        ParkingAvailability parkingAvailability;
};


/*!

## Traffic Attributes for Display Lines

The following attributes describe traffic-related information applying to
display lines.

!*/

/** Traffic attributes for display line ranges. */
enum varuint16 TrafficDisplayLineRangeAttributeType
{
  /** Traffic event that affects the range on a display line. */
  TRAFFIC_EVENT,

  /** Traffic flow on the display line range. */
  TRAFFIC_FLOW,

  /** Indicates that current road conditions are available for the display line range. */
  CURRENT_ROAD_CONDITION,

  /** Availability of on-street parking on the side of the road. */
  PARKING_AVAILABILITY,
};

choice TrafficDisplayLineRangeAttributeValue(TrafficDisplayLineRangeAttributeType type) on type
{
  case TRAFFIC_EVENT:
          TrafficEvent trafficEvent;
  case TRAFFIC_FLOW:
          TrafficFlow trafficFlow;
  case CURRENT_ROAD_CONDITION:
          CurrentRoadCondition currentRoadCondition;
  case PARKING_AVAILABILITY:
          ParkingAvailability parkingAvailability;
};