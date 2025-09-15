/*!

# Guidance

This package defines guidance instructions and related data structures.

**Dependencies**

!*/

package routing.guidance;

import routing.types.*;
import core.types.*;
import core.speech.*;

/*!

## Guidance Instructions

Guidance instructions are given until a vehicle reaches a target index of
waypoints on a route.

The guidance instruction is activated at a specified distance from the zero-point
of the instruction. The zero-point is used to display the distance of the maneuver
and other elements, for example, arrows.

TODO: What do we do with the following information. Can this be tested so that we can convert it into a rule?

Each guidance instruction has a predefined guidance code. For interoperability reasons,
all applications must support all codes.
In addition to the basic guidance codes, extended guidance codes can be used,
which allow more precise guidance instructions.
Extended guidance codes use predefined consts plus optional custom extensions.


**Example**

When leaving the highway, the target index is placed on the intersection
where the ramp branches off. The activation distance is set to the length of the
deceleration lane. That way, the application can then display and announce the
maneuver correctly.

!*/

/** List of guidance instructions. */
struct GuidanceInstructions
{
  Instruction instructions[];
};

/** Guidance instruction. */
struct Instruction
{
  /**
    * The guidance instruction is given until the vehicle reaches the
    * `targetIndex` of the route waypoints.
    */
  varuint targetIndex;

  /** Distance from the `targetIndex` to the zero-point of the instruction in meters. */
  varuint activationDistance;

  /** Basic guidance code for the instruction. */
  GuidanceCode guidanceCode;

  /** Extended guidance code for the instruction. */
  optional ExtGuidanceCode extGuidanceCode;

  /**
    * Indication of roundabout exit that the vehicle is to take, counted from
    * the entrance of the roundabout.
    */
  uint8 roundaboutExitNumber if guidanceCode == GuidanceCode.ROUNDABOUT
                             || guidanceCode == GuidanceCode.ROUNDABOUT_REVERSED;

  /**
    * Target name of the guidance instruction, for example, road, city, or place.
    * Indicated in the language of the service request.
    */
  optional GuidanceName targetName;

  /** Guidance towards name in the language of the service request. */
  optional GuidanceName towardsName;

  /** Lane guidance information. */
  optional GuidanceLanes lanes;

};

/** Lane guidance information for a guidance instruction. */
struct GuidanceLanes
{
  /** Number of lanes available at the location of the guidance instruction. */
  uint8 numLanes;

  /**
    * Indicator of affected lanes. Set to `true` for the lanes that are affected
    * by the guidance instruction. Set to `false` for the lanes that are not affected.
    */
  bool active[numLanes];

  /** Lane markings for the guidance instruction. */
  optional GuidanceLaneMarking markings[numLanes];

};

/** Bitmask for lane markings. Can be used to generate lane guidance arrows. */
bitmask varuint64 GuidanceLaneMarking
{
  /** No arrow. */
  NONE = 0,

  /** Straight arrow in travel direction. */
  ARROW_STRAIGHT,

  /** Arrow that points left in travel direction. */
  ARROW_LEFT,

  /** Arrow that points right in travel direction. */
  ARROW_RIGHT,

  /**
    * Arrow that points upwards while slightly bending to the left in driving
    * direction.
    *
    * Example: Arrow indicating a merge.
    */
  ARROW_SLIGHT_LEFT,

  /**
   * Arrow pointing upwards while slightly bending to the right in driving
   * direction.
   *
   * Example: Arrow indicating a merge.
   */
  ARROW_SLIGHT_RIGHT,

  /**
    * Arrow that points sharp to the right, slightly bending back in driving
    * direction.
    */
  ARROW_SHARP_RIGHT,

  /**
    * Arrow that pointing sharp to the left, slightly bending back in driving
    * direction.
    */
  ARROW_SHARP_LEFT,

  /**
    * Arrow that starts in travel direction, then turns left and points
    * back into the opposite direction.
    */
  ARROW_U_TURN_LEFT,

  /**
    * Arrow that starts in travel direction, then turns right and points
    * back into the opposite direction.
    */
  ARROW_U_TURN_RIGHT,
};


/** Name of guidance target or towards information. */
struct GuidanceName
{
  /** Guidance name class. */
  GuidanceNameClass guidanceNameClass;

  /** Number of guidance names. */
  uint8 numNames;

  /** Name strings of the guidance name. */
  GuidanceNameString(numNames) nameStrings[numNames];
};

/** Name string of a guidance name. */
struct GuidanceNameString(uint8 numNames)
{
  /** Language code of the name string. */
  LanguageCode  language;

  /** Actual name string. */
  string        name;

  /** Relations to other name strings. */
  optional      GuidanceNameStringRelationList(numNames) relations;

  /** Phonetic transcriptions for the name string. */
  optional      PhoneticTranscriptionList phoneticTranscriptions;
};

/** List of guidance relations. */
struct GuidanceNameStringRelationList(uint8 numNames)
{
  /** Number of guidance relations. */
  uint8 numRelations;

  /** Guidance name string relations. */
  GuidanceNameStringRelation(numNames) relations[numRelations];
};

/** Guidance name string relations. */
struct GuidanceNameStringRelation(uint8 numNames)
{
  /** Type of guidance name string relation. */
  GuidanceNameStringRelationType relationType;

  /**
    * Index of the related name string in the `nameStrings` list of the
    * guidance name list.
    */
  uint8 relatedGuidanceNameStringIndex : relatedGuidanceNameStringIndex < numNames;
};

/** Type of relation between guidance name strings. */
enum uint8 GuidanceNameStringRelationType
{
  /** Name string is a synonym of the related name string. */
  SYNONYM,

  /** Name string is a translation of the related name string. */
  TRANSLITERATION,

  /** Name string is an exonym of the related name string. */
  EXONYM,

  /** Name string is an alternate spelling of the related name string. */
  ALTERNATE_SPELLING,

  /** Name string is an abbreviation of the related name string. */
  ABBREVIATION,
};

/*!

TODO: Check the descriptions of the following types. Are all of them required?
 More explanation might be needed for a few of them.

!*/

/** Guidance name class types. */
enum uint8 GuidanceNameClass
{
  /** City block, for example, the administrative level of city blocks in Japan (Japanese Gaiku). */
  CITY_BLOCK,

  /** Territorial division of some countries, for example, a county in the US or a Landkreis in Germany. */
  COUNTY,

  /** Country. */
  COUNTRY,

  /** Set of countries, for example, Europe or North America. Sometimes called a supranational area. */
  COUNTRY_SET,

  /** Hamlet. */
  HAMLET,

  /** Building that humans live or work in.*/
  HOUSE,

  /** Intersection name. */
  INTERSECTION,

  /** License plate zone. */
  LICENSE_PLATE_ZONE,

  /** Municipal area, for example, a city, town, or urban area. Japan mapping: Shi-Ku-Cho-Son. */
  MUNICIPALITY,

  /** Subdivision of a municipal area, for example, a city district or ward. Japan mapping: Machi/Oaza. */
  MUNICIPALITY_SUBDIVISION,

  /**
    * Administrative area that is not an official city or city district and
    * also is not a zone, for example, Villingen contained in Villingen-Schwenningen
    * or Borsum contained in Harsum.
    */
  NAMED_AREA,

  /** Name of a bridge. */
  NAMED_BRIDGE,

  /** Tunnel name. */
  NAMED_TUNNEL,

  /**
    * Area formed on a cultural, social, or economical basis. Neighborhoods
    * often have a semi-official status, but they are not part of an administrative
    * structure. Names of neighborhoods are commonly known and often used as
    * place names. Typically, neighborhoods do not have official borders.
    * Examples: Karolinenviertel in Hamburg, Little Italy in New York, Quartier
    * Pigalle in Paris, Soho in London, or Museum Island in Berlin.
    * Japan mapping: Chome/Aza.
    */
  NEIGHBORHOOD,

  /** Postal code district .*/
  POSTAL_CODE_DISTRICT,

  /**
    * Place name that is preferred for usage in addresses, for example,
    * USPS ZIP-9 Preferred Localities.
    *
    * TODO: Apply the same restriction as in NDS.Classic, i.e. this shall only
    * be used for reverse geocoding and not for destination input? Then we need a rule.
    */
  PREFERRED_POSTAL_PLACE,

  /** Point of interest. */
  POI,

  /** Road. */
  ROAD,

  /** Road number. */
  ROAD_NUMBER,

  /**
    * Route name that is different from standard road names, for example,
    * "S Van Ness Ave" vs. "United States Highway 101 N" (San Francisco).
    */
  ROUTE,

  /** Signpost. */
  SIGNPOST,

  /** Sub-country area, for example, a province or state. Japan mapping: To-Do-Fu-Ken. */
  SUB_COUNTRY,

  /** Set of sub-country areas, for example, regions of provinces. Japan mapping: Chiho. */
  SUB_COUNTRY_SET,

  /** Toll station. */
  TOLL_GATE,

  /** Tourist route. */
  TOURIST_ROUTE,

  /** Traffic zone .*/
  TRAFFIC_ZONE,

  /**
    * Agglomeration of administrative areas, for example, Greater City Zone New York, Greater Tokyo Area.
    * Zones do not belong to and cannot be mapped directly to an administrative level.
    */
  ZONE,
};
