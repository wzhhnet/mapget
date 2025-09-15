/*!

# NDS.Live Lane Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Lane module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Lane module provides data structures to model lane topology as well as
geometry.

The lane model is independent from the road model. There are no direct
references between the road model and the lane model. All attributes that can be
assigned to roads can also be assigned to individual lanes or lane groups.

Lanes are modeled using the following:

- **Lane groups**: A lane group is a container that models a continuous part of
  a road topology based on the lanes of that road. Lanes in both directions can
  be included in one lane group, provided that there is no physical divider
  between the two sides of the road.

  There are different types of lane groups:
    - Road lane groups and intersection lane groups model the real-world road
      topology.
    - Fork lane groups and border lane groups are introduced artificially to
      resolve connectivity in specific cases.
    - Additional artificial lane groups allow to provide full lane group
      coverage in areas where no detailed lane information is available.

  All lane groups include connectors to adjacent lane groups as well as the
  information whether the lane group uses boundary geometries or not.

  For more information, see [Lane Groups](lanegroups.zs).

- **Lanes**: A lane corresponds to the part of a real-world lane that is stored
  inside a lane group. Each lane has an identifier and provides information on
  lane geometry, connectivity, boundaries, legal traversability, and relations
  to other lanes.

  A zero-length lane is a special type of lane that is only used by fork lane
  groups and border lane groups. Zero-length lanes exist for topology reasons
  and only store connectivity information.

  For more information, see [Lanes](lanes.zs).

- **Lane boundaries**: Each lane has a list of directed references to boundaries
  on its left and right side. A boundary object has an ID, a reference to a
  boundary geometry, and a list of boundary elements that are mapped
  sequentially to a range on the lane boundary. Different boundary types are
  provided for physical dividers, marking boundaries, and purely logical
  boundaries. Boundary sets order parts of lane boundaries sequentially along a
  lane.

  For more information, see [Lane Boundaries](boundaries.zs).

In addition to lanes, the Lane module provides road surfaces. Road surfaces are
geometry objects that model the properties of a certain aspect of the road
surface. This includes physical properties, for example, whether the surface is
paved or unpaved, as well as logical properties that describe the purpose of the
surface area, for example, whether it is a crosswalk, a walking area, or part of
a roundabout. Road surfaces can have direct relations to lane groups and lanes
or be fully independent from the lane model. For more information, see [Road
Surfaces](roadsurface.zs).

Lane information and road surfaces are provided using the corresponding layer:

- The lane layer is a feature layer that provides lane topology information,
  lane boundary definitions, and lane groups.
- The lane geometry layer provides geometries for lane center lines and lane
  boundaries.
- The road surface layer contains geometries for road surfaces and relations to
  lane groups and lanes.
- The matched lane group path layer is always used together with a lane layer
  and stores references to lane groups in the lane layer that have been matched
  by a service.

For more information, see [Lane Layers](layer.zs).

Attributes from attribute modules can be assigned to lane features in this
module via the dedicated Lane Reference module.

## Content of the Lane Module

The Lane module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[boundaries.zs](boundaries.zs)         | Provides structures for lane boundaries.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in the Lane module.
[lanegroups.zs](lanegroups.zs)         | Provides structures for lane groups.
[lanes.zs](lanes.zs)                   | Provides structures for lanes.
[layer.zs](layer.zs)                   | Provides the layer definitions for lanes.
[metadata.zs](metadata.zs)             | Provides metadata for the lane layer.
[roadsurface.zs](roadsurface.zs)       | Provides structures for the road surface layer.
[topics.zs](topics.zs)                 | Provides publish-subscribe topics for use in horizon scenarios.
[types.zs](types.zs)                   | Provides lane types.
[examples.zs](examples.zs)             | Provides extended examples on using the data structures provided by the Lane module.

**Dependencies**

!*/

package lane._module;

import system.types.*;
import lane.metadata.*;
import lane.layer.*;
import lane.lanegroups.*;
import lane.boundaries.*;
import lane.lanes.*;
import lane.topics.*;
import lane.types.*;
import lane.instantiations.*;
import lane.roadsurface.*;
import lane.examples.*;


const ModuleName NAME = "LANE";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.07";

/**
  * Extern identifier of the lane layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_LAYER = "lane.layer.LaneLayer";

/**
  * Extern identifier of the lane geometry layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_GEOMETRY_LAYER = "lane.layer.LaneGeometryLayer";

/**
  * Extern identifier of the road surface layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_SURFACE_LAYER = "lane.layer.RoadSurfaceLayer";

/**
  * Extern identifier of the layer for matched lane group path references, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern MATCHED_LANE_GROUP_PATH_LAYER = "lane.layer.MatchedLaneGroupPathLayer";

/**
  * Extern identifier of the lane layer metadata. The layer metadata can be
  * used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_LAYER_METADATA = "lane.metadata.LaneLayerMetadata";

/**
  * Extern identifier of the geometry layer metadata for lane geometries. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_GEOMETRY_LAYER_METADATA = "lane.metadata.LaneGeometryLayerMetadata";

/**
  * Extern identifier of the geometry layer metadata for road surfaces. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_SURFACE_LAYER_METADATA = "lane.metadata.RoadSurfaceLayerMetadata";
