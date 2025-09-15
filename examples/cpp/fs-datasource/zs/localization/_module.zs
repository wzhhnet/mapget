/*!

# NDS.Live Localization Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Localization module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Localization module provides different types of localization objects to
support localization use cases. Localization objects represent real-world
objects, such as signs or road-side furniture like posts and poles. If the
sensors of a vehicle detect such objects along the road, then the
application can use these to determine the vehicle's position.

The Localization module provides the following types of localization objects:

- **Landmarks** are classified geometric objects that optionally have additional
  detail information. Landmarks use line geometries, planar polygon geometries
  (2D), or polygon mesh geometries (3D).
- **Obstacles** are line geometries that are either horizontal or vertical to
  the road surface and provide no additional information. Obstacles do not have
  IDs.
- **Occupancy grids** are matrixes with individual filling of each cell.
  Occupancy grids can be used to model the probability that specific locations
  (cells) are occupied by an object.

The following figure shows an example of the visualization of an occupancy grid
with lanes as overlay. Light pixels represent a high probability that a cell in
the grid is occupied. Dark pixels represent a high probability that a cell is
unoccupied.

![Occupancy grid visualization](assets/occupancy_visualization.jpg)

For details about the different localization objects, see [Localization Types](types.zs).

In addition to the localization objects themselves, the Localization module
provides attributes that allow to model relations between the localization
objects and roads, lanes, or road surfaces.

Localization objects are provided using the corresponding geometry layer. The
relations between localization objects and map features are provided using the
corresponding attribute layer.

## Content of the Localization Module

The Localization module includes the following files:

Files                                 | Description
--------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)        | Provides attributes of the localization layers.
[instantiations.zs](instantiations.zs)| Provides instantiations of templates used in the Localization module.
[layer.zs](layer.zs)                  | Provides the localization layers for landmarks, obstacles, and occupancy grids.
[metadata.zs](metadata.zs)            | Provides metadata for the localization layers.
[properties.zs](properties.zs)        | Provides attribute properties of localization attributes.
[types.zs](types.zs)                  | Provides types for localization attributes and attribute properties.

**Dependencies**

!*/

package localization._module;

import system.types.*;
import localization.types.*;
import localization.layer.*;
import localization.metadata.*;
import localization.attributes.*;
import localization.properties.*;
import localization.instantiations.*;

/*!

**Constants**

!*/

const ModuleName NAME = "LOCALIZATION";
const ModuleVersion VERSION = "2024.05";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the obstacle layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern OBSTACLE_LAYER = "localization.layer.ObstacleLayer";

/**
  * Extern identifier of the obstacle layer metadata. The layer metadata can be
  * used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern OBSTACLE_LAYER_METADATA = "localization.metadata.ObstacleLayerMetadata";

/**
  * Extern identifier of the landmark layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANDMARK_LAYER = "localization.layer.LandmarkLayer";

/**
  * Extern identifier of the landmark layer metadata. The layer metadata can be
  * used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANDMARK_LAYER_METADATA = "localization.metadata.LandmarkLayerMetadata";

/**
  * Extern identifier of the relation layer between landmarks and roads,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_LANDMARK_LAYER = "localization.layer.RoadLandmarkLayer";

/**
  * Extern identifier of the metadata of the relation layer between landmarks
  * and roads. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_LANDMARK_LAYER_METADATA = "localization.metadata.RoadLandmarkRelationLayerMetadata";

/**
  * Extern identifier of the relation layer between landmarks and lanes,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_LANDMARK_LAYER = "localization.layer.LaneLandmarkLayer";

/**
  * Extern identifier of the metadata of the relation layer between landmarks
  * and lanes. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_LANDMARK_LAYER_METADATA = "localization.metadata.LaneLandmarkRelationLayerMetadata";

/**
  * Extern identifier of the relation layer between landmarks and road surfaces,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_SURFACE_LANDMARK_LAYER = "localization.layer.RoadSurfaceLandmarkLayer";

/**
  * Extern identifier of the metadata of the relation layer between landmarks
  * and road surfaces. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_SURFACE_LANDMARK_LAYER_METADATA = "localization.metadata.RoadSurfaceLandmarkRelationLayerMetadata";

/**
  * Extern identifier of the occupancy grid layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern OCCUPANCY_GRID_LAYER = "localization.layer.OccupancyGridLayer";

/**
  * Extern identifier of the metadata of the occupancy grid layer. The layer
  * metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern OCCUPANCY_GRID_LAYER_METADATA = "localization.metadata.OccupancyGridLayerMetadata";

/**
  * Extern identifier of the relation layer between occupancy grids and roads,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_OCCUPANCY_GRID_LAYER = "localization.layer.RoadOccupancyGridLayer";

/**
  * Extern identifier of the metadata of the relation layer between occupancy grids
  * and roads. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_OCCUPANCY_GRID_LAYER_METADATA = "localization.metadata.RoadOccupancyGridLayerMetadata";

/**
  * Extern identifier of the relation layer between occupancy grids and lanes,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_OCCUPANCY_GRID_LAYER = "localization.layer.LaneOccupancyGridLayer";

/**
  * Extern identifier of the metadata of the relation layer between occupancy grids
  * and lanes. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_OCCUPANCY_GRID_LAYER_METADATA = "localization.metadata.LaneOccupancyGridLayerMetadata";