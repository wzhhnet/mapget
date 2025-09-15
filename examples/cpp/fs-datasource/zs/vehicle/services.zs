/*!

# Vehicle Services

This package defines services for vehicle horizon generation.

**Dependencies**

!*/

package vehicle.services;

import system.types.*;
import core.types.*;
import core.vehicle.*;
import vehicle.types.*;
import vehicle.metadata.*;


/*!

## Vehicle Horizon Service

!*/

rule_group HorizonServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Vehicle Horizon Service:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `VehicleHorizonService`.
  !*/

  rule "vehicle-ktf6h8";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Vehicle Horizon Service:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `VehicleHorizonService`.
  !*/

  rule "vehicle-8oi7me";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Vehicle Horizon Service:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `VehicleHorizonService`.
  !*/

  rule "vehicle-zm8u3f";

  /*!
  Metadata Method `getHorizonServiceCapabilities` in Vehicle Horizon Service:

  The metadata method `getHorizonServiceCapabilities` shall be implemented by the
  `VehicleHorizonService`.
  !*/

  rule "vehicle-3wzdge";
};

/** Service interfaces for a vehicle horizon service. */
service VehicleHorizonService
{
  /** Module definition of the vehicle horizon service. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** System token of the vehicle horizon service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Legal metadata of the vehicle horizon service. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Metadata on implemented methods of the vehicle horizon service. */
  HorizonServiceCapabilitiesResponse getHorizonServiceCapabilities(Empty);

  /** Calculate a vehicle horizon based on request parameters. */
  Horizon calculateHorizon(HorizonRequest);
};

/** Details for vehicle horizon service requests. */
struct HorizonRequest
{
  /**
    * List of vehicle poses.
    * Latest position shall be on top of the list (index 0).
    * Ordering of the list shall be from newest to oldest pose.
    */
  VehiclePose pose[] : lengthof(pose) >= 1;

  /** Requested length of the horizon in meters. */
  LengthMeters horizonLength;
};
