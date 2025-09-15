/*!

# Drive Path Attribute Properties

This package defines attribute properties of drive path attributes.

The Drive Path module uses either attribute property types and values that are
defined in the Core module or attribute property types and values that are
locally defined in the Drive Path module.

**Dependencies**

!*/

package drivepath.properties;

import core.properties.*;
import core.types.*;

/** Defines which attribute property type is used. */
struct DrivePathPropertyType
{
  /**
    * Type of attribute property. If set to `CORE`, then an attribute
    * property from the Core module is used.
    */
  PropertyType type;

  /** Attribute property type imported from the Core module. */
  CorePropertyType coreType if type == PropertyType.CORE;
};

/** Value of the attribute property. */
struct DrivePathPropertyValue(DrivePathPropertyType type)
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
};

choice PropertyValue(PropertyType type) on type
{
  case CORE:
    ;
};
