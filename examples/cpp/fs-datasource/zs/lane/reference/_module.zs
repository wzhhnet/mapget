/*!

# NDS.Live Lane Reference Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Lane Reference module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Lane Reference module provides identifiers and references that allow to
assign attributes from attribute modules to lane groups, lanes, and road
surfaces.

The Lane Reference module provides the following types:

- Identifiers for lanes, lane groups, and road surfaces.
- Directed lane references using lane IDs.
- Indirect references to lane groups, which can be used to assign attributes to
  lanes without using explicit identifiers.
- References to transitions across multiple lanes or lane groups.
- Validities for attributes that describe for which part of the lane within a
  lane group an attribute is valid, that is, a specific position or a range on
  the lane.

## Content of the Lane Reference Module

The Lane Reference module includes the following files:

Files                            | Description
---------------------------------| ---------------------------------------------
[types.zs](types.zs)             | Provides lane reference types.

**Dependencies**

!*/

package lane.reference._module;

import system.types.*;
import lane.reference.types.*;

const ModuleName NAME = "LANE.REFERENCE";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";
