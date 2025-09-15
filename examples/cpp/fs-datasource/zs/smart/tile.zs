/*!

# Smart Layer Tiles

This package defines smart layer tiles, which provide mixed map content for
multiple layers of a tile. The layers are defined per tile and can be addressed
by their packed tile ID.

**Dependencies**

!*/

package smart.tile;

import system.types.*;
import smart.types.*;
import core.types.*;

/*!

`SmartLayerTile` is the return value of the `SmartLayerTileService` getter APIs.

A smart layer tile contains multiple `DataLayer` objects that cover map components of
exactly one tile. The `tileId` field defines the affected tile.

The `header` structure of type `SmartLayerHeader` contains the data layer IDs of all
contained data layers.

Data layer IDs associate each data layer with `DataLayerDefinition` objects,
which may be retrieved through the `SmartLayerService.getLayerDefinition` API.

!*/

rule_group SmartLayerTileRules
{
  /*!
  Unique Data Layer ID in `header.availableLayers`:

  Each `DataLayerId` in `header.availableLayers` shall be unique.
  !*/

  rule "smart-0q8qch";

  /*! `DataLayerLifetimeType` Entries in `header.layerLifetime`:

  The `DataLayerLifetimeType` entries in `header.layerLifetime` shall match the
  lifetime provided in `SmartLayerDefinition.DataLayerDefinition.DataLayerLifetimeType`
  of the respective module.
  !*/

  rule "smart-0qrjub";

  /*!
  Data Layer Definitions without Defined `SignatureDefinition`:

  If no `SignatureDefinition` is defined in the `DataLayerDefinition` of the
  `SmartLayerDefinition`, the corresponding `DataLayer` shall have no
  signature (`layers[].hasSignature` == `false`) and the predefined
  `SignatureId.NO_SIGNATURE` shall be set in `header.packagingDetails`.
  !*/

  rule "smart-0w6ud5";

  /*!
  Geometries and Attributes in Tiles:

  If a feature is stored in one tile, all attributes that are assigned to the
  feature and all geometries that the feature references shall be stored in the
  same tile. This also applies if these attributes or geometries extend beyond
  the tile border of that same tile.
  !*/

  rule "smart-7xstem-I";
};

/** Smart layer tile. */
struct SmartLayerTile
{
  /** Geographic extent of the contained data. */
  PackedTileId tileId;

  /** Header structure that associates data layers with data layer definitions. */
  SmartLayerHeader header;

  /** Blobs with data as prescribed by the associated data layer definitions. */
  DataLayer layers[header.numDataLayers];
};

/** List of Smart layer tiles. */
struct SmartLayerTileList
{
  /** Number of smart layer tiles in the list. */
  varsize numTiles;

  /** List of smart layers. */
  SmartLayerTile tileList[numTiles];
};

/** List of smart layer tile headers. */
struct SmartLayerTileHeaderList
{
  /** Number of tiles in the list. */
  varsize numTiles;

  /** Tile IDs. */
  PackedTileId tileIds[numTiles];

  /** Smart layer header for each corresponding tile. */
  SmartLayerHeader headers[numTiles];
};

/** Request object for delta of one statically versioned tile. */
struct DeltaTileInfo
{
  /** Requested tile ID.  */
  TileId tileId;

  /** Content of the source smart layer for which deltas are requested. */
  SourceLayerInfo sourceLayerInfo;
};

/** Content of a source smart layer for which a delta is requested. */
struct SourceLayerInfo
{
  /** Number of data layers in the original smart layer tile.*/
  varuint16 numDataLayers;

  /** Data layer IDs sorted in the same order as in the original smart layer tile. */
  DataLayerId availableLayers[numDataLayers];

  /** Versions of the data layers in the original smart layer tile. */
  VersionId versionId[numDataLayers];
};

/** Request object for delta of list of statically versioned tiles. */
struct DeltaTileListInfo
{
  /** Number of tiles in the list. */
  varsize numTiles;

  /** Tile IDs. */
  PackedTileId tileIds[numTiles];

  /** Content of all source smart layers for which a delta is requested. */
  SourceLayerInfo headers[numTiles];
};

/**
  * Request object for a dedicated version of smart layer tiles.
  * This request object is filled with data from previous header-only calls
  * to the smart layer tile service.
  * The availability of the requested smart layer tile is not guaranteed.
  */
struct SmartLayerTileVersionRequest
{
  /** Packed tile ID of the requested tile. */
  TileId id;

  /** Number of data layers. */
  varuint16 numDataLayers;

  /** Data layer IDs of the requested tiles. */
  DataLayerId layerIds[numDataLayers];

  /**
    * Lifetime information of the requested data layers,
    * for example, version information.
    */
  DataLayerLifetime lifetimeInfo[numDataLayers];
};

/** List of requests for dedicated versions of smart layer tiles. */
struct SmartLayerTileVersionRequestList
{
  /** Number of tiles. */
  varsize numTiles;

  /** List of request objects for dedicated versions of tiles. */
  SmartLayerTileVersionRequest tileVersionRequests[numTiles];
};

/**
  * Request object for a dedicated version of a data layer.
  * This request object is filled with data from previous header-only calls
  * to the smart layer tile service.
  * The availability of the requested data layer is not guaranteed.
  * The data layer may contain references to other data layers that need to
  * be fetched by subsequent calls.
  */
struct DataLayerTileVersionRequest
{
  /** Packed tile ID of the requested data layer. */
  TileId id;

  /** ID of the requested data layer. */
  DataLayerId layerId;

  /**
    * Lifetime information of the requested data layer,
    * for example, version information.
    */
  DataLayerLifetime lifetimeInfo;
};

/** Request object for a list of versioned data layers for a single tile. */
struct MultiDataLayerTileRequest
{
  /** Packed tile ID of the requested data layer. */
  TileId id;

  /** Number of data layers. */
  varuint16 numDataLayers;

  /** Data layer IDs of the requested tiles. */
  DataLayerId layerIds[numDataLayers];

  /**
    * Lifetime information of the requested data layers,
    * for example, version information.
    */
  DataLayerLifetime lifetimeInfo[numDataLayers];
};

/**
  * Request object for dedicated versions of data layers for multiple tiles.
  * This request object is filled with data from previous header-only calls
  * to the smart layer tile service, namely the data layer IDs and their versions.
  * The availability of the requested data layers is not guaranteed.
  * The data layers may contain references to other data layers that need to
  * be fetched by subsequent calls.
  */
struct MultiDataLayerMultiTileRequest
{
  /** Number of tiles requested. */
  varsize numTiles;

  /** List of request objects for dedicated versions of data layers per tile. */
  MultiDataLayerTileRequest tileVersionRequests[numTiles];
};

/** Response object for dedicated data layers of multiple tiles. */
struct MultiDataLayerMultiTileResponse
{
  /** Number of tiles requested. */
  varsize numTiles;

  /** List of response objects for dedicated versions of data layers per tile. */
  MultiDataLayerTileResponse tileVersionResponses[numTiles];
};

/** Response object for a set of data layers of a tile. */
struct MultiDataLayerTileResponse
{
  /** Packed tile ID of the requested data layers. */
  TileId id;

  /** Number of data layers. */
  varuint16 numDataLayers;

  /** Data layers ordered as requested. */
  DataLayer layers[numDataLayers];
};
