/*!

# Display Attribute Properties

This package defines attribute properties of display attributes.

The Display Details module uses either attribute property types and value that
are defined in the Core module or attribute property types and values that are
locally defined in the Display Details module.


**Dependencies**

!*/

package display.details.properties;

import core.properties.*;


/** Defines which type of attribute property is used. */
struct DisplayPropertyType
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
struct DisplayPropertyValue(DisplayPropertyType type)
{
  /** Value of the attribute property if locally defined. */
  PropertyValue(type.type) value if type.type != PropertyType.CORE;

  /** Value of the attribute property if globally defined in the Core module. */
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
