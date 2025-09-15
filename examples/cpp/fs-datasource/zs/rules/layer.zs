/*!

# Rules Attribute Layers

This package defines the content of the attribute layers in the Rules module, that
is, the road rules layer, the lane rules layer, and the region rules layer. The
rules data is supplied through the smart layer interface.

**Dependencies**

!*/

package rules.layer;

import system.types.*;
import lane.reference.types.*;
import road.reference.types.*;
import display.reference.types.*;
import core.geometry.*;
import core.types.*;
import rules.instantiations.*;
import rules.attributes.*;
import rules.properties.*;
import rules.metadata.*;

/*!

## Region Rules Attribute Layer

The region rules attribute layer contains driving rules for regions.
These rules are valid for all features that are stored within the same data
container, for example, a smart layer tile if only one region layer exists.
If more than one region is stored in the region layer, the layer also contains
a mapping that assigns a region ID to map features like roads, lane groups,
or display lines.

!*/

rule_group RegionRulesLayerRules
{
  /*!
  Feature Relations of Region Rules:

  If the region rules attribute layer refers to more than one region, then
  `hasFeatureRelations` shall be set to `true` and feature relations shall be
  defined for each region.

  A feature shall only be related to one region. Exception: If a directed
  feature reference in positive direction is used for a feature in one region, a
  directed feature reference in negative direction may be used in another
  region, and vice versa.
  !*/

  rule "rules-7z8ek8";
};

/** Attribute layer containing region-wide driving rules. */
struct RegionRulesLayer<REL_LIST>
{
  /** Number of regions stored in the layer. */
  varuint16 numRegions : numRegions > 0;

  /** Identifiers of regions used in the layer. */
  RegionId regionId[numRegions];

  /** Content bitmask indicating which attribute maps or sets are available. */
  RegionRulesLayerContent content;

  /** Attribute maps for region rules. */
  RulesRegionAttributeMapList(0) regionRulesAttributeMaps
    if isset(content, RegionRulesLayerContent.REGION_MAPS);

  /** Attribute sets for region rules. */
  RulesRegionAttributeSetList(0) regionRulesAttributeSets
    if isset(content, RegionRulesLayerContent.REGION_SETS);

  /** Set to `true` if region rules are related to features. */
  bool  hasFeatureRelations if numRegions > 1;

  /** Lane group relations valid for each region stored in the layer. */
  REL_LIST featureRelations[numRegions]
    if numRegions > 1 && hasFeatureRelations;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/** Region layer that contains a mapping of roads to a region. */
instantiate RegionRulesLayer<RegionRoadRelationList> RegionRulesLayerRoads;

/** Region layer that contains a mapping of lane groups to a region. */
instantiate RegionRulesLayer<RegionLaneGroupRelationList> RegionRulesLayerLanes;

/** Region layer that contains a mapping of display lines to a region. */
instantiate RegionRulesLayer<RegionDisplayLineRelationList> RegionRulesLayerDisplayLines;

/** Relates lane groups to a region.
  * A relation always consists of a lane group reference and a validity on that
  * lane group. If a lane group runs along the border of a region, a
  * directed lane group reference can be used to indicate on which side of the
  * lane group the region is located.
  * `numRelations` acts as the common index for the two lists that
  * store the lane group IDs and validities.
  */
struct RegionLaneGroupRelationList
{
  /** Number of lane groups that the region is related to. */
  varsize numRelations;

  /** Identifiers of the related lane groups. */
  LaneGroupId laneGroupIds[numRelations];

  /** Validities on the related lane groups.
    * If a lane validity direction is given for a lane and is stored in
    * positive direction, the region is on the right side of that lane.
    */
  LaneGroupRangeValidity(0) laneGroupRangeValidity[numRelations];
};

/**
  * Relates roads to a region.
  * A relation always consists of a road reference and a validity on that
  * road.
  * If a road runs along the border of a region, a directed road reference
  * can be used to indicate on which side of the road the region is located.
  * `numRelations` acts as the common index for the two lists that
  * store the road IDs and validities.
  */
struct RegionRoadRelationList
{
  /** Coordinate shift used for validities on roads. */
  CoordShift shift;

  /** Number of roads that the region is related to. */
  varsize numRelations;

  /** Identifiers of the related roads. If a directed road reference is used for
    * a road and the reference is in positive direction, the region is on the
    * right side of that road.
    */
  RoadReference roadIds[numRelations];

  /** Validities on the related roads. */
  RoadRangeValidity(shift) roadRangeValidity[numRelations];
};

/**
  * Relates display lines to a region.
  * A relation always consists of a display line reference and a validity on that
  * display line.
  * If a display line runs along the border of a region, a directed display line
  * reference can be used to indicate on which side of the display line the region
  * is located.
  * `numRelations` acts as the common index for the two lists that
  * store the display line IDs and validities.
  */
struct RegionDisplayLineRelationList
{
  /** Coordinate shift used for validities on display lines. */
  CoordShift shift;

  /** Number of display lines that the region is related to. */
  varsize numRelations;

  /** Identifiers of the related display lines. If a directed display line reference
    * is used for a display line and the reference is in positive direction, the
    * region is on the right side of that display line.
    */
  DisplayLineReference displayLineIds[numRelations];

  /** Validities on the related display lines. */
  DisplayLineRangeValidity(shift) displayLineRangeValidity[numRelations];
};

/*!

## Rules Attribute Layers for Roads

The rules attribute layers for roads contain driving rules for roads.
The rules attribute layers use direct road references or indirect road references.

!*/

/** Rules attribute layer for roads using direct references.*/
struct RoadRulesLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadRulesLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  RulesRoadRangeAttributeMapList(shift) roadRangeAttributeMaps
        if isset(content, RoadRulesLayerContent.ROAD_RANGE_MAPS);

  /** Attribute maps for road position attributes. */
  RulesRoadPositionAttributeMapList(shift) roadPositionAttributeMaps
        if isset(content, RoadRulesLayerContent.ROAD_POSITION_MAPS);

  /** Attribute maps for transition attributes. */
  RulesTransitionAttributeMapList(shift) transitionAttributeMaps
        if isset(content, RoadRulesLayerContent.TRANSITION_MAPS);

  /** Attribute sets for road range attributes. */
  RulesRoadRangeAttributeSetList(shift) roadRangeAttributeSets
        if isset(content, RoadRulesLayerContent.ROAD_RANGE_SETS);

  /** Attribute sets for road position attributes. */
  RulesRoadPositionAttributeSetList(shift) roadPositionAttributeSets
        if isset(content, RoadRulesLayerContent.ROAD_POSITION_SETS);

  /** Attribute sets for transition attributes. */
  RulesTransitionAttributeSetList(shift) transitionAttributeSets
        if isset(content, RoadRulesLayerContent.TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};


/** Rules attribute layer for roads using indirect references.*/
struct RoadRulesLayerIndirect
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadRulesLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  RulesIndirectRoadRangeAttributeMapList(shift) roadRangeAttributeMaps
        if isset(content, RoadRulesLayerContent.ROAD_RANGE_MAPS);

  /** Attribute maps for road position attributes. */
  RulesIndirectRoadPositionAttributeMapList(shift) roadPositionAttributeMaps
        if isset(content, RoadRulesLayerContent.ROAD_POSITION_MAPS);

  /** Attribute sets for road range attributes. */
  RulesIndirectRoadRangeAttributeSetList(shift) roadRangeAttributeSets
        if isset(content, RoadRulesLayerContent.ROAD_RANGE_SETS);

  /** Attribute sets for road position attributes. */
  RulesIndirectRoadPositionAttributeSetList(shift) roadPositionAttributeSets
        if isset(content, RoadRulesLayerContent.ROAD_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Rules Attribute Layer for Road Locations

The rules attribute layer for road locations contains driving rules for roads.
Instead of using references to NDS.Live roads, it uses road location references.

__Note:__
Using road locations, driving rules can also be assigned to NDS.Classic map
features. In this case, source location IDs from the Location
extension are used instead of road location IDs.

!*/

/** Rules attribute layer for road locations.*/
struct RoadLocationRulesLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadLocationRulesLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes assigned to road locations. */
  RulesRoadLocationRangeAttributeMapList(shift) roadLocationRangeAttributeMaps
        if isset(content, RoadLocationRulesLayerContent.ROAD_LOCATION_MAPS);

  /** Attribute maps for transition attributes assigned to road locations. */
  RulesRoadLocationTransitionAttributeMapList(shift) roadLocationTransitionAttributeMaps
        if isset(content, RoadLocationRulesLayerContent.ROAD_LOCATION_TRANSITION_MAPS);

  /** Attribute sets for road range attributes assigned to road locations. */
  RulesRoadLocationRangeAttributeSetList(shift) roadLocationRangeAttributeSets
        if isset(content, RoadLocationRulesLayerContent.ROAD_LOCATION_SETS);

  /** Attribute sets for transition attributes assigned to road locations. */
  RulesRoadLocationTransitionAttributeSetList(shift) roadLocationTransitionAttributeSets
        if isset(content, RoadLocationRulesLayerContent.ROAD_LOCATION_TRANSITION_SETS);

  /** Attribute maps for road position attributes assigned to road locations. */
  RulesRoadLocationPositionAttributeMapList(shift) roadLocationPositionAttributeMaps
        if isset(content, RoadLocationRulesLayerContent.ROAD_LOCATION_POSITION_MAPS);

  /** Attribute sets for road position attributes assigned to road locations. */
  RulesRoadLocationPositionAttributeSetList(shift) roadLocationPositionAttributeSets
        if isset(content, RoadLocationRulesLayerContent.ROAD_LOCATION_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Rules Attribute Layers for Lanes

The rules attribute layers for lanes contain driving rules for lanes. The
rules attribute layers for lanes use direct road references or indirect road
references.

!*/

/** Rules attribute layer for lanes using direct references. */
struct LaneRulesLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneRulesLayerContent content;

  /** Attribute maps for lane range attributes. */
  RulesLaneRangeAttributeMapList(0) laneRangeAttributeMaps
        if isset(content, LaneRulesLayerContent.LANE_RANGE_MAPS);

  /** Attribute maps for lane position attributes. */
  RulesLanePositionAttributeMapList(0) lanePositionAttributeMaps
        if isset(content, LaneRulesLayerContent.LANE_POSITION_MAPS);

  /** Attribute maps for lane transition attributes. */
  RulesLaneTransitionAttributeMapList(0) laneTransitionAttributeMaps
        if isset(content, LaneRulesLayerContent.LANE_TRANSITION_MAPS);

  /** Attribute sets for lane range attributes. */
  RulesLaneRangeAttributeSetList(0) laneRangeAttributeSets
        if isset(content, LaneRulesLayerContent.LANE_RANGE_SETS);

  /** Attribute sets for lane position attributes. */
  RulesLanePositionAttributeSetList(0) lanePositionAttributeSets
        if isset(content, LaneRulesLayerContent.LANE_POSITION_SETS);

  /** Attribute sets for lane transition attributes. */
  RulesLaneTransitionAttributeSetList(0) laneTransitionAttributeSets
        if isset(content, LaneRulesLayerContent.LANE_TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/** Rules attribute layer for lanes using indirect references. */
struct LaneRulesLayerIndirect
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneRulesLayerContent content;

  /** Attribute maps for lane range attributes. */
  RulesIndirectLaneRangeAttributeMapList(0) laneRangeAttributeMaps
        if isset(content, LaneRulesLayerContent.LANE_RANGE_MAPS);

  /** Attribute maps for lane position attributes. */
  RulesIndirectLanePositionAttributeMapList(0) lanePositionAttributeMaps
        if isset(content, LaneRulesLayerContent.LANE_POSITION_MAPS);

  /** Attribute sets for lane range attributes. */
  RulesIndirectLaneRangeAttributeSetList(0) laneRangeAttributeSets
        if isset(content, LaneRulesLayerContent.LANE_RANGE_SETS);

  /** Attribute sets for lane position attributes. */
  RulesIndirectLanePositionAttributeSetList(0) lanePositionAttributeSets
        if isset(content, LaneRulesLayerContent.LANE_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Rules Attribute Layer for Display Lines

The rules attribute layer for display lines contains driving rules for display lines.
The rules attribute layer uses direct references.

!*/

/** Rules attribute layer for display lines using direct references.*/
struct DisplayLineRulesLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  DisplayLineRulesLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for display line range attributes. */
  RulesDisplayLineRangeAttributeMapList(shift) displayLineRangeAttributeMaps
        if isset(content, DisplayLineRulesLayerContent.DISPLAY_LINE_RANGE_MAPS);

  /** Attribute maps for display line position attributes. */
  RulesDisplayLinePositionAttributeMapList(shift) displayLinePositionAttributeMaps
        if isset(content, DisplayLineRulesLayerContent.DISPLAY_LINE_POSITION_MAPS);

  /** Attribute sets for display line range attributes. */
  RulesDisplayLineRangeAttributeSetList(shift) displayLineRangeAttributeSets
        if isset(content, DisplayLineRulesLayerContent.DISPLAY_LINE_RANGE_SETS);

  /** Attribute sets for display line position attributes. */
  RulesDisplayLinePositionAttributeSetList(shift) displayLinePositionAttributeSets
        if isset(content, DisplayLineRulesLayerContent.DISPLAY_LINE_POSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};