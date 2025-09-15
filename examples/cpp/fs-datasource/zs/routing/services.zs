/*!

# Routing Services

This package defines the service interfaces for routing.

**Dependencies**

!*/

package routing.services;

import routing.types.*;
import routing.route.*;
import routing.metadata.*;

import core.types.*;
import core.vehicle.*;
import core.geometry.*;
import core.location.*;

import system.types.*;

/*!


## Routing Service

A routing service provides routes based on request details.

!*/

rule_group RoutingServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Routing Service:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `RoutingService`.
  !*/

  rule "routing-opbdph";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Routing Service:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `RoutingService`.
  !*/

  rule "routing-oox066";

  /*!
  Metadata Method `getRouteServiceCapabilities` in Routing Service:

  The metadata method `getRouteServiceCapabilities` shall be implemented by the
  `RoutingService`.
  !*/

  rule "routing-ootnia";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Routing Service:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `RoutingService`.
  !*/

  rule "routing-k2bk8x";

  /*!
  Order of Via Points:

  If `RoutingServiceRequest.optimizeViaPoints` is set to `false`, the server
  shall strictly maintain the order of via points.
  !*/

  rule "routing-9g0pxx";
};

/** Service that provides routes based on request details from the `RoutingServiceRequest`. */
service RoutingService
{
  /** Module definition of the routing service. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** System token of the routing service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /**
    * Metadata on implemented methods and supported options
    * of the routing service.
    */
  RouteServiceCapabilities getRouteServiceCapabilities(Empty);

  /** Legal metadata of the service node. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Calculate a route with options. */
  RoutingServiceResponse getRoute(RoutingServiceRequest);
};

/** Request object for the routing service. */
struct RoutingServiceRequest
{
  /** If set to `true`, the server can optimize the order of the via points.
    * If set to `false`, the server strictly maintains order.
  */
  bool optimizeViaPoints;

  /** Languages that must be included in the response. */
  LanguageCode  language;

  /** Requested route type, for example, fastest route or eco route. */
  RouteType type;

  /** Start of the route. */
  Waypoint origin;

  /** Destination of the route. */
  Waypoint destination;

  /** Via points or stopovers. */
  optional Waypoint viaPoints[];

  /** Preference or avoidance options. */
  optional RouteOptions routeOptions[];

  /** Vehicle details. */
  optional VehicleDetails vehicleDetails;

  /** Current pose of the vehicle. */
  optional VehiclePose vehiclePose;

  /** Profile of the driver. */
  optional DriverProfile driverProfile;

  /**
    * Number of alternative routes that are requested. The service may return
    * fewer routes if no alternatives are found.
    */
  uint8 numAlternativeRoutes;

  /** Departure time. If not set, the current time is used. */
  optional TimeWithZone departureTime;

  /** Planned arrival time. */
  optional TimeWithZone arrivalTime;

  /**
    * Path that was recently covered by the client. Used by the server
    * to improve matching results for the origin of the request.
    * For example, to determine which side of the road is the origin located on
    * or to determine the current travel direction of the client.
    */
  optional RoadLocationPath coveredPath;

  /**
    * Geopolitical view for the requested route.
    * The geopolitical view may influence, for example, the guidance instructions
    * or the overall route path.
    * If no geopolitical view is provided, the server assumes the default view.
    */
  optional Iso3166Codes geopoliticalView;

  /** Custom request data. */
align(8):
  extern customRequestData;
};

/** Response object of a routing service request. */
struct RoutingServiceResponse
{
  /** Calculated route. */
  Route             route;

  /** Alternative routes have the same route type and options as the
    * original route. To get other route options, the service has to be called
    * several times. */
  optional Route    alternativeRoutes[];

  /** Map system token of the map that was used to generate the route. */
  optional NdsSystemToken mapId;

  /** Version of the map that was used to generate the route. */
  optional VersionId      versionId;

  /** Custom response data. */
align(8):
  extern customResponseData;
};

/*!

## Range Projection Service

A range projection service provides a polygon of a reachable area based on
consumption parameters.

!*/

rule_group RangeProjectionServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Range Projection Service:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `RangeProjectionService`.
  !*/

  rule "routing-v8gfp9";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Range Projection Service:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `RangeProjectionService`.
  !*/

  rule "routing-gszky7";

  /*!
  Metadata Method `getRangeProjectionServiceCapabilities` in Range Projection Service:

  The metadata method `getRangeProjectionServiceCapabilities` shall be implemented by the
  `RangeProjectionService`.
  !*/

  rule "routing-u3idaj";

  /*!
  Vehicle Consumption Data for Fuel or Battery Range Projection:

  If `RangeProjectionRequest.type` is set to `FUEL` or `BATTERY` or both, the
  respective consumption structure in `vehicleDetails` shall be filled.
  !*/

  rule "routing-qyfhmu";
};

/** Service that provides a polygon of a reachable area based on consumption parameters. */
service RangeProjectionService
{
  /** Module definition of the range projection service. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** System token of the range projection service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Metadata on implemented methods of the range-projection service. */
  RangeProjectionServiceCapabilities getRangeProjectionServiceCapabilities(Empty);

  /** Calculate a range based on current position and consumption. */
  RangeProjectionResponse calculateRange(RangeProjectionRequest);
};

/** Request object to be passed to a range projection service. */
struct RangeProjectionRequest
{
  /** Type of range projection request. */
  RangeProjectionType type;

  /** Origin position for which the range is calculated. */
  Waypoint   origin;

  /** Maximum time budget for time-based requests. */
  Seconds timeBudget if isset(type, RangeProjectionType.TIME);

  /** Maximum distance budget for distance-based requests. */
  DistanceMeters distanceMeters if isset(type, RangeProjectionType.DISTANCE);

  /** Vehicle details needed for the range calculation. */
  VehicleDetails  vehicleDetails;

  /** Current pose of the vehicle. */
  optional VehiclePose vehiclePose;

  /** Driver profile for range calculation. */
  optional DriverProfile   driverProfile;

  /**
    * Maximum number of points in the result geometry the service shall return.
    * This is to reduce the amount of resources needed to process the resulting
    * polygon of the range.
    */
  optional varuint32 maxPolyCount;
};

/** Response object for a range projection request. */
struct RangeProjectionResponse
{
  /** Used coordinate shift of the range line geometry. */
  CoordShift shift;

  /** Geometry of the range polygon. */
  Ring2D(shift) geometry;

};

/*!

## Publish-Subscribe Routing Topics

The publish-subscribe routing topics allow applications to publish route
information using NDS-encoded route structures.
This may be used as an interface between systems of different vendors, which
includes NDS and non-NDS applications.

!*/

pubsub RoutingTopics
{
  /** Currently active route. */
  topic("nds/routing/current_route") Route currentRoute;
};
