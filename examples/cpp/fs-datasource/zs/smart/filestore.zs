/*!

# Smart Layer File Store

Smart layer tiles and objects can be stored in SQLite database files.


**Dependencies**

!*/

package smart.filestore;

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

Smart layer file stores for tiles and objects can have any name, but the file
ending is always `.ndslive` in lowercase letters.

!*/

rule_group SmartLayerFileStoreRules
{
  /*!
  Naming of Smart Layer File Stores:

  SQLite databases for smart layer tile storage or smart layer object storage
  shall have the file ending `.ndslive`, which shall be written in lowercase
  letters.
  !*/

  rule "smart-966wdq";
};

/** SQL database for smart layer tile storage. */
sql_database SmartLayerTileStore
{
  SmartLayerMetadataTable metadataTable;

  SmartLayerTileTable tileTable;
};

/** SQL database for smart layer object storage. */
sql_database SmartLayerObjectStore
{
  SmartLayerMetadataTable metadataTable;

  SmartLayerObjectTable objectTable;
};

/** Metadata table with only one row holding all smart layer metadata. */
sql_table SmartLayerMetadataTable
{
  /** Artificial primary key. Shall be set to 0. */
  uint8 id sql "PRIMARY KEY DEFAULT 0 NOT NULL";

  /** Metadata of the smart layer that would normally be provided by the registry. */
  SmartLayerRegistryMetadata registryMetadata;

  /** Module definition of the smart layer module itself, not its content. */
  ModuleDefinition moduleDefinition;

  /** Data layer metadata of the smart layer. */
  SmartLayerDefinition definition;

  /** System token of the smart layer. */
  NdsSystemToken nodeSystemReference;

  /** Legal information of the smart layer. */
  NdsNodeLegalInfo nodeLegalInfo;

  /** Spatial extent covered by the file store. */
  SpatialExtent spatialExtent;

  sql("check(id == 0)");
};

/** Smart layer tile table. */
sql_table SmartLayerTileTable
{
  /** Tile ID of the smart layer. */
  PackedTileId tileId sql "PRIMARY KEY NOT NULL";

  /** Smart layer tile. */
  SmartLayerTile smartLayer sql "NOT NULL";

  /** Optional header information for the tile. */
  SmartLayerHeader header sql "NULL";

};

/** Smart layer object table. */
sql_table SmartLayerObjectTable
{
  /** ID of the smart layer object. */
  SmartLayerObjectId objectId sql "NOT NULL";

  /** Class of the smart layer object. */
  SmartLayerObjectClass objectClass sql "NOT NULL";

  /** Smart layer object. */
  SmartLayerObject smartLayer sql "NOT NULL";

  /** Optional header information for the object. */
  SmartLayerHeader header sql "NULL";

  sql "primary key (objectId, objectClass)";

};
