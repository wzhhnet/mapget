/*!

# Daimler NDS.Live Extension Module: EXT_LANE

## Introduction

Current module contains relationship between road and lane group.

## Content of the Current Module

Current module includes the following files:

Files                                   | Description
----------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides attributes of the layer.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the layer definitions.
[metadata.zs](metadata.zs)             | Provides metadata.

**Dependencies**

!*/

package ext.lane._module;

import system.types.*;
import ext.lane.metadata.*;
import ext.lane.layer.*;
import ext.lane.instantiations.*;

const ModuleName NAME = "EXT_LANE";
const ModuleVersion VERSION = "2024.04";

const ModuleExtern LANE_RELATION_LAYER = "ext.lane.layer.LaneRelationLayer";
const ModuleExtern LANE_RELATION_LAYER_METADATA = "ext.lane.layer.LaneRelationLayerMetadata";

const ModuleExtern LANE_CHARACTERISTICS_LAYER = "ext.lane.layer.LaneCharacteristicsLayer";
const ModuleExtern LANE_CHARACTERISTICS_LAYER_METADATA = "ext.lane.layer.LaneCharacteristicsLayerMetadata";
