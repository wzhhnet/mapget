/*!

# NDS.Live Characteristics Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Characteristics module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Characteristics module provides attributes that classify roads or lanes
based on physical or typological criteria. The attributes describe many
different aspects of roads or lanes, but they have in common that these
characteristics are permanent, in the sense that they do not change regularly,
although they can change over time, for example, due to constructional changes
or changing classifications.

Physical criteria relate to something that you can see in the real world, for
example, the number of lanes on a road or the presence of physical objects like
a painted stop line. Typological criteria are used to derive driving rules from
a defined classification system, for example, the functional road class or the
lane type.

Additionally, the Characteristics module provides attributes such as the global
source ID that allow to reference roads or lanes, independent of their feature
IDs.

Characteristics attributes are assigned to positions or ranges on the
corresponding feature. Examples:

- A stop line is assigned to a specific position.
- The physical width of a road is assigned to a range on the road.

The Characteristics module provides attributes that can be assigned to one or
both directions of roads, road locations, lanes, and display lines using the
corresponding layer.

Some attributes can only be assigned in a specific direction or only in both
directions. This is clearly defined using individual rules for such attributes.

## Content of the Characteristics Module

The Characteristics module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides attributes of the characteristics layer.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the layer definitions for characteristics.
[metadata.zs](metadata.zs)             | Provides metadata for characteristics.
[properties.zs](properties.zs)         | Provides attribute property definitions.
[types.zs](types.zs)                   | Provides types for characteristics attributes.

**Dependencies**

!*/

package characteristics._module;

import system.types.*;

import characteristics.layer.*;
import characteristics.types.*;
import characteristics.attributes.*;
import characteristics.properties.*;
import characteristics.metadata.*;
import characteristics.instantiations.*;

const ModuleName NAME = "CHARACTERISTICS";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the characteristics attribute layer for roads using
  * direct references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_CHARACTERISTICS_LAYER = "characteristics.layer.RoadCharacteristicsLayer";

/**
  * Extern identifier of the indirect characteristics attribute layer for roads
  * using indirect references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_CHARACTERISTICS_LAYER_INDIRECT = "characteristics.layer.RoadCharacteristicsLayerIndirect";

/**
  * Extern identifier of the characteristics attribute layer for lanes, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_CHARACTERISTICS_LAYER = "characteristics.layer.LaneCharacteristicsLayer";

/**
  * Extern identifier of the characteristics attribute layer for road locations,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_LOCATION_CHARACTERISTICS_LAYER = "characteristics.layer.RoadLocationCharacteristicsLayer";

/**
  * Extern identifier of the characteristics attribute layer for display lines using
  * direct references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_LINE_CHARACTERISTICS_LAYER = "characteristics.layer.DisplayLineCharacteristicsLayer";

/**
  * Extern identifier of the metadata of the characteristics attribute layer for
  * roads using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_CHARACTERISTICS_LAYER_METADATA = "characteristics.metadata.RoadCharacteristicsLayerMetadata";

/**
  * Extern identifier of the metadata of the characteristics attribute layer for
  * roads using indirect references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_CHARACTERISTICS_LAYER_INDIRECT_METADATA = "characteristics.layer.RoadCharacteristicsLayerIndirectMetadata";

/**
  * Extern identifier of the metadata of the characteristics attribute layer for lanes.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_CHARACTERISTICS_LAYER_METADATA = "characteristics.metadata.LaneCharacteristicsLayerMetadata";

/**
  * Extern identifier of the metadata of the characteristics attribute layer
  * for road locations. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_LOCATION_CHARACTERISTICS_LAYER_METADATA = "characteristics.metadata.RoadLocationCharacteristicsLayerMetadata";

/**
  * Extern identifier of the metadata of the characteristics attribute layer for
  * display lines using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_LINE_CHARACTERISTICS_LAYER_METADATA = "characteristics.metadata.DisplayLineCharacteristicsLayerMetadata";

/**
  * Extern identifier of the toll cost layer, which can be 
  * used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern TOLL_COST_LAYER = "characteristics.layer.TollCostLayer";

/**
  * Extern identifier of the metadata of the toll cost layer.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern TOLL_COST_LAYER_METADATA = "characteristics.metadata.TollCostLayerMetadata";
