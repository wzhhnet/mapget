/*!

# NDS.Live Registry Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Registry module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The distributed ecosystem of NDS.Live requires that clients, such as a
vehicle on the road, have direct access to specific service endpoints, such as
smart layer services or publish-subscribe brokers. Service endpoints are represented
by __network nodes__.

__Registry nodes__ are the gateways of NDS.Live. A registry is a network node that
receives, stores, and distributes metadata about service nodes. It provides
the information that a client sees before connecting to any specific service.

Service nodes use registry nodes to announce their operational readiness and to
register connection cost and priority values. Clients use registry nodes to
discover network nodes that are able to deliver data for their
application-specific needs. The registry information also enables clients to
consider economic aspects and to prioritize requests in environments with bandwidth
constraints.

**Notes**

1. Because registries represent network nodes, a root registry may
    point clients to other registry nodes.
2. A single registry endpoint may operate across multiple NDS maps, which are
    identified by NDS system tokens. This means that service nodes
    belonging to different NDS maps may register in the same registry node.

The following figure shows how a registry serves as a broker between network
nodes and clients.

![Registry Cloud](assets/cloud.png)

### Service Metadata

Each service that is registered needs to provide metadata, so that a client can
connect to that service using the supplied information. Next to the address of
the service node, the registry provides information about the used protocol and
about the NDS.Live module that is needed to connect and use the data.

### File Stores

Registry information can also be stored in SQLite database files for offline use
of registry nodes. For more information, see [Registry File Store](filestore.zs).

## Content of the Registry Module

The Registry module includes the following files:

Files                                         | Description
----------------------------------------------| ----------------------------------------------------------------------------
[node.zs](node.zs)                            | Provides data structures to describe and search nodes.
[services.zs](services.zs)                    | Provides data structures to define a registry service.
[filestore.zs](filestore.zs)                  | Provides a file store definition for storing registry information in SQLite files.


**Dependencies**

!*/

package registry._module;

import system.types.*;

import registry.services.*;
import registry.node.*;
import registry.filestore.*;

const ModuleName NAME = "REGISTRY";
const ModuleVersion VERSION = "2024.03";
const ModuleVersion MIN_VERSION = "2024.03";

/** Module service identifier of the registry service. */
const ModuleService REGISTRY_SERVICE = "registry.services.NdsRegistry";
