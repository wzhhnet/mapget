/*!

# NDS.Live Search Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Search module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Search module provides definitions for a remote procedure call (RPC) interface
that a server can use to implement a text-based geographic search service and a
client can use to retrieve ranked results and completions for a text-based geographic
search input.

The API offers the following degrees of freedom (DOF):

**Request**
  - __Search string__: User input for a textual search
  - __Location__: Centroid and radius of the location
  - __Max response count__: Maximum number of ranked search hits
  - __Result order__: Criterion by which the results are ranked, for example,
  server-defined, distance-based, lexical match, or travel distance

**Response**
  - __Completion suggestions__: Postfix strings that can complete the user's
  search input, possibly fuzzy-matched
  - __Next valid character list__: Characters that are allowed as continuation
  of the search input, specific to the server's database
  - __Ranked matches__: Ordered result objects, including a position and an
  external component that is specified by the result type, for example, POI, Name,
  or Road

Before invoking a search, a client can use a supported search configuration
request to determine which of the above mentioned DOF requests are supported by
the server.

## Content of the Search Module

The Search module includes the following files:

Files                            | Description
---------------------------------|-----------------------------------------------------------------------------
[services.zs](services.zs)       | Provides the search service interface and type specifications of parameter and result wrappers.
[types.zs](types.zs)             | Provides content for types that are referenced in the search service interface.

**Dependencies**

!*/

package search._module;
import system.types.*;

import search.services.*;
import search.types.*;

const ModuleName NAME = "SEARCH";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/** Module service identifier of a search service. */
const ModuleService SEARCH_SERVICE = "search.services.SearchService";

/** Module service identifier of a geocoding service. */
const ModuleService GEOCODING_SERVICE = "search.services.GeocodingService";
