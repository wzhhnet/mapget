/*!

# NDS.Live POI Reference Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live POI Reference module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The POI Reference module provides identifiers and references for POIs that allow
to assign attributes from attribute modules to POI features.

The POI Reference module provides the following types:

- Identifiers for POIs and POI categories.
- Direct and indirect references for POIs.
- An enumeration of standard POI categories.

## Content of the POI Reference Module

The POI Reference module includes the following files:

Files                            | Description
---------------------------------| ---------------------------------------------
[types.zs](types.md)             | Provides POI reference types.

**Dependencies**

!*/

package poi.reference._module;

import system.types.*;
import poi.reference.types.*;

const ModuleName NAME = "POI.REFERENCE";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";
