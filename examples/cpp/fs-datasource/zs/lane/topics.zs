/*!
# Lane Topics

This package defines lane topics.

The publish-subscribe lane topics allow applications to publish lane information
using NDS-encoded lane structures.

**Dependencies**

!*/

package lane.topics;

import vehicle.reference.types.*;
import core.types.*;
import core.geometry.*;
import lane.lanes.*;
import lane.boundaries.*;
import lane.lanegroups.*;
import lane.instantiations.*;

/*!

## Lane Groups on Path Topic

This topic provides lane groups with connectivity information along the vehicle
horizon. The horizon path is identified by a path ID.

!*/

/** Provides lane groups with connectivity information along the vehicle horizon. */
struct LaneGroupsOnPathTopic
{
  /** Time stamp. */
  TimeStamp stamp;

  /** Identifier of the horizon path. */
  HorizonPathId pathId;

  /** Definition of boundary elements. */
  BoundaryElementDefinitions boundaryDefinitions;

  /** Definition of lane groups on the horizon path. */
  LaneGroup laneGroupPath[];
};

/*!

## Lane Geometry on Path Topic

This topic provides lane center line geometry for the vehicle horizon. The
horizon path is identified by a path ID.

!*/

/** Provides lane center line geometry for the vehicle horizon. */
struct LaneGeometryOnPathTopic
{
  /** Time stamp. */
  TimeStamp stamp;

  /** Identifier of the horizon path. */
  HorizonPathId pathId;

  /** Definition of center line geometries for the horizon path. */
  CenterLineGeometryLayer(GeometryLayerType.LINE_3D, true, false) centerLineGeometryLayer;
};

/*!

## Boundary Geometry on Path Topic

This topic provides boundary geometry for the vehicle horizon. The
horizon path is identified by a path ID.

!*/

/** Provides boundary geometry for the vehicle horizon. */
struct LaneBoundaryGeometryOnPathTopic
{
  /** Time stamp. */
  TimeStamp stamp;

  /** Identifier of the horizon path. */
  HorizonPathId pathId;

  /** Defines boundary elements. */
  BoundaryElementDefinitions boundaryDefinitions;

  /** Definition of boundary geometry for the horizon path. */
  BoundaryGeometryLayer(GeometryLayerType.LINE_3D, true, false) boundaryGeometryLayer;
};


pubsub LaneTopicCollection
{
  /**
    * Lane groups for a horizon path.
    * Wildcard 1: vehicle ID, e.g. VIN
    * Wildcard 2: HorizonPathId to listen on
    */
  topic("nds/vehicle/+/path/+/lane/connectivity") LaneGroupsOnPathTopic laneGroups;

  /**
    * Lane center line geometries for a horizon path.
    * Wildcard 1: vehicle ID, e.g. VIN
    * Wildcard 2: HorizonPathId to listen on
    */
  topic("nds/vehicle/+/path/+/lane/geometry") LaneGeometryOnPathTopic laneCenterlineGeometry;

  /**
    * Boundary geometries for a horizon path.
    * Wildcard 1: vehicle ID, e.g. VIN
    * Wildcard 2: HorizonPathId to listen on
    */
  topic("nds/vehicle/+/path/+/lane/geometry/boundary") LaneBoundaryGeometryOnPathTopic laneBoundaryGeometry;
};
