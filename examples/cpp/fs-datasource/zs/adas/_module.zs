/*!

# NDS.Live ADAS Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live ADAS module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

Advanced driver assistance systems (ADAS) are designed to enhance the safety and
convenience of driving by using various sensors and other technologies to
monitor the vehicle's surroundings.

The ADAS module provides attributes to support ADAS use cases, for example,
slope, curvature, clothoid, gradient, or comfortable speed.

ADAS attributes are valid for positions or ranges on a feature geometry or a
dedicated ADAS geometry. The ADAS geometry is independent of the road geometry
and can contain different positions than the corresponding feature geometry. For
more information, see [ADAS Geometry](types.zs).

The ADAS attributes can be assigned to roads, road locations, lanes, or
transitions using the corresponding layer.

## Content of the ADAS Module

The ADAS module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides ADAS attributes.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides ADAS attribute layers.
[metadata.zs](metadata.zs)             | Provides metadata for ADAS attribute layers.
[properties.zs](properties.zs)         | Provides attribute properties for ADAS attributes.
[types.zs](types.zs)                   | Provides types for ADAS attributes.
[examples.zs](examples.zs)             | Provides use cases for ADAS attributes.

**Dependencies**

!*/

package adas._module;

import system.types.*;
import adas.layer.*;
import adas.types.*;
import adas.attributes.*;
import adas.properties.*;
import adas.metadata.*;
import adas.instantiations.*;
import adas.examples.*;


const ModuleName NAME = "ADAS";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.07";

/**
  * Extern identifier of the ADAS attribute layer for roads, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern ADAS_ROAD_LAYER = "adas.layer.AdasRoadLayer";

/**
  * Extern identifier of the ADAS attribute layer for road locations, which can
  * be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ADAS_CLASSIC_LOCATION_LAYER = "adas.layer.AdasRoadLocationLayer";

/**
  * Extern identifier of the ADAS attribute layer for lanes, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern ADAS_LANE_LAYER = "adas.layer.AdasLaneLayer";

/**
  * Extern identifier of the metadata of the ADAS attribute layer for roads.
  * The layer metadata can be used by`smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ADAS_ROAD_LAYER_METADATA = "adas.metadata.AdasRoadLayerMetadata";

/**
  * Extern identifier of the metadata of the ADAS attribute layer for road
  * locations. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ADAS_CLASSIC_LOCATION_LAYER_METADATA = "adas.metadata.AdasRoadLocationLayerMetadata";

/**
  * Extern identifier of the metadata of the ADAS attribute layer for lanes. The
  * layer metadata can be used by`smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ADAS_LANE_LAYER_METADATA = "adas.metadata.AdasLaneLayerMetadata";
