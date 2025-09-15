/*!

# NDS.Live Drive Path Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Drive Path module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

A drive path is the trajectory of a vehicle along a path that is statistically
derived from vehicles traveling along this path. Drive paths are independent
from other map features, but they can be related to roads, lanes, or road
locations. There can be multiple drive paths for the same lane or road.

A drive path can be used instead of the lane center line for use cases such as
improved motion planning or assigning attributes.

The following figure shows a road with a curve and the drive paths for each
lane, which deviate from the lane center line because vehicles travel along a
different path.

![Drive paths through a curve](assets/drive_path_curvature.png)

The Drive Path module provides data structures to model the drive path
geometries as well as attributes that describe the drive path in more detail.
Drive path geometries are always stored in the direction that corresponds to the
vehicle's trajectory along the drive path.

If two drive paths in the same tile or in different tiles are connected, then
they share one coordinate position. If two or more drive paths have the same
start position or end position, they are considered to be connected.

## Content of the Drive Path Module

The Drive Path module includes the following files:

Files                                       | Description
--------------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)              | Provides attributes that describe drive paths.
[instantiations.zs](instantiations.zs)      | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                        | Provides layers for drive path geometries, attributes, and relations to other features.
[metadata.zs](metadata.zs)                  | Provides metadata for the drive path layers.
[properties.zs](properties.zs)              | Provides attribute properties for drive path attributes.
[types.zs](types.zs)                        | Provides drive path types.

**Dependencies**

!*/


package drivepath._module;

import system.types.*;
import drivepath.attributes.*;
import drivepath.instantiations.*;
import drivepath.layer.*;
import drivepath.metadata.*;
import drivepath.properties.*;
import drivepath.types.*;

const ModuleName NAME = "DRIVEPATH";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.05";


/**
  * Extern identifier of the drive path layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern DRIVE_PATH_LAYER = "drivepath.layer.DrivePathLayer";

/**
  * Extern identifier of the drive path attribute layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern DRIVE_PATH_ATTRIBUTE_LAYER = "drivepath.layer.DrivePathAttributeLayer";

/**
  * Extern identifier of the drive path relation layer,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern DRIVE_PATH_RELATION_LAYER = "drivepath.layer.DrivePathRelationLayer";

/**
  * Extern identifier of the metadata of the drive path layer. The layer metadata
  * can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DRIVE_PATH_LAYER_METADATA = "drivepath.metadata.DrivePathLayerMetadata";

/**
  * Extern identifier of the metadata of the drive path attribute layer. The layer metadata
  * can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DRIVE_PATH_ATTRIBUTE_LAYER_METADATA = "drivepath.metadata.DrivePathAttributeLayerMetadata";

/**
  * Extern identifier of the metadata of the drive path relation layer. The layer metadata
  * can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DRIVE_PATH_RELATION_LAYER_METADATA = "drivepath.metadata.DrivePathRelationLayerMetadata";