/*!

# NDS.Live Venue Reference Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Venue Reference module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Venue Reference module provides identifiers that allow to assign attributes
from attribute modules to venue features.

Currently, parking facilities are the only supported venue type. Identifiers are
provided for parking facilities, parking levels, parking sections, parking rows,
and parking spots.

## Content of the Venue Reference Module

The Venue Reference module includes the following files:

Files                            | Description
---------------------------------| ---------------------------------------------
[types.zs](types.zs)             | Provides venue reference types.

**Dependencies**

!*/

package venue.reference._module;

import system.types.*;
import venue.reference.types.*;

/*!

**Definitions**

!*/

const ModuleName NAME = "VENUE.REFERENCE";
const ModuleVersion VERSION = "2024.03";
const ModuleVersion MIN_VERSION = "2024.03";
