/*!

# NDS.Live Road Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Road module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Road module provides data structures to model road topology as well as
geometry.

The road model is independent from the lane model. There are no direct
references between the road model and the lane model. All attributes that can be
assigned to lanes or lane groups can also be assigned to roads.

The road topology is modeled using the following:

- A road feature corresponds to a part of a real-world road. A road is
  tile-independent and is therefore split on tile borders. Each road has an
  identifier and provides information on the length of the road in centimeters.
  Road geometries can optionally be provided using a separate data layer.
- An intersection feature has an identifier and additionally stores information
  on the z-Level of the intersection, its position, directed references to the
  connected roads. Artificial intersections are introduced at tile borders to
  connect roads from adjacent tiles.

For detailed information about roads and intersections, see [Roads and
Intersections](road.zs).

Because roads are aggregated on upper tile levels, the road network can be
provided with a different degree of detail on different tile levels.
Applications can connect roads from different levels by relating intersections
that have the same position on different levels. For more information, see
[Roads and Intersections > Routing Information in Road
Tiles](road.zs#routing-information-in-road-tiles).

Roads and intersections are stored in road and intersection lists respectively,
which are provided using the corresponding layer:

- The road layer stores all road topology and intersection features.
- The road geometry layer stores 2D lines for roads.
- The matched road path layer stores references to roads in the road layer that
  have been matched by a service. The matched road path layer is always used
  together with a road layer that contains the referenced roads.

Attributes from attribute modules can be assigned to road features via the
dedicated Road Reference module.

## Content of the Road Module

The Road module includes the following files:

Files                                   | Description
----------------------------------------| ----------------------------------------------------------------------------
[instantiations.zs](instantiations.zs)  | Provides instantiations for the Road module.
[layer.zs](layer.zs)                    | Provides the layer definitions for roads.
[metadata.zs](metadata.zs)              | Provides metadata for the road layer.
[road.zs](road.zs)                      | Provides structures for road topology and road geometry.

**Dependencies**

!*/

package road._module;

import system.types.*;
import road.road.*;
import road.metadata.*;
import road.layer.*;
import road.instantiations.*;

const ModuleName NAME = "ROAD";
const ModuleVersion VERSION = "2024.05";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the road layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_LAYER = "road.layer.RoadLayer";

/**
  * Extern identifier of the road geometry layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_GEOMETRY_LAYER = "road.layer.RoadGeometryLayer";

/**
  * Extern identifier of the matched road path layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern MATCHED_ROAD_PATH_LAYER = "road.layer.MatchedRoadPathLayer";

/**
  * Extern identifier of the road layer metadata. The layer metadata can be
  * used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_LAYER_METADATA = "road.metadata.FeatureLayerMetadata";

/**
  * Extern identifier of the metadata of the road geometry layer. The layer
  * metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_GEOMETRY_LAYER_METADATA = "road.metadata.GeometryLayerMetadata";

/**
  * Extern identifier of the metadata of the matched road path layer. The layer
  * metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern MATCHED_ROAD_PATH_LAYER_METADATA = "road.metadata.MatchedRoadPathLayerMetadata";
