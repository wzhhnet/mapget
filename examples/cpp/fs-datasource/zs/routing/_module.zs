/*!

# NDS.Live Routing Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Routing module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Routing module provides data structures for routing-related services. In
addition to the route itself, a routing service can include other details such
as vehicle consumption information or guidance instructions. Instructions are
given based on waypoints, that is, important points on the route that are
selected by the driver.

For details, see [Routes](routes.zs) and [Guidance](guidance.zs).

Routes and optional guidance instructions are provided via a dedicated routing
service that is based on routing request details.

Additionally, the Routing module defines a time-based or range-based range
projection service that provides a polygon of a reachable area based on an
origin waypoint.

## Content of the Routing Module

The Routing module includes the following files:

Files                                    | Description
-----------------------------------------| ----------------------------------------------------------------------------
[guidance.zs](guidance.zs)               | Provides data structures for guidance instructions.
[metadata.zs](metadata.zs)               | Provides metadata for routing services and routing registries.
[route.zs](route.zs)                     | Provides data structures for routes.
[services.zs](services.zs)               | Provides data structures for routing services.
[types.zs](types.zs)                     | Provides data structures for common types that are used in the Routing module.

**Dependencies**

!*/

package routing._module;

import system.types.*;

import routing.route.*;
import routing.services.*;
import routing.guidance.*;
import routing.types.*;
import routing.metadata.*;

const ModuleName NAME = "ROUTING";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/** External service identifier of a routing service. */
const ModuleService ROUTING_SERVICE = "routing.services.RoutingService";

/** External service identifier of a range projection service. */
const ModuleService RANGE_PROJECTION_SERVICE = "routing.services.RangeProjectionService";

/**
  * External identifier of service metadata used by all routing services. Routing
  * registry metadata can be used by `registry.node.ServiceInformation.serviceMetadata`.
  **/
const ModuleExtern ROUTING_SERVICE_METADATA = "routing.metadata.RoutingRegistryMetadata";
