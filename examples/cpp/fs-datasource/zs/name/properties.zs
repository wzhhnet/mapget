/*!

# Name Attribute Properties

This package defines attribute properties for the attributes provided by the Name
module. Attribute properties are used to annotate attributes with supplementary
metadata.

The Name module either uses locally defined attribute property types or
attribute property types that are imported from the Core module.

**Dependencies**

!*/

package name.properties;

import core.properties.*;
import core.types.*;
import core.speech.*;
import name.types.*;

rule_group NamePropertyRules
{
  /*!
  Usage of `ROAD_NAME_ID`:

  The attribute property `ROAD_NAME_ID` shall only be used for an attribute
  if that attribute is assigned at least twice to the same feature, with
  identical or overlapping validity ranges, but with different attribute
  property values. Example: An old and a new road name.
  !*/

  rule "name-agbn7z";

  /*!
  Usage of `ADDRESS_FORMAT_ID`:

  The attribute property `ADDRESS_FORMAT_ID` shall only be used if the
  `addressFormats` list in the corresponding name attribute layer contains
  multiple address formats.
  !*/

  rule "name-tr4sk2";

  /*!
  Usage of `ROAD_ADDRESS_POINT`:

  The property `ROAD_ADDRESS_POINT` shall only be used with the attribute
  `HOUSE_NUMBER`.
  !*/

  rule "name-8e0gy9";

  /*!
  Usage of `LANE_ADDRESS_POINT`:

  The property `LANE_ADDRESS_POINT` shall only be used with the attribute
  `HOUSE_NUMBER`.
  !*/

  rule "name-hj6pp8";

  /*!
  Usage of `HOUSE_POSITION`:

  The property `HOUSE_POSITION` shall only be used with the attribute
  `HOUSE_NUMBER`.
  !*/

  rule "name-kvmqf4";

  /*!
  Usage of `PREFER_ROAD_NAME_OVER_ROAD_NUMBER`:

  The property `PREFER_ROAD_NAME_OVER_ROAD_NUMBER` shall only be used with the
  attribute `ROAD_NUMBER`.
  !*/

  rule "name-2q0q2y";
};

/** Defines which attribute property type is used. */
struct NamePropertyType
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
struct NamePropertyValue(NamePropertyType type)
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

  /** Language code of a name. Enables applications to filter for different languages. */
  LANGUAGE_CODE,

  /** Usage type of a name. Defines whether the name is an official or unofficial name. */
  USAGE_TYPE,

  /** Detailed type of a name. Defines whether the name is an exonym, abbreviation, etc. */
  DETAIL_TYPE,

  /** Flag that identifies the preferred name if more than one name is available. */
  PREFERRED_NAME,

  /**
    * Flag that indicates that the road name is used for address display only,
    * not for map display.
    */
  ADDRESS_ONLY,

  /** Identifier of a road name. */
  ROAD_NAME_ID,

  /**
    * Defines that the administrative hierarchy is used for something other than
    * addresses.
    */
  NOT_ADDRESS_RELEVANT,

  /**
    * Identifier of an address format.
    * Used for road names or administrative hierarchies with an address format
    * that differs from the default address format.
    */
  ADDRESS_FORMAT_ID,

  /** Road number prefix string. */
  ROAD_NUMBER_PREFIX,

  /** Road number suffix string. */
  ROAD_NUMBER_SUFFIX,

  /**
    * Used in combination with the attribute `HOUSE_NUMBER` to model the
    * correct access position for routing to the address.
    * Determines whether the position on the road is the postal
    * address or the access position to the building.
    */
  ROAD_ADDRESS_POINT,

  /**
    * Used in combination with the attribute `HOUSE_NUMBER` to model the
    * correct access position for routing to the address.
    * Determines whether the position on the lane or lane group is the postal
    * address or the access position to the building.
    */
  LANE_ADDRESS_POINT,

  /**
    * Used in combination with the attribute `HOUSE_NUMBER` to model the correct
    * position of a house number on the map.
    */
  HOUSE_POSITION,

  /** Phonetic transcription of a name. */
  PHONETIC_TRANSCRIPTION,

  /**
    * Indicates that the road name is preferred over the road number for guidance
    * purposes, for example, in map display or voice guidance.
    */
  PREFER_ROAD_NAME_OVER_ROAD_NUMBER,
};

choice PropertyValue(PropertyType type) on type
{
  case CORE:
    ;
  case LANGUAGE_CODE:
    LanguageCode languageCode;
  case USAGE_TYPE:
    NameUsageType usageType;
  case DETAIL_TYPE:
    NameDetailType detailType;
  case PREFERRED_NAME:
    PreferredName preferredName;
  case ADDRESS_ONLY:
    AddressOnly addressOnly;
  case ROAD_NAME_ID:
    RoadNameId roadNameId;
  case NOT_ADDRESS_RELEVANT:
    NotAddressRelevant notAddressRelevant;
  case ADDRESS_FORMAT_ID:
    AddressFormatId addressFormatId;
  case ROAD_NUMBER_PREFIX:
    RoadNumberPrefix roadNumberPrefix;
  case ROAD_NUMBER_SUFFIX:
    RoadNumberSuffix roadNumberSuffix;
  case ROAD_ADDRESS_POINT:
    RoadAddressPoint roadAddressPoint;
  case LANE_ADDRESS_POINT:
    LaneAddressPoint laneAddressPoint;
  case HOUSE_POSITION:
    HousePosition(0) housePosition;
  case PHONETIC_TRANSCRIPTION:
    PhoneticTranscriptionList phoneticTranscription;
  case PREFER_ROAD_NAME_OVER_ROAD_NUMBER:
    PreferRoadNameOverRoadNumber preferRoadNameOverRoadNumber;
};
