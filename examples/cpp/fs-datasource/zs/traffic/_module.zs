/*!

# NDS.Live Traffic Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Traffic module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

Traffic information in navigation systems is used to provide real-time information
about traffic flow and events. Traffic information can stem from various sources,
such as traffic cameras, sensors, or government agencies.

The Traffic module provides attributes to support traffic-related use cases, for
example, traffic events, the current state of traffic flow, current road conditions,
or parking availability.

Traffic attributes apply to road transitions or to ranges on a road, lane, or
display line.

Traffic attributes can be assigned to roads, road locations, lanes, or display
lines using the corresponding layer.

## Content of the Traffic Module

The Traffic module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides traffic attributes.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the attribute layer definitions for traffic.
[metadata.zs](metadata.zs)             | Provides metadata for traffic.
[properties.zs](properties.zs)         | Provides attribute properties for traffic attributes.
[types.zs](types.zs)                   | Provides types for traffic attributes.

**Dependencies**

!*/

package traffic._module;

import system.types.*;

import traffic.layer.*;
import traffic.attributes.*;
import traffic.properties.*;
import traffic.instantiations.*;
import traffic.types.*;
import traffic.metadata.*;

const ModuleName NAME = "TRAFFIC";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the traffic attribute layer for roads using direct references,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_TRAFFIC_LAYER = "traffic.layer.RoadTrafficLayer";

/**
  * Extern identifier of the traffic attribute layer for roads using indirect references,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_TRAFFIC_LAYER_INDIRECT = "traffic.layer.RoadTrafficLayerIndirect";

/**
  * Extern identifier of the traffic attribute layer for road locations, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_LOCATION_TRAFFIC_LAYER = "traffic.layer.RoadLocationTrafficLayer";

/**
  * Extern identifier of the traffic attribute layer for lanes using direct
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_TRAFFIC_LAYER = "traffic.layer.LaneTrafficLayer";

/**
  * Extern identifier of the traffic attribute layer for lanes using indirect
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_TRAFFIC_LAYER_INDIRECT = "traffic.layer.LaneTrafficLayerIndirect";

/**
  * Extern identifier of the traffic attribute layer for display lines using direct
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_LINE_TRAFFIC_LAYER = "traffic.layer.DisplayLineTrafficLayer";

/**
  * Extern identifier of the metadata of the traffic attribute layer for roads
  * using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_TRAFFIC_LAYER_METADATA = "traffic.metadata.RoadTrafficLayerMetadata";

/**
  * Extern identifier of the metadata of the traffic attribute layer for roads
  * using indirect references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_TRAFFIC_LAYER_INDIRECT_METADATA = "traffic.metadata.RoadTrafficLayerIndirectMetadata";

/**
  * Extern identifier of the metadata of the traffic attribute layer for
  * road locations. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_LOCATION_TRAFFIC_LAYER_METADATA = "traffic.metadata.RoadLocationTrafficLayerMetadata";

/**
  * Extern identifier of the metadata of the traffic attribute layer for lanes
  * using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_TRAFFIC_LAYER_METADATA = "traffic.metadata.LaneTrafficLayerMetadata";

/**
  * Extern identifier of the metadata of the traffic attribute layer for lanes
  * using indirect references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_TRAFFIC_LAYER_INDIRECT_METADATA = "traffic.metadata.LaneTrafficLayerIndirectMetadata";

/**
  * Extern identifier of the metadata of the traffic attribute layer for display lines
  * using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_LINE_TRAFFIC_LAYER_METADATA = "traffic.metadata.DisplayLineTrafficLayerMetadata";