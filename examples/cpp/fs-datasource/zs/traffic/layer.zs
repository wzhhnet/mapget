/*!

# Traffic Attribute Layers

This package defines the content of the attribute layers in the Traffic module,
for example, the traffic attribute layer for roads and the traffic attribute
layer for lanes. The traffic information, such as traffic flow and traffic events,
is supplied through the smart layer interface.


**Dependencies**

!*/

package traffic.layer;

import system.types.*;
import lane.reference.types.*;
import road.reference.types.*;
import core.geometry.*;
import core.types.*;
import traffic.instantiations.*;
import traffic.attributes.*;
import traffic.properties.*;
import traffic.metadata.*;

/*!

## Traffic Attribute Layers for Roads

The traffic attribute layers for roads contain traffic information for roads.
The layers use direct or indirect references.

!*/

/** Traffic attribute layer for roads using direct references. */
struct RoadTrafficLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadTrafficLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  TrafficRoadRangeAttributeMapList(shift) roadRangeAttributeMaps
        if isset(content, RoadTrafficLayerContent.ROAD_RANGE_MAPS);

  /** Attribute maps for transition attributes. */
  TrafficTransitionAttributeMapList(shift) transitionAttributeMaps
        if isset(content, RoadTrafficLayerContent.TRANSITION_MAPS);

  /** Attribute sets for road range attributes. */
  TrafficRoadRangeAttributeSetList(shift) roadRangeAttributeSets
        if isset(content, RoadTrafficLayerContent.ROAD_RANGE_SETS);

  /** Attribute sets for transition attributes. */
  TrafficTransitionAttributeSetList(shift) transitionAttributeSets
        if isset(content, RoadTrafficLayerContent.TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};


/** Traffic attribute layer for roads using indirect references. */
struct RoadTrafficLayerIndirect
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadTrafficLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes. */
  TrafficIndirectRoadRangeAttributeMapList(shift) roadRangeAttributeMaps
        if isset(content, RoadTrafficLayerContent.ROAD_RANGE_MAPS);

  /** Attribute sets for road range attributes. */
  TrafficIndirectRoadRangeAttributeSetList(shift) roadRangeAttributeSets
        if isset(content, RoadTrafficLayerContent.ROAD_RANGE_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Traffic Attribute Layer for Road Locations

The traffic attribute layer for road locations contains traffic information for
road location references.
Instead of using references to NDS.Live roads, it uses road location references.

__Note:__
Using road locations, traffic attributes can also be assigned to NDS.Classic map
features. In this case, source location IDs from the Location
extension are used instead of road location IDs.


!*/

/** Traffic attribute layer for road locations. */
struct RoadLocationTrafficLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadLocationTrafficLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for road range attributes assigned to road locations. */
  TrafficRoadLocationRangeAttributeMapList(shift) roadLocationRangeAttributeMaps
        if isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_MAPS);

  /** Attribute maps for transition attributes assigned to road locations. */
  TrafficRoadLocationTransitionAttributeMapList(shift) roadLocationTransitionAttributeMaps
        if isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_TRANSITION_MAPS);

  /** Attribute sets for road range attributes assigned to road locations. */
  TrafficRoadLocationRangeAttributeSetList(shift) roadLocationRangeAttributeSets
        if isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_SETS);

  /** Attribute sets for transition attributes assigned to road locations. */
  TrafficRoadLocationTransitionAttributeSetList(shift) roadLocationTransitionAttributeSets
        if isset(content, RoadLocationTrafficLayerContent.ROAD_LOCATION_TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Traffic Attribute Layers for Lanes

The traffic attribute layers for lanes contain traffic information for lanes.
The layers use direct or indirect references.

!*/

/** Traffic attribute layer for lanes using direct references. */
struct LaneTrafficLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneTrafficLayerContent content;

  /** Attribute maps for lane range attributes. */
  TrafficLaneRangeAttributeMapList(0) laneRangeAttributeMaps
        if isset(content, LaneTrafficLayerContent.LANE_RANGE_MAPS);

  /** Attribute sets for lane range attributes. */
  TrafficLaneRangeAttributeSetList(0) laneRangeAttributeSets
        if isset(content, LaneTrafficLayerContent.LANE_RANGE_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/** Traffic attribute layer for lanes using indirect references. */
struct LaneTrafficLayerIndirect
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneTrafficLayerContent content;

  /** Attribute maps for lane range attributes. */
  TrafficIndirectLaneRangeAttributeMapList(0) laneRangeAttributeMaps
        if isset(content, LaneTrafficLayerContent.LANE_RANGE_MAPS);

  /** Attribute sets for lane range attributes. */
  TrafficIndirectLaneRangeAttributeSetList(0) laneRangeAttributeSets
        if isset(content, LaneTrafficLayerContent.LANE_RANGE_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Traffic Attribute Layer for Display Lines

The traffic attribute layer for display lines contains traffic information for
display lines.
The layer uses direct references only.

!*/

/** Traffic attribute layer for display lines using direct references. */
struct DisplayLineTrafficLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  DisplayLineTrafficLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for display line range attributes. */
  TrafficDisplayLineRangeAttributeMapList(shift) displayLineRangeAttributeMaps
        if isset(content, DisplayLineTrafficLayerContent.DISPLAY_LINE_RANGE_MAPS);

  /** Attribute sets for display line range attributes. */
  TrafficDisplayLineRangeAttributeSetList(shift) displayLineRangeAttributeSets
        if isset(content, DisplayLineTrafficLayerContent.DISPLAY_LINE_RANGE_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};