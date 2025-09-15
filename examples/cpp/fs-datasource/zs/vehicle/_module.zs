/*!

# NDS.Live Vehicle Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Vehicle module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Vehicle module provides data structures to model service-based e-horizons.
Horizon calculation is based on request details that include a list of vehicle
poses and the requested horizon length in meters.

The calculated horizon consists of multiple probable paths (MPPs) that are
connected and form a network. Each horizon path has a geometry and a list of
road location segments that allow to attach detailed information.

The Vehicle module also provides a publish-subscribe-based collection of
vehicle topics that allows applications to publish vehicle information using
NDS-encoded vehicle structures. Topics are, for example, the sequence of road
path IDs that make up the current most probable path or a list of paths that
span the probable road network ahead. A topic always contains a time stamp.

## Content of the Vehicle Module

The Vehicle module includes the following files:

Files                            | Description
---------------------------------| ----------------------------------------------------------------------------
[metadata.zs](metadata.zs)       | Provides data structures for vehicle metadata.
[services.zs](services.zs)       | Provides data structures for horizon generation services.
[topics.zs](topics.zs)           | Provides publish-subscribe topics for use in horizon scenarios.
[types.zs](types.zs)             | Provides data structures for common types that are used in the Vehicle module.

**Dependencies**

!*/

package vehicle._module;

import system.types.*;
import vehicle.topics.*;
import vehicle.types.*;
import vehicle.services.*;
import vehicle.metadata.*;

const ModuleName NAME = "VEHICLE";
const ModuleVersion VERSION = "2024.03";
const ModuleVersion MIN_VERSION = "2024.03";

/** Module service identifier of the horizon service. */
const ModuleService VEHICLE_HORIZON_SERVICE = "vehicle.services.VehicleHorizonService";

/**
  * Extern identifier of service metadata used by all vehicle services. Vehicle
  * registry metadata can be used by `registry.node.ServiceInformation.serviceMetadata`.
  */
const ModuleExtern VEHICLE_SERVICE_METADATA = "vehicle.metadata.VehicleRegistryMetadata";
