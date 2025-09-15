/*!

# NDS.Live POI Module

This document is part of the Navigation Data Standard (NDS) and specifies the
NDS.Live POI module.

- [Copyright](../../../copyright.md)
- [Terms and Definitions](../../../terms-definitions.md)

## Introduction

A point of interest (POI) is a basic map feature that is used for map display
and search.

POIs are characterized by the following:

- POIs belong to one or more POI categories. The following applies:
    - There are predefined categories and non-standard categories.
    - POI categories can be organized hierarchically using parent-child
      relations.
    - A POI category can have multiple names, which can be associated with
      different languages and/or apply in different contexts.
- POIs can have a reference to a POI icon set and/or a brand icon set so that an
  icon from that set can be displayed at the position of the POI.
- POIs can have parent-child relations to other POIs, for example:
    - An entrance gate POI has an access relation to a business center POI.
    - A motorway exit has a logical access point relation to a filling station.
    - An airport terminal POI has a part-of relation to the airport POI.

In addition, attributes can be assigned to POIs that describe POIs in more
detail. For example, they provide details about the services that are provided
or contact details of a POI. POI attributes can be used to filter POI search
results.

The POI module also defines metadata for a POI search service that can be
implemented using the Search module.

POIs are provided using the POI layer. The POI attribute layers allow to assign
POI attributes directly to POIs using the corresponding POI ID or indirectly
using the position of the POI. The POI relation layer allows to relate access
point POIs to roads, lane groups, or display features. POI names are provided
using the `PoiNameLayer` of the Name module.

## Content of the POI Module

The POI module includes the following files:

Files                                       | Description
--------------------------------------------| ----------------------------------------------------------------------------
[attributes.zs](attributes.zs)              | Provides structures for POI attributes.
[instantiations.zs](instantiations.zs)      | Provides instantiations of templates used in this module.
[layer.zs](layer.zs)                        | Provides layers for POIs, POI attributes, and POI relations.
[metadata.zs](metadata.zs)                  | Provides metadata for the POI layers.
[poi.zs](poi.zs)                            | Provides structures for POIs and POI relations.
[properties.zs](properties.zs)              | Provides the attribute properties for POI attributes.
[types.zs](types.zs)                        | Provides POI types.

**Dependencies**

!*/


package poi._module;

import system.types.*;
import poi.attributes.*;
import poi.instantiations.*;
import poi.layer.*;
import poi.metadata.*;
import poi.poi.*;
import poi.properties.*;
import poi.types.*;

const ModuleName NAME = "POI";
const ModuleVersion VERSION = "2024.07";
const ModuleVersion MIN_VERSION = "2024.07";


/**
  * Extern identifier of the POI layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern POI_LAYER = "poi.layer.PoiLayer";

/**
  * Extern identifier of the POI attribute layer, which can be used by
  * `smart.types.DataLayer.layer`.
  */
const ModuleExtern POI_ATTRIBUTE_LAYER = "poi.layer.PoiAttributeLayer";

/**
  * Extern identifier of the POI attribute layer with indirect references,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern POI_ATTRIBUTE_LAYER_INDIRECT = "poi.layer.PoiAttributeLayerIndirect";

/**
  * Extern identifier of the POI relation layer,
  * which can be used by `smart.types.DataLayer.layer`.
  */
const ModuleExtern POI_RELATION_LAYER = "poi.layer.PoiRelationLayer";

/**
  * Extern identifier of the metadata of the POI layer. The layer metadata
  * can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern POI_LAYER_METADATA = "poi.metadata.PoiLayerMetadata";

/**
  * Extern identifier of the metadata of the POI attribute layer. The layer metadata
  * can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern POI_ATTRIBUTE_LAYER_METADATA = "poi.metadata.PoiAttributeLayerMetadata";

/**
  * Extern identifier of the metadata of the POI attribute layer which uses indirect references.
  * The layer metadata can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern POI_ATTRIBUTE_LAYER_INDIRECT_METADATA = "poi.metadata.PoiAttributeLayerIndirectMetadata";

/**
  * Extern identifier of the metadata of the POI relation layer. The layer metadata
  * can be used by `smart.types.DataLayerDefinition.layerMetadata`.
  */
const ModuleExtern POI_RELATION_LAYER_METADATA = "poi.metadata.PoiRelationLayerMetadata";

/**
  * Extern identifier of the POI search metadata. The metadata can be used by
  * `search.services.SupportedSearchConfiguration.poiSearchMetadata`.
  */
const ModuleExtern POI_SEARCH_METADATA = "poi.metadata.PoiSearchMetadata";

/**
  * Extern identifier of details of a POI search result. The result details
  * can be used by `search.types.SearchResult.detailedResultInformation`.
  */
const ModuleExtern POI_SEARCH_RESULT_DETAILS = "poi.poi.PoiSearchResultDetails";

/**
  * Extern identifier of details of the POI search filter. The filter
  * can be used by `search.services.GeneralSearchRequest.poiFilter`.
  */
const ModuleExtern POI_SEARCH_FILTER = "poi.poi.PoiSearchFilter";
