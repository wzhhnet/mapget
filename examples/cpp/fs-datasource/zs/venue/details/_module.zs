/*!

# NDS.Live Venue Details Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Venue Details module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Venue Details module provides attributes that describe venues in detail.
Currently, parking facilities are the only supported venue type, therefore the
attributes describe parking facilities, parking sections, parking rows, or
parking spots in more detail. Examples:

- Type of parking section, for example, customer parking, hotels, or private
  parking
- Parking restrictions, for example, reserved parking for persons with impaired
  mobility or reserved for electric vehicles
- Size of a parking facility, given in number of parking spots

The attributes in the Venue Details module can be assigned to parking
facilities, parking levels, parking sections, parking rows, or parking spots
using the corresponding layer.

## Content of the Venue Details Module

The Venue Details module includes the following files:

Files                                       | Description
--------------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)              | Provides attributes for venues.
[instantiations.zs](instantiations.zs)      | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                        | Provides the venue attribute layers.
[metadata.zs](metadata.zs)                  | Provides metadata for the venue attribute layers.
[properties.zs](properties.zs)              | Provides attribute properties for venue attributes.
[types.zs](types.zs)                        | Provides types for venue attributes.

**Dependencies**

!*/


package venue.details._module;

import system.types.*;
import venue.details.attributes.*;
import venue.details.instantiations.*;
import venue.details.layer.*;
import venue.details.metadata.*;
import venue.details.properties.*;
import venue.details.types.*;

/*!

**Definitions**

!*/

const ModuleName NAME = "VENUE.DETAILS";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the parking facility attribute layer, which can be used
  * by `smart.types.DataLayer.layer`.
  */
const ModuleExtern PARKING_FACILITY_ATTRIBUTE_LAYER = "venue.details.layer.ParkingFacilityAttributeLayer";

/**
  * Extern identifier of the metadata of the parking facility attribute layer.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern PARKING_FACILITY_ATTRIBUTE_LAYER_METADATA = "venue.details.metadata.ParkingFacilityAttributeLayerMetadata";
