/*!

# NDS.Live Smart Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Smart module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

To combine data from different NDS.Live modules, data layers need to be stacked.
The Smart module provides data structures to combine multiple data layers into
one smart layer using different types of containers to transmit the data.

### Containers and Smart Layers

The Smart module provides the following types of smart layer containers:

- [Smart layer tile](tile.zs): Contains mixed map content for multiple layers of
  a tile.
- [Smart layer object](object.zs): Contains mixed map content for multiple data
  layers of an object that is not bound to a predefined spatial extent.
- [Smart layer path](path.zs): Contains mixed map content for multiple layers of a
  path.
- [Smart layer mesh](mesh.zs): Contains pre-packaged sets of smart layer tiles.

For a general description of tiles, objects, and paths, see [Using NDS Live >
Architecture > Data Structures > Data
Containers](https://developer.nds.live/using-nds.live/architecture/data-structures).

All smart layer containers can include data layers from one or more NDS.Live
modules. They also provide a generic interface for layered map data that is
independent of the provided data schema.

Each smart layer container uses a specific referencing mechanism:

- Smart layer tiles associate data layers with specific NDS tiles.
- Smart layer objects use types and type-unique IDs for identification.
- Smart layer paths use path geometries for referencing.

Smart layers contain data layer components that deliver module-specific and
version-specific binary content.

The smart layer definition contains a set of data layer definitions, which
describes the possible content of data layer objects inside the results of a
smart layer getter call to a smart layer service.

The following layer combinations are allowed:

- One smart layer can contain multiple instances of the same attribute layer,
  for example, two road rules layers.
- One smart layer can have a single instance of a feature layer, for example,
  a road layer.
- All feature references must be resolvable within the same smart layer.
  For example, if a road rules layer uses direct road references, the road layer
  that contains the referenced road IDs must be present in the same smart layer.

### Smart Layer Services

Dedicated smart layer services allow to access the data. To determine which data
layer contains which type of data, a smart layer service provides a description. This
description associates each data layer with a description, which a client can
use to determine the specific schema for the data layer.

In addition to a dedicated service for each type of smart layer container, this
module provides the followings types of services:

- Smart layer path horizon service: Provides horizon data based on the smart
  layer path concept.
- Smart raster tile service: Provides direct access to raster image tiles without
  using a packaging structure.

For more information about the available services, see [Smart Layer
Services](services.zs).

To implement or use a smart layer service, it is not required to know the schema
of the delivered data types. This keeps the server interface stable, while
leaving the filling of a smart layer's data layer components up to the
configuration of the server instance. A client only has to know the schema of
the data layers that it is interested in.

**Example – Smart Layer Tile Service**

The following examples show a sample interaction between a vehicle and a smart
layer service.

The following figure illustrates the communication pattern of the interaction.

![Smart layer example: communication pattern](assets/smart-smart-layer-service-example.png)

The vehicle communicates as follows with an instance of the smart layer tile service:

1. The vehicle uses the `getLayerDefinition` method of the smart layer tile service to
   retrieve information about the served content, the `SmartLayerDefinition`.
2. The vehicle calls the `getLayerByTileId` method of the smart layer tile service
   to retrieve a `SmartLayerTile` for tile ID 42.

The following figure illustrates the data structure of the response to the request
for the smart layer definition.

![Smart layer example: smart layer definition](assets/smart-smart-layer-definition-example.png)

In the example, the `SmartLayerTileService` endpoint serves data layer objects
from two different modules: ADAS and Road. In addition, the specific supported
data layers from each module are defined. The `external` layer metadata type is
specific to each data layer. The smart layer tile service declares that it can
serve three data layers:

- A data layer (ID = 0) with content type `attributes`, served by the ADAS
  module. The layer metadata type is `adas.metadata.AdasRoadLayerMetadata`.
- A data layer (ID = 1) with content type `features`, served by the Road module.
  The layer metadata type is `road.metadata.FeatureLayerMetadata`.
- A data layer (ID = 2) with content type `geometry`, served by the Road module.
  The layer metadata type is `road.metadata.GeometryLayerMetadata`.

The following figure illustrates the data structure of the response to the
request for the smart layer tile.

![Smart layer example: smart layer tile for tile
42](assets/smart-smart-layer-example.png)

The smart layer service responds with a smart layer tile containing a subset of
the promised data layers, as specified in the available-layers array. Only data
layers 0 and 2 are returned. This is a decision that can be made by the
individual smart layer endpoint. In this example, the smart layer service may
not have road feature data available for this tile.

In addition to the services, the Smart module provides a file store definition
for offline use of smart layers.

### File Stores

Smart layer tiles and objects can also be stored in SQLite database files for
offline use of smart layers. For more information, see [Smart Layer File
Store](filestore.zs).


## Content of the Smart Module

The Smart module includes the following files:

Files                            | Description
---------------------------------| ----------------------------------------------------------------------------
[filestore.zs](filestore.zs)     | Provides a file store definition for storing smart layers in SQLite files.
[mesh.zs](mesh.zs)               | Provides pre-packaged sets of smart layer tiles in a smart layer mesh.
[metadata.zs](metadata.zs)       | Provides metadata for smart layers.
[object.zs](object.zs)           | Provides data structures for smart layer objects.
[path.zs](path.zs)               | Provides data structures for smart layer paths.
[services.zs](services.zs)       | Provides service interfaces for smart layers.
[stats.zs](stats.zs)             | Provides PubSub topics that track the network statistics of smart layer RPC calls.
[tile.zs](tile.zs)               | Provides data structures for smart layer tiles.
[types.zs](types.zs)             | Provides common types for the services and containers defined in the module.


**Dependencies**

!*/

package smart._module;

import system.types.*;

import smart.tile.*;
import smart.object.*;
import smart.path.*;
import smart.mesh.*;
import smart.types.*;
import smart.stats.*;
import smart.services.*;
import smart.metadata.*;
import smart.filestore.*;



rule_group SmartLayerRules
{
  /*!
  Only One Feature Layer per Smart Layer:

  One smart layer shall not have more than one instance of a specific feature layer.
  Exception: A feature module defines a different behavior for a specific
  layer type.
  !*/

  rule "smart-v9aezs";

  /*!
  Self-contained Feature References in Smart Layer:

  All feature references in a smart layer shall be resolvable to features inside
  of the same smart layer.
  !*/

  rule "smart-ot3i55";
};


const ModuleName NAME = "SMART";
const ModuleVersion VERSION = "2024.05";
const ModuleVersion MIN_VERSION = "2024.05";

/** Module service identifier of smart layer tile service. */
const ModuleService SMART_LAYER_TILE_SERVICE = "smart.services.SmartLayerTileService";

/** Module service identifier of smart layer object service. */
const ModuleService SMART_LAYER_OBJECT_SERVICE = "smart.services.SmartLayerObjectService";

/** Module service identifier of smart layer path service. */
const ModuleService SMART_LAYER_PATH_SERVICE = "smart.services.SmartLayerPathService";

/** Module service identifier of smart layer path horizon service. */
const ModuleService SMART_LAYER_PATH_HORIZON_SERVICE = "smart.services.SmartLayerPathHorizonService";

/** Module service identifier of smart layer mesh service. */
const ModuleService SMART_LAYER_MESH_SERVICE = "smart.services.SmartLayerMeshService";

/** Module service identifier of smart raster tile service. */
const ModuleService SMART_RASTER_TILE_SERVICE = "smart.services.SmartRasterTileService";

/**
  * Extern identifier of service metadata used by all smart layer services. Smart
  * layer registry metadata can be used by `registry.node.ServiceInformation.serviceMetadata`.
  **/
const ModuleExtern SMART_LAYER_SERVICE_METADATA = "smart.metadata.SmartLayerRegistryMetadata";

/** Extern identifier of service metadata used by all smart raster services. */
const ModuleExtern SMART_RASTER_SERVICE_METADATA = "smart.metadata.SmartRasterRegistryMetadata";