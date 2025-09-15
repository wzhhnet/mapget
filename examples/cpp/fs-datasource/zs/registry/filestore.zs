/*!

# Registry File Store

Registry information can be stored in SQLite database files. The registry
node table lists all relevant nodes, including second-tier registries,
if available.

**Dependencies**

!*/

package registry.filestore;

import system.types.*;
import core.geometry.*;
import registry.node.*;

/*!

The file name of registry file stores is always `registry.ndslive` in lowercase
letters, including the file ending.

!*/

rule_group RegistryFileStoreRules
{
  /*!
  Naming of Registry File Stores:

  The file names of SQLite databases for storage of registry information
  shall only use lowercase letters, including the file extension.
  The file name including the extension shall be `registry.ndslive`.
  !*/

  rule "registry-edm6c2";

  /*!
  Service Information in Registry Node Table:

  If the type of a node in `RegistryNodeTable.type` is set to `SERVICE`, the
  field `RegistryNodeTable.serviceInformation` shall be filled with the
  corresponding service information.
  The field `RegistryNodeTable.registryDefinition` shall be NULL.
  !*/

  rule "registry-pvhgqk";

  /*!
  Registry Definition in Registry Node Table:

  If the type of a node in `RegistryNodeTable.type` is set to `REGISTRY`,
  the field `RegistryNodeTable.registryDefinition` shall be filled with the
  corresponding registry information.
  The field `RegistryNodeTable.serviceInformation` shall be NULL.
  !*/

  rule "registry-jeq627";
};


/** SQL database for storage of registry information. */
sql_database RegistryStore
{
  RegistryNodeTable nodeTable;
};



/** Registry node table, provides information about registered nodes. */
sql_table RegistryNodeTable
{
  /** Identifier of the NDS system that the network node works with. */
  NdsSystemToken systemId sql "NOT NULL";

  /** Identifier of the network node. */
  NdsNodeToken nodeToken sql "NOT NULL";

  /** Legal information of the network node. */
  NdsNodeLegalInfo legalInfo sql "NOT NULL";

  /** Functional role of the network node.*/
  NodeType type sql "NOT NULL";

  /** Generic cost value, which may be interpreted by a client.*/
  ConnectionCosts connectionCosts sql "NOT NULL";

  /** Geographic coverage of the network node. */
  SpatialExtent spatialCoverage sql "NOT NULL";

  /** Node interface protocol, which a client may use for communication. */
  ProtocolType protocolType sql "NOT NULL";

  /** URI to more information on the used protocol. */
  string protocolDetailsUri sql "NOT NULL";

  /** Arbitrary name of the network node. */
  string nodeName sql "NOT NULL";

  /** Host name or IP address of the network node. */
  string hostName sql "NOT NULL";

  /** Port under which the network node runs on the host under the designated name.*/
  uint16 port sql "NOT NULL";

  /** Semantic service configuration, if applicable. */
  ServiceInformation serviceInformation sql "NULL";

  /** Module information of registered second-tier registries, if applicable. */
  ModuleDefinition registryDefinition sql "NULL";

  sql "primary key (systemId, nodeToken)";

};