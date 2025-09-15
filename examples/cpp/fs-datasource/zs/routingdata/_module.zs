/*!

# NDS.Live Routing Data Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Routing Data module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

Routing data is used to determine the optimal path between a starting point and
a destination based on several factors, for example, the energy consumption on a
specific route.

The Routing Data module provides attributes to support route calculation and
guidance. Examples:

- Speed profiles that describe time-specific driving speeds on a road range.
- Tourist routes that allow drivers to select a route based on certain
  characteristics that make them attractive for tourism.
- Eco routing attributes, such as road slope, speed variation, and consumption
  speed curve.

The routing attributes can be assigned to roads or lanes using the corresponding
layer.

## Content of the Routing Data Module

The Routing Data module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides attributes for routing.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the attribute layer definitions for routing.
[metadata.zs](metadata.zs)             | Provides metadata for routing.
[properties.zs](properties.zs)         | Provides attribute property definitions for routing attributes.
[types.zs](types.zs)                   | Provides types for routing attributes.

**Dependencies**

!*/

package routingdata._module;

import system.types.*;

import routingdata.layer.*;
import routingdata.types.*;
import routingdata.attributes.*;
import routingdata.properties.*;
import routingdata.metadata.*;
import routingdata.instantiations.*;

const ModuleName NAME = "ROUTING_DATA";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.07";

/**
  * Extern identifier of the routing attribute layer for roads, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_ROUTING_LAYER = "routingdata.layer.RoadRoutingLayer";

/**
  * Extern identifier of the metadata of the routing attribute layer for roads. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_ROUTING_METADATA = "routingdata.metadata.RoadRoutingLayerMetadata";

/**
  * Extern identifier of the routing attribute layer for lanes, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_ROUTING_LAYER = "routingdata.layer.LaneRoutingLayer";

/**
  * Extern identifier of the metadata of the routing attribute layer for lanes. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_ROUTING_METADATA = "routingdata.metadata.LaneRoutingLayerMetadata";