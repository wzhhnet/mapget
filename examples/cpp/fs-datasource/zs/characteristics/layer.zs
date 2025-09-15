/*!

# Characteristics Attribute Layers

This package defines the characteristics attribute layers.

**Dependencies**

!*/

package characteristics.layer;

import system.types.*;
import core.geometry.*;
import characteristics.instantiations.*;
import characteristics.metadata.*;
import characteristics.types.*;

/*!

## Characteristics Attribute Layers for Roads

The characteristics attribute layers for roads contain all attributes for roads
defined in the Characteristics module. The layers use direct references to roads
or indirect references to roads.

!*/

/** Characteristics attribute layer for roads using direct references. */
struct RoadCharacteristicsLayer
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadCharacsLayerContent content;

  /** Attribute maps for road range attributes. */
  CharacsRoadRangeAttributeMapList(shift) characsRoadRangeMaps
              if isset(content, RoadCharacsLayerContent.ROAD_RANGE_MAPS);

  /** Attribute maps for road position attributes. */
  CharacsRoadPositionAttributeMapList(shift) characsRoadPositionMaps
              if isset(content, RoadCharacsLayerContent.ROAD_POSITION_MAPS);

  /** Attribute sets for road range attributes. */
  CharacsRoadRangeAttributeSetList(shift) characsRoadRangeSets
              if isset(content, RoadCharacsLayerContent.ROAD_RANGE_SETS);

  /** Attribute sets for road position attributes. */
  CharacsRoadPositionAttributeSetList(shift) characsRoadPositionSets
              if isset(content, RoadCharacsLayerContent.ROAD_POSITION_SETS);

  /** Attribute maps for transitions. */
  CharacsTransitionAttributeMapList(shift) characsTransitionMaps
              if isset(content, RoadCharacsLayerContent.TRANSITION_MAPS);

  /** Attribute sets for transitions. */
  CharacsTransitionAttributeSetList(shift) characsTransitionSets
              if isset(content, RoadCharacsLayerContent.TRANSITION_SETS);


  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/** Characteristics attribute layer for roads using indirect references. */
struct RoadCharacteristicsLayerIndirect
{
  /** Coordinate shift. */
  CoordShift shift;

  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadCharacsLayerContent content;

  /** Attribute maps for road range attributes. */
  CharacsIndirectRoadRangeAttributeMapList(shift) characsRoadRangeMaps
              if isset(content, RoadCharacsLayerContent.ROAD_RANGE_MAPS);

  /** Attribute maps for road position attributes. */
  CharacsIndirectRoadPositionAttributeMapList(shift) characsRoadPositionMaps
              if isset(content, RoadCharacsLayerContent.ROAD_POSITION_MAPS);

  /** Attribute sets for road range attributes. */
  CharacsIndirectRoadRangeAttributeSetList(shift) characsRoadRangeSets
              if isset(content, RoadCharacsLayerContent.ROAD_RANGE_SETS);

  /** Attribute sets for road position attributes. */
  CharacsIndirectRoadPositionAttributeSetList(shift) characsRoadPositionSets
              if isset(content, RoadCharacsLayerContent.ROAD_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Characteristics Attribute Layer for Road Locations

The characteristics attribute layer for road locations contains all attributes
for roads defined in the Characteristics module.
Instead of using references to NDS.Live roads, it uses road location references.


__Note:__
Using road location references, characteristics attributes can also be assigned to
NDS.Classic map features. In this case, source location IDs from the Location
extension are used instead of road location IDs.

!*/

rule_group RoadLocationCharacteristicsLayerRules
{
  /*!
  No Road Location ID in Characteristics Attribute Layer for Road Locations:

  The `ROAD_LOCATION_ID` attribute shall not be used in the
  `RoadLocationCharacteristicsLayer`.
  !*/

  rule "characteristics-8ntahs";
};

/** Characteristics attribute layer for road locations. */
struct RoadLocationCharacteristicsLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadLocationCharacsLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes assigned to road locations. */
  CharacsRoadLocationRangeAttributeMapList(shift) characsRoadLocationRangeMaps
              if isset(content, RoadLocationCharacsLayerContent.ROAD_LOCATION_MAPS);

  /** Attribute sets for road range attributes assigned to road locations. */
  CharacsRoadLocationRangeAttributeSetList(shift) characsRoadLocationRangeSets
              if isset(content, RoadLocationCharacsLayerContent.ROAD_LOCATION_SETS);

  /** Attribute maps for road position attributes assigned to road locations. */
  CharacsRoadLocationPositionAttributeMapList(shift) characsRoadLocationPositionMaps
              if isset(content, RoadLocationCharacsLayerContent.ROAD_LOCATION_POSITION_MAPS);

  /** Attribute sets for road position attributes assigned to road locations. */
  CharacsRoadLocationPositionAttributeSetList(shift) characsRoadLocationPositionSets
              if isset(content, RoadLocationCharacsLayerContent.ROAD_LOCATION_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Characteristics Attribute Layer for Lanes

The characteristics attribute layer for lanes contains all attributes for lanes
defined in the Characteristics module.

!*/

/** Characteristics attribute layer for lanes. */
struct LaneCharacteristicsLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneCharacsLayerContent content;

  /** Attribute maps for lane range attributes. */
  CharacsLaneRangeAttributeMapList(0) characsLaneRangeMaps
          if isset(content, LaneCharacsLayerContent.LANE_RANGE_MAPS);

  /** Attribute maps for lane position attributes. */
  CharacsLanePositionAttributeMapList(0) characsLanePositionMaps
          if isset(content, LaneCharacsLayerContent.LANE_POSITION_MAPS);

  /** Attribute sets for lane range attributes. */
  CharacsLaneRangeAttributeSetList(0) characsLaneRangeSets
          if isset(content, LaneCharacsLayerContent.LANE_RANGE_SETS);

  /** Attribute sets for lane position attributes. */
  CharacsLanePositionAttributeSetList(0) characsLanePositionSets
          if isset(content, LaneCharacsLayerContent.LANE_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Characteristics Attribute Layer for Display Lines

The characteristics attribute layer for display lines contains all attributes for display lines
defined in the Characteristics module.

!*/

/** Characteristics attribute layer for display lines. */
struct DisplayLineCharacteristicsLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  DisplayLineCharacsLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for display line range attributes. */
  CharacsDisplayLineRangeAttributeMapList(shift) characsDisplayLineRangeMaps
          if isset(content, DisplayLineCharacsLayerContent.DISPLAY_LINE_RANGE_MAPS);

  /** Attribute maps for display line position attributes. */
  CharacsDisplayLinePositionAttributeMapList(shift) characsDisplayLinePositionMaps
          if isset(content, DisplayLineCharacsLayerContent.DISPLAY_LINE_POSITION_MAPS);

  /** Attribute sets for display line range attributes. */
  CharacsDisplayLineRangeAttributeSetList(shift) characsDisplayLineRangeSets
          if isset(content, DisplayLineCharacsLayerContent.DISPLAY_LINE_RANGE_SETS);

  /** Attribute sets for display line position attributes. */
  CharacsDisplayLinePositionAttributeSetList(0) characsDisplayLinePositionSets
          if isset(content, DisplayLineCharacsLayerContent.DISPLAY_LINE_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Toll Cost Layer

The toll cost layer can be used to provide the toll cost for traveling from one
toll station to the next.

!*/

/** Toll cost layer. */
struct TollCostLayer
{
  /** Number of toll cost tables in the layer. */
  varsize numTables;

  /** Toll cost table. */
  TollCostTable tollCostTables[numTables];

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};