/*!

# NDS.Live System Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live System module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The System module defines generic metadata types that are used to identify and
classify the components of an NDS.Live system:

- Unique identifiers for NDS.Live systems and nodes in NDS.Live systems
- Legal metadata for registry nodes and services of an NDS.Live system
- Basic definition of the modules in an NDS.Live system, including a name and a
  version, as well as a definition for external data
- Classification of the layers that are provided by NDS.Live modules

## Content of the System Module

The System module includes the following files:

Files                            | Description
---------------------------------| -------------------------------------------------------
[types.zs](types.zs)             | Provides generic data structure for NDS.Live systems and modules.

**Dependencies**

!*/

package system._module;

import system.types.*;

const ModuleName NAME = "SYSTEM";
const ModuleVersion VERSION = "2024.03";
const ModuleVersion MIN_VERSION = "2024.03";
