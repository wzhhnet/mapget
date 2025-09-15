/*!
# Smart Layer Objects

This package defines smart layer objects, which provide mixed map content
for multiple data layers of an object that is not bound to a predefined
spatial extent.

A smart layer object ID is unique per type. The combination of type and smart layer object ID
defines a globally unique ID inside an NDS map, which is used to identify smart layer objects.

A smart layer object combines data layers from different NDS.Live modules. The
concept is similar to smart layer tiles and the only difference is the addressability.

**Dependencies**
!*/

package smart.object;

import system.types.*;
import core.geometry.*;
import smart.types.*;
import smart.metadata.*;

subtype varuint SmartLayerObjectId;

/** List of smart layer objects for usage in smart services. */
struct SmartLayerObjectList
{
  /** List of objects. */
  SmartLayerObject list[];
};

/** Smart layer object, combines data layers and is addressable via a type-unique ID. */
struct SmartLayerObject
{
  /** ID of the smart layer object. */
  SmartLayerObjectId         id;

  /** Header structure that associates data layers with data layer definitions. */
  SmartLayerHeader           header;

  /** BLOBs with data as prescribed by the associated data layer definitions. */
  DataLayer             layers[header.numDataLayers];
};

/** List of smart layer object references for usage in smart services. */
struct SmartLayerObjectReferenceList
{
  /** Number of objects in the list. */
  varsize numObjects;

  /** List of references. */
  SmartLayerObjectReference list[numObjects];

  /**
    * Spatial extent of the returned objects.
    * Can help to match returned objects to map features, for example,
    * matching a smart layer object representing a parking facility to a POI.
    */
  optional SpatialExtent extent[numObjects];
};

/** Reference to a smart layer object. */
struct SmartLayerObjectReference
{
  /** ID of the smart layer object. */
  SmartLayerObjectId         id;
};

/** Metadata describing smart layer objects.  */
struct SmartLayerObjectDefinition
{
  /** Class of the smart layer object. */
  SmartLayerObjectClass smartObjectClass;

  /** Describes content of smart layer objects using this object definition. */
  SmartLayerDefinition smartLayerDefinition;
};

/**
  * Request object for a dedicated version of a data layer.
  * This request object is filled with data from previous header-only calls
  * to the smart layer object service.
  * The availability of the requested data layer is not guaranteed.
  * The data layer may contain references to other data layers that need to
  * be fetched by subsequent calls.
  */
struct DataLayerObjectVersionRequest
{
  /** Smart layer reference of the requested data layer. */
  SmartLayerObjectReference objectReference;

  /** ID of the requested data layer. */
  DataLayerId layerId;

  /**
    * Lifetime information of the requested data layer,
    * for example, version information.
    */
  DataLayerLifetime lifetimeInfo;
};

/** Response object for headers of smart layer objects. */
struct SmartLayerObjectHeaderList
{
  /** Number of objects in the list. */
  varsize numObjects;

  /** Smart layer object references. */
  SmartLayerObjectReference references[numObjects];

  /** Headers for the referenced smart layer object. */
  SmartLayerHeader headers[numObjects];
};
