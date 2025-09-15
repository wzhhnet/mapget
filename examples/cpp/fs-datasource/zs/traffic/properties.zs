/*!

# Traffic Attribute Properties

This package defines attribute properties for the attributes provided by the Traffic module.
Attribute properties are used to annotate attributes with supplementary metadata.

The Traffic module either uses locally defined attribute property types or
attribute property types that are imported from the Core module.

**Dependencies**

!*/

package traffic.properties;

import core.properties.*;
import core.types.*;
import traffic.types.*;


/** Defines which attribute property type is used. */
struct TrafficPropertyType
{
  /**
    * Type of attribute property. If set to `CORE`, then an attribute property
    * type from the Core module is used.
    */
  PropertyType type;

  /** Attribute property type imported from the Core module. */
  CorePropertyType coreType if type == PropertyType.CORE;
};

/**
  * Value of the attribute property. The values are either locally defined
  * or the attribute property uses a globally defined value from the Core module.
  */
struct TrafficPropertyValue(TrafficPropertyType type)
{
  /** Value of the attribute property if locally defined. */
  PropertyValue(type.type) value if type.type != PropertyType.CORE;

  /** Value of the attribute property if globally defined in the Core module. */
  CorePropertyValue(type.coreType) coreValue if type.type == PropertyType.CORE;
};

/** Type of attribute property. */
enum varuint16 PropertyType
{
  /** Attribute property types from Core module are used. */
  CORE = 0,

  /** Globally unique identifier of a traffic event using an integer number. */
  TRAFFIC_EVENT_ID,

  /** Globally unique identifier of a traffic event using a UUID. */
  TRAFFIC_EVENT_UUID,

  /** Globally unique identifier of a traffic event using a string. */
  TRAFFIC_EVENT_ID_STRING,

  /** Advice for the traffic event. */
  TRAFFIC_EVENT_ADVICE,

  /**
    * Estimated travel time on the road range to which the attribute is assigned.
    * Can be used to add estimated travel times to traffic event and traffic
    * flow attributes.
    */
  ESTIMATED_TRAVEL_TIME,

  /**
    * Estimated average speed that can be achieved on the road range to which
    * the attribute is assigned.
    * Can be used to add estimated average speeds to traffic event and traffic
    * flow attributes.
    */
  ESTIMATED_AVERAGE_SPEED,
};

choice PropertyValue(PropertyType type) on type
{
  case CORE:
    ;
  case TRAFFIC_EVENT_ID:
    TrafficEventId eventId;
  case TRAFFIC_EVENT_UUID:
    TrafficEventUuid eventUuid;
  case TRAFFIC_EVENT_ID_STRING:
    TrafficEventIdString eventIdString;
  case TRAFFIC_EVENT_ADVICE:
    TrafficEventAdvice advice;
  case ESTIMATED_TRAVEL_TIME:
    Seconds estimatedTravelTime;
  case ESTIMATED_AVERAGE_SPEED:
    SpeedKmh estimatedAverageSpeed;
};
