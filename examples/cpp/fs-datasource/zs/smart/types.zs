/*!

# Smart Layer Types

This package defines common data structures that are used by the Smart module.

**Dependencies**

!*/

package smart.types;

import system.types.*;
import core.types.*;
import core.packaging.*;


/*!

## Data Layer Types

A `DataLayer` carries data as defined in the corresponding `DataLayerDefinition`.
The layer ID and its metadata have to be derived from the header of the
corresponding `SmartLayerTile`, `SmartLayerObject`, or `SmartLayerPath`.

Optionally, a `DataLayer` is signed with a signature to support, for example,
end-to-end data protection. First, the data that is to be signed is hashed, then
the hash is signed, and finally the signature is provided along with the data.
Since NDS.Live provides different hash algorithms and signature calculation
methods, signatures allow more flexibility as to what type of cryptographic
method can be used to authenticate map data.

!*/

rule_group DataLayerRules
{
  /*!
  Filling of `layer.ExternDescriptor`

  The `ExternDescriptor` of each data layer shall be filled with the predefined
  values as described in the `nds.*._module` package of the module where the
  layer is defined.
  !*/

  rule "smart-jfou3h";

  /*!
  Filling of `layer.ExternDescriptor` for Custom Layers

  Custom layers shall use the following prefix for the module name, when
  filling the `ExternDescriptor` of a data layer: "custom:".
  The string can be freely extended after the prefix.
  !*/

  rule "smart-xtv5k5";
};

/** Carries data as defined in the corresponding `DataLayerDefinition`. */
struct DataLayer
{
  /** Set to `true` if the data layer is signed. */
  bool hasSignature;

  /**
    * Optional signature of the data layer, which can be read using the
    * information provided in the `DataLayerDefinition` of the smart layer
    * service.
    */
align(8):
  extern signature if hasSignature;

  /** Content of the data layer. */
  ExternData layer;
};


/**
* The data layer definition describes the data layer content, which is provided by
* the smart layer services.
*/
struct DataLayerDefinition
{
  /** Identifier of a data layer.*/
  DataLayerId dataLayerId;

  /** Lifetime type of the data layer. */
  DataLayerLifetimeType lifetime;

  /**
    * Defines if the data layer is a custom extension.
    */
  bool isCustomExtension = false;

  /** Descriptor of the layer structure, including module and version info.*/
  ExternDescriptor layerDescriptor;

  /** Identifier of a custom extension. */
  CustomExtensionIdentifier customExtensionIdentifier if isCustomExtension;

  /** Name of the data layer. Only used for informational purposes.*/
  DataLayerName name;

  /** Content of the data layer.*/
  DataLayerContentType contentType;

  /** Definition of the signature algorithm and key used for signing the data layer. */
  optional SignatureDefinition signatureDefinition;

  /** Specific metadata structure of the content type.*/
  ExternData layerMetadata if !isCustomExtension;

  /** Unspecified metadata for custom extensions. */
align(8):
  extern customExtensionMetadata if isCustomExtension;
};

/** The data layer content type provides generic types for data layer content. */
subtype LayerType DataLayerContentType;

/**
  * Information on the lifetime of a data layer.
  * Provides either a version ID or detailed lifetime information,
  * depending on the lifetime type.
  */
struct DataLayerLifetime
{
  /**
    * Lifetime type of the data layer. Describes whether it contains
    * static, dynamic, or live data.
    */
  DataLayerLifetimeType lifetime;

  /** Lifetime information of the data layer. */
  DataLayerLifetimeInfo(lifetime) layerLifetimeInfo;
};

/** Lifetime type of a data layer. */
enum uint8 DataLayerLifetimeType
{
  /** Static lifetime. Data uses classic versioning information. */
  STATIC,

  /** Dynamic lifetime. Data has age information only. */
  DYNAMIC,

  /**
    * Live lifetime. Data is live by definition and has no additional version or
    * age info.
    */
  LIVE,
};


choice DataLayerLifetimeInfo(DataLayerLifetimeType lifetime) on lifetime
{
  case STATIC:
          /** A version ID is provided for static data. */
          VersionId versionId;

  case DYNAMIC:
          /** Detailed lifetime information is provided for dynamic data. */
          DynamicDataLifetimeInfo dynamicDataLifetimeInfo;

  case LIVE:
          // Live data does not have any additional age information.
          ;
};

/** Detailed information on lifetime for dynamic data. */
struct DynamicDataLifetimeInfo
{
  /**
    * A timestamp describing the point in time when the data was collected.
    * `collectionTime` can be used to determine the freshness of the data
    */
  TimeStamp collectionTime;

  /**
    * Expected expiration time of the dynamic data. `expirationTime` can be used to
    * configure refresh times for subsequent calls to the service.
    */
  TimeStamp expirationTime;
};

/**
  * Unique ID that associates a `DataLayer` with a `DataLayerDefinition`
  * through the `SmartLayerHeader.availableLayers` field.
  */
subtype varuint16 DataLayerId;

/**
  * User-friendly name string for a data layer. A data layer name can
  * optionally be assigned to a `DataLayerDefinition`.
  */
subtype string DataLayerName;

/** Indicates whether a data layer is a custom extension. */
subtype string CustomExtensionIdentifier;


/*!

## Smart Layer Header and Type

!*/

rule_group SmartLayerHeaderRules
{
  /*! `layerLifetimeInfo` Sorting Order:

  `layerLifetimeInfo` shall use the same sorting order as `availableLayers`.
  !*/

  rule "smart-0wnktk";

  /*! `packagingDetails` Sorting Order:

  `packagingDetails` shall use the same sorting order as `availableLayers`.
  !*/

  rule "smart-20opod";
};

/**
  * Header structure that is aggregated in `SmartLayerObject`, `SmartLayerTile`,
  * and `SmartLayerPath`.
  */
struct SmartLayerHeader
{
  /** Number of data layers in the corresponding parent `SmartObject` or `SmartLayer`.*/
  varuint16 numDataLayers;

  /** Data layer IDs sorted by appearance in the content stream. */
  DataLayerId availableLayers[numDataLayers];

  /** Lifetime information of the data layers. */
  DataLayerLifetime layerLifetime[numDataLayers];

  /**
    * Information on which signature, compression, and encryption is used for
    * each data layer.
    */
  PackagingDetails packagingDetails[numDataLayers];

  /**
    * Legal information string for all data layers.
    * The string is a concatenation of the legal data of all data layers and is
    * used for legal purposes, such as copyright information.
    */
  optional string legalInformation;
};

/** Type of the smart layer service. */
enum uint8 SmartLayerType
{
  /** Smart layer service providing tiles. */
  SMART_LAYER_TILE,

  /** Smart layer service providing objects. */
  SMART_LAYER_OBJECT,

  /** Smart layer service providing paths. */
  SMART_LAYER_PATH,

  /** Smart layer service providing meshes of tiles. */
  SMART_LAYER_MESH,

  /** Smart layer service providing horizon paths. */
  SMART_LAYER_PATH_HORIZON,
};

/*!

## Smart Raster Tile Service Types

!*/

/**
  * Basic image request specifying the tile and the requested raster image
  * configuration.
  */
struct RasterTileImageRequest
{
  /** ID of the tile that the image is used in. */
  TileId tileId;

  /** Requested raster image configuration. */
  RasterImageConfigBase64 configuration;
};

/** Latest version and available configurations of one raster tile image. */
struct RasterTileInfo
{
  /** Lifetime information of the raster image tile. */
  RasterImageLifetime lifetimeInfo;

  /** Available raster image configurations. */
  RasterImageConfigExtern configurations[];
};

/** Request for raster image that fulfills specific conditions. */
struct RasterTileImageVersionRequest
{
  /** ID of the tile that the image is used in. */
  TileId tileId;

  /** Requested raster image configuration. */
  RasterImageConfigBase64 configuration;

  /**
    * Lifetime information of the requested raster image, for example, version
    * information.
    */
  RasterImageLifetime lifetimeInfo;
};

/** Unwrapped image data. */
subtype bytes RasterImage;

/**
  * URL-safe Base64 encoding of the content of `RasterImageConfigExtern.data`.
  * For more information about Base64 encoding, see RFC 4648.
  *
  * The raster image is Base64-encoded to provide flexibility when retrieving
  * images from a `SmartRasterTileService` without having zserio on the
  * client or on the server side. This flexibility is useful, for example, when
  * using a mapping to URL path segments.
  *
  * A raster image configuration is retrieved by evaluating either
  * `RasterRegistryMetadataExtern` or the `RasterTileInfo` of a specific tile.
  */
subtype string RasterImageConfigBase64;

/**
  * Specific configuration of the raster image. Is filled with the data structure
  * `DISPLAY_ORTHO_IMAGE_CONFIG`, which is defined in the Display module.
  */
subtype ExternData RasterImageConfigExtern;

/** Lifetime information of a raster image. */
subtype DataLayerLifetime RasterImageLifetime;