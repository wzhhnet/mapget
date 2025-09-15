/*!

# Lane Metadata

This package defines the metadata of the Lane module. The metadata is
used in the smart layer and registry components to gather additional information
on the content of the lane layers.

**Dependencies**

!*/

package lane.metadata;

import core.types.*;
import core.vehicle.*;
import lane.lanegroups.*;
import lane.types.*;


rule_group LaneLayersMetadataRules
{
  /*!
  `LaneLayerMetadata` Structure:

  The structure `LaneLayerMetadata` shall be used to populate the external
  structure `layerMetadata` in smart layer services that provide lane features.
  !*/

  rule "lane-2jukoo";

  /*!
  `GeometryLayerMetadata` Structure:

  The structure `GeometryLayerMetadata` shall be used to populate the
  external structure `layerMetadata` in smart layer services that provide
  lane geometries.
  !*/

  rule "lane-2kaw7h";

  /*!
  `layerType` Setting for Lane Geometry Layer:

  The `layerType` shall be set to `LANE_GEOMETRY` for the lane geometry
  layer, which includes the lane center line and lane boundaries.
  !*/

  rule "lane-2ksis9";

  /*!
  `layerType` Setting for Road Surface Layer

  The `layerType` shall be set to `ROAD_SURFACE` for the road surface layer.
  !*/

  rule "lane-2me8q3";
};


/** Metadata of the lane layer. */
struct LaneLayerMetadata
{
  /** Covered road types. */
  RoadType includedRoadTypes[];

  /** Lane group types used in the layer. */
  LaneGroupType includedLaneGroupTypes[];

  /** Logical boundary types used in the layer. */
  LogicalBoundaryType includedLogicalBoundaryTypes[];

  /** Marking boundary types used in the layer. */
  MarkingBoundaryType includedMarkingBoundaryTypes[];

  /** Physical divider boundary types used in the layer. */
  PhysicalDividerBoundaryType includedPhysicalDividerBoundaryTypes[];

  /** Physical marking boundary types used in the layer. */
  PhysicalMarkingBoundaryType includedPhysicalMarkingBoundaryTypes[];

  /** Boundary geometry usage in the layer. */
  BoundaryGeometryUsage boundaryGeometryUsage;

  /** Vehicle specifications for which lanes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Holds metadata of the geometry layers of the Lane module. */
struct GeometryLayerMetadata
{
  /** Type of geometry layer. */
  GeometryLayerType layerType;
};

/** Metadata of the lane geometry layer. */
subtype GeometryLayerMetadata LaneGeometryLayerMetadata;

/** Metadata of the road surface layer. */
subtype GeometryLayerMetadata RoadSurfaceLayerMetadata;

/** Type of geometry layer. */
enum uint8 GeometryLayerType
{
  /** Layer contains lane geometries. */
  LANE_GEOMETRY,

  /** Layer contains geometries for road surfaces. */
  ROAD_SURFACE,
};

/** Indicates how boundary geometries are used in the lane layer. */
bitmask varuint32 BoundaryGeometryUsage
{
  /** Boundary geometries are not used in the layer. */
  NOT_USED,

  /** Each boundary uses a distinct boundary geometry. */
  DISTINCT,

  /**
    * Multiple boundaries share the same boundary geometry, for example,
    * a dashed line and a solid line refer to the same boundary geometry.
    */
  SHARED,
};
