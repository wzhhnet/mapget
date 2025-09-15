/*!

# Core Attribute Templates

This package defines templates for attribute storage structures such as attribute maps.
The attributes themselves are defined in one of the attribute
modules, for example, ADAS.
In the attribute modules, the templates are instantiated with the local
attribute definitions.

There are two types of templates:

- [Attribute map templates](#attribute-map-template)
- [Attribute set templates](#attribute-set-template)

These two different templates use slightly different representations of attributes:

- In **attribute maps**, the information for an attribute is split into separate
  information objects: The attribute type code, the attribute value and its
  properties, as well as the conditions are stored in separate lists.

- In **attribute sets**, full attributes are stored in a single, compound structure.
  The full attribute definition includes type information, attribute properties,
  and conditions.

  The following attribute template parameters are used in attribute maps and
  attribute sets:

  - REF = ReferenceValue
  - VAL = Validity
  - ATTR_T = AttributeType
  - ATTR_V = AttributeValue
  - PROP_T = PropertyType
  - PROP_V = PropertyValue

**Dependencies**

!*/

package core.attributemap;

import core.types.*;
import core.conditions.*;
import core.geometry.*;


/*!

## Attribute Map Template

An attribute map is the physical representation of attributes and their
assignment to features. Attribute maps are a space-efficient way to store
attributes because the same attribute can be assigned to multiple features.

An attribute map contains two logical arrays that consist of multiple lists.
The lists in each array have the same size and implicitly share an index.
Each array has an iterator that relates the entries in the lists to one entity.
Within an array, the entries in different lists at a dedicated value of the
iterator belong together. This column-based storage approach allows for good
compression because the values in each list are of the same type.

The following iterators are available:

- **Feature iterator**: Combines a feature reference with a validity
  on the feature and then points to an attribute. To achieve this, the iterator
  controls the feature references list, the feature validities list, and the
  value pointers list. The value pointers list stores values of the attribute iterator.
  By following the entry in the value pointers list, the corresponding
  entries of the two arrays can be combined.

- **Attribute iterator**: Combines an attribute value with attribute properties
  and conditions. To achieve this, the attribute iterator controls the attribute
  values list, the attribute properties list, and the attribute conditions list.

The following figure demonstrates how attributes are stored within an
attribute map.

![Storage of attributes in an attribute map](assets/attribute_map_column_store.png)

For more information on using attribute maps including examples, see [Using
NDS.Live > Concepts and Use Cases > Attributes and
Conditions](https://developer.nds.live/using-nds.live/concepts-and-use-cases/attributes).

!*/

rule_group AttributeMapRules
{
  /*!
  Conditions in Conditions List Combined by AND:

  Conditions in the `attributeConditions` list of an attribute map
  shall be combined by a logical AND.
  !*/

  rule "core-fg5pcb";
};

/** Template for an attribute map, designed as a column store. */
struct AttributeMap<REF, VAL, ATTR_T, ATTR_V, PROP_T, PROP_V>(CoordShift coordShift)
{
  /** Attribute type code of the primary attribute of this attribute map. **/
  ATTR_T attributeTypeCode;

align(8):

  /** Feature iterator. */
  FeatureIterator feature;

  /** List of feature references. */
  packed REF featureReferences[feature];

align(8):

  /** List of validities. */
  packed VAL(coordShift) featureValidities[feature];

align(8):

  /** Value pointer that refers to an index in the `attributeValues` list. */
  packed AttributeIterator featureValuePtr[feature];

  /** Attribute iterator. */
  AttributeIterator attribute;

  /** List of attribute values. */
  packed Attribute<ATTR_T, ATTR_V>(attributeTypeCode) attributeValues[attribute];

align(8):

  /** List of attribute properties. */
  packed PropertyList<PROP_T, PROP_V> attributeProperties[attribute];

align(8):

  /** List of conditions. */
  packed ConditionList attributeConditions[attribute];
};

/** Iterator for feature lists. Also defines size of arrays. */
subtype varsize FeatureIterator;

/** Iterator for attribute lists. Also defines size of arrays. */
subtype varsize AttributeIterator;

/** Template for an attribute to be used in attribute maps. */
struct Attribute<ATTR_T, ATTR_V>(ATTR_T attributeTypeCode)
{
  /** Attribute value based on the attribute type code. */
  ATTR_V(attributeTypeCode) attributeValue;
};

/*!

### Attribute Map List

Attribute maps are stored in attribute map lists.

The attribute map list header provides information on which attribute type code is
stored in which attribute map and on the conditions that are used.
The header can be used to check if all attribute type codes can be read or
skipped and to evaluate the conditions before accessing the attribute maps lists.

!*/

rule_group AttributeMapListRules
{
  /*!
  Consistent Condition Types in Attribute Map Lists:

  All condition types used in an attribute map shall also be stored
  in the header metadata of the attribute map list of that map.
  !*/

  rule "core-5fwres";
};

/** Template for a list of attribute maps. */
struct AttributeMapList<REF, VAL, ATTR_T, ATTR_V, PROP_T, PROP_V>(CoordShift coordShift)
{
  /** Number of attribute maps in this list. */
  varsize numMaps;

  /** Attribute map list header. */
  AttributeMapListHeader<ATTR_T>(numMaps) header;

  /** List of attribute maps. */
  packed AttributeMap<REF, VAL, ATTR_T, ATTR_V, PROP_T, PROP_V>(coordShift) maps[numMaps];
};

/**
  * Header of an attribute map list, containing the used attribute types and
  * condition types.
  */
struct AttributeMapListHeader<ATTR_T>(varuint16 numMaps)
{
  /** List of attribute type codes per attribute map. */
  packed ATTR_T attributeTypeCode[numMaps];

  /** Collection of conditions per attribute map. */
  packed ConditionTypeCodeCollection conditionType[numMaps];
};

/** Collection of condition types used in the attribute map list header. */
struct ConditionTypeCodeCollection
{
  /** List of condition type codes. */
  packed ConditionTypeCode conditionTypeCode[];
};

/*!

## Attribute Set Template

An attribute set combines attributes and can be assigned to one or more features
using an attribute set map. Attribute sets are useful if certain combinations of
attributes with the same values apply to a high number of features. In this
case, an attribute set requires less storage space because the feature reference
is only stored once.

An attribute set map contains the following:

- **Attribute set**: List of self-contained attributes. The full attribute
  definitions include type information and attribute value, as well as attribute
  properties, and conditions, if applicable.

- **Feature iterator**: Defines the validity of the attribute set for a list of
  features. Feature references and the validity on the features are combined by
  aligning two arrays that share an index.

The following figure demonstrates how attribute sets are stored within an
attribute set map.

![Storage of attributes sets in an attribute set map](assets/attribute_set_map.png)

For more information on using attribute sets including examples, see
[Attributes](https://developer.nds.live/using-nds.live/concepts-and-use-cases/attributes)
in the section Using NDS.Live on the Developer Portal.

!*/

/** Set of attributes. */
struct AttributeSet<ATTR_T, ATTR_V, PROP_T, PROP_V>
{
  /** Number of attributes stored in the set. */
  varsize numEntries;

  /** List of full attributes. */
  packed FullAttribute<ATTR_T, ATTR_V, PROP_T, PROP_V> attributes[numEntries];
};

/**
  * A full attribute contains attribute type code, attribute value, attribute
  * properties, and conditions.
  */
struct FullAttribute<ATTR_T, ATTR_V, PROP_T, PROP_V>
{
  /** Attribute type code. */
  ATTR_T attributeTypeCode;

  /** Attribute value. */
  ATTR_V(attributeTypeCode) attributeValue;

  /** Optional list of attribute properties. */
  optional PropertyList<PROP_T, PROP_V> properties;

  /** Optional list of conditions that apply. */
  optional ConditionList conditions;
};

/** An attribute set map connects attribute sets to features. */
struct AttributeSetMap<REF, VAL, ATTR_T, ATTR_V, PROP_T, PROP_V>(CoordShift coordShift)
{
  /** Attribute set that contains all attributes. */
  AttributeSet<ATTR_T, ATTR_V, PROP_T, PROP_V> attributeSet;

  /**
    * Feature iterator. The next list block uses same index iterator
    * (like they would be in a row).
    */
  FeatureIterator feature;

  /** List of feature references. */
  packed REF references[feature];

align(8):

  /** List of validities. */
  packed VAL(coordShift) validities[feature];
};

/** Attribute set maps are stored in attribute set lists. */
struct AttributeSetList<REF, VAL, ATTR_T, ATTR_V, PROP_T, PROP_V>(CoordShift coordShift)
{
  /** Number of attribute set maps in the list. */
  varsize numAttributeSets;

  /** List of attribute set maps. */
  packed AttributeSetMap<REF, VAL, ATTR_T, ATTR_V, PROP_T, PROP_V>(coordShift) sets[numAttributeSets];
};

/*!

## Attributes Properties and Conditions

Attribute properties annotate attributes with supplementary information and
conditions constrain the application of attributes to a certain domain.

For details, see [Core Attribute Properties](properties.zs) and
[Core Conditions](conditions.zs).

!*/

rule_group PropertyConditionListRules
{
  /*!
  Sorting Order of Condition Types:

  All condition types used in the conditions list shall be sorted in ascending
  order by their `conditionTypeCode`.
  !*/

  rule "core-t9rhig";
};

/** Template for a list of attribute properties. */
struct PropertyList<PROP_T, PROP_V>
{
  /** Number of attribute properties. */
  uint8 numProperties;

  /** Attribute properties. */
  packed Property<PROP_T, PROP_V> property[numProperties] if numProperties > 0;
};

/** Template for an attribute property. */
struct Property<PROP_T, PROP_V>
{
  /** Type code of the attribute property. */
  PROP_T   propertyTypeCode;

  /** Value of the attribute property. */
  PROP_V(propertyTypeCode) propertyValue;
};

/** List of conditions. */
struct ConditionList
{
  /** Number of conditions in the list. */
  uint8 numConditions;

  /** Conditions. */
  packed Condition conditionList[numConditions];
};

/** A condition consists of a type and a value. */
struct Condition
{
  /** Condition type code. */
  ConditionTypeCode conditionTypeCode;

  /** Condition value based on the condition type code. */
  ConditionValue(conditionTypeCode) conditionValue;
};

/**
  * Empty prototype declaration for validities used in the attribute map template.
  * This value is used in template instantiations that do not use validities
  * and use always the full feature.
  */
struct Validity(CoordShift shift)
{

};

/*!

## Attribute Metadata

The attribute metadata describes all types that are used in an attribute
map list or attribute set list. It lists attribute type codes, attribute property
types, and conditions.

The attribute metadata does not state which of these types are combined
with each other. It is simply an indicator of what kind of types are to be expected.
Not all of the listed types have to be used in all instances of the attribute
map list or attribute set list.

!*/

rule_group AttributeMetadataRules
{
  /*!
  Consistent Attribute Metadata:

  All attribute type codes, attribute property types, and condition types that
  are used in an attribute map list or attribute set list shall also be stored
  in the attribute metadata of that list.
  !*/

  rule "core-34wq3g";
};

/** Metadata of an attribute map list or attribute set list. */
struct AttributeMetadata<ATTR_T, PROP_T>
{
  /** Available attribute type codes in the attribute map or attribute set list. */
  packed ATTR_T availableAttributes[];

  /** Available attribute property types in the attribute map or attribute set list. */
  packed PROP_T availableProperties[];

  /** Available conditions in the attribute map or attribute set list. */
  ConditionTypeCodeCollection availableConditions;
};
