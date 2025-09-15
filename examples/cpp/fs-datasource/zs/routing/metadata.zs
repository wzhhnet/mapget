/*!

# Routing Service Metadata

This package defines routing service metadata.

**Dependencies**

!*/

package routing.metadata;

import routing.types.*;
import routing.route.*;
import core.language.*;
import core.types.*;

/*!

## Routing Registry Metadata

Routing registry metadata stores information about the type and capabilities of
a routing service.

Routing registry metadata structures are stored in the registry service metadata
so that clients can identify capabilities and content definitions of routing services
before querying the services.

!*/

rule_group RoutingRegistryMetadataRules
{
  /*!
  Routing Registry Metadata Storage:

  Routing registry metadata structures shall be stored in the registry service metadata.
  !*/

  rule "routing-zhrmq9";
};

/** Stores information about the type and capabilities of a routing service. */
struct RoutingRegistryMetadata
{
  /** Type of the routing service. */
  RoutingServiceType routingServiceType;

  /** Description of the implemented service methods of the routing service. */
  RoutingServiceCapabilities(routingServiceType) capabilities;

  /** Available languages used in the routing service. */
  AvailableLanguages availableLanguages;

  /** ISO revision of the language codes used in the routing service. */
  IsoRevision isoRevisionLanguages;

  /** ISO revision of the country codes used in the routing service. */
  IsoRevision isoRevisionCountries;
};

/** Type of the routing service. **/
enum uint8 RoutingServiceType
{
  /** Service generates routes. */
  ROUTE_SERVICE,

  /** Service projects ranges. */
  RANGE_PROJECTION_SERVICE,
};

/*!

## Routing Service Capabilities

The capabilities of a routing service depend on the routing service type.

!*/

choice RoutingServiceCapabilities(RoutingServiceType type) on type
{
  case ROUTE_SERVICE:
        RouteServiceCapabilities routeServiceCapabilities;

  case RANGE_PROJECTION_SERVICE:
        RangeProjectionServiceCapabilities rangeProjectionServiceCapabilities;
};

/** Capabilities of a routing service. **/
struct RouteServiceCapabilities
{
  /** Describes which methods are implemented by the routing service. */
  RouteServiceMethods implementedMethods;

  /** List of supported route types. */
  RouteType supportedRouteTypes[];

  /** List of available route options. */
  RouteOptions supportedRouteOptions[];

  /** Supported language codes. */
  LanguageCode  supportedLanguages[];

  /** Supported vehicle-specific routing options. */
  SupportedVehicleDetails supportedVehicleDetails;

  /** Supported driver-specific routing options. */
  SupportedDriverProfileDetails supportedDriverProfileDetails;

  /** Set to `true` if the service provides route alternatives. */
  bool providesAlternativeRoutes;

  /** Set to `true` if the service considers departure and/or arrival times. */
  bool considersTimes;

  /** Set to `true` if the service expects or uses custom request data. */
  bool usesCustomData;

  /** Unspecified metadata for custom request data. */
  extern customDataMetadata if usesCustomData;
};

/** Vehicle-specific options supported by a routing service. */
bitmask uint16 SupportedVehicleDetails
{
  /** Offers routing optimized for electric vehicles. */
  ENGINE_TYPE_ELECTRIC,

  /** Considers the emission class and corresponding prohibitions. */
  ENGINE_EURO_EMISSION_CLASS,

  /** Supports routing for big vehicles like trucks. */
  VEHICLE_TYPE_TRUCK,

  /** Supports using public transport for routing. */
  VEHICLE_TYPE_PUBLIC_TRANSPORT,

  /** Supports routing for pedestrians. */
  VEHICLE_TYPE_PEDESTRIAN,

  /** Supports routing for bicycles. */
  VEHICLE_TYPE_BICYCLE,
};

/** Driver-specific options supported by a routing service. */
bitmask uint16 SupportedDriverProfileDetails
{
  /** Considers driving style, which effects consumption. */
  DRIVER_AGGRESSIVENESS,

  /**
    * Considers disabilities, for example, to pick a suitable
    * parking spot or to park near the entrance.
    */
  DISABLED_DRIVERS,
};

/** Optional methods that a routing service can implement. */
bitmask uint16 RouteServiceMethods
{
  /** Set if the `getRoute` method is implemented. */
  GET_ROUTE,
};

/** Capabilities of a range-projecting service. **/
struct RangeProjectionServiceCapabilities
{
  /** Describes which methods are implemented by the routing service. */
  RangeProjectionServiceMethods implementedMethods;

  /** List of supported range-projection types. */
  RangeProjectionType supportedRangeProjectionTypes[];
};

/** Optional methods that a range projection service may implement. */
bitmask uint16 RangeProjectionServiceMethods
{
  /** Set if the `calculateRange` method is implemented. */
  CALCULATE_RANGE,
};
