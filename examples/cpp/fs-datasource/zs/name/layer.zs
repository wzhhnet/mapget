/*!

# Name Attribute Layers

This package defines the attribute layers of the Name module. The name data
is supplied through the corresponding smart layer interface.

**Dependencies**

!*/

package name.layer;

import system.types.*;
import lane.reference.types.*;
import road.reference.types.*;
import core.geometry.*;
import core.types.*;
import name.instantiations.*;
import name.attributes.*;
import name.properties.*;
import name.metadata.*;
import name.types.*;

/**
  * Name attribute layer for roads. Contains names, an administrative hierarchy,
  * and house numbers for roads. The layer uses direct road references.
  */
struct RoadNameLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadNameLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  NameRoadRangeAttributeMapList(shift) roadRangeAttributeMaps
        if isset(content, RoadNameLayerContent.ROAD_RANGE_MAPS);

  /** Attribute maps for road position attributes. */
  NameRoadPositionAttributeMapList(shift) roadPositionAttributeMaps
        if isset(content, RoadNameLayerContent.ROAD_POSITION_MAPS);

  /** Attribute maps for transition attributes. */
  NameTransitionAttributeMapList(shift) transitionAttributeMaps
        if isset(content, RoadNameLayerContent.TRANSITION_MAPS);

  /** Attribute sets for road range attributes. */
  NameRoadRangeAttributeSetList(shift) roadRangeAttributeSets
        if isset(content, RoadNameLayerContent.ROAD_RANGE_SETS);

  /** Attribute sets for road position attributes. */
  NameRoadPositionAttributeSetList(shift) roadPositionAttributeSets
        if isset(content, RoadNameLayerContent.ROAD_POSITION_SETS);

  /** Attribute sets for transition attributes. */
  NameTransitionAttributeSetList(shift) transitionAttributeSets
        if isset(content, RoadNameLayerContent.TRANSITION_SETS);

  /** Definition of administrative hierarchy elements used in the layer. */
  AdministrativeHierarchyElement adminHierarchyElementDefinitions[]
        if isset(content, RoadNameLayerContent.ADMIN_HIERARCHY);

  /** Definition of one or more address formats that is used in the layer. */
  AddressFormat addressFormats[]
        if isset(content, RoadNameLayerContent.ADDRESS_FORMAT);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/**
  * Name attribute layer for lanes. Contains names, an administrative hierarchy,
  * and house numbers for lanes and lane groups.
  */
struct LaneNameLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneNameLayerContent content;

  /** Attribute maps for lane range attributes. */
  NameLaneRangeAttributeMapList(0) laneRangeAttributeMaps
        if isset(content, LaneNameLayerContent.LANE_RANGE_MAPS);

  /** Attribute maps for lane position attributes. */
  NameLanePositionAttributeMapList(0) lanePositionAttributeMaps
        if isset(content, LaneNameLayerContent.LANE_POSITION_MAPS);

  /** Attribute sets for lane range attributes. */
  NameLaneRangeAttributeSetList(0) laneRangeAttributeSets
        if isset(content, LaneNameLayerContent.LANE_RANGE_SETS);

  /** Attribute sets for lane position attributes. */
  NameLanePositionAttributeSetList(0) lanePositionAttributeSets
        if isset(content, LaneNameLayerContent.LANE_POSITION_SETS);

  /** Definition of administrative hierarchy elements used in the layer. */
  AdministrativeHierarchyElement adminHierarchyElementDefinitions[]
        if isset(content, LaneNameLayerContent.ADMIN_HIERARCHY);

  /** Definition of one or more address formats that are used in the layer. */
  AddressFormat addressFormats[]
        if isset(content, LaneNameLayerContent.ADDRESS_FORMAT);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/** Name attribute layer for display features, that is, lines, areas, and points. */
struct DisplayNameLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  DisplayNameLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for name attributes assigned to ranges on display lines. */
  NameDisplayLineRangeAttributeMapList(shift) displayLineRangeAttributeMaps
        if isset(content, DisplayNameLayerContent.DISPLAY_LINE_RANGE_MAPS);

  /** Attribute maps for name attributes assigned to display areas. */
  NameDisplayAreaAttributeMapList(shift) displayAreaAttributeMaps
        if isset(content, DisplayNameLayerContent.DISPLAY_AREA_MAPS);

  /** Attribute maps for name attributes assigned to display points. */
  NameDisplayPointAttributeMapList(shift) displayPointAttributeMaps
        if isset(content, DisplayNameLayerContent.DISPLAY_POINT_MAPS);

  /** Attribute sets for name attributes assigned to ranges on display lines. */
  NameDisplayLineRangeAttributeSetList(shift) displayLineRangeAttributeSets
        if isset(content, DisplayNameLayerContent.DISPLAY_LINE_RANGE_SETS);

  /** Attribute sets for name attributes assigned to display areas. */
  NameDisplayAreaAttributeSetList(shift) displayAreaAttributeSets
        if isset(content, DisplayNameLayerContent.DISPLAY_AREA_SETS);

  /** Attribute sets for name attributes assigned to display points. */
  NameDisplayPointAttributeSetList(shift) displayPointAttributeSets
        if isset(content, DisplayNameLayerContent.DISPLAY_POINT_SETS);

  /** Definition of administrative hierarchy elements used in the layer. */
  AdministrativeHierarchyElement adminHierarchyElementDefinitions[]
        if isset(content, DisplayNameLayerContent.ADMIN_HIERARCHY);

  /** Definition of one or more address formats that are used in the layer. */
  AddressFormat addressFormats[]
        if isset(content, DisplayNameLayerContent.ADDRESS_FORMAT);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/** Name attribute layer for POIs. Contains names and addresses for POIs. */
struct PoiNameLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  PoiNameLayerContent content;

  /** Attribute maps for POI attributes. */
  NamePoiAttributeMapList(0) poiAttributeMaps
        if isset(content, PoiNameLayerContent.POI_MAPS);

  /** Attribute sets for POI attributes. */
  NamePoiAttributeSetList(0) poiAttributeSets
        if isset(content, PoiNameLayerContent.POI_SETS);

  /** Definition of one or more address formats that are used in the layer. */
  AddressFormat addressFormats[]
        if isset(content, PoiNameLayerContent.ADDRESS_FORMAT);

  /** Definition of administrative hierarchy elements used in the layer. */
  AdministrativeHierarchyElement adminHierarchyElementDefinitions[]
        if isset(content, PoiNameLayerContent.ADMIN_HIERARCHY);


  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};