/*!

# Name Types

This package defines types that are reused in other packages of the Name module.

**Dependencies**

!*/

package name.types;

import core.types.*;
import core.geometry.*;
import lane.reference.types.*;
import road.reference.types.*;


/*!

## Administrative Hierarchy

Countries have different administrative hierarchies that represent
administrative, geographical, or political units, for example,
a country, a state in a country, a city, or a postal code.

An administrative hierarchy is a list of elements that is ordered from the lowest
to the highest element of the hierarchy. For example, the first (lowest) element
of an administrative hierarchy is the city district and the last (highest) element
is the country.

Each element of the administrative hierarchy is contained in the next element
of the list. Example: Manhattan < New York City < New York State < USA.

The administrative hierarchy can be used to retrieve the address of a position
on a road or lane, for example. However, the order in which the elements of the
address are displayed is defined by the corresponding address format and can differ
from the administrative hierarchy.

Multiple administrative hierarchies can be defined, for example, if an additional
hierarchy is needed for other use cases than address generation.

The following figure shows the name attributes that are assigned to a road.
This information is used to generate the address for a specific position. Parts of
the address are derived from the administrative hierarchy, others from the
house number and road name attributes. The resulting address is displayed as follows:
13200-13698 Pioneer Rd., Camden, MI 49232, USA.

![Administrative hierarchy used for address generation](assets/name_administrative_hierarchy.png)

!*/

rule_group AdministrativeHierarchyRules
{
  /*!
  Unique Administrative Hierarchy Element IDs:

  Administrative hierarchy element IDs shall be unique per
  smart layer tile or smart layer object.
  !*/

  rule "name-39wnty";
};

/**
  * Administrative hierarchy of a road or lane.
  * The elements of the administrative hierarchy are defined in
  * `adminHierarchyElementDefinitions` of the corresponding layer. The attribute
  * only contains references to these elements.
  */
struct AdministrativeHierarchy
{
  /** Number of elements in the administrative hierarchy. */
  varsize numElements;

  /** List of administrative hierarchy elements, ordered from lowest to highest. */
  AdminHierarchyElementId adminElements[numElements];

};

/** Element of an administrative hierarchy, including its type and name. */
struct AdministrativeHierarchyElement
{
  /** Identifier of the administrative hierarchy element. */
  AdminHierarchyElementId id;

  /** Type of administrative hierarchy element. */
  AdminHierarchyElementType type;

  /** Name of the administrative hierarchy element. */
  AdminHierarchyName name;

  /** Global source ID of the administrative hierarchy element. */
  optional GlobalSourceId globalSourceId;
};

/*!

## Name Types

Names can be assigned to roads and lanes and have different types, like the name
of the road or the name of an intersection, bridge, or tunnel.

Road names can contain control characters for text separation or markings of the
base name. The following non-printable characters may be added to the string of
any name:

- `TEXT_SEPARATOR`: Unicode character Information Separator Four (U+001C)
  to separate text parts from each other.
- `BASENAME_MARKER`: Unicode character Information Separator Two (U+001E)
  to mark the base name of a name string.

The first occurrence of `BASENAME_MARKER` in a string marks the start of the base
name part of the string. The optional second occurrence of `BASENAME_MARKER` marks
the end of the base name part of the string. If no second `BASENAME_MARKER` occurs
in the string, the entire string after the first `BASENAME_MARKER` is the base name.
If the string has no prefix but does have a suffix, then the string starts
with the `BASENAME_MARKER`.

Example: "E Williams Field Rd" can be stored as "E (0x1E)Williams Field(0x1E) Rd"
to define that "Williams Field" is the base name, "E " is the prefix, and " Rd"
is the suffix.

!*/

rule_group NameTypeRules
{
  /*!
  Strings of Base Names without Prefix But with Suffix:

  If a name string has no prefix but does have a suffix, then the string shall
  start with the `BASENAME_MARKER`.
  !*/

  rule "name-6ga37j-I";
};

/** Non-printable text separator character. */
const uint8 TEXT_SEPARATOR = 0x1C;

/**
  * Non-printable character to define the start and/or end of the base name part
  * of a name.
  */
const uint8 BASENAME_MARKER = 0x1E;

/** Name of a road. */
subtype string RoadName;

/** Name of an intersection. */
subtype string IntersectionName;

/** Name of a tunnel. */
subtype string TunnelName;

/** Name of a bridge. */
subtype string BridgeName;

/** Name of a route. */
subtype string RouteName;

/** Display label. */
subtype string LabelName;

/** Road number. */
subtype string RoadNumber;

/** Toll station name. */
subtype string TollStationName;

/** Service area name. */
subtype string ServiceAreaName;

/** Exit number. */
subtype string ExitNumber;

/** Exit name. */
subtype string ExitName;

/** Prefix of a road number. */
subtype RoadNumberComponent RoadNumberPrefix;

/** Suffix of a road number. */
subtype RoadNumberComponent RoadNumberSuffix;

/** Name of an administrative hierarchy element. */
subtype string AdminHierarchyName;

/** Identifier of an address format. */
subtype varuint16 AddressFormatId;

/** Identifier of a road name. */
subtype uint8 RoadNameId;

/**
  * Identifier of an administrative hierarchy element.
  * Is unique within a smart layer tile or smart layer object.
  */
subtype varuint32 AdminHierarchyElementId;

/** Component of a road number to be used as prefix or suffix of the road number. */
struct RoadNumberComponent
{
  /** Name string of the road number component. */
  string componentString;

  /** Set to `true` if the component is to be rendered on an icon. */
  bool onIcon;

  /** Set to `true` if the component is to be used for acoustic output. */
  bool acousticOutput;

  /** Set to `true` if the component is to be used for textual output. */
  bool textOutput;

  /** Local priority of the road number component. Lowest number is highest priority. */
  bit:5 localPriority;
};

/** Detailed type of a name. */
enum bit:4 NameDetailType
{
  /** Name is a synonym. */
  SYNONYM,

  /** Name is a transliteration. */
  TRANSLITERATION,

  /** Name is an exonym. */
  EXONYM,

  /** Alternate spelling of a name. */
  ALTERNATE_SPELLING,

  /** Name is an abbreviation. */
  ABBREVIATION,
};

/** Usage type of a name. */
enum bit:4 NameUsageType
{
  /** If multiple official names exist, this name is defined as the default name. */
  DEFAULT_OFFICIAL_NAME,

  /** The name is one of the official names. */
  OFFICIAL_NAME,

  /**
    * If multiple alternate names exist, this name is defined as the preferred
    * alternate name.
    */
  PREFERRED_ALTERNATE_NAME,

  /**
    * A name that has no official status but is used or known by the general
    * public.
    */
  ALTERNATE_NAME,
};

/** Indicates that a name is preferred over others. */
subtype Flag PreferredName;

/**
  * Indicates that a name is to be used for address display only and not
  * for map display.
  */
subtype Flag AddressOnly;

/**
  * Indicates that an administrative hierarchy is not relevant for address
  * generation.
  */
subtype Flag NotAddressRelevant;

/**
  * Indicates that the road name is preferred over the road number in
  * cases where usually the road number is used, for example, in map display.
  */
subtype Flag PreferRoadNameOverRoadNumber;

/** Type of an administrative hierarchy element. */
enum varuint16 AdminHierarchyElementType
{
  /** Country. */
  COUNTRY,

  /**
   * Sub-country area, for example, a province or state.
   * Japan mapping: To-Do-Fu-Ken.
   */
  SUB_COUNTRY,

  /**
   * Set of sub-country areas, for example, regions of provinces.
   * Japan mapping: Chiho.
   */
  SUB_COUNTRY_SET,

  /**
    * Territorial division of some countries, for example, a county in the USA
    * or a Landkreis in Germany.
    */
  COUNTY,

  /**
   * Municipal area, for example, a city, town, or urban area.
   * Japan mapping: Shi-Ku-Cho-Son.
   */
  MUNICIPALITY,

  /**
   * Subdivision of a municipal area, for example, a city district or ward.
   * Japan mapping: Machi/Oaza.
   */
  MUNICIPALITY_SUBDIVISION,

  /** Hamlet. */
  HAMLET,

  /** License plate zone. */
  LICENSE_PLATE_ZONE,

  /**
    * Agglomeration of administrative areas, for example, Greater City Zone
    * New York, Greater Tokyo Area. Zones do not belong to and cannot be mapped
    * directly to an administrative level.
    */
  ZONE,

  /**
    * Set of countries, for example, Europe or North America.
    * Sometimes called a supranational area.
    */
  COUNTRY_SET,

  /**
    * Area formed on a cultural, social, or economical basis. Neighborhoods
    * can have touristic appeal as a nice area with a specific atmosphere like
    * a restaurant area.
    * Neighborhoods often have a semi-official status, but they are not part of
    * an administrative structure. Names of neighborhoods are commonly known and
    * often used as place names.
    * Typically, neighborhoods neither have official borders nor an equivalent
    * in administrative or postal sources.
    * Examples: Karolinenviertel in Hamburg, Little Italy in New York,
    * Quartier Pigalle in Paris, Soho in London, or Museum Island in Berlin.
    * Japan mapping: Chome/Aza
    */
  NEIGHBORHOOD,

  /**
    * Administrative area that is not an official city or city district and
    * also is not a zone, for example, Villingen contained in Villingen-Schwenningen
    * or Borsum contained in Harsum.
    */
  NAMED_AREA,

  /**
    * City block, for example, the administrative level of city blocks in
    * Japan (Japanese Gaiku).
    */
  CITY_BLOCK,

  /** Postal code. */
  POSTAL_CODE,
};

/*!

## Address Formats

Address formats can be used to retrieve the corresponding address elements and
display them in the correct order. Each address format is defined
by a sequence of elements that either correspond to individual name attributes
or to elements from an administrative hierarchy. For example, `HOUSE` is derived
from the attributes `HOUSE_NUMBER` or `HOUSE_NUMBER_Range`, while `MUNICIPALITY` is
derived from the administrative hierarchy.

!*/

rule_group AddressFormatRules
{
  /*!
  Empty Last Element Separator in Address Format:

  The last `elementSeparator` in `AddressFormatElements.elements` shall be empty.
  !*/

  rule "name-p9a4c2";
};

/**
  * Address format that defines how to retrieve the corresponding address
  * elements.
  */
struct AddressFormat
{
  /** Identifier of the address format. */
  AddressFormatId id;

  /** List of elements of the address format ordered by their appearance. */
  AddressFormatElement elements[];
};

/** Element of an address format. */
struct AddressFormatElement
{
  /** Type of the address format element. */
  AddressFormatElementType type;

  /** More detailed information on the element from the administrative hierarchy. */
  AdminHierarchyElementType adminHierarchyElementType
    if type == AddressFormatElementType.ADMINISTRATIVE_HIERARCHY_ELEMENT;

  /**
    * Separator character between this and the next address element,
    * for example, blank, line break, hyphen, colon, or semicolon.
    *
    * The element separator after the last address element is left empty.
    */
  string elementSeparator;
};

/** Type of element to be used in an address format. */
enum uint8 AddressFormatElementType
{
  /** Road name. To be fetched from the `ROAD_NAME` attribute. */
  ROAD,

  /**
    * Name of a building or house number. To be fetched from the `HOUSE_NUMBER`
    * attribute or the `HOUSE_NUMBER_RANGE` attribute.
    */
  HOUSE,

  /**
    * Administrative hierarchy element. To be fetched from the
    * `ADMINISTRATIVE_HIERARCHY` attribute.
    */
  ADMINISTRATIVE_HIERARCHY_ELEMENT,

  /** Road number. To be fetched from the `ROAD_NUMBER` attribute. */
  ROAD_NUMBER,

  /** Route name. To be fetched from the `ROUTE_NAME` attribute. */
  ROUTE_NAME,
};

/*!

### Supplementary Address Information

If multiple address formats exist in a region, additional address formats can
be defined. The address formats are looked up using the corresponding address
format ID.

The following figure shows an example of two co-existing address formats:

- Address format 10 is based on city blocks and does not make use of road names
  or house numbers. For address generation based on this format, all elements
  are derived from the corresponding administrative hierarchy.
- Address format 20 uses road names and house numbers. For address generation
  based on this format, information from the corresponding attributes and the
  administrative hierarchy is combined.

![Two address formats used for address generation](assets/name_two_address_formats.png)

If supplementary road names and/or house numbers exist in the same address format
as the main road information, additional name attributes can be stored that
get assigned the attribute property `ROAD_NAME_ID` with a different value.

Example: The road "Old boring road" is renamed to "New funky road". The house
numbers are also changed. For a transitional period, both street names are
valid so that the road is still findable under the old name. The following
attributes are stored:

- Old road name:
    - `ROAD_NAME` = "Old boring road" with `ROAD_NAME_ID` = 10
    - `HOUSE_NUMBER_RANGE` = 1000-1300 with `ROAD_NAME_ID` = 10
- New road name:
        - `ROAD_NAME` = "New funky road" with `ROAD_NAME_ID` = 20
        - `HOUSE_NUMBER_RANGE` = "2000-2300" with `ROAD_NAME_ID` = 20


## House Numbers

House numbers can be stored as single values containing alphanumeric characters
in the `HOUSE_NUMBER` attribute or as a range of values of a specific type
in the `HOUSE_NUMBER_RANGE` attribute.

House number ranges can contain ordered or unordered lists of numeric or string
values with or without pattern information.

The following rules apply:

- If the parameter `isEvenOdd` is set to `true`, the range contains only even
  (2, 4, 6, 8, …) or only odd (1, 3, 5, 7, …) house numbers. Whether the range
  is even or odd is determined by the first number in the house number range.
- If the parameter `isEvenOdd` is set to `false`, the range is a sequence
  of continuous house numbers, for example, 1, 2, 3, 4.
- If the parameter `hasPattern` is set to `true`, an alphanumeric pattern for
  number interpolation is applied.
- If the start house number of the range is smaller than the end house number
  of the range, the range is increasing, and vice versa.

Examples of house number ranges:

- Decreasing range of even numbers: 42, 40, 38, …, 2.
    - `startHouseNumber` = 42, `endHouseNumber` = 2
    - `isEvenOdd` = `true`
- Continuous range of increasing, numeric house numbers: 1, 2, 3, 4, …, 27.
   - `startHouseNumber` = 1, `endHouseNumber` = 27
   - `isEvenOdd` = `false`
- Continuous range with pattern: P1S, P2S, P3S, …, P15S.
   - `startHouseNumber` = 1, `endHouseNumber` = 15
   - `hasPattern` = `true`
   - `pattern` = P*S


At road level, house numbers are located on the side of the road that
corresponds to the direction of the road reference. The attributes
`HOUSE_NUMBER` and `HOUSE_NUMBER_RANGE` are always assigned in positive or
negative direction:

- If set to `IN_POSITIVE_DIRECTION`, the house numbers are located to the
  right of the road in digitization direction.
- If set to `IN_NEGATIVE_DIRECTION`, the house numbers are located to the
  left of the road in digitization direction.

At lane level, house numbers are located on the side of the road that corresponds
to the lane closest to the corresponding curb. Only that lane gets assigned the
`HOUSE_NUMBER` or `HOUSE_NUMBER_RANGE` attribute. The `HOUSE_NUMBER_RANGE`
attribute cannot be used with `completeGroup` set to `true` in the lane group
range validity because then it would apply on both sides of the lane group.

Example: A road from A to B has four lanes, two of which apply in each driving
direction. The house number range 1-30 applies on the right side of the road in
digitization direction. The `HOUSE_NUMBER_RANGE` attribute is assigned to lane 0
(the right-most lane) of the corresponding lane group.

!*/

rule_group HouseNumberRules
{
  /*!
  Assignment of House Numbers to Roads Always Directed:

  The attributes `HOUSE_NUMBER` and `HOUSE_NUMBER_RANGE` shall always be
  assigned in positive or negative direction to a road, that is,
  `RoadReference.isDirected` shall be set to `true`.
  !*/

  rule "name-x5625b";

  /*!
  House Number Ranges for Lane Groups:

  The `HOUSE_NUMBER_RANGE` attribute shall not be assigned to a complete lane group,
  that is, `LaneGroupRangeValidity.completeGroup` shall not be set to `true` for
  this attribute.
  !*/

  rule "name-39htcp";
};

/** List of house numbers defined as a house number range. */
struct HouseNumberRange
{
  /** Type of the house number range representation. */
  HouseNumberType type;

  /** One or multiple house numbers depending on the type. */
  HouseNumberRangeNumbers(type) numbers;
};

/** Type of the house number range. */
enum bit:4 HouseNumberType
{
  /** Even/odd ordered range of numeric house numbers. */
  RANGE_EVEN_ODD,

  /** Even/odd ordered range of numeric house numbers with additional pattern information. */
  RANGE_EVEN_ODD_PATTERN,

  /** Continuous ordered range of numeric house numbers. */
  RANGE_CONTINUOUS,

  /** Continuous ordered range of numeric house numbers with additional pattern information. */
  RANGE_CONTINUOUS_PATTERN,

  /** Unordered list of numeric house numbers. */
  LIST_NUMERIC,

  /** Unordered list of string house numbers. */
  LIST_STRING,
};

choice HouseNumberRangeNumbers(HouseNumberType type) on type
{
  case RANGE_EVEN_ODD:
    HouseNumberNumericRange(false, true) houseNumberRangeEvenOdd;
  case RANGE_EVEN_ODD_PATTERN:
    HouseNumberNumericRange(true, true) houseNumberRangeEvenOddPattern;
  case RANGE_CONTINUOUS:
    HouseNumberNumericRange(false, false) houseNumberRangeContinuous;
  case RANGE_CONTINUOUS_PATTERN:
    HouseNumberNumericRange(true, false) houseNumberRangeContinuousPattern;
  case LIST_NUMERIC:
    HouseNumberNumeric houseNumberNumeric[];
  case LIST_STRING:
    HouseNumber houseNumber[];
};

/** Numeric house number. */
subtype varuint32 HouseNumberNumeric;

/** House number containing alphanumeric characters. */
subtype string HouseNumber;

/** Numeric house number range with optional pattern. */
struct HouseNumberNumericRange(bool hasPattern, bool isEvenOdd)
{
  /** Start house number. */
  HouseNumberNumeric startHouseNumber;

  /** End house number. */
  HouseNumberNumeric endHouseNumber : endHouseNumber != startHouseNumber;

  /** House number range pattern. Use '*' character as placeholder for numbers. */
  string pattern if hasPattern;

  /** Returns the increment direction of the stored range. */
  function HouseNumberIncrement getIncrement()
  {
    return (startHouseNumber > endHouseNumber) ? HouseNumberIncrement.DECREASING : HouseNumberIncrement.INCREASING;
  }
};

/** Defines the increment direction of a house number range. */
enum bit:1 HouseNumberIncrement
{
  /** House numbers are decreasing along the validity of the range. */
  DECREASING,

  /** House numbers are increasing along the validity of the range. */
  INCREASING,
};

/*!

### Address Points and House Positions

The attribute properties `ROAD_ADDRESS_POINT`, `LANE_ADDRESS_POINT`, and
`HOUSE_POSITION` are used in combination with house numbers to
indicate whether the position on the road or lane that the house number is
assigned to represents the postal position, an access position, or the
real-world position of the building.

The following figure shows how house numbers with different attribute properties
can be modeled, for example, individual house numbers, house number ranges, and
multiple address points for the same building.

For the building K5F two `HOUSE_NUMBER` attributes with different values for the
attribute property `ROAD_ADDRESS_POINT` are stored:

- The `HOUSE_NUMBER` attribute on road 1 corresponds to the postal address.
  The attribute properties reference the access position and indicate the real-world
  position of the building.
- The `HOUSE_NUMBER` attribute on road 2 corresponds to the parking lot, which
  is used as destination for calculating a route. The attribute is therefore
  assigned to the other side of the road.
  The attribute properties reference the postal position.

![Modeling house numbers with and without address points](assets/name_house_numbers_address_point.png)

!*/

/** Address point on a road. */
struct RoadAddressPoint
{
  /** Type of the address point. */
  AddressPointType type;

  /** References to the access positions of a postal address point. */
  RoadAddressPointReference accessPositions[]
        if type == AddressPointType.POSTAL_POSITION;

  /** Reference to the postal position of an access address point. */
  RoadAddressPointReference postalPosition
        if type == AddressPointType.ACCESS_POSITION;
};

/** Address point on a lane. */
struct LaneAddressPoint
{
  /** Type of the address point. */
  AddressPointType type;

  /** References to the access positions of a postal address point. */
  LaneAddressPointReference accessPositions[]
        if type == AddressPointType.POSTAL_POSITION;

  /** Reference to the postal position of an access address point. */
  LaneAddressPointReference postalPosition
        if type == AddressPointType.ACCESS_POSITION;
};

/** Reference to an access position or postal position of an address point on a road. */
struct RoadAddressPointReference
{
  /** Indirect reference to a road where the access or postal address point is. */
  RoadReferenceIndirect indirectReference;

  /** Position on the indirect reference where the access or postal address point is. */
  RoadPositionValidity(0) position;
};

/** Reference to an access position or postal position of an address point on a lane. */
struct LaneAddressPointReference
{
  /** Indirect reference to a lane or lane group where the access or postal address point is. */
  LaneGroupReferenceIndirect indirectReference;

  /** Position on the indirect reference where the access or postal address point is. */
  LaneGroupPositionValidity(0) position;
};

/** Type of the address point. */
enum bit:1 AddressPointType
{
  /** The address point is the postal address of the building. */
  POSTAL_POSITION,

  /** The address point is the access position to the building. */
  ACCESS_POSITION,
};

/** Real-world position of a building. */
subtype Position2D HousePosition;

/*!

## POI Names

Name attributes provide names and addresses for POI features.

!*/

/** Name of a POI. */
subtype string PoiName;

/** Name of a building in which a POI is located. */
subtype string BuildingName;

/** Designation of a floor on which a POI is located. */
subtype string FloorName;