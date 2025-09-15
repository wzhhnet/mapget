/*!

# NDS.Live Core Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Core module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Core module provides basic data structures that are used across modules.
While the System module provides types that are used to define and classify the
nodes of an NDS.Live system itself, the Core module provides content that is
used within a module, for example, templates and generic feature types.

In detail, the Core module provides the following:

- Templates for attribute storage such as attribute maps and attribute sets. The
  attributes that are used in such structures are defined in the corresponding
  attribute module.
- Basic attribute properties that provide metadata for attributes in any module.
  For example, this can be quality metadata such as source and confidence of an
  attribute or whether metric or imperial units are used.
- Conditions that can be combined with attribute to constrain their validity
  based on time ranges, environmental conditions, or type of vehicle.
- Generic data structures to describe geometries or grids, including templates
  for the corresponding data layers.
- Definitions related to road locations, that is, logical entities that describe
  a path along one or more real-world roads.
- Definitions related to packaging that provide information about compression,
  signatures, and compression of NDS.Live data.
- Generic definitions for objects such as icons or vehicles.
- Generic definitions for characteristics such as colors or languages.
- Basic data types and other generic data structures that are used by multiple
  modules, for example, time or measurement units, currencies, or basic road
  types.

## Content of the Core Module

The Core module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributemap.zs](attributemap.zs)     | Provides templates for attribute storage.
[conditions.zs](conditions.zs)         | Provides structures for conditions.
[color.zs](color.zs)                   | Provides structures for color definitions.
[geometry.zs](geometry.zs)             | Provides structures for geometries.
[grid.zs](grid.zs)                     | Provides structures for grids.
[icons.zs](icons.zs)                   | Provides structures for icons.
[language.zs](language.zs)             | Provides structures for languages.
[location.zs](location.zs)             | Provides structures for road locations.
[packaging.zs](packaging.zs)           | Provides structures for packaging.
[properties.zs](properties.zs)         | Provides structures for attribute properties.
[speech.zs](speech.zs)                 | Provides structures for speech.
[types.zs](types.zs)                   | Provides basic data structures and definitions.
[vehicle.zs](vehicle.zs)               | Provides structures for vehicles.


**Dependencies**

!*/

package core._module;

import system.types.*;

import core.attributemap.*;
import core.types.*;
import core.conditions.*;
import core.vehicle.*;
import core.speech.*;
import core.location.*;
import core.packaging.*;
import core.properties.*;
import core.geometry.*;
import core.icons.*;
import core.language.*;
import core.grid.*;
import core.color.*;

const ModuleName NAME = "CORE";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";
