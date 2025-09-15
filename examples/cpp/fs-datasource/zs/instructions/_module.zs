/*!

# NDS.Live Instructions Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Instructions module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Instructions module provides attributes that allow applications to generate
guidance instructions based on map content. Instructions include information for
displaying or announcing these guidance instructions. The following types of
instructions are supported:

- **Signpost instructions**: Representation of the visual and textual
  information on signposts to generate guidance instructions, for example,
  background color, exit name, and towards information. Based on this
  information, simplified graphical representations can be generated that do not
  necessarily correspond to the layout of the sign in reality.
- **Signpost images**: Graphical representations of signposts as seen in the
  real world. Signpost images are used for display purposes.
- **Junction views**: Realistic visual representations of intersections and the
  guidance instructions that are required to perform specific maneuvers.
  Different junction view image sets can be displayed based on a set of
  activation points along a transition.
- **Lane instructions**: Set of lane instructions that can be assigned to
  transitions for lane guidance. Different scenes can be displayed based on a
  set of activation points along a transition.

The Instructions attributes can be assigned to roads, transitions, or lanes
using the corresponding layer. The images that are referenced by the attribute
layers are provided using a separate instructions image layer.

## Content of the Instructions Module

The Instructions module includes the following files:

Files                            | Description
---------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)   | Provides attributes of the instruction layer.
[layer.zs](layer.zs)             | Provides the instruction layer.
[properties.zs](properties.zs)   | Provides attribute properties for instruction attributes.
[types.zs](types.zs)             | Provides types for instruction attributes and attribute properties.

**Dependencies**

!*/

package instructions._module;

import system.types.*;
import instructions.layer.*;
import instructions.types.*;
import instructions.attributes.*;
import instructions.properties.*;
import instructions.instantiations.*;

const ModuleName NAME = "INSTRUCTIONS";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.07";


/**
  * Extern identifier of the instructions attribute layer for roads using
  * direct references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_INSTRUCTIONS_LAYER = "instructions.layer.RoadInstructionsLayer";

/**
  * Extern identifier of the metadata of the instructions attribute layer for
  * roads using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_INSTRUCTIONS_LAYER_METADATA = "instructions.metadata.RoadInstructionsLayerMetadata";

/**
  * Extern identifier of the instructions attribute layer for lanes using direct
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_INSTRUCTIONS_LAYER = "instructions.layer.LaneInstructionsLayer";

/**
  * Extern identifier of the metadata of the instructions attribute layer for lanes
  * using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_INSTRUCTIONS_LAYER_METADATA = "instructions.metadata.LaneInstructionsLayerMetadata";


/**
  * Extern identifier of the instructions image layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern INSTRUCTIONS_IMAGE_LAYER = "instructions.layer.InstructionsImageLayer";

/**
  * Extern identifier of the metadata of the instructions image layer.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern INSTRUCTIONS_IMAGE_LAYER_METADATA = "instructions.metadata.InstructionsImageLayerMetadata";
