/*!

# NDS.Live Display Details Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Display Details module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Display Details module provides attributes that describe display features in
detail. Display attributes are assigned to 2D display features, that is, display
areas, lines, and points, or to 3D display features, that is, 3D polygon meshes.
Examples:

- Relative height of display line features to each other (2D display)
- Population of a city to display different sizes of city center points (2D display)
- Original height values of a 3D polygon mesh to better align with terrain (3D
  display)

Display attributes can be assigned to display points, lines, and areas, or to 3D
polygon meshes using the corresponding layer.

## Content of the Display Details Module

The Display Details module includes the following files:

Files                                       | Description
--------------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)              | Provides attributes for display features that are used in the display detail layers.
[instantiations.zs](instantiations.zs)      | Provides instantiations of the display detail layers.
[layer.zs](layer.zs)                        | Provides the display detail layers.
[metadata.zs](metadata.zs)                  | Provides metadata for the display details layers.
[properties.zs](properties.zs)              | Provides attribute properties for display attributes.
[types.zs](types.zs)                        | Provides display attribute types.

**Dependencies**

!*/


package display.details._module;

import system.types.*;
import display.details.attributes.*;
import display.details.instantiations.*;
import display.details.layer.*;
import display.details.metadata.*;
import display.details.properties.*;
import display.details.types.*;

/*!

**Definitions**

!*/

const ModuleName NAME = "DISPLAY.DETAILS";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the display attribute layer, which can be used
  * by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_ATTRIBUTE_LAYER = "display.details.layer.DisplayAttributeLayer";

/**
  * Extern identifier of the 3D display attribute layer, which can be used
  * by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_3D_ATTRIBUTE_LAYER = "display.details.layer.Display3dAttributeLayer";

/**
  * Extern identifier of the metadata of the display attribute layer.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_ATTRIBUTE_LAYER_METADATA = "display.details.metadata.DisplayAttributeLayerMetadata";

/**
  * Extern identifier of the metadata of the 3D display attribute layer.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_3D_ATTRIBUTE_LAYER_METADATA = "display.details.metadata.Display3dAttributeLayerMetadata";
