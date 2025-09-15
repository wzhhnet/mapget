/*!

# NDS.Live Display Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Display module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Display module provides graphical representations of geographic information.
The Display module provides the following data structures for map display:

- 2D display features: display areas, display lines, and display points
- 3D display features:
    - Polygon meshes for 3D objects
    - glTF files. The Graphics Language Transmission Format (glTF) is a standard
      file format for 3-dimensional scenes and models. NDS.Live supports the
      *.glb file format.
- Terrain models, that is, digital representations of the ground surface
  topography. NDS.Live supports heightmaps and BDAM as terrain representation
  methods. Both representations use the same input data but differ in the way
  the data is processed:
    - Heightmap: A grid of squares with height information. The application
      renders this height information to display a 3D view of the terrain.
    - Batched Dynamic Adaptive Mesh (BDAM): The terrain is modeled by means of
      triangulated irregular networks (TIN) organized in BDAM patches.
- Icon sets that can be mapped to all instances of a feature, position
  attribute, or enum value of a position attribute.

The geometries for 2D and 3D display features are provided using the
corresponding feature layers. gLTF files are provided using a layer that
references external data. For 3D display, there is an additional 3D display
style layer, which provides textures and color pallettes. Icons are provided
using their own geometry layer.

Attributes that describe display features in more detail are described in the
separate Display Details module.

Attributes from attribute modules can be assigned to display features via the
dedicated Display Reference module.

## Content of the Display Module

The Display module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the feature layer definitions for map display.
[metadata.zs](metadata.zs)             | Provides metadata for map display layers.
[types.zs](types.zs)                   | Provides types for display features and layers.

**Dependencies**

!*/

package display._module;

import display.layer.*;
import display.metadata.*;
import display.instantiations.*;
import display.types.*;
import system.types.*;


const ModuleName NAME = "DISPLAY";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the 2D display feature layer for map display, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_LAYER_2D = "display.layer.Display2DLayer";

/**
  * Extern identifier of the icon layer, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ICON_LAYER = "display.layer.IconLayer";

/**
  * Extern identifier of the metadata of the 2D display feature layer.
  * The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_LAYER_2D_METADATA = "display.metadata.Display2DLayerMetadata";

/**
  * Extern identifier of the metadata of the icon layer.
  * The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ICON_LAYER_METADATA = "display.metadata.IconLayerMetadata";

/**
  * Extern identifier of the 3D display feature layer for map display, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_LAYER_3D = "display.layer.Display3DLayer";

/**
  * Extern identifier of the metadata of the 3D display feature layer.
  * The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_LAYER_3D_METADATA = "display.metadata.Display3DLayerMetadata";

/**
  * Extern identifier of the 3D display style layer for map display, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_LAYER_3D_STYLE = "display.layer.Display3DStyleLayer";

/**
  * Extern identifier of the metadata of the 3D display style layer.
  * The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_LAYER_3D_STYLE_METADATA = "display.metadata.Display3DStyleLayerMetadata";

/**
  * Extern identifier of the heightmap layer,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern HEIGHTMAP_LAYER = "display.layer.HeightmapLayer";

/**
  * Extern identifier of the metadata of the heightmap layer.
  * The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern HEIGHTMAP_LAYER_METADATA = "display.metadata.HeightmapLayerMetadata";

/**
  * Extern identifier of the BDAM layer,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern BDAM_LAYER = "display.layer.BdamLayer";

/**
  * Extern identifier of the metadata of the BDAM layer.
  * The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern BDAM_LAYER_METADATA = "display.metadata.BdamLayerMetadata";

/**
  * Extern identifier of the glTF layer,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern GLTF_LAYER = "display.layer.GltfLayer";

/**
  * Extern identifier of the metadata of the glTF layer.
  * The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern GLTF_LAYER_METADATA = "display.metadata.GltfLayerMetadata";

/**
  * Extern identifier of the orthoimage configuration, which can be used by
  * `smart.types.RasterImageConfigExtern`.
  */
const ModuleExtern DISPLAY_ORTHO_IMAGE_CONFIG = "display.types.OrthoImageConfig";

/**
  * Extern identifier of the orthoimage service metadata,
  * which can be used by the `smart.types.RasterRegistryMetadataExtern`.
  */
const ModuleExtern DISPLAY_ORTHO_IMAGE_SERVICE_METADATA = "display.metadata.OrthoImageServiceMetadata";