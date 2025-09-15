/*!

# Registry Node

This package defines the registry services that are necessary to
describe and search service nodes.

A registry node is uniquely identified by its combination of `NdsNodeToken`
and `NdsSystemToken`.

**Dependencies**

!*/

package registry.node;

import system.types.*;
import core.types.*;
import core.geometry.*;

/*!

## Basic Subtypes

!*/

/**
  * Defines the global priority of the service. A higher value indicates a
  * higher priority. A client uses the combination of service priority and
  * connection costs to decide whether to connect to a specific service node.
 */
subtype uint8 ServicePriority;

/**
  * Defines the costs for connecting to a specific service node.
  * The costs can be real costs like data carrier costs, but will mainly
  * be artificial. An application may choose from different nodes offering the same
  * data based on the costs it will generate.
 */
subtype uint16 ConnectionCosts;


/*!

## Registry Information

Registry information includes basic enumerations of possible semantic
node types and specific service types, as well as protocol types for remote
procedure calls (RPC) and publish-subscribe (PubSub) systems.

In combination with `ServiceInformation.moduleDefinition`, this information enables clients
to determine which structures to use to interact with a specific service.

!*/

/** Type of a network node.*/
enum uint8 NodeType
{
  /** The network node provides a registry service interface.*/
  REGISTRY = 0,

  /** The network node provides module-based services.*/
  SERVICE = 1,

  /** The network node is an publish-subscribe broker.*/
  TOPIC_SERVER = 3,
};

/** Protocol type of the underlying service or publish-subscribe implementation.*/
subtype uint8 ProtocolType;

/** The service uses a secure REST implementation using HTTPS.*/
const ProtocolType REST = 0;

  /** The service is based on gRPC.*/
const ProtocolType GRPC = 1;

  /** The node is an MQTT broker.*/
const ProtocolType MQTT = 2;

/**
  * The service uses a secure REST implementation using HTTPS and provides
  * additional information on the transport layer using OpenAPI 3.0.
  */
const ProtocolType REST_OPENAPI30 = 3;

/** The service uses a SOME/IP implementation. */
const ProtocolType SOME_IP = 5;

/** The service uses an unsecure REST implementation. */
const ProtocolType REST_UNSECURE = 6;

/**
  * The service uses an unsecure REST implementation and provides additional information
  * on the transport layer using OpenAPI 3.0.
  */
const ProtocolType REST_OPENAPI30_UNSECURE = 7;

/** The data is stored in a SQLITE (file format 3) file. */
const ProtocolType FILE_SQLITE3 = 8;

/*!

## Node Information Objects

Network nodes are defined in node information objects, which are
stored in a node list. Each node information object identifies the specific
service provided by a network node, including physical and semantic properties.

The definitions in `connectionCosts`, `spatialCoverage` and
`ServiceInformation.servicePriority` allow service nodes to influence potential
client decisions for a connection to a node.

!*/

rule_group NodeInformationObjectsRules
{
  /*!
  Protocol Type `REST_OPENAPI30`:

  If `ProtocolType` is set to `REST_OPENAPI30`, `protocolDetailsUri` shall point
  to the JSON representation of the OpenAPI definition file of the node,
  for example, openapi.json.
  !*/

  rule "registry-0a74vn";
};

/** List of node information objects.*/
struct NodeList
{
  /** Count of objects in the `nodes` array. */
  varuint numNodes;

  /** Array of unique node information objects. */
  NodeInformation nodes[numNodes];
};

/** Definition of a node information object.*/
struct NodeInformation
{
  /** Identifier of the NDS map that the network node works with.*/
  NdsSystemToken systemId;

  /** Identifier of the network node. */
  NdsNodeToken nodeToken;

  /** Legal info of the network node. */
  NdsNodeLegalInfo legalInfo;

  /** Functional role of the network node.*/
  NodeType type;

  /** Generic cost value, which may be interpreted by a client.*/
  ConnectionCosts connectionCosts;

  /** Geographic coverage of the network node. */
  SpatialExtent spatialCoverage;

  /** Node interface protocol, which a client may use for communication. */
  ProtocolType protocolType;

  /** URI to more information on the used protocol. */
  string protocolDetailsUri;

  /** Arbitrary name of the network node. */
  string nodeName;

  /** Host name or IP address of the network node. Relative file name in case of file stores. */
  string hostName;

  /** Port under which the network node runs on the host under the designated name.*/
  uint16 port;

  /** Semantic service configuration, if applicable. */
  ServiceInformation serviceInformation if type == NodeType.SERVICE;

  /** Module information for registered 2nd tier registries. */
  ModuleDefinition registryDefinition if type == NodeType.REGISTRY;
};

/*!

### Service Information

For network nodes with `NodeType.SERVICE`, the `ServiceInformation` structure
defines the provided service. In this case, the node provides a service
interface, which requires additional qualification.

The `serviceMetadata` field holds external metadata that can be parsed with the
corresponding module parser (as defined in the `ExternData` wrapper).

!*/

/** Defines the provided service. */
struct ServiceInformation
{
  /** Module definition of the service. */
  ModuleDefinition moduleDefinition;

  /** Module service identifier of the service. */
  ModuleService moduleService;

  /** Priority hint, which may be used by registry or client to control network use.*/
  ServicePriority servicePriority;

  /**
    * Metadata of the service. In case the service metadata is not filled, details need
    * to be directly retrieved from the service.
    */
  optional ExternData serviceMetadata;

  /** Certification metadata of the service. */
align(8):
  extern serviceCertificationMetadata;
};

/*!

## Node Search Filter and Service Information Filter

Node search filter and service information filter are search filters for network
nodes.

Clients fill the search filter and pass it to the registry. The registry
searches for network nodes that match the filter and return a `NodeList`.

A node search filter is always valid for one module only. Subsequent calls may
return the same network node if the node offers data layers from more than one module.
It is up to the client to implement a smart lookup and combine service nodes for an
optimal query strategy.

!*/

rule_group NodeFilterRules
{
  /*!
  Filters Matching Node Information Objects:

  `NodeSearchFilter` and `ServiceInformationFilter` shall only match a node
  information object if each of the filter fields matches the counterpart
  field in `NodeInformation`.
  !*/

  rule "registry-0coefy";
};

/** Node search filter.*/
struct NodeSearchFilter
{
  /** Token which identifies the map that should be served by the desired node. */
  NdsSystemToken           systemId;

  /** Desired node type. */
  NodeType                 nodeType;

  /** Optional service information filter for additional service-specific criteria. */
  ServiceInformationFilter serviceInfoFilter if nodeType == NodeType.SERVICE;
};

/** Service information filter.*/
struct ServiceInformationFilter
{
  /** Desired module of the service. */
  ModuleDefinition moduleDefinition;

  /** Desired service identifier. */
  ModuleService moduleService;

  /** Desired minimum service priority. Value is inclusive. */
  ServicePriority minServicePriority;

  /** Desired maximum service priority. Value is inclusive. */
  ServicePriority maxServicePriority;
};
