/*!

# Search Services

This package defines the search service interface and type specifications of parameters.

**Dependencies**

!*/

package search.services;

import core.types.*;
import core.geometry.*;
import core.language.*;
import core.location.*;
import search.types.*;
import system.types.*;

/*!

## Search Service

A search service provides search service interfaces. Servers use the interface to
implement a text-based geographic search service, and clients use the interface
to retrieve ranked search results and completions.

A client uses the `getConfiguration` call to get the following information:
- The capabilities of the server, which indicate the degree of freedom of what
the client can do with the server.
- The kind of data to expect in a `GeneralSearchResponse` return value.

!*/

/** Provides search service interfaces. */
service SearchService
{
  /** Module definition of the search service. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** System token of the search service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Supported search configuration. */
  SupportedSearchConfiguration getConfiguration(Empty);

  /** General search response. */
  GeneralSearchResponse search(GeneralSearchRequest);
};

/*!

### Search Server Configuration

As a result of the `getConfiguration` call, the `SupportedSearchConfiguration`
informs the client about the types of available search result objects.
The following search result types are supported:
- `ADDRESS`
- `POI`
- `NVC` = next valid characters
- `SUGGESTIONS` = auto completions

For search results of type `POI` and `ADDRESS`, `poiSearchMetadata` and
`addressSearchMetadata` provide type-specific details on the search
configuration, respectively.

!*/

rule_group SearchServerConfigurationRules
{
  /*!
  Setting of Search Result Object:

  In `supportedFeatures`, at least one of the search result objects
  `ADDRESS` or `POI` shall be set. The search result objects `NVC` and
  `SUGGESTIONS` are optional.
  !*/

  rule "search-fxh2km";

  /*!
  Supported Result Orders:

  Clients shall only request result orders that are supported
  by the search service.
  !*/

  rule "search-46xibp-I";

  /*!
  Displaying of Characters in Supported Languages:

  Clients shall ensure that they can display the characters of all supported
  languages correctly.
  !*/

  rule "search-4kwwk4-I";
};


/** Detailed information about the type of service that is provided by the server. */
struct SupportedSearchConfiguration
{
  /** Supported search result types.  */
  SupportedFeature supportedFeatures;

  /** Supported request options. */
  RequestOptions supportedRequestOptions;

  /** Bitmask of supported result orders. */
  ResultOrder supportedResultOrders
    if isset(supportedRequestOptions, RequestOptions.RESULT_ORDER);

  /** All languages that the search service is able to return. */
  AvailableLanguages availableLanguages;

  /** Module definition of the POI module needed for POI searches. */
  ModuleDefinition poiModuleDefinition
        if isset(supportedFeatures, SupportedFeature.POI);

  /** The metadata defined in the POI module, such as POI categories. */
  ExternData poiSearchMetadata
        if isset(supportedFeatures, SupportedFeature.POI);

  /** Module definition of the Names module needed for address searches. */
  ModuleDefinition nameModuleDefinition
        if isset(supportedFeatures, SupportedFeature.ADDRESS);

  /** The metadata defined in the Names module, such as address format of search results. */
  ExternData addressSearchMetadata
        if isset(supportedFeatures, SupportedFeature.ADDRESS);

  /** ISO revision of the language codes used in the search service. */
  IsoRevision isoRevisionLanguages;

  /** ISO revision of the country codes used in the search service. */
  IsoRevision isoRevisionCountries;
};

/** Supported search result types. */
bitmask uint8 SupportedFeature
{
  /** The service supports address search. */
  ADDRESS,

  /** The service supports POI search. */
  POI,

  /** The service supports next valid character dictation. */
  NVC,

  /** The service supports auto completion of search strings. */
  SUGGESTIONS,
};


/** Options of a search request. */
bitmask varuint16 RequestOptions
{
  /** Request results in preferred language. */
  PREFERRED_LANGUAGE,

  /** Request results around a position. */
  SEARCH_AROUND,

  /** Request results along a path. */
  SEARCH_ALONG,

  /** Request results within a defined geographical area. */
  SEARCH_IN_GEO_AREA,

  /** Request results within a country defined by ISO country code. */
  SEARCH_IN_ISO_COUNTRY,

  /** Limit the request to the defined maximum number of results. */
  MAX_RESPONSE,

  /** Request results to be returned in a dedicated order. */
  RESULT_ORDER,

  /** Request POI results to be filtered. */
  POI_FILTER,

  /** Request addresses to be filtered. */
  ADDRESS_FILTER,

  /** Request a specific geopolitical view for the search results. */
  GEOPOLITICAL_VIEW, 
};

/*!

### Search Request

The `GeneralSearchRequest` structure encodes a text-based search request.
The minimal version of this structure contains a single search string.

Optional members allow to specify additional constraints, for example,
geographic constraints (`geoSearchDetails`), constraints regarding the result
ranking size (`maxResponseCount`), or result ranking criterion (`order`).

!*/

rule_group SearchRequestRules
{
  /*!
  Preferred Language of Search Request:

  If a preferred language is indicated in a search request, then the
  corresponding language code shall match one of the languages that are
  supported by the search configuration of the service.
  !*/

  rule "search-2qjppf";
};

/** Encodes a text-based search request. */
struct GeneralSearchRequest
{
  /** Options used in the search request. */
  RequestOptions options;

  /** Search string entered by the user. */
  string term;

  /**
    * Preferred language in which the service returns search results.
    * If not set, the service can return any of the supported languages.
    * If set and no result can be provided in the preferred language, the
    * service may return a result in any of the other supported languages.
    */
  LanguageCode preferredLanguage
    if isset(options, RequestOptions.PREFERRED_LANGUAGE);

  /** Geographic position around which the search is performed. */
  AroundPositionSearchRequestDetails aroundSearchDetails
    if isset(options, RequestOptions.SEARCH_AROUND);

  /** Path along which the search is performed. */
  AlongPathSearchRequestDetails alongSearchDetails
    if isset(options, RequestOptions.SEARCH_ALONG);

  /** Geographic area defined by a bounding box or bounding polygon in which the search is performed. */
  SpatialExtent inAreaSearchDetails
    if isset(options, RequestOptions.SEARCH_IN_GEO_AREA);

  /** Area defined by ISO country code in which the search is performed. */
  IsoCountryCode isoCountryCode
    if isset(options, RequestOptions.SEARCH_IN_ISO_COUNTRY);

  /** Maximum number of responses. */
  varuint maxResponseCount
    if isset(options, RequestOptions.MAX_RESPONSE);

  /** Order in which the search results are returned. */
  ResultOrder order
    if isset(options, RequestOptions.RESULT_ORDER);

  /**
    * External data structure to filter the search.
    * The structures are defined in the POI module
    * and can contain `PoiCategory` or similar information.
    */
  ExternData poiFilter
    if isset(options, RequestOptions.POI_FILTER);

  /**
    * External data structure to filter the search.
    * The structures are defined in the Name module and can contain
    * administrative hierarchy elements or similar information.
    */
  ExternData addressFilter
    if isset(options, RequestOptions.ADDRESS_FILTER);

  /** Geopolitical view for the search results based on the ISO codes of the country. */
  Iso3166Codes geopoliticalView
    if isset(options, RequestOptions.GEOPOLITICAL_VIEW);
};

/** Details of the geographic position around which a search is performed. */
struct AroundPositionSearchRequestDetails
{
  /** Center of the search area. */
  Position2D(0) origin;

  /**
    * Optional maximum distance in meters from the `origin` position to
    * determine the size of the search area.
    */
  optional DistanceMeters maxDistance;
};

/** Details of the path along which a search is performed. */
struct AlongPathSearchRequestDetails
{
  /** Search path. */
  RoadLocationPath path;

  /**
    * Optional maximum travel distance in meters on all sides of the search path
    * to determine the radius of the search corridor.
    * For example, if visiting a restaurant requires a detour of 900 m from the
    * route and the maximum travel distance is set to 1 km, then the restaurant
    * is included in the search result.
    */
  optional DistanceMeters maxTravelDistance;
};

/*!

### Search Response

The `GeneralSearchResponse` structure encodes any return values of the
`Search.search` service call. The response contains the available results
for the POI or address search, which can be ranked, and optionally contains
suggestions or next valid characters.

!*/

/** Encodes any return values of the `Search.search` service call. */
struct GeneralSearchResponse
{
  /**
    * If set to `true`, the search result contains information about the distance
    * from the `origin` position of the search request.
    */
  bool hasDistanceInfo;

  /** List of suggestions based on auto completion.  */
  optional Suggestions suggestionList;

  /** List of next valid characters.  */
  optional NextValidCharacterList nvcList;

  /** Number of search results.  */
  varuint32 numResults;

  /** List of search results. Can be empty if `numResults` is 0. */
  SearchResult(hasDistanceInfo) results[numResults];
};

/*!

## Geocoding Service

A geocoding service provides service interfaces for geocoding and reverse geocoding.
Servers use the interface to implement address and position information that is
used for geocoding. Clients use the interface to retrieve a position for an address,
called geocoding, or to retrieve an address for a position, called reverse geocoding.

!*/

/** Provides service interfaces for geocoding and reverse geocoding. */
service GeocodingService
{
  /** Module definition of the search service. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** System token of the search service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Metadata on implemented methods of the geocoding service. */
  GeocodingServiceCapabilities getGeocodingServiceCapabilities(Empty);

  /** Method to request coordinates for an address. */
  GeocodingPosition geocode(GeocodingAddress);

  /** Method to request an address for a geo position. */
  GeocodingAddress reverseGeocode(GeocodingPosition);
};

/** Position to be used for geocoding services. */
struct GeocodingPosition
{
  /** Position of the location using full coordinate resolution. */
  Position2D(0) position;
};

/** Address information to be used for geocoding services. */
struct GeocodingAddress
{
  /** Type of address content that is requested. */
  GeocodingContentType content;

  /** String that contains the address in no particular format. */
  string addressString
    if isset(content, GeocodingContentType.ADDRESS_STRING);
  /**
    * External data structure with detailed information about the result.
    * The structures are defined in the Name module and can contain
    * administrative hierarchy elements or similar information.
    */
  ExternData addressDetails
    if isset(content, GeocodingContentType.ADDRESS_DETAILS);
};

/** Type of address content provided in a geocoding request. */
bitmask varuint16 GeocodingContentType
{
  /** Address in simple string representation. */
  ADDRESS_STRING,

  /** Detailed hierarchy information as provided by the Names module. */
  ADDRESS_DETAILS,
};

/** Detailed information about the capabilities of the geocoding service. */
struct GeocodingServiceCapabilities
{
  /** Implemented methods of the geocoding service. */
  GeocodingServiceMethods implementedMethods;
};

/** Provides methods that can be implemented with the geocoding service. */
bitmask varuint16 GeocodingServiceMethods
{
  /** Set if the `geocode` method is implemented. */
  GEOCODE,

  /** Set if the `reverseGeocode` method is implemented. */
  REVERSE_GEOCODE,
};