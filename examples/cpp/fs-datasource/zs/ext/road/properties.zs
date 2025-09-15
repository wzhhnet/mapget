
package ext.road.properties;

import core.properties.*;
import ext.road.types.*;

/** Defines which attribute property type is used. */
struct RoadPropertyType
{
  /**
    * Type of attribute property. If set to `CORE`, then an attribute
    * property from the Core module is used.
    */
  PropertyType type;

  /** Attribute property type imported from the Core module. */
  CorePropertyType coreType if type == PropertyType.CORE;
};

/**
  * Value of the attribute property. The values are either locally defined
  * or the attribute property uses a globally defined value from the Core module.
  */
struct RoadPropertyValue(RoadPropertyType type)
{
  /** Value of the attribute property if locally defined. */
  PropertyValue(type.type) value if type.type != PropertyType.CORE;

  /**
    * Value of the attribute property if globally defined in the Core module.
    */
  CorePropertyValue(type.coreType) coreValue if type.type == PropertyType.CORE;
};

/** Type of attribute property. */
enum varuint16 PropertyType
{
  /** Attribute property types from Core module are used. */
  CORE,
  
  /** This attribute describes a subset of lanes along a road in a given direction. */
  LANE_MASK,

  /** Group with LANE_GEO_CONNECT_TYPE, indicating the increase/decrease lane counts. */
  VALID_NUMS,

  /** Indicating the middle type of 3d lane object elements. */
  EXTENDED_TYPES,
};

choice PropertyValue(PropertyType type) on type
{
  case CORE:
    ;
  case LANE_MASK:
    LaneMask lanemask;
  case VALID_NUMS:
    int8 validNums;
  case EXTENDED_TYPES:
    int8 extendedTypes;
};
