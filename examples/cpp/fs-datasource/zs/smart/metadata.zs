/*!

# Smart Layer Metadata

This package defines smart layer metadata, which applies to all modules of an
NDS map.

**Dependencies**

!*/

package smart.metadata;

import smart.types.*;
import core.types.*;
import core.vehicle.*;
import system.types.*;

/*!
## Smart Layer Registry Metadata

This metadata structure shall be stored in the registry service metadata so that
clients can identify capabilities and content definitions of smart layer services before
querying the services.

It consists of the `SmartLayerDefinition` and `SmartLayerServiceCapabilities`.

!*/

rule_group SmartLayerRegistryMetadataRules
{
  /*! `SmartLayerDefinition` of Registry Metadata:

  The `SmartLayerDefinition` of the registry metadata shall match the
  `SmartLayerDefinition` that a service responds by its own service interface.
  This implies that the registry shall always be updated with new metadata
  before a changed 'SmartLayerDefinition' is provided by the service
  interface of the smart layer server.
  !*/

  rule "smart-0gb6oa";
};

/**
  * Smart layer metadata that is stored in the registry service metadata so that
  * clients can identify capabilities and content definitions of smart layer
  * services before querying the services.
  */
struct SmartLayerRegistryMetadata
{
  /** Type of the smart layer service. */
  SmartLayerType smartLayerType;

  /** Data coverage that is valid for all layers within the smart layer. */
  SmartLayerContent dataContents;

  /** List of layers, described by their descriptors, that are available in the smart layer. */
  ExternDescriptor layerDescriptors[] : lengthof(layerDescriptors) > 0;

  /** Description of the implemented service methods of the smart layer service. */
  SmartLayerServiceCapabilities(smartLayerType) capabilities;

  /** List of NDS levels that are served by the smart layer service. */
  bit:4 supportedLevels[] if smartLayerType == SmartLayerType.SMART_LAYER_TILE
                          || smartLayerType == SmartLayerType.SMART_LAYER_MESH;

  /** Smart layer mesh index metadata. */
  SmartLayerMeshIndexContent meshIndexContent
                          if smartLayerType == SmartLayerType.SMART_LAYER_MESH;

  /** Smart layer object class of the service. */
  SmartLayerObjectClass objectClass 
                          if smartLayerType == SmartLayerType.SMART_LAYER_OBJECT;
};

/** Type of the smart layer object. */
subtype varuint32 SmartLayerObjectClass;

/** A smart layer object service providing data for parking facilities. */
const SmartLayerObjectClass PARKING_FACILITY = 2;

/** A smart layer object service providing data for factory sites. */
const SmartLayerObjectClass FACTORY_SITE = 3;

/** A smart layer object service providing data for indoor locations. */
const SmartLayerObjectClass INDOOR_LOCATION = 4;

/** A smart layer object service providing generic icons. */
const SmartLayerObjectClass GLOBAL_GENERIC_ICONS = 5;

/**
  * A global smart layer object service providing icons that are
  * referenced by global icon set references.
  */
const SmartLayerObjectClass GLOBAL_ICONS = 6;

/**
  * A global smart layer object service providing instruction images
  * for signposts and junction views.
  */
const SmartLayerObjectClass GLOBAL_INSTRUCTION_IMAGES = 7;

/*!

## Smart Layer Definition and Content

The smart layer definition provides information about each data layer that the
smart layer service provides. For example, it provides an ID and a layer name,
a content type, and information about the lifetime of the layer.

The smart layer content describes which road types and vehicles types are
covered by the data layers in the smart layer, and which geopolitical views are
represented. This metadata is aggregated from all data layers. Each data layer
describes the content that it provides more specifically in its own metadata.

!*/

  rule_group SmartLayerDefinitionRules
  {
    /*!
    Unique Module Definitions in `layerDefinitions.module`:

    Each `ModuleDefinition` in `layerDefinitions.module` shall be unique.
    !*/

    rule "smart-0ig3vr";

    /*!
    Unique Data Layer IDs in `layerDefinitions`:

    The `DataLayerDefinition.dataLayerId` shall be unique for all data layer
    definitions in `layerDefinitions`.
    !*/

    rule "smart-0iuvm9";

    /*!
    Unique Data Layer Definitions in `layerDefinitions`:

    Each `DataLayerDefinition` in `layerDefinitions` shall have a unique
    combination of `module`, `contentType`, and `layerMetadata`.
    !*/

    rule "smart-0mjuai";

    /*!
    Smart Layer Content Across all Data Layers:

    The data layers of a smart layer shall only contain those road types and
    vehicles for which metadata is defined in `SmartLayerContent`.
    !*/

    rule "smart-2jv8ru";

    /*!
    References Across Data Layers of a Smart Layer:

    For every direct reference from an attribute layer, that is, a reference that
    uses an identifier, there shall be a target feature in a data layer
    of `contentType`=`FEATURES` in the same smart layer.
    !*/

    rule "smart-2k2mrg";
  };

/** Definition of a smart layer. */
struct SmartLayerDefinition
{
  /** List of data layer definitions that reference the modules. */
  DataLayerDefinition layerDefinitions[] : lengthof(layerDefinitions) > 0;
};

/**
  * Data coverage of the data layers in the smart layer.
  * This metadata is valid for the features and attributes of all data layers.
  */
struct SmartLayerContent
{
  /** Road types that are covered by the smart layer. */
  RoadType coveredRoadTypes[];

  /** Detailed information on vehicles for which the smart layer applies. */
  VehicleSpecification vehicleSpecifications[];

  /** Detailed information on geopolitical views for which the smart layer applies. */
  GeopoliticalView geopoliticalView;
};

/** Describes the available optional content of a smart layer mesh index. */
struct SmartLayerMeshIndexContent
{
  /** Set to `true` if the mesh index includes smart layer tile headers. */
  bool hasHeaders;

  /** Set to `true` if the mesh index contains size information of the meshes. */
  bool hasSizes;
};

/*!

## Smart Layer Service Capabilities

`SmartLayerServiceCapabilities` provides implemented service capabilities that
depend on the smart layer type.

!*/

choice SmartLayerServiceCapabilities(SmartLayerType type) on type
{
  case SMART_LAYER_TILE:
        TileServiceCapabilities tileServiceCapabilities;

  case SMART_LAYER_OBJECT:
        ObjectServiceCapabilities objectServiceCapabilities;

  case SMART_LAYER_PATH:
        PathServiceCapabilities pathServiceCapabilities;

  case SMART_LAYER_MESH:
        MeshServiceCapabilities meshServiceCapabilities;

  case SMART_LAYER_PATH_HORIZON:
        PathHorizonServiceCapabilities pathHorizonServiceCapabilities;
};


/** Optional methods that a smart layer tile service may implement. */
bitmask uint16 TileServiceCapabilities
{
  /** Set bit if the `getLayerByTileId` method is implemented. */
  GET_LAYER_BY_TILE_ID,

  /** Set bit if the `getLayerByTileIdList` method is implemented. */
  GET_LAYER_BY_TILE_ID_LIST,

  /** Set bit if the `getHeaderOnlyByTileId` method is implemented. */
  GET_HEADER_ONLY_BY_TILE_ID,

  /** Set bit if the `getHeaderOnlyByTileIdList` method is implemented. */
  GET_HEADER_ONLY_BY_TILE_ID_LIST,

  /** Set bit if the `getHeaderOnlyListInTile` method is implemented. */
  GET_HEADER_ONLY_LIST_IN_TILE,

  /** Set bit if the `nds/smart/tile/update` topic publishing is implemented. */
  TOPIC_NDS_SMART_TILE_UPDATE,

  /** Set bit if the `getDeltaLayerByTileId` method is implemented. */
  GET_DELTA_LAYER_BY_TILE_ID,

  /** Set bit if the `getDeltaLayerByTileIdList` method is implemented. */
  GET_DELTA_LAYER_BY_TILE_ID_LIST,

  /** Set bit if the `getLayerByTileVersion` method is implemented. */
  GET_LAYER_BY_TILE_VERSION,

  /** Set bit if the `getLayerByTileVersionList` method is implemented. */
  GET_LAYER_BY_TILE_VERSION_LIST,

  /** Set bit if the `getSingleDataLayerByTileId` method is implemented. */
  GET_SINGLE_DATA_LAYER_BY_TILE_ID,

  /** Set bit if the `getDataLayerListByTileIdList` method is implemented. */
  GET_DATA_LAYER_LIST_BY_TILE_ID_LIST,
};

/** Optional methods that a smart layer object service may implement. */
bitmask uint16 ObjectServiceCapabilities
{
  /** Set bit if the `getObjectByReference` method is implemented. */
  GET_OBJECT_BY_REFERENCE,

  /** Set bit if the `getObjectsInTile` method is implemented. */
  GET_OBJECTS_IN_TILE,

  /** Set bit if the `getHeaderOnlyByObjectReference` method is implemented. */
  GET_HEADER_ONLY_BY_OBJECT_REFERENCE,

  /** Set bit if the `getHeaderOnlyListInTile` method is implemented. */
  GET_HEADER_ONLY_LIST_IN_TILE,

  /** Set bit if the `getLocationPathForObjectReference` method is implemented. */
  GET_LOCATION_PATH_FOR_OBJECT_REFERENCE,

  /** Set bit if the `getLocationIdForObjectReference` method is implemented. */
  GET_LOCATION_ID_FOR_OBJECT_REFERENCE,

  /** Set bit if the `nds/smart/object/update` topic publishing is implemented. */
  TOPIC_NDS_SMART_OBJECT_UPDATE,

  /** Set bit if the `getSingleDataLayerByObjectReference` method is implemented. */
  GET_SINGLE_DATA_LAYER_BY_OBJECT_REFERENCE,
};

/** Optional methods that a smart layer path service may implement. */
bitmask uint16 PathServiceCapabilities
{
  /** Set bit if `getDataAlongPath` method is implemented. */
  GET_DATA_ALONG_PATH,

  /** Set bit if `getPathsInTile` method is implemented. */
  GET_PATHS_IN_TILE,

  /** Set bit if `getHeaderOnlyByPath` method is implemented. */
  GET_HEADER_ONLY_BY_PATH,

  /** Set bit if `getHeaderOnlyListInTile` method is implemented. */
  GET_HEADER_ONLY_LIST_IN_TILE,
};

/** Optional methods that a smart layer horizon path service may implement. */
bitmask uint16 PathHorizonServiceCapabilities
{
  /** Set bit if `getHorizonDataForPath` method is implemented. */
  GET_HORIZON_DATA_FOR_PATH,

  /** Set bit if `getHorizonDataForPose` method is implemented. */
  GET_HORIZON_DATA_FOR_POSE,
};

/** Optional methods that a smart layer mesh service may implement. */
bitmask uint16 MeshServiceCapabilities
{
  /** Set to `true` if the `getMeshIndexByTileId` method is implemented. */
  GET_MESH_INDEX_BY_TILE_ID,

  /** Set to `true` if the `getMeshById` method is implemented. */
  GET_MESH_BY_ID,
};

/** Wrapper around tile service capabilities for direct use in service interface. */
struct TileServiceCapabilitiesResponse
{
  TileServiceCapabilities capabilities;
};

/** Wrapper around object service capabilities for direct use in service interface. */
struct ObjectServiceCapabilitiesResponse
{
  ObjectServiceCapabilities capabilities;
};

/** Wrapper around path service capabilities for direct use in service interface. */
struct PathServiceCapabilitiesResponse
{
  PathServiceCapabilities capabilities;
};

/** Wrapper around horizon path service capabilities for direct use in service interface. */
struct PathHorizonServiceCapabilitiesResponse
{
  PathHorizonServiceCapabilities capabilities;
};

/** Wrapper around mesh service capabilities for direct use in service interface. */
struct MeshServiceCapabilitiesResponse
{
  MeshServiceCapabilities capabilities;
};


/*!

## Smart Raster Service Metadata

!*/

/**
  * Smart raster metadata that is stored in the registry service metadata so that
  * clients can identify all types of raster image configurations that are supported.
  */
struct SmartRasterRegistryMetadata
{
  /** Metadata describing the data provided by the smart raster tile service. */
  RasterRegistryMetadataExtern metadataExtern;
};

/**
  * Metadata that describes the data provided by the smart raster tile service.
  * This metadata also covers the raster image configurations.
  */
subtype ExternData RasterRegistryMetadataExtern;

/** Wrapper around smart raster tile service capabilities for direct use in service interface. */
struct RasterTileServiceCapabilitiesResponse
{
  /** Capabilities of smart raster tile service. */
  RasterTileServiceCapabilities capabilities;
};

/** Optional methods that a smart raster tile service may implement. */
bitmask uint16 RasterTileServiceCapabilities
{
  /** Set to `true` if the `getImage` method is implemented. */
  GET_IMAGE,

  /** Set to `true` if the `getTileMetadata' method is implemented. */
  GET_TILE_METADATA,

  /** Set to `true` if the `getImageVersioned` method is implemented. */
  GET_IMAGE_VERSIONED,
};
