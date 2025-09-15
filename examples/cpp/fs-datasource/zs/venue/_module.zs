/*!

# NDS.Live Venue Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Venue module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

A venue is a map feature that is attached to the road network and provides
further information about locations that are relevant for the driver.

The Venue module provides features to model types of venues. Currently, parking
facilities are the only supported venue type.

Attributes that describe venues in more detail are described in the separate
Venue Details module.

Attributes from attribute modules can be assigned to venue features via the
dedicated Venue Reference module.

### Parking Facilities

A parking facility is the top node in a hierarchy of parking facility elements.
The next levels of the hierarchy are:

- Parking level
- Parking section
- Parking row
- Parking spot

For a detailed overview of the available parking facility elements, see
[Parking Facilities](parking.zs). The hierarchy information of one or more parking
facilities is provided using the parking facility layer.

To find and access a parking spot, an application needs information about the
connection between the parking facility and the lane topology or road surfaces.
For example, a lane group can be related to a parking section or a road surface
can be related to a parking spot. The necessary relations are provided using the
parking facility relation layer. Parking facility elements can be related to
ranges or positions on lane groups and lanes, to road surfaces, or to POIs. For
more information, see [Venue Layers > Parking Facility Relation
Layer](layer.zs#parking-facility-relation-layer).

The complete information related to a parking facility is spread across multiple
data layers that are defined in different modules. Depending on the availability
of data, different combinations of layers can be used.

For example, information about a parking facility is provided using the
following layers or a subset of these layers:

|Type of layer                    | Content of layer                                                                  | Defined in module |
|---------------------------------|-----------------------------------------------------------------------------------|-------------------|
|`ParkingFacilityLayer`           | Logical structure of the parking facility.                                        | Venue             |
|`ParkingFacilityRelationLayer`   | Relations from parking facility elements to lane groups, road surfaces, and POIs. | Venue             |
|`ParkingFacilityAttributeLayer`  | Attributes for parking facility elements.                                         | Venue Details     |
|`LaneLayer`                      | Lane topology inside the parking facility.                                        | Lane              |
|`LaneGeometryLayer`              | Geometries of all lanes inside the parking facility.                              | Lane              |
|`RoadSurfaceLayer`               | Road surface geometries of the parking facility.                                  | Lane              |
|`LandmarkLayer`                  | Localization landmarks that are used in the parking facility.                     | Localization      |
|`LaneLandmarkLayer`              | Relations from lane groups to landmarks for improved loading of landmarks.        | Localization      |
|`RoadSurfaceLandmarkLayer`       | Relations from road surfaces to landmarks for improved loading of landmarks.      | Localization      |
|`PoiLayer`                       | POIs that are located in the parking facility, for example, EV charging stations. | POI               |
|`PoiAttributeLayer`              | POI attributes that describe the POIs in more detail.                             | POI               |
|`LaneCharacteristicsLayer`       | Additional lane characteristics.                                                  | Characteristics   |
|`LaneRulesLayer`                 | Additional driving rules for the lanes in the parking facility.                   | Rules             |
|`Display2DLayer`                 | 2D map display of the parking facility. (Note: Not yet applicable)                | Display           |

## Content of the Venue Module

The Venue module includes the following files:

Files                                       | Description
--------------------------------------------| ----------------------------------------------------------------------------
[instantiations.zs](instantiations.zs)      | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                        | Provides venue layers.
[metadata.zs](metadata.zs)                  | Provides metadata for the venue layer.
[parking.zs](parking.zs)                    | Provides structures for parking facility features.
[types.zs](types.zs)                        | Provides venue types.

**Dependencies**

!*/


package venue._module;

import system.types.*;
import venue.instantiations.*;
import venue.layer.*;
import venue.metadata.*;
import venue.parking.*;
import venue.types.*;

/*!

**Definitions**

!*/

const ModuleName NAME = "VENUE";
const ModuleVersion VERSION = "2024.05";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the parking facility layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern PARKING_FACILITY_LAYER = "venue.layer.ParkingFacilityLayer";

/**
  * Extern identifier of the metadata of the parking facility layer. The layer
  * metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern PARKING_FACILITY_LAYER_METADATA = "venue.metadata.ParkingFacilityLayerMetadata";

/**
  * Extern identifier of the parking facility relation layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern PARKING_FACILITY_RELATION_LAYER = "venue.layer.ParkingFacilityRelationLayer";

/**
  * Extern identifier of the metadata of the parking facility relation layer.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern PARKING_FACILITY_RELATION_LAYER_METADATA = "venue.metadata.ParkingFacilityRelationLayerMetadata";
