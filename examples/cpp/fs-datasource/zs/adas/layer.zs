/*!

# ADAS Attribute Layers

This package defines the ADAS attribute layers.

Each attribute layer provides different types of attribute maps that allow to
assign ADAS attributes using references to the corresponding feature geometries,
transitions, or dedicated ADAS geometries. For more information on ADAS
geometries, see [ADAS Types > ADAS Geometry](types.zs).

**Dependencies**

!*/

package adas.layer;

import system.types.*;
import core.geometry.*;
import adas.instantiations.*;
import adas.types.*;
import adas.metadata.*;

/*!

## ADAS Attribute Layer for Roads

The ADAS attribute layer for roads contains road and transition attributes for
use with Advanced Driver Assistance Systems.

!*/

/** ADAS attribute layer for roads. */
struct AdasRoadLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  AdasRoadLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** ADAS geometries that act as the base for ADAS attributes. */
  AdasGeometryList(shift) adasGeometryList;

  /** Attribute maps for road attributes using ADAS geometry. */
  AdasRoadAttributeMapList(shift) adasRoadAttributeMaps
                  if isset(content, AdasRoadLayerContent.ROAD_MAPS);

  /** Attribute sets for road attributes using ADAS geometry. */
  AdasRoadAttributeSetList(shift) adasRoadAttributeSets
                  if isset(content, AdasRoadLayerContent.ROAD_SETS);

  /** Attribute maps for transition attributes using ADAS geometry. */
  AdasTransitionAttributeMapList(shift) adasTransitionAttributeMaps
                  if isset(content, AdasRoadLayerContent.TRANSITION_MAPS);

  /** Attribute sets for transition attributes using ADAS geometry. */
  AdasTransitionAttributeSetList(shift) adasTransitionAttributeSets
                  if isset(content, AdasRoadLayerContent.TRANSITION_SETS);

  /** Attribute maps for road attributes using road geometry. */
  AdasRoadAttributeMapList(shift) adasRoadGeometryAttributeMaps
                  if isset(content, AdasRoadLayerContent.ROAD_GEOMETRY_MAPS);

  /** Attribute sets for road attributes using road geometry. */
  AdasRoadAttributeSetList(shift) adasRoadGeometryAttributeSets
                  if isset(content, AdasRoadLayerContent.ROAD_GEOMETRY_SETS);

  /** Attribute maps for transition attributes using road geometry. */
  AdasTransitionAttributeMapList(shift) adasRoadGeometryTransitionAttributeMaps
                  if isset(content, AdasRoadLayerContent.TRANSITION_GEOMETRY_MAPS);

  /** Attribute sets for transition attributes using road geometry. */
  AdasTransitionAttributeSetList(shift) adasRoadGeometryTransitionAttributeSets
                  if isset(content, AdasRoadLayerContent.TRANSITION_GEOMETRY_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## ADAS Attribute Layer for Road Locations

The ADAS attribute layer for road locations contains road attributes for use
with Advanced Driver Assistance Systems.
This layer uses the same attributes as the ADAS attribute layer for roads, but
instead of using references to NDS.Live roads it uses road location references.

The ADAS attribute layer for road locations always uses ADAS geometries.

__Note:__
Using road location references, ADAS attributes can also be assigned to NDS.Classic
map features. In this case, source location IDs from the Location
extension are used instead of road location IDs.

!*/

/** ADAS attribute layer for road locations using ADAS geometries. */
struct AdasRoadLocationLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  AdasRoadLocationLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** ADAS geometries that act as the base for ADAS attributes. */
  AdasRoadLocationGeometryList(shift) adasGeometryList;

  /** Attribute maps for road attributes assigned to road locations. */
  AdasRoadLocationAttributeMapList(shift) adasRoadLocationAttributeMaps
                  if isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_MAPS);

  /** Attribute sets for road attributes assigned to road locations. */
  AdasRoadLocationAttributeSetList(shift) adasRoadLocationAttributeSets
                  if isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_SETS);

  /** Attribute maps for transition attributes assigned to road locations. */
  AdasRoadLocationTransitionAttributeMapList(shift) adasRoadLocationTransitionAttributeMaps
                  if isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_TRANSITION_MAPS);

  /** Attribute sets for transition attributes assigned to road locations. */
  AdasRoadLocationTransitionAttributeSetList(shift) adasRoadLocationTransitionAttributeSets
                  if isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## ADAS Attribute Layer for Lanes

The ADAS attribute layer for lanes contains lane attributes for use with
Advanced Driver Assistance Systems.

!*/

/** ADAS attribute layer for lanes. */
struct AdasLaneLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  AdasLaneLayerContent content;

  /** Attribute maps for lane attributes using lane geometry. */
  AdasLaneAttributeMapList(0) adasLaneAttributeMaps
              if isset(content, AdasLaneLayerContent.LANE_MAPS);

  /** Attribute sets for lane attributes using lane geometry. */
  AdasLaneAttributeSetList(0) adasLaneAttributeSets
                  if isset(content, AdasLaneLayerContent.LANE_SETS);

  /** Coordinate shift of the ADAS geometries. */
  CoordShift shift;

  /** ADAS geometries for lane groups. */
  AdasLaneGroupGeometryList(shift) adasLaneGroupGeometries
                  if isset(content, AdasLaneLayerContent.LANE_GROUP_GEOMETRIES);

  /** ADAS geometries for individual lanes or sets of lanes. */
  AdasLaneGeometryList(shift) adasLaneGeometries
                  if isset(content, AdasLaneLayerContent.LANE_GEOMETRIES);

  /** Attribute maps for lane attributes using ADAS geometry. */
  AdasLaneAttributeMapList(shift) adasLaneAdasGeometryAttributeMaps
                  if isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_MAPS);

  /** Attribute sets for lane attributes using ADAS geometry. */
  AdasLaneAttributeSetList(shift) adasLaneAdasGeometryAttributeSets
                  if isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_SETS);

  /** Attribute maps for lane transition attributes using lane geometry. */
  AdasLaneTransitionAttributeMapList(shift) adasLaneTransitionAttributeMaps
                  if isset(content, AdasLaneLayerContent.LANE_TRANSITION_MAPS);

  /** Attribute sets for lane transition attributes using lane geometry. */
  AdasLaneTransitionAttributeSetList(shift) adasLaneTransitionAttributeSets
                  if isset(content, AdasLaneLayerContent.LANE_TRANSITION_SETS);

  /** Attribute maps for lane transition attributes using ADAS geometry. */
  AdasLaneTransitionAttributeMapList(shift) adasLaneAdasGeometryTransitionAttributeMaps
                  if isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_TRANSITION_MAPS);

  /** Attribute sets for lane transition attributes using ADAS geometry. */
  AdasLaneTransitionAttributeSetList(shift) adasLaneAdasGeometryTransitionAttributeSets
                  if isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};
