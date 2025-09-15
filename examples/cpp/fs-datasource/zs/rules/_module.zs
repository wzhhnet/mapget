/*!

# NDS.Live Rules Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Rules module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Rules module provides attributes that describe driving rules. These driving
rules can be valid at different levels, for example:

- Region-specific rules: maximum allowed blood alcohol concentration, speed
  limits, or legal requirements such as the requirement to carry a warning
  triangle, a first-aid kit, or a breathalyzer
- Rules for transitions on roads or lanes: allowance for automated driving or
  turn prohibitions
- Rules for ranges on roads, lanes, or display lines: prohibitions for passing,
  overtaking, or parking
- Rules for positions on roads, lanes, or display lines: existence of a traffic
  enforcement camera or of a warning sign

Some rules attributes have additional attribute properties that can be used to
provide specific details, for example, the layout and usage type of traffic
lights.

Rules attributes can be assigned to regions, roads, road locations, lanes, or
display lines using the corresponding layer.

## Content of the Rules Module

The Rules module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides rules attributes.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the layer definitions for rules.
[metadata.zs](metadata.zs)             | Provides metadata for rules.
[properties.zs](properties.zs)         | Provides attribute properties for rules attributes.
[types.zs](types.zs)                   | Provides attribute types for rules.

**Dependencies**

!*/

package rules._module;

import system.types.*;

import rules.layer.*;
import rules.attributes.*;
import rules.properties.*;
import rules.instantiations.*;
import rules.types.*;
import rules.metadata.*;

const ModuleName NAME = "RULES";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the rules attribute layer for roads using direct
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_RULES_LAYER = "rules.layer.RoadRulesLayer";

/**
  * Extern identifier of the rules attribute layer for roads using indirect
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_RULES_LAYER_INDIRECT = "rules.layer.RoadRulesLayerIndirect";

/**
  * Extern identifier of the rules attribute layer for road locations, which can
  * be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_LOCATION_RULES_LAYER = "rules.layer.RoadLocationRulesLayer";

/**
  * Extern identifier of the rules attribute layer for lanes using direct
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_RULES_LAYER = "rules.layer.LaneRulesLayer";

/**
  * Extern identifier of the rules attribute layer for lanes using indirect
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_RULES_LAYER_INDIRECT = "rules.layer.LaneRulesLayerIndirect";

/**
  * Extern identifier of the region rules attribute layer for roads, which can
  * be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern REGION_RULES_LAYER_ROADS = "rules.layer.RegionRulesLayerRoads";

/**
  * Extern identifier of the region rules attribute layer for lane groups, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern REGION_RULES_LAYER_LANES = "rules.layer.RegionRulesLayerLanes";

/**
  * Extern identifier of the region rules attribute layer for display lines, which
  * can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern REGION_RULES_LAYER_DISPLAY_LINES = "rules.layer.RegionRulesLayerDisplayLines";

/**
  * Extern identifier of the rules attribute layer for display lines using direct
  * references, which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_LINE_RULES_LAYER = "rules.layer.DisplayLineRulesLayer";


/**
  * Extern identifier of the metadata of the region rules attribute layer for roads.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern REGION_RULES_LAYER_ROADS_METADATA = "rules.metadata.RegionRulesLayerRoadsMetadata";

/**
  * Extern identifier of the metadata of the region rules attribute layer for lane groups.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern REGION_RULES_LAYER_LANES_METADATA = "rules.metadata.RegionRulesLayerLanesMetadata";

/** Extern identifier of the metadata of the region rules attribute layer for display lines.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern REGION_RULES_LAYER_DISPLAY_LINES_METADATA = "rules.metadata.RegionRulesLayerDisplayLinesMetadata";

/**
  * Extern identifier of the metadata of the rules attribute layer for roads
  * using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_RULES_LAYER_METADATA = "rules.metadata.RoadRulesLayerMetadata";

/**
  * Extern identifier of the metadata of the rules attribute layer for roads
  * using indirect references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_RULES_LAYER_INDIRECT_METADATA = "rules.metadata.RoadRulesLayerIndirectMetadata";

/**
  * Extern identifier of the metadata of the rules attribute layer for road
  * locations. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_LOCATION_RULES_LAYER_METADATA = "rules.metadata.RoadLocationRulesLayerMetadata";

/**
  * Extern identifier of the metadata of the rules attribute layer for lanes
  * using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_RULES_LAYER_METADATA = "rules.metadata.LaneRulesLayerMetadata";

/**
  * Extern identifier of the metadata of the rules attribute layer for lanes
  * using indirect references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_RULES_LAYER_INDIRECT_METADATA = "rules.metadata.LaneRulesLayerIndirectMetadata";

/**
  * Extern identifier of the metadata of the rules attribute layer for display lines
  * using direct references. The layer metadata can be used by
  * `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_LINE_RULES_LAYER_METADATA = "rules.metadata.DisplayLineRulesLayerMetadata";
