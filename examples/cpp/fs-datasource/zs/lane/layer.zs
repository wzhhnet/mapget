/*!

# Lane Layers

This package defines the content of the feature layers in the Lane module, that is,
the lane layer and the lane geometry layer. The lane data is supplied
through the smart layer interface.

**Dependencies**

!*/

package lane.layer;

import system.types.*;
import core.types.*;
import core.geometry.*;
import lane.lanegroups.*;
import lane.lanes.*;
import lane.boundaries.*;
import lane.roadsurface.*;
import lane.instantiations.*;

/*!

## Lane Layer

The lane layer provides lane topology information, lane boundary definitions,
and lane groups.

!*/

rule_group LaneLayerRules
{
  /*!
  Lane Group Ordering along Smart Layer Path:

  If the lane layer is used within a smart layer path, then the lane groups
  in `laneGroupList` shall be ordered from the start to the end of the path.
  !*/

  rule "lane-2gx73s";
};


/** Layer for lane topology, lane boundary definitions, and lane groups. */
struct LaneLayer
{
  /**
    * Definitions of lane boundary elements that are referred to inside
    * the lane layer.
    */
  BoundaryElementDefinitions boundaryDefinitions;

  /** List of lane boundaries. */
  packed Boundary boundaryList[];

  /** List of lane groups. */
  packed LaneGroup laneGroupList[];

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};

/*!

## Lane Geometry Layer

The lane geometry layer contains geometries for lane center lines and lane
boundaries.

!*/

/** Layer for lane center line and boundary geometries. */
struct LaneGeometryLayer
{
  /** Geometry layer for center lines. */
  CenterLineGeometryLayer(GeometryLayerType.LINE_3D, true, false) centerLineGeometryLayer;

  /** Geometry layer for boundaries. */
  BoundaryGeometryLayer(GeometryLayerType.LINE_3D, true, false) boundaryGeometryLayer;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};

/*!

## Road Surface Layer

The road surface layer contains geometries for road surfaces and relations to
lane groups and lanes.

!*/

/** Layer for road surfaces. */
struct RoadSurfaceLayer
{
  /**
    * Geometry layer for polygon road surfaces. Road surfaces use polygon meshes,
    * road surface IDs, and polygon types.
    */
  RoadSurfacePolygonGeometryLayer(GeometryLayerType.MESH_3D, true, true) roadSurfacePolygonLayer;

  /**
    * Geometry layer for line road surfaces. Road surfaces use 3D lines,
    * road surface IDs, and line types.
    */
  RoadSurfaceLineGeometryLayer(GeometryLayerType.LINE_3D, true, true) roadSurfaceLinesLayer;

  /** Road surface relations to lane groups and lanes. */
  packed RoadSurfaceLaneGroupRelation lanegroupRelations[];

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};

/*!

## Matched Lane Group Path Layer

The matched lane group path layer stores references to lane groups in the lane
layer that have been matched by a service. The matched lane group path layer is always
used together with a lane layer that contains the referenced lane groups, in the
following called the "source layer".

The matched lane group path layer is used when a horizon is calculated and the original
path provided in the request to the service has to be indicated in the returned
source layer. The source layer may contain more lane groups than the original request
and an application may not find the original path without the matched lane group path
layer.

A matched lane group path layer can consist of multiple segments. This can occur when
the layer is delivered in a tiled container (tile, path) and the matched lane
group path leaves and enters the tile multiple times.
The segments are ordered along the original path.

!*/

rule_group MatchedLaneGroupPathLayerRules
{
  /*!
  Matched Lane Group Path Layer Used With Lane Layer:

  The matched lane group path layer shall only be used together with a lane layer
  that contains the referenced lane groups.
  !*/

  rule "lane-npz7ct";

  /*!
  Ordering of Segments in Matched Lane Group Path Layer:

  The segments in a matched lane group path layer shall be ordered along the
  original path.
  !*/

  rule "lane-gahrzj";
};


/** Layer for matched lane group path references. */
struct MatchedLaneGroupPathLayer
{
  /** Number of segments in the matched lane group path layer. */
  varuint16 numSegments : numSegments > 0;

  /** Matched lane group segments in order of the path. */
  MatchedLaneGroupSegment segments[numSegments];

  /** Set to `true` if the last segment of `segments` terminates the matched path. */
  bool pathEnds;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};
