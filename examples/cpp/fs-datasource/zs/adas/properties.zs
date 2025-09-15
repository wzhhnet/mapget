/*!

# ADAS Attribute Properties

This package defines attribute properties of ADAS attributes. Attribute
properties are used to annotate attributes with supplementary metadata.
In the ADAS module, such metadata can be present in the form of
`AdasAccuracy`, `ClothoidMetaData`, or `GradientMetaData`.

__Note:__
`ClothoidMetaData` and `GradientMetaData` contain `AdasAccuracy`
and cannot be combined into a single attribute property set.

**Dependencies**

!*/

package adas.properties;

import core.properties.*;
import adas.types.*;

/*!

Depending on the attribute property type, the ADAS module uses either
attribute property types that are defined in the Core module or attribute
property types that are locally defined in the ADAS module.

!*/

rule_group AdasPropertyTypeRules
{
  /*!
  No Combining of `AdasAccuracy` with `ClothoidMetaData`:

  `AdasAccuracy` shall not be combined with `ClothoidMetaData`.
  !*/

  rule "adas-06q900";

  /*!
  No Combining of `AdasAccuracy` with `GradientMetaData`:

  `AdasAccuracy` shall not be combined with `GradientMetaData`.
  !*/

  rule "adas-075n2r";
};

/** Defines which attribute property type is used. */
struct AdasPropertyType
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
struct AdasPropertyValue(AdasPropertyType type)
{
  /** Value of the attribute property if locally defined. */
  PropertyValue(type.type) value if type.type != PropertyType.CORE;

  /** Value of the attribute property if globally defined in the Core module. */
  CorePropertyValue(type.coreType) coreValue if type.type == PropertyType.CORE;
};

/** Type of attribute property. */
enum varuint16 PropertyType
{
  /** ADAS accuracy level of a specific attribute. */
  ADAS_ACCURACY,

  /** Metadata of clothoid data. */
  CLOTHOID_META_DATA,

  /** Metadata of gradient data. */
  GRADIENT_META_DATA,

  /** Attribute property types from Core module are used. */
  CORE,
};

choice PropertyValue(PropertyType type) on type
{
  case ADAS_ACCURACY:
      AdasAccuracy adasAccuracy;
  case CLOTHOID_META_DATA:
      ClothoidMetaData clothoidMetaData;
  case GRADIENT_META_DATA:
      GradientMetaData gradientMetaData;
  case CORE:
      ;
};
