/*!

# Routing Attribute Properties

This package defines attribute properties of routing attributes.

**Dependencies**

!*/

package routingdata.properties;

import core.properties.*;

/*!

Depending on the attribute property type, the Routing Data module uses either
attribute property types that are defined in the Core module or attribute
property types that are locally defined in the Routing Data module.

!*/

/** Defines which attribute property type is used. */
struct RoutingPropertyType
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
struct RoutingPropertyValue(RoutingPropertyType type)
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
  /** Attribute property types from the Core module are used. */
  CORE = 0,
};

choice PropertyValue(PropertyType type) on type
{
  case CORE:
    ;
};
