/*!

# Search Types

This package defines types that are referenced in the search
service interface.

**Dependencies**

!*/

package search.types;

import system.types.*;
import core.types.*;
import core.geometry.*;
import core.location.*;

/*!

## Search Result

The search result is based on the search string from the search request. All
distances, if available, are based on the `origin` position of the search request.

!*/

/** Search result that is based on the search string from the search request. */
struct SearchResult(bool hasDistanceInfo)
{
  /** Geographic position of the search result. */
  Position2D(0) position;

  /**
    * Road location path that represents the road on which the search result is
    * located. The search result is located on the right side in direction of the path.
    */
  optional RoadLocationPath path;

  /**
    * Straight-line distance between the `origin` position of the search request and
    * the `position` of the search result.
    *
    * The straight-line distance is the shortest distance between the two positions,
    * not taking into account the road network or the surface in general.
    */
  DistanceMeters distanceToOrigin if hasDistanceInfo;

  /** Indicates whether an optional travel distance is available. */
  bool hasTravelDistance if hasDistanceInfo;

  /**
    * Travel distance between the `origin` position of the search request and
    * the `position` of the search result.
    *
    * In contrast to the straight-line distance, the travel distance is calculated
    * based on the underlying road network.
    */
  DistanceMeters travelDistanceToOrigin if hasDistanceInfo && hasTravelDistance;

  /** Preformatted string to display in the search result list. */
  string displayString;

  /**
    * Ranges of the display string that may be used to highlight matching parts
    * of the search term.
    *
    * The matches do not need to be exact matches. For example, highlighting of
    * fuzzy matches is possible.
    */
  optional TextRange highlight[];

  /** Search result type. */
  SearchResultType type;

  /** Global source ID of the search result. */
  optional GlobalSourceId globalSourceId;

  /**
    * External data structure that provides more information on the
    * search result based on its type. The structures are defined in the POI or
    * Name modules and may contain POI IDs, POI categories, selection criteria, or
    * address formats.
    */
  optional ExternData detailedResultInformation;
};

/*!

## Text Range

A range of text described by its start index and end index.

The indexes are based on the character count of the text, not on the byte count.
Text ranges are supported for text lengths up to 32767 characters.

!*/

rule_group TextRangeRules
{
  /*!
  Text Length in `TextRange`:
  The text that a text range is applied to shall not be longer than 536870911
  characters.
  !*/

  rule "search-a0uicz";
};

/** Range of text that is described by its start index and end index. */
struct TextRange
{
  /** Index of the start character. */
  CharacterIndex startIndex;

  /** Index of the end character. */
  CharacterIndex endIndex;
};

/** Index position of a character within a text. */
subtype varuint32 CharacterIndex;

/*!

## Other Types

!*/

/** Type of search result. */
enum uint8 SearchResultType
{
  /** General result type for addresses. */
  ADDRESS,
  /**
    * Result type for address objects that are larger than a place,
    * for example, countries or states.
    */
  ADDRESS_COUNTRY,

  /**
    * Result type for address objects that are larger than a road, for example,
    * municipalities, districts, or postal codes.
    */
  ADDRESS_PLACE,

  /** Result type for roads with or without house numbers and address points. */
  ADDRESS_ROAD,

  /** Result type for intersections. */
  ADDRESS_INTERSECTION,

  /** Result type for points of interest. */
  POI,
};

/**
  * List of auto-completion suggestions based on the search term in the search
  * request, ordered by relevance.
  *
  * Index 0 of the list is the most relevant suggestion. The provided suggestion
  * replaces the complete search string. Even if only the last token is
  * auto completed or corrected, the full search string is supplied including all
  * suggestions.
  */
struct Suggestions
{
  string suggestion[];
};

/**
  * String containing next valid characters based on the search term provided in
  * the search request.
  */
struct NextValidCharacterList
{
  string nvc;
};

/** Order in which search results are provided. */
bitmask uint8 ResultOrder
{
  /** The server defines the order of the search results. */
  GENERAL,

  /**
    * The search results are ordered by straight-line distance from the `origin`
    * position of the search request.
    */
  DISTANCE,

  /**
    * The search results are ordered by travel distance or routing distance from
    * the `origin` position of the search request.
    */
  TRAVEL_DISTANCE,

  /** The search results are ordered by relevance to the provided search term. */
  TERM_RELEVANCE,
};
