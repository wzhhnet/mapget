/*!

# Localization Layers

Localization objects are stored in the corresponding geometry layer, depending
on the type of the localization object.

**Dependencies**

!*/

package localization.layer;

import system.types.*;
import core.attributemap.*;
import core.geometry.*;

import localization.attributes.*;
import localization.properties.*;
import localization.types.*;
import localization.instantiations.*;

/*!

## Landmark Layers

The landmark layers include all relevant geometries for localization as well as
the basic types of the geometries and the detail information of the landmarks,
where available.

If available, relations from landmarks to roads or lanes are stored in the road
landmark layer and the lane landmark layer.

!*/

rule_group LandmarkLayerRules
{
  /*!
  Order of Line Landmarks of Compound Localization Objects:

  If multiple horizontal line landmarks are combined in one compound localization
  object, then the first polyline in the `LandmarkLineGeometryLayer` represents
  the upper edge of the object and the last polyline represents the lower edge.
  !*/

  rule "localization-sqtptj-I";

  /*!
  Landmark Relations for Drivable Road Surfaces Only:

  Landmarks shall not be related to line road surfaces. Landmarks shall only be
  related to polygon road surfaces of logical type `DRIVABLE`.
  !*/

  rule "localization-xsj0xx";
};

/** Landmark layer to provide geometries for landmarks. */
struct LandmarkLayer
{
  /** Header structure that defines available landmark types and relations. */
  LandmarkLayerHeader header
      :  (lengthof(header.availableLineTypes) > 0)
      || (lengthof(header.availablePolygonTypes) > 0)
      || (lengthof(header.availableMeshTypes) > 0);

  /** Geometry layer for lines. */
  LandmarkLineGeometryLayer
        (GeometryLayerType.LINE_3D, (header.hasRelations || header.hasDetails), true)
        lineGeometryLayer
        if lengthof(header.availableLineTypes) > 0;

  /** Geometry layer for planar polygons. */
  LandmarkPolygonGeometryLayer
        (GeometryLayerType.POLYGON_3D, (header.hasRelations || header.hasDetails), true)
        polygonGeometryLayer
        if lengthof(header.availablePolygonTypes) > 0;

  /** Geometry layer for polygon meshes. */
  LandmarkMeshGeometryLayer
        (GeometryLayerType.MESH_3D, (header.hasRelations || header.hasDetails), true)
        meshGeometryLayer
        if lengthof(header.availableMeshTypes) > 0;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};

/** Header information of landmark layer. */
struct LandmarkLayerHeader
{
  /** List of available landmark types that use line geometries. */
  LandmarkLineType availableLineTypes[];

  /** List of available landmark types that use planar polygon geometries. */
  LandmarkPolygonType availablePolygonTypes[];

  /** List of available landmark types that use polygon mesh geometries. */
  LandmarkMeshType availableMeshTypes[];

  /**
    * Set to `true` if landmarks have relations to other features. In this case, the
    * landmark layer provides landmark IDs to reference the geometries.
    */
  bool hasRelations;

  /**
    * Set to `true` if landmarks have detail information. In this case, the landmark
    * layer provides landmark IDs to reference the geometries.
    */
  bool hasDetails;
};

/** Road landmark layer to store relations between landmarks and roads. */
struct RoadLandmarkLayer
{
  CoordShift shift;

  LandmarkRoadAttributeMapList(shift) roadAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/** Lane landmark layer to store relations between landmarks and lanes. */
struct LaneLandmarkLayer
{
  LandmarkLaneAttributeMapList(0) laneAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/** Road surface landmark layer to store relations between landmarks and road surfaces. */
struct RoadSurfaceLandmarkLayer
{
  LandmarkRoadSurfaceAttributeMapList(0) roadSurfaceAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/*!

## Obstacle Layer

The obstacle layer consists only of the obstacle geometry layer, which
uses the obstacle type to distinguish between horizontal and vertical obstacles.

!*/

/** Obstacle geometry layer. */
struct ObstacleLayer
{
  /** Geometry layer for obstacles, which uses 3D lines. */
  ObstacleGeometryLayer(GeometryLayerType.LINE_3D, false, true) obstacleGeometryLayer;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};

/*!

## Occupancy Grid Layers

The occupancy grid layer stores occupancy grids that divide the world into
evenly spaced cells. Each cell is assigned a defined occupancy status.

If available, relations from occupancy grids to roads or lanes are stored in the
road occupancy grid layer and the lane occupancy grid layer.

!*/

rule_group OccupancyGridLayerRules
{
  /*!
  Layer-unique Occupancy Grid IDs:

  Occupancy grid IDs shall be unique within one occupancy grid layer.
  !*/

  rule "localization-yxq5cq-I";
};

/**
  * Occupancy grid geometry layer to store occupancy grids that divide the world
  * into evenly spaced cells.
  */
struct OccupancyGridLayer
{
  /** Set to `true` if the occupancy grid has IDs. */
  bool hasIds;

  /** The grid layer, IDs are optional, additional type information is not used. */
  OccupancyProbabilityGridLayer(hasIds, false) gridLayer;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};


/** Road occupancy grid layer to store relations between occupancy grids and roads. */
struct RoadOccupancyGridLayer
{
  CoordShift shift;

  OccupancyGridRoadAttributeMapList(shift) roadAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};

/** Lane occupancy grid layer to store relations between occupancy grids and lanes. */
struct LaneOccupancyGridLayer
{
  OccupancyGridLaneAttributeMapList(0) laneAttributeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};
