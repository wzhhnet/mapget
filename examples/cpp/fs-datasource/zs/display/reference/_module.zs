/*!

# NDS.Live Display Reference Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Display Reference module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Display Reference module provides identifiers and references that allow to
assign attributes from attribute modules to display features, for example, to a
complete display area or to a range on a display line.

The Display Reference module provides the following types:

- Identifiers for display lines, display points, display areas, and 3D polygon
  meshes.
- Directed or undirected reference to a display line.
- Reference to a complete texture or a section of a texture.
- Display line validity that describes for which part of the line an attribute
  is valid, that is, a specific position or a range on the line.
- Display area validity that describes for which part of the area an attribute
  is valid, that is, the complete area or a specific position in the area.
- Label positioning hints to dynamically position labels on the display. These
  hints provide information on when, how, and where to place the label.

## Content of the Display Reference Module

The Display Reference module includes the following files:

Files                            | Description
---------------------------------| ---------------------------------------------
[types.zs](types.zs)             | Provides reference types for display features.

**Dependencies**

!*/

package display.reference._module;

import system.types.*;
import display.reference.types.*;

/*!

**Definitions**

!*/

const ModuleName NAME = "DISPLAY.REFERENCE";
const ModuleVersion VERSION = "2024.05";
const ModuleVersion MIN_VERSION = "2024.03";
