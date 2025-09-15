/*!

# Smart Layer Meshes

This package defines smart layer meshes, which are pre-packaged sets of smart
layer tiles.

**Dependencies**

!*/

package smart.mesh;

import system.types.*;
import core.types.*;
import smart.types.*;
import smart.tile.*;

/*!

## Smart Layer Mesh

A smart layer mesh is a container for smart layer tiles for optimized transport.
Smart layer meshes are useful, for example, when smart layer tiles are
very small and the overhead for metadata and transport is bigger than the actual
data payload.

The mesh contains an additional identifier and a list of tiles. There
is no additional information, because smart layer tiles already contain all
necessary metadata.

!*/

rule_group SmartLayerMeshRules
{
  /*!
  Tile Order in Smart Layer Meshes:

  Tiles shall be ordered by their packed tile IDs within a mesh.
  !*/

  rule "smart-magawc";

  /*!
  No Duplicate Tiles in One Smart Layer Mesh:

  There shall be no duplicate tiles within a mesh. Two tiles are considered to
  be duplicates if they have the same tile ID.
  !*/

  rule "smart-66z3em";
};

/** Container for smart layer tiles for optimized transport. */
struct SmartLayerMesh
{
  /** Universally unique identifier of a mesh. */
  SmartMeshId meshId;

  /** Number of tiles within the mesh. */
  uint16 numTiles : numTiles > 0;

  /** List of smart layer tiles, ordered by their tile ids. */
  SmartLayerTile tileList[numTiles];
};

/*!
## Smart Mesh ID

The smart mesh ID is a universally unique identifier with no further meaning.
A mesh retrieves a new ID every time one of the contained smart layer tiles changes,
for example, when one layer gets updated.

!*/

/** Universally unique identifier of a smart layer mesh. */
subtype UUID SmartMeshId;

/*!

## Smart Mesh Index

A smart mesh index contains information about the content of a mesh.
In the simplest case, this is only the relation of smart layer tile identifiers
and mesh identifiers.

The index may also contain metadata information of the smart layer tiles like
version information and packaging information.

The index is encoded in a column-store design for improved packaging.
`numEntries` is the common iterator for all lists within the mesh index.

One tile may be contained in more than one mesh.

!*/

/**
  * Index with information about the content of a mesh and with optional
  * metadata information of the smart layer tiles.
  */
struct SmartMeshIndex
{
  /** Set to `true` if the index contains smart layer header information. */
  bool hasHeaders;

  /** Set to `true` if the index contains mesh size information. */
  bool hasMeshSizes;

align(8):

  /** Number of entries in the index. */
  varsize numEntries;

  /** List of tile IDs. */
  PackedTileId tileIds[numEntries];

  /** List of mesh IDs. */
  SmartMeshId meshIds[numEntries];

  /** Smart layer header information. */
  SmartLayerHeader header[numEntries] if hasHeaders;

  /** Size of the mesh in bytes. */
  varuint32 meshSize[numEntries] if hasMeshSizes;
};
