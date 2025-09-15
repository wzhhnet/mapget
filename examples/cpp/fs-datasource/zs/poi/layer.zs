/*!

# POI Layers

This package defines the data layers of the POI module.

**Dependencies**

!*/

package poi.layer;

import system.types.*;
import poi.instantiations.*;
import poi.metadata.*;
import poi.poi.*;
import poi.types.*;


rule_group PoiLayerRules
{
  /*!
  Multiple Instances of POI Layer:

  A smart layer can have multiple instances of the `PoiLayer`, provided that
  there are no collisions between the POI IDs. This means that the `poiId`
  values are unique across all instances of the `PoiLayer` within a smart layer
  tile or smart layer object.
  !*/

  rule "poi-wwr44z";
};

/**
  * The POI layer stores all POI information within a container, for example,
  * a tile, an object, or a path.
  */
struct PoiLayer
{
  /** List of POIs. */
  packed Poi poiList[];

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};


/**
  * The POI attribute layer stores additional information on the POI, for example,
  * the star rating or opening hours. This information can be used to filter
  * POIs by attributes or to enhance the display.
 */
struct PoiAttributeLayer
{
  /** Defines whether the layer contains attribute maps and/or attribute sets. */
  PoiAttributeLayerContent content;

  /** POI attribute maps. */
  PoiAttributeMapList(0) poiAttributeMaps
    if isset(content, PoiAttributeLayerContent.POI_ATTRIBUTE_MAPS);

  /** POI attribute sets. */
  PoiAttributeSetList(0) poiAttributeSets
    if isset(content, PoiAttributeLayerContent.POI_ATTRIBUTE_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/**
  * POI attribute layer using indirect references. Stores the same attributes
  * as the POI attribute layer, but uses indirect POI references.
 */
struct PoiAttributeLayerIndirect
{
  /** Defines whether the layer contains attribute maps and/or attribute sets. */
  PoiAttributeLayerContent content;

  /** POI attribute maps. */
  PoiIndirectAttributeMapList(0) poiAttributeMaps
    if isset(content, PoiAttributeLayerContent.POI_ATTRIBUTE_MAPS);

  /** POI attribute sets. */
  PoiIndirectAttributeSetList(0) poiAttributeSets
    if isset(content, PoiAttributeLayerContent.POI_ATTRIBUTE_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};


/** POI relation layer. Relates access point POIs to roads, lanes, or display features. */
struct PoiRelationLayer
{
  /** Content of the POI relation layer. */
  PoiRelationLayerContent content;

  /** Relations to positions on lane groups and lanes using direct references. */
  PoiLanePositionRelationMapList(0) poiLanePositionRelationMapList
      if isset(content, PoiRelationLayerContent.LANE_POSITION_MAPS);

  /** Relations to positions on lane groups and lanes using indirect references. */
  PoiLaneIndirectPositionRelationMapList(0) poiLaneIndirectPositionRelationMapList
      if isset(content, PoiRelationLayerContent.LANE_INDIRECT_POSITION_MAPS);

  /** Relations to positions on roads using direct references. */
  PoiRoadPositionRelationMapList(0) poiRoadPositionRelationMapList
      if isset(content, PoiRelationLayerContent.ROAD_POSITION_MAPS);

  /** Relations to positions on roads using indirect references. */
  PoiRoadIndirectPositionRelationMapList(0) poiRoadIndirectPositionRelationMapList
      if isset(content, PoiRelationLayerContent.ROAD_INDIRECT_POSITION_MAPS);

  /** Relations to display areas. */
  PoiDisplayAreaRelationMapList(0) poiDisplayAreaRelationMapList
      if isset(content, PoiRelationLayerContent.DISPLAY_AREA_MAPS);

  /** Relations to positions on roads using road location IDs. */
  PoiRoadLocationPositionRelationMapList(0) poiRoadLocationPositionRelationMapList
      if isset(content, PoiRelationLayerContent.ROAD_LOCATION_POSITION_MAPS);

  /** Relations to polygon meshes for 3D display. */
  PoiDisplayMesh3DRelationMapList(0) poiDisplayMesh3DRelationMapList
      if isset(content, PoiRelationLayerContent.DISPLAY_MESH_MAPS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};
