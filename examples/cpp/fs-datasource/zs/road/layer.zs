/*!

# Road Layers

This package defines the feature layers of the Road module. The road data
is supplied through the smart layer interface.

**Dependencies**

!*/

package road.layer;

import system.types.*;
import core.types.*;
import core.geometry.*;
import road.road.*;
import road.instantiations.*;

/*!

## Road Layer

The road layer stores all road topology and intersection features within a
container, for example, in a tile, an object, or a path.

!*/

/** Road layer. Stores all road topology and intersection features. */
struct RoadLayer
{
  /** Coordinate shift to be used inside the layer. */
  CoordShift coordShift;

  /** List of roads. This list only stores the topology of roads, no geometries. */
  RoadList    roadList;

  /** List of intersections. */
  IntersectionList(coordShift)  intersectionList;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};

/*!

## Road Geometry Layer

The road geometry layer stores shapes for roads. These shapes can be used to
assign attributes to road features as well as for map display, map matching, and
other use cases.

!*/

/** Road geometry layer. Stores shapes for roads. */
struct RoadGeometryLayer
{
  /** Geometry layer for road shapes using 2D lines, and the RoadId. */
  RoadShapesLayer(GeometryLayerType.LINE_2D, true, false) roadShapes;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};

/*!

## Matched Road Path Layer

The matched road path layer stores references to roads in the road layer that have
been matched by a service. The matched road path layer is always used together
with a road layer that contains the referenced roads, in the following called
the "source layer".

The matched road path layer is used when a horizon is calculated and the original
path provided in the request to the service has to be indicated in the returned
source layer. The source layer may contain more roads than the original request
and an application may not find the original path without the matched road path
layer.

A matched road path layer can consist of multiple segments. This can occur when
the layer is delivered in a tiled container (tile, path) and the matched road path
leaves and enters the tile multiple times.
The segments are ordered along the original path.

!*/

rule_group MatchedRoadPathLayerRules
{
  /*!
  Matched Road Path Layer Used With Road Layer:

  `MatchedRoadPathLayer` shall only be used together with a road layer
  that contains the referenced roads.
  !*/

  rule "road-rj6p2f";

  /*!
  Ordering of Segments in Matched Road Path Layer:

  The segments in `MatchedRoadPathLayer.segments` shall be ordered along the original path.
  !*/

  rule "road-vuub46";
};

/**
  * Matched road path layer. Stores references to roads in the road
  * layer that have been matched by a service.
  */
struct MatchedRoadPathLayer
{
  /** Number of segments in the matched road path layer. */
  varuint16 numSegments : numSegments > 0;

  /** Matched road segments in order of the path. */
  MatchedRoadSegment segments[numSegments];

  /** Set to `true` if the last segment of `segments` terminates the matched path. */
  bool pathEnds;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};
