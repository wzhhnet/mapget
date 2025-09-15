/*!

# Daimler NDS.Live Extension Module: RCMS

## Introduction

The RCMS module contains attributes of the Rollout and Configuration Management Service (RCMS).

## Content of the RCMS Module

The RCMS module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides attributes of the RCMS layer.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the layer definitions for RCMS.
[metadata.zs](metadata.zs)             | Provides metadata for RCMS.
[properties.zs](properties.zs)         | Provides attribute property definitions.
[types.zs](types.zs)                   | Provides types for RCMS attributes.

**Dependencies**

!*/

package ext.rcms._module;

import system.types.*;

import ext.rcms.layer.*;
import ext.rcms.types.*;
import ext.rcms.attributes.*;
import ext.rcms.properties.*;
import ext.rcms.metadata.*;
import ext.rcms.instantiations.*;

const ModuleName NAME = "EXT_RCMS";
const ModuleVersion VERSION = "2022.01";

const ModuleExtern ROAD_RCMS_LAYER = "ext.rcms.layer.RoadRcmsLayer";
const ModuleExtern ROAD_RCMS_LAYER_METADATA = "ext.rcms.metadata.RoadRcmsLayerMetadata";
