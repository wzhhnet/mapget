/*!

# NDS.Live Signs Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Signs module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Signs module provides types for warning signs and other signs.

## Content of the Signs Module

The Signs module includes the following files:

Files                            | Description
---------------------------------| ----------------------------------------------------------------------------
[warning.zs](warning.zs)         | Provides warning sign types.

**Dependencies**

!*/

package signs._module;

import system.types.*;
import signs.warning.*;

const ModuleName NAME = "SIGNS";
const ModuleVersion VERSION = "2024.03";
const ModuleVersion MIN_VERSION = "2024.03";
