/*!

# Daimler NDS.Live Extension Module: EXT_HDROAD

## Introduction

Current module contains relationship between road and lane group.

## Content of the Current Module

Current module includes the following files:

Files                                   | Description
----------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides attributes of the RoadLaneLayer layer.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the layer definitions for RoadLaneLayer.
[metadata.zs](metadata.zs)             | Provides metadata for RoadLaneLayer.
[properties.zs](properties.zs)         | Provides attribute property definitions.

**Dependencies**

!*/

package ext.road._module;

import system.types.*;
import ext.road.metadata.*;
import ext.road.layer.*;
import ext.road.instantiations.*;

const ModuleName NAME = "EXT_ROAD";
const ModuleVersion VERSION = "2023.01";

const ModuleExtern ROAD_LANE_LAYER = "ext.road.layer.RoadLaneLayer";
const ModuleExtern ROAD_LANE_LAYER_METADATA = "ext.road.metadata.RoadLaneLayerMetadata";

const ModuleExtern LANE_ROAD_LAYER = "ext.road.layer.LaneRoadLayer";
const ModuleExtern LANE_ROAD_LAYER_METADATA = "ext.road.metadata.LaneRoadLayerMetadata";

const ModuleExtern ROAD_CHARACTERISTICS_LAYER_METADATA = "ext.road.layer.RoadCharacteristicsLayerMetadata";
const ModuleExtern ROAD_CHARACTERISTICS_LAYER = "ext.road.layer.RoadCharacteristicsLayer";

const ModuleExtern ROAD_CHARACTERISTICS_EXTEND_LAYER_METADATA = "ext.road.layer.RoadCharacteristicsExtendLayerMetadata";
const ModuleExtern ROAD_CHARACTERISTICS_EXTEND_LAYER = "ext.road.layer.RoadCharacteristicsExtendLayer";

const ModuleExtern PARKING_FACILITY_ROAD_RELATION_LAYER = "ext.road.layer.ParkingFacilityRoadRelationLayer";
const ModuleExtern PARKING_FACILITY_ROAD_RELATION_LAYER_METADATA = "ext.road.metadata.ParkingFacilityRoadRelationLayerMetadata";

const ModuleExtern INTERSECTION_RELATION_LAYER = "ext.road.layer.IntersectionRelationLayer";
const ModuleExtern INTERSECTION_RELATION_LAYER_METADATA = "ext.road.metadata.IntersectionRelationLayer";

const ModuleExtern LANEGROUP_LANEPORTINFO_LAYER = "ext.road.layer.LaneGroupLaneProtInfoLayer";
const ModuleExtern LANEGROUP_LANEPORTINFO_LAYER_METADATA = "ext.road.metadata.LaneGroupLaneProtLayer";

const ModuleExtern ROAD_CONNECT_LAYER = "ext.road.layer.RoadConnectLayer";
const ModuleExtern ROAD_CONNECT_LAYER_METADATA = "ext.road.metadata.RoadConnectLayerMetadata";
