/*!

# Smart Layer Services

Smart layer tiles, smart layer objects, and smart layer paths are accessed via
individual services.

All services provide the following sets of service methods:

- Methods that retrieve metadata about the service itself, such as
  the service's module version, its system token, or its service definition,
  which describes the kind of data that a client can expect.
- Methods that retrieve the actual data provided by the service.

**Dependencies**

!*/

package smart.services;

import system.types.*;
import core.types.*;
import core.location.*;
import core.geometry.*;
import smart.types.*;
import smart.tile.*;
import smart.object.*;
import smart.path.*;
import smart.mesh.*;
import smart.metadata.*;


/*!

## Smart Layer Tile Service

A smart layer tile service provides layered data for a tile.

Smart layer services provide several methods to return a list
of tiles or tile headers. It is not guaranteed that the returned set of
tiles constitutes a consistent set of tile versions. Therefore, an application
cannot rely on this consistency.

!*/

rule_group SmartLayerTileServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Smart Layer Tile Services:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `SmartLayerTileService`.
  !*/

  rule "smart-2mxvw8";

  /*!
  Metadata Method `getServiceDefinition` in Smart Layer Tile Services:

  The metadata method `getServiceDefinition` shall be implemented by the
  `SmartLayerTileService`.
  !*/

  rule "smart-0mkkw0";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Smart Layer Tile Services:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `SmartLayerTileService`.
  !*/

  rule "smart-0nrusp";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Smart Layer Tile Services:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `SmartLayerTileService`.
  !*/

  rule "smart-h4xxjb";

  /*!
  Metadata Method `getTileServiceCapabilities` in Smart Layer Tile Services:

  The metadata method `getTileServiceCapabilities` shall be implemented by the
  `SmartLayerTileService`.
  !*/

  rule "smart-0omu52";

  /*!
  Metadata Method `getSpatialExtent` in Smart Layer Tile Services:

  The metadata method `getSpatialExtent` shall be implemented by the
  `SmartLayerTileService`.
  !*/

  rule "smart-0qyv2y";

  /*!
  Metadata Method `getRegistryMetadata` in Smart Layer Tile Services:

  The metadata method `getRegistryMetadata` shall be implemented by the
  `SmartLayerTileService`.
  !*/

  rule "smart-0qyv3y";
};

/** Provides layered data for a tile. */
service SmartLayerTileService
{
  /** Module definition of the smart layer service itself, not its content. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** Data layer metadata of the smart layer service. */
  SmartLayerDefinition getServiceDefinition(Empty);

  /** System token of the smart layer service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Legal metadata of the smart layer service. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Metadata on implemented methods of the smart layer service. */
  TileServiceCapabilitiesResponse getTileServiceCapabilities(Empty);

  /** Spatial extent covered by the smart layer service. */
  SpatialExtent getSpatialExtent(Empty);

  /** Metadata of the smart layer service that is also stored in the registry. */
  SmartLayerRegistryMetadata getRegistryMetadata(Empty);

  /** Smart layer tiles identified by tile ID. */
  SmartLayerTile getLayerByTileId(TileId);

  /** Multiple smart layer tiles identified by a list of tile IDs. */
  SmartLayerTileList getLayerByTileIdList(TileIdList);

  /**
    * Smart layer header only, to read lifetime and version information without
    * payload for one single tile.
    */
  SmartLayerHeader getHeaderOnlyByTileId(TileId);

  /**
    * Smart layer header only, to read lifetime and version information without
    * payload for a list of tiles.
    */
  SmartLayerTileHeaderList getHeaderOnlyByTileIdList(TileIdList);

  /**
    * Smart layer header only, to read lifetime and version information without
    * payload for one provided tile ID. This method returns the requested tile
    * and all tiles from lower levels that are covered by the requested tile ID.
    */
  SmartLayerTileHeaderList getHeaderOnlyListInTile(TileId);

  /**
    * Delta-encoded smart layer tile based on the source versions that are
    * passed on via `DeltaTileInfo`.
    */
  SmartLayerTile getDeltaLayerByTileId(DeltaTileInfo);

  /**
    * List of delta-encoded smart layer tiles based on the source versions that
    * are passed on via `DeltaTileListInfo`.
    */
  SmartLayerTileList getDeltaLayerByTileIdList(DeltaTileListInfo);

  /** Smart layer tiles identified by tile ID and additional version information. */
  SmartLayerTile getLayerByTileVersion(SmartLayerTileVersionRequest);

  /** List of smart layer tiles identified by a list of tile IDs and version information. */
  SmartLayerTileList getLayerByTileVersionList(SmartLayerTileVersionRequestList);

  /**
    * Direct access to a single data layer, which is not a smart layer, of a
    * tile with a specific version.
    */
  DataLayer getSingleDataLayerByTileId(DataLayerTileVersionRequest);

  /**
    * Direct access to a list of data layers, which are not smart layers,
    * of multiple tiles.
    */
  MultiDataLayerMultiTileResponse getDataLayerListByTileIdList(MultiDataLayerMultiTileRequest);
};

/** Publish-subscribe topics for smart layer tile services. */
pubsub SmartLayerTileTopics
{
  /** Publish whenever a tile gets updated. */
  topic("nds/smart/tile/update") TileId tileID;
};

/*!

## Smart Layer Object Service

A smart layer object service provides layered data for an object, which is
identified by a reference ID.

!*/

rule_group SmartLayerObjectServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Smart Layer Object Services:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `SmartLayerObjectService`.
  !*/

  rule "smart-rink53";

  /*!
  Metadata Method `getObjectServiceDefinition` in Smart Layer Object Services:

  The metadata method `getObjectServiceDefinition` shall be implemented by the
  `SmartLayerObjectService`.
  !*/

  rule "smart-uiuzbn";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Smart Layer Object Services:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `SmartLayerObjectService`.
  !*/

  rule "smart-pbw0c7";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Smart Layer Object Services:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `SmartLayerObjectService`.
  !*/

  rule "smart-n29nms";

  /*!
  Metadata Method `getObjectServiceCapabilities` in Smart Layer Object Services:

  The metadata method `getObjectServiceCapabilities` shall be implemented by the
  `SmartLayerObjectService`.
  !*/

  rule "smart-kzrahz";

  /*!
  Metadata Method `getSpatialExtent` in Smart Layer Object Services:

  The metadata method `getSpatialExtent` shall be implemented by the
  `SmartLayerObjectService`.
  !*/

  rule "smart-i3qj5y";

  /*!
  Metadata Method `getRegistryMetadata` in Smart Layer Object Services:

  The metadata method `getRegistryMetadata` shall be implemented by the
  `SmartLayerObjectService`.
  !*/

  rule "smart-12qj7y";
};

/** Provides layered data for an object. */
service SmartLayerObjectService
{
  /** Module definition of the smart layer service itself, not its content. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** Data layer metadata of the smart layer service. */
  SmartLayerObjectDefinition getObjectServiceDefinition(Empty);

  /** System token of the smart layer service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Legal metadata of the smart layer service. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Metadata on implemented methods of the smart layer service. */
  ObjectServiceCapabilitiesResponse getObjectServiceCapabilities(Empty);

  /** Spatial extent covered by the smart layer service. */
  SpatialExtent getSpatialExtent(Empty);

  /** Metadata of the smart layer service that is also stored in the registry. */
  SmartLayerRegistryMetadata getRegistryMetadata(Empty);

  /** Smart layer objects identified by reference. */
  SmartLayerObject getObjectByReference(SmartLayerObjectReference);

  /** Smart layer object references identified by tile ID. */
  SmartLayerObjectReferenceList getReferencesInTile(TileId);

  /** Road location path for a smart layer object. */
  RoadLocationPath getLocationPathForObjectReference(SmartLayerObjectReference);

  /** Road location identifier of a smart layer object. */
  RoadLocationId getLocationIdForObjectReference(SmartLayerObjectReference);

  /** Smart layer objects identified by tile ID. */
  SmartLayerObjectList getObjectsInTile(TileId);

  /**
    * Smart layer header only, to read lifetime and version information without
    * payload for one object reference.
    */
  SmartLayerHeader getHeaderOnlyByObjectReference(SmartLayerObjectReference);

  /**
    * Smart layer header only, to read lifetime and version information without
    * payload for one provided tile ID.
    */
  SmartLayerObjectHeaderList getHeaderOnlyListInTile(TileId);

    /**
    * Direct access to a single data layer, which is not a complete smart layer, of a
    * smart layer object with a specific version.
    */
  DataLayer getSingleDataLayerByObjectReference(DataLayerObjectVersionRequest);
};

/** Publish-subscribe topics for smart layer object services. */
pubsub SmartLayerObjectTopics
{
  /** Publish whenever an object gets updated. */
  topic("nds/smart/object/update") SmartLayerObjectReference objectReference;
};


/*!

## Smart Layer Path Service

A smart layer path service provides layered data for a path.
The path is identified by a path geometry.

!*/

rule_group SmartLayerPathServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Smart Layer Path Services:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `SmartLayerPathService`.
  !*/

  rule "smart-r67oe4";

  /*!
  Metadata Method `getServiceDefinition` in Smart Layer Path Services:

  The metadata method `getServiceDefinition` shall be implemented by the
  `SmartLayerPathService`.
  !*/

  rule "smart-98n74a";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Smart Layer Path Services:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `SmartLayerPathService`.
  !*/

  rule "smart-xbodbd";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Smart Layer Path Services:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `SmartLayerPathService`.
  !*/

  rule "smart-86o05g";

  /*!
  Metadata Method `getPathServiceCapabilities` in Smart Layer Path Services:

  The metadata method `getPathServiceCapabilities` shall be implemented by the
  `SmartLayerPathService`.
  !*/

  rule "smart-6ywkr3";

  /*!
  Metadata Method `getSpatialExtent` in Smart Layer Path Services:

  The metadata method `getSpatialExtent` shall be implemented by the
  `SmartLayerPathService`.
  !*/

  rule "smart-p5qj5y";

  /*!
  Metadata Method `getRegistryMetadata` in Smart Layer Path Services:

  The metadata method `getRegistryMetadata` shall be implemented by the
  `SmartLayerPathService`.
  !*/

  rule "smart-d2qj7y";
};

/** Provides layered data for a path. */
service SmartLayerPathService
{
  /** Module definition of the smart layer service itself, not its content. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** Data layer metadata of the smart layer service. */
  SmartLayerDefinition getServiceDefinition(Empty);

  /** System token of the smart layer service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Legal metadata of the smart layer service. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Metadata on implemented methods of the smart layer service. */
  PathServiceCapabilitiesResponse getPathServiceCapabilities(Empty);

  /** Spatial extent covered by the smart layer service. */
  SpatialExtent getSpatialExtent(Empty);

  /** Metadata of the smart layer service that is also stored in the registry. */
  SmartLayerRegistryMetadata getRegistryMetadata(Empty);

  /** Smart layer path data along a provided path reference. */
  SmartLayerPath getDataAlongPath(SmartLayerPathReference);

  /** Smart layer path data along an NDS.Classic road location ID. */
  SmartLayerLocationIdPath getDataAlongLocationId(RoadLocationId);

  /** List of smart layer paths within a list of tiles. */
  SmartLayerPathList getPathsInTile(TileIdList);

  /**
    * Smart layer header only, to read lifetime and version information without
    * payload for one path.
    */
  SmartLayerHeader getHeaderOnlyByPath(SmartLayerPathReference);

  /**
    * Smart layer header only, to read lifetime and version information without
    * payload for one provided tile ID. This method returns all paths within
    * the requested tile and all paths from lower level tiles that are covered by the
    * requested tile ID.
    */
  SmartLayerTileHeaderList getHeaderOnlyListInTile(TileId);
};

/*!

## Smart Layer Path Horizon Service

A smart layer path horizon service provides layered data for a horizon based
on a provided path, which is identified by a path geometry.
The returned path does not include the provided path.
Rather than providing data for the provided path, the smart layer path horizon
extends this path based on the service's prediction and provides layered data for
the extended path.

!*/

rule_group SmartLayerPathHorizonServiceRules
{
  /*!
  Provided Path Not Included in Returned Path:

  The `SmartLayerPath` returned by `getHorizonDataForPath` shall not include the
  path that is provided in `SmartLayerPathReference`.
  !*/

  rule "smart-8fam5r";

  /*!
  Metadata Method `getServiceModuleDefinition` in Smart Layer Path Horizon Services:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `SmartLayerPathHorizonService`.
  !*/

  rule "smart-0qywof";

  /*!
  Metadata Method `getServiceDefinition` in Smart Layer Path Horizon Services:

  The metadata method `getServiceDefinition` shall be implemented by the
  `SmartLayerPathHorizonService`.
  !*/

  rule "smart-65oydu";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Smart Layer Path Horizon Services:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `SmartLayerPathHorizonService`.
  !*/

  rule "smart-pmdai5";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Smart Layer Path Horizon Services:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `SmartLayerPathHorizonService`.
  !*/

  rule "smart-c0862b";

  /*!
  Metadata Method `getPathHorizonServiceCapabilities` in Smart Layer Path Horizon Services:

  The metadata method `getPathHorizonServiceCapabilities` shall be implemented by the
  `SmartLayerPathHorizonService`.
  !*/

  rule "smart-t5fex6";

  /*!
  Metadata Method `getSpatialExtent` in Smart Layer Path Horizon Services:

  The metadata method `getSpatialExtent` shall be implemented by the
  `SmartLayerPathHorizonService`.
  !*/

  rule "smart-0wqj5y";

  /*!
  Metadata Method `getRegistryMetadata` in Smart Layer Path Horizon Services:

  The metadata method `getRegistryMetadata` shall be implemented by the
  `SmartLayerPathHorizonService`.
  !*/

  rule "smart-9wqj5y";
};

/** Provides layered data for a horizon based on a provided path. */
service SmartLayerPathHorizonService
{
  /** Module definition of the smart layer service itself, not of its content. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** Data layer metadata of the smart layer service. */
  SmartLayerDefinition getServiceDefinition(Empty);

  /** System token of the smart layer service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Legal metadata of the smart layer service. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Metadata on implemented methods of the smart layer service. */
  PathHorizonServiceCapabilitiesResponse getPathHorizonServiceCapabilities(Empty);

  /** Spatial extent covered by the smart layer service. */
  SpatialExtent getSpatialExtent(Empty);

  /** Metadata of the smart layer service that is also stored in the registry. */
  SmartLayerRegistryMetadata getRegistryMetadata(Empty);

  /**
    * Smart layer path data extending a provided path reference by
    * predicting the horizon.
    */
  SmartLayerPath getHorizonDataForPath(SmartLayerPathReference);

  /**
    * Smart layer path data extending a provided list of raw poses by
    * predicting the horizon.
    */
  SmartLayerPath getHorizonDataForPose(SmartLayerPosePathRequest);
};

/** Publish-subscribe topics for smart layer path services. */
pubsub SmartLayerPathTopics
{
  /**
    * Publish the currently valid smart layer path.
    * Subsequent updates will be published on the same topic and overwrite the
    * previous value.
    */
  topic("nds/smart/path/current") SmartLayerPath currentPath;
};

/*!

## Smart Layer Mesh Service

A smart layer mesh service provides pre-packaged sets of smart layer tiles.
These sets are called meshes. Meshes can be accessed using a mesh ID.
The number of tiles in a mesh is defined by the service.

!*/

rule_group SmartLayerMeshServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Smart Layer Mesh Services:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `SmartLayerMeshService`.
  !*/

  rule "smart-5xsnux";

  /*!
  Metadata Method `getServiceDefinition` in Smart Layer Mesh Services:

  The metadata method `getServiceDefinition` shall be implemented by the
  `SmartLayerMeshService`.
  !*/

  rule "smart-44nuqw";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Smart Layer Mesh Services:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `SmartLayerMeshService`.
  !*/

  rule "smart-cnccnv";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Smart Layer Mesh Services:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `SmartLayerMeshService`.
  !*/

  rule "smart-gyoje3";

  /*!
  Metadata Method `getMeshServiceCapabilities` in Smart Layer Mesh Services:

  The metadata method `getMeshServiceCapabilities` shall be implemented by the
  `SmartLayerMeshService`.
  !*/

  rule "smart-yuktx3";

  /*!
  Metadata Method `getSpatialExtent` in Smart Layer Mesh Services:

  The metadata method `getSpatialExtent` shall be implemented by the
  `SmartLayerMeshService`.
  !*/

  rule "smart-fgtj5y";

  /*!
  Metadata Method `getRegistryMetadata` in Smart Layer Mesh Services:

  The metadata method `getRegistryMetadata` shall be implemented by the
  `SmartLayerMeshService`.
  !*/

  rule "smart-fgxj5y";
};

/** Provides pre-packaged sets of smart layer tiles. */
service SmartLayerMeshService
{
  /** Module definition of the smart layer service itself, not its content. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** Data layer metadata of the smart layer service. */
  SmartLayerDefinition getServiceDefinition(Empty);

  /** System token of the smart layer service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Legal metadata of the smart layer service. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Metadata on implemented methods of the smart layer service. */
  MeshServiceCapabilitiesResponse getMeshServiceCapabilities(Empty);

  /** Spatial extent covered by the smart mesh service. */
  SpatialExtent getSpatialExtent(Empty);

  /** Metadata of the smart mesh service that is also stored in the registry. */
  SmartLayerRegistryMetadata getRegistryMetadata(Empty);

  /** Retrieve a smart mesh index for the given tile id. */
  SmartMeshIndex getMeshIndexByTileId(TileId);

  /** Retrieve a smart layer mesh. */
  SmartLayerMesh getMeshById(SmartMeshId);
};

/*!

## Smart Raster Tile Service

A smart raster tile service provides access to raster images.
It does not wrap these images in any packaging structure but
provides direct access.

!*/

rule_group SmartRasterTileServiceRules
{
  /*!
  Metadata Method `getServiceModuleDefinition` in Smart Raster Tile Services:

  The metadata method `getServiceModuleDefinition` shall be implemented by the
  `SmartRasterTileService`.
  !*/

  rule "smart-9xsnux";

  /*!
  Metadata Method `getServiceNodeSystemReference` in Smart Raster Tile Services:

  The metadata method `getServiceNodeSystemReference` shall be implemented by the
  `SmartRasterTileService`.
  !*/

  rule "smart-cncxnv";

  /*!
  Metadata Method `getServiceNodeLegalInfo` in Smart Raster Tile Services:

  The metadata method `getServiceNodeLegalInfo` shall be implemented by the
  `SmartRasterTileService`.
  !*/

  rule "smart-gyije3";

  /*!
  Metadata Method `getRasterTileServiceCapabilities` in Smart Raster Tile Services:

  The metadata method `getRasterTileServiceCapabilities` shall be implemented by the
  `SmartRasterTileService`.
  !*/

  rule "smart-yuktx4";

  /*!
  Metadata Method `getSpatialExtent` in Smart Raster Tile Services:

  The metadata method `getSpatialExtent` shall be implemented by the
  `SmartRasterTileService`.
  !*/

  rule "smart-fgtu5y";

  /*!
  Metadata Method `getRegistryMetadata` in Smart Raster Tile Services:

  The metadata method `getRegistryMetadata` shall be implemented by the
  `SmartRasterTileService`.
  !*/

  rule "smart-fotu5y";

  /*!
  Tile Metadata Required for Versioned Access:

  If `getImageVersioned` is provided by a service implementation,
  the service shall also offer `getTileMetadata`.
  !*/

  rule "smart-szf73s";

};

/** Smart raster tile service. Provides raw raster image tiles. */
service SmartRasterTileService
{
  /** Module definition of the smart raster tile service. */
  ModuleDefinition getServiceModuleDefinition(Empty);

  /** System token of the smart raster tile service. */
  NdsSystemToken getServiceNodeSystemReference(Empty);

  /** Legal metadata of the smart raster tile service. */
  NdsNodeLegalInfo getServiceNodeLegalInfo(Empty);

  /** Metadata on implemented methods of the smart raster tile service. */
  RasterTileServiceCapabilitiesResponse getRasterTileServiceCapabilities(Empty);

  /** Spatial extent covered by the smart raster service. */
  SpatialExtent getSpatialExtent(Empty);

  /** Metadata of the smart raster service that is also stored in the registry. */
  SmartLayerRegistryMetadata getRegistryMetadata(Empty);

  /**
    * Returns the latest version of the raster image with the specified
    * configuration.
    */
  RasterImage getImage(RasterTileImageRequest);

  /**
    * Metadata of the tile, including available configurations and the latest
    * version.
    */
  RasterTileInfo getTileMetadata(TileId);

  /** Requests raster image based on version and the image configuration. */
  RasterImage getImageVersioned(RasterTileImageVersionRequest);
};