/*!

# Registry Services

This package defines the registry service that is required to
access the registry node.

**Dependencies**

!*/

package registry.services;

import core.types.*;
import system.types.*;
import registry.node.*;

/*!

## NDS Registry Service

A single instance of an NDS registry service operates across one or more NDS maps,
which are identified by an `NdsSystemToken`. Network nodes that serve data belonging to
the same NDS map are associated by an identical `NdsSystemToken`.

Service nodes belonging to different NDS maps may register in the same NDS
registry. One NDS registry service may contain references to other NDS registry
instances if `NodeInformation.type` is set to `NodeType.REGISTRY`.

The `NdsNodeToken` argument of the `unregisterNode` function must be a value
that was previously provided via the `registerNode` function to register the node.

!*/

rule_group RegistryServiceRules
{
  /*!
  Entries in `getAllNodes` and `getAllNodesAllSystems`:

  A registry shall not include itself in `getAllNodes` and `getAllNodesAllSystems`.
  !*/

  rule "registry-0d2mja";

  /*!
  Registry Reference to `NodeInformation` Structure:

  A registry shall retain a reference to a specific `NodeInformation`
  structure until `unregisterNode` is called with this structure's
  exact `NdsNodeToken`.
  !*/

  rule "registry-0dv45j-I";

  /*!
  Calling `registerNode` Method with Registered `NdsNodeToken`:

  A registry shall update the information of a node if the `registerNode`
  method is called with an already registered `NdsNodeToken`.
  !*/

  rule "registry-0g5pib-I";

  /*!
  Metadata Method `getRegistryModuleDefinition` in Registry Services:

  The metadata method `getRegistryModuleDefinition` shall be implemented by all
  registry services.
  !*/

  rule "registry-pv0cu9";

  /*!
  Metadata Method `getRegistryServiceCapabilities` in Registry Services:

  The metadata method `getRegistryServiceCapabilities` shall be implemented by all
  registry services.
  !*/

  rule "registry-t5hvby";

  /*!
  Method `getAllNodesAllSystems` in Registry Services:

  The method `getAllNodesAllSystems` shall be implemented by all
  registry services.
  !*/

  rule "registry-fvt3to";
};

/**
  * NDS.Live registry service that acts as a gateway to get information about
  * available services, including other registries. A single instance
  * of `NdsRegistry` operates across one or more NDS maps.
  */
service NdsRegistry
{
  /** Module definition of the registry service itself. */
  ModuleDefinition getRegistryModuleDefinition(Empty);

  /** Metadata on implemented methods of the registry service. */
  RegistryServiceCapabilitiesResponse getRegistryServiceCapabilities(Empty);

  /** Request for all available nodes of all systems. */
  NodeList getAllNodesAllSystems(Empty);

  /** Request for all available network nodes of a complete NDS map.*/
  NodeList getAllNodes(NdsSystemToken);

  /** Request for all available network nodes of a certain filter.*/
  NodeList searchNodes(NodeSearchFilter);

  /** Registers a new network node.*/
  Empty registerNode(NodeInformation);

  /** Removes a node from the system.*/
  Empty unregisterNode(NdsNodeToken);
};

/** Wrapper around registry capabilities for direct use in service interface. */
struct RegistryServiceCapabilitiesResponse
{
  /** Defines which methods are implemented by a registry service. */
  RegistryServiceCapabilities capabilities;
};

/** Methods that can be implemented by a registry service. */
bitmask uint16 RegistryServiceCapabilities
{
  /** Set if the `getAllNodes` method is implemented. */
  GET_ALL_NODES,

  /** Set if the `searchNodes`method is implemented. */
  SEARCH_NODES,

  /** Set if the `registerNode` method is implemented. */
  REGISTER_NODE,

  /** Set if the `unregisterNode` method is implemented. */
  UNREGISTER_NODE,
};

/** Publish-subscribe topics for registry services. */
pubsub RegistryTopics
{
  /**
    * Publish whenever the registry gets updated with changed/added/removed
     * node information of the published NDS system token.
     */
  topic("nds/registry/update/system") NdsSystemToken ndsSystemToken;

  /** Publish whenever a second-tier registry has been changed/added/removed. */
  topic("nds/registry/update/tier2registry") Empty empty;
};
