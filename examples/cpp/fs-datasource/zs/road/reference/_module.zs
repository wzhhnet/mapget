/*!

# NDS.Live Road Reference Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Road Reference module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Road Reference module provides identifiers and references that allow to
assign attributes from attribute modules to roads, intersections, and
transitions.

The Road Reference module provides the following types:

- Directed or undirected road references using a road ID.
- Indirect road references using a road location geometry, which describes a
  path along one or more real-world roads.
- Directed references to roads that are connected to intersections.
- Transition references that describe selected or all transitions of an
  intersection or a transition path across multiple roads.
- Validities for attributes that describe for which part of the road an
  attribute is valid, that is, for the complete road, a specific position on the
  road, or a range on the road.
- Road location references that use road location IDs as an alternative to using
  direct road references.

## Content of the Road Reference Module

The Road Reference module includes the following files:

Files                            | Description
---------------------------------| ---------------------------------------------
[location.zs](location.zs)       | Provides references to location features from NDS.Classic.
[types.zs](types.zs)             | Provides road reference types.

**Dependencies**

!*/

package road.reference._module;

import system.types.*;
import road.reference.types.*;
import road.reference.location.*;

const ModuleName NAME = "ROAD.REFERENCE";
const ModuleVersion VERSION = "2024.05";
const ModuleVersion MIN_VERSION = "2024.03";
