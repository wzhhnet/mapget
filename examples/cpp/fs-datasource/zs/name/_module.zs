/*!

# NDS.Live Name Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live Name module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

The Name module provides attributes and attribute properties to model names.
Name attributes can be used for map display and reverse geo coding.

Names can be provided for roads, lanes, POIs, or display features, as well as
structures such as bridges or tunnels, toll stations, or service areas. For
display features, names can also be provided for objects such as water areas,
mountains, public transport lines, or borders. Additionally, the Name module
provides data structures for house numbers and administrative hierarchy
information.

Name attributes can be combined with attribute properties to provide additional
information, for example, whether the name is used as the official name or
whether an alternate name exists. An application can use these attribute
properties to select the correct name depending on the use case.

Name attributes can be assigned to roads, lanes, display features, or POIs using
the corresponding layer.

## Content of the Name Module

The Name module includes the following files:

Files                                  | Description
---------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)         | Provides name attributes.
[instantiations.zs](instantiations.zs) | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                   | Provides the layer definitions for names.
[metadata.zs](metadata.zs)             | Provides metadata for names.
[properties.zs](properties.zs)         | Provides attribute properties for name attributes.
[types.zs](types.zs)                   | Provides types for name attributes.

**Dependencies**

!*/

package name._module;

import system.types.*;

import name.layer.*;
import name.attributes.*;
import name.properties.*;
import name.instantiations.*;
import name.types.*;
import name.metadata.*;

const ModuleName NAME = "NAME";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.03";

/**
  * Extern identifier of the name attribute layer for roads, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern ROAD_NAME_LAYER = "name.layer.RoadNameLayer";

/**
  * Extern identifier of the name attribute layer for lanes, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern LANE_NAME_LAYER = "name.layer.LaneNameLayer";


/**
  * Extern identifier of the name attribute layer for POIs, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern POI_NAME_LAYER = "name.layer.PoiNameLayer";

/**
  * Extern identifier of the name attribute layer for lanes, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern DISPLAY_NAME_LAYER = "name.layer.DisplayNameLayer";

/**
  * Extern identifier of the metadata of the name attribute layer for roads. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern ROAD_NAME_LAYER_METADATA = "name.metadata.RoadNameLayerMetadata";

/**
  * Extern identifier of the metadata of the name attribute layer for lanes. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern LANE_NAME_LAYER_METADATA = "name.metadata.LaneNameLayerMetadata";


/**
  * Extern identifier of the metadata of the name attribute layer for POIs. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern POI_NAME_LAYER_METADATA = "name.metadata.PoiNameLayerMetadata";

/**
  * Extern identifier of the metadata of the name attribute layer for display. The
  * layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern DISPLAY_NAME_LAYER_METADATA = "name.metadata.DisplayNameLayerMetadata";

/**
  * Extern identifier of the address search metadata. The metadata can be used by
  * `search.services.SupportedSearchConfiguration.poiSearchMetadata`.
  */
const ModuleExtern ADDRESS_SEARCH_METADATA = "name.metadata.AddressSearchMetadata";

/**
  * Extern identifier of details of an address search result. The result details
  * can be used by `search.types.SearchResult.detailedResultInformation`
  * or `search.services.GeocodingAddress.addressDetails`.
  */
const ModuleExtern ADDRESS_SEARCH_RESULT_DETAILS = "name.metadata.AddressSearchResultDetails";

/**
  * Extern identifier of details of the address search filter. The filter
  * can be used by `search.services.GeneralSearchRequest.addressFilter`.
  */
const ModuleExtern ADDRESS_SEARCH_FILTER = "name.metadata.AddressSearchFilter";
