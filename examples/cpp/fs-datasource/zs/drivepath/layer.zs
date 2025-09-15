/*!

# Drive Path Layers

This package defines the data layers of the Drive Path module.

**Dependencies**

!*/

package drivepath.layer;

import system.types.*;
import core.geometry.*;
import drivepath.instantiations.*;
import drivepath.metadata.*;
import drivepath.types.*;

/*!

## Drive Path Layer

The drive path layer stores all drive paths within a container, for example, a
tile, an object, or a path.

!*/

rule_group DrivePathLayerRules
{
  /*!
  Cutting of Drive Paths at Tile Borders:

  Drive paths shall be cut directly at tile borders or in the near vicinity of
  the tile border.
  !*/

  rule "drivepath-owum4z-I";

  /*!
  Shared Positions of Drive Paths:

  Subsequent drive paths are connected if the start point of one drive path
  geometry has the same position as the end point of another drive path geometry.
  Drive paths without connection shall not share one start position or end position.
  !*/

  rule "drivepath-f6u29y";
};

/** Layer for drive paths. */
struct DrivePathLayer
{
  /**
    * Drive paths using 3D line geometries. Drive path geometries are stored in
    * the direction of the vehicle's trajectory along the path.
    */
  DrivePathGeometryLayer(GeometryLayerType.LINE_3D, true, false) drivePaths;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};

/*!

## Drive Path Attribute Layer

The drive path attribute layer stores additional information about available
drive paths, for example, the average speed.

!*/

/** Layer for drive path attributes. */
struct DrivePathAttributeLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  DrivePathAttributeLayerContent content;

  /** Attribute maps for drive path range attributes. */
  DrivePathRangeAttributeMapList(0) drivePathRangeAttributeMaps
    if isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_RANGE_ATTRIBUTE_MAPS);

  /** Attribute sets for drive path range attributes. */
  DrivePathRangeAttributeSetList(0) drivePathRangeAttributeSets
    if isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_RANGE_ATTRIBUTE_SETS);

  /** Attribute maps for drive path position attributes. */
  DrivePathPositionAttributeMapList(0) drivePathPositionAttributeMaps
    if isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_POSITION_ATTRIBUTE_MAPS);

  /** Attribute sets for drive path position attributes. */
  DrivePathPositionAttributeSetList(0) drivePathPositionAttributeSets
    if isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_POSITION_ATTRIBUTE_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/*!

## Drive Path Relation Layer

The drive path relation layer relates drive paths to roads, lanes, or road
locations.

!*/

rule_group DrivePathRelationLayerRules
{
  /*!
  No Undirected Drive Path Relations:

  Relations from drive paths to roads, lanes, or road locations are always
  directed:
  - If `drivePathRoadRangeRelations` is used, then `RoadReference.isDirected`
    shall be set to `true`.
  - If `drivePathLaneRangeRelations` is used, then
    `LaneGroupRangeValidity.completeGroup` shall not be set to `true` and the
    validity direction for the corresponding lanes shall not be set to
    `IN_BOTH_DIRECTIONS`.
  - If `drivePathRoadLocationRangeRelations` is used, then
    `RoadLocationReference.direction` shall not be set to `IN_BOTH_DIRECTIONS`.
  !*/

  rule "drivepath-h9s9jr";
};

/** Layer for drive path relations. */
struct DrivePathRelationLayer
{
  /** Content of the drive path relation layer. */
  DrivePathRelationLayerContent content;

  /** Drive path relations to roads. */
  DrivePathRoadRangeRelationMapList(0) drivePathRoadRangeRelations
    if isset(content, DrivePathRelationLayerContent.ROAD_RANGE_MAPS);

  /** Drive path relations to lanes. */
  DrivePathLaneRangeRelationMapList(0) drivePathLaneRangeRelations
    if isset(content, DrivePathRelationLayerContent.LANE_RANGE_MAPS);

  /** Drive path relations to road location IDs. */
  DrivePathRoadLocationRangeRelationMapList(0) drivePathRoadLocationRangeRelations
    if isset(content, DrivePathRelationLayerContent.ROAD_LOCATION_RANGE_MAPS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};
