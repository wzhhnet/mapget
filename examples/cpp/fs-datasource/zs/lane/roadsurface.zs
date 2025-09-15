/*!

# Road Surfaces

This package defines road surfaces. Road surfaces are represented as polygon mesh
geometries or 3D line geometries, depending on the container type.

Each road surface has a road surface type and an optional
relation to a lane.

**Dependencies**

!*/

package lane.roadsurface;

import core.types.*;
import lane.types.*;
import lane.reference.types.*;

/*!

## Road Surface Type

The following road surface types are available for polygon and line road surfaces:

- Physical types
- Logical types
- Marking types (only for road surfaces of logical types `MARKING_POLYGON` and
  `MARKING_LINE`)

The polygon mesh or 3D line of a road surface can combine a physical and
a logical type. The geometries of different road surfaces can overlap, regardless
of the geometry type.

!*/

/** Types for polygon road surfaces. */
struct RoadSurfacePolygonType
{
  /** Physical type of road surface. */
  RoadSurfacePolygonPhysicalType physicalType;

  /** Logical type of road surface. */
  RoadSurfacePolygonLogicalType logicalType;

  /** Road surface marking. */
  RoadSurfacePolygonMarking markingDetails if logicalType == RoadSurfacePolygonLogicalType.MARKING_POLYGON;
};

/** Marking details for polygon road surfaces of logical type `MARKING_POLYGON`. */
struct RoadSurfacePolygonMarking
{
  /** Marking type. */
  RoadSurfacePolygonMarkingType markingType;

  /** Marking color. */
  MarkingColor markingColor;

  /** Marking material. */
  MarkingMaterial markingMaterial;
};

/** Types for line road surfaces. */
struct RoadSurfaceLineType
{
  /** Physical type of road surface. */
  RoadSurfaceLinePhysicalType physicalType;

  /** Logical type of road surface. */
  RoadSurfaceLineLogicalType logicalType;

  /** Road surface marking. */
  RoadSurfaceLineMarking markingDetails if logicalType == RoadSurfaceLineLogicalType.MARKING_LINE;
};

/** Marking details for line road surfaces of logical type `MARKING_LINE`. */
struct RoadSurfaceLineMarking
{
  /** Marking type. */
  RoadSurfaceLineMarkingType markingType;

  /** Marking color. */
  MarkingColor markingColor;

  /** Marking material. */
  MarkingMaterial markingMaterial;

  /** Width of the marking. */
  MarkingWidth markingWidth;
};

/**
  * Physical type of polygon road surface. Describes the physical nature of
  * areas on the road surface and of adjacent areas, for example, sidewalks.
  */
enum varuint32 RoadSurfacePolygonPhysicalType
{
  /** Physical road surface information is unknown. */
  UNKNOWN,

  /** Paved road surface. No further details on the type of pavement is available. */
  PAVED,

  /** Unpaved road surface. */
  UNPAVED,

  /** Gravel. */
  GRAVEL,

  /** Manhole. */
  MANHOLE,

  /** Pothole. */
  POTHOLE,

  /** Ditch. */
  DITCH,
};

/** Physical type of line road surface. */
enum varuint32 RoadSurfaceLinePhysicalType
{
  /** Physical road surface information is unknown. */
  UNKNOWN,

  /** Paved road surface. Used for painted markings. */
  PAVED,

  /** Rail of a tram, railway, etc. */
  RAIL,

  /** Curb. */
  CURB,
};

/** Width of a road surface line marking. */
subtype WidthCentimeters MarkingWidth;

/** Width of road surface line marking is unknown. */
const MarkingWidth UNKNOWN_MARKING_WIDTH = 0;

/**
  * Logical type of polygon road surface. Describes the purpose of areas on the
  * road surface and of adjacent areas, for example, sidewalks.
  */
enum varuint32 RoadSurfacePolygonLogicalType
{
  /** Logical type is not known or not existing. */
  UNKNOWN,

  /** Crosswalk. */
  CROSSWALK,

  /** Bicycle crossing. */
  BICYCLE_CROSSING,

  /** Part of an intersection. */
  INTERSECTION,

  /** Marking that is represented as a polygon. */
  MARKING_POLYGON,

  /**
    * Paved area between two lanes that can be crossed physically, but usually
    * is not allowed to be crossed legally except in emergency situations.
    */
  GORE,

  /**
    * Walking area for pedestrians adjacent to the road or on the road surface,
    * for example, sidewalks or dedicated paths inside a parking garage.
    */
  WALKING_AREA,

  /** Part of a driveway. */
  DRIVEWAY,

  /** Part of a roundabout. */
  ROUNDABOUT,

  /** Pedestrian waiting area. */
  PEDESTRIAN_WAITING_AREA,

  /** Bicycle waiting area. */
  BICYCLE_WAITING_AREA,

  /** Part of a parking facility. */
  PARKING,

  /** Part of a construction area. */
  CONSTRUCTION_AREA,

  /** Bus stop. */
  BUS_STOP,

  /** Tram stop. */
  TRAM_STOP,

  /** Tram crossing. */
  TRAM_CROSSING,

  /** Tram track. */
  TRAM_TRACK,

  /** No stop zone. */
  NO_STOP_ZONE,

  /** Road surface that a vehicle can drive on. */
  DRIVABLE,

  /** Road surface that is not intended or not suitable for a vehicle to drive on. */
  NON_DRIVABLE,

  /** Road surface that a vehicle can drive on, but should avoid. */
  UNDESIRABLE,
};

/** Logical type of line road surface. */
enum varuint32 RoadSurfaceLineLogicalType
{
  /** Logical type of the road surface is unknown. */
  UNKNOWN,

  /** Marking that is represented as a line. */
  MARKING_LINE,

  /** Traversable curb. */
  CURB_TRAVERSABLE,
};

/**
  * Marking type of polygon road surface. Provides detailed information for road
  * surfaces of logical type `MARKING_POLYGON`.
  */
enum varuint32 RoadSurfacePolygonMarkingType
{
  /** Detailed marking type is unknown. */
  UNKNOWN,

  /**
    * Dash or a part of a line modeled as a polygon, which indicates that consecutive
    * dashes are expected nearby.
    */
  DASH,

  /** Text that is written on the road surface. The text itself is not specified. */
  TEXT,

  /** Straight arrow in travel direction. */
  ARROW_STRAIGHT,

  /** Arrow that points left in travel direction. */
  ARROW_LEFT,

  /** Arrow that points right in travel direction. */
  ARROW_RIGHT,

  /**
   * Combined arrow where one part points straight and the other part points
   * left in travel direction.
   */
  ARROW_STRAIGHT_AND_LEFT,

  /**
   * Combined arrow where one part points straight and the other part points
   * right in travel direction.
   */
  ARROW_STRAIGHT_AND_RIGHT,

  /**
   * Combined arrow where one part points left and the other part points right
   * in travel direction.
   */
  ARROW_LEFT_AND_RIGHT,

  /**
   * Arrow that points upwards while slightly bending to the left in driving
   * direction.
   *
   * Example: Arrow indicating a merge.
   */
  ARROW_SLIGHT_LEFT,

  /**
   * Arrow that points upwards while slightly bending to the right in driving
   * direction.
   *
   * Example: Arrow indicating a merge.
   */
  ARROW_SLIGHT_RIGHT,

  /**
   * Arrow that starts in travel direction but that points
   * in opposite direction.
   */
  ARROW_U_TURN,

  /** Marking that combines `ARROW_STRAIGHT` and `ARROW_U_TURN`. */
  ARROW_STRAIGHT_AND_U_TURN,

  /** Marking that combines `ARROW_LEFT` and `ARROW_U_TURN`. */
  ARROW_LEFT_AND_U_TURN,

  /** Marking that combines `ARROW_RIGHT` and `ARROW_U_TURN`. */
  ARROW_RIGHT_AND_U_TURN,

  /** Sign painted on the road surface. The sign type itself is not specified. */
  SIGN,

  /** Line of triangles painted on the surface to indicate where to yield. */
  YIELD_INDICATION,

  /** Speed bump decorated with paint. */
  VISUAL_SPEED_BUMP,

  /** Shaded area. */
  SHADED_AREA,
};

/**
  * Marking type of line road surface. Provides detailed information for road
  * surfaces of logical type `MARKING_LINE`.
  */
enum varuint32 RoadSurfaceLineMarkingType
{
  /** Detailed marking type is unknown. */
  UNKNOWN,

  /** Line with no further information. */
  LINE,

  /** Solid line. */
  SOLID_LINE,

  /** Dashed line. */
  DASHED_LINE,

  /**
    * Transverse line on a road surface. Indicates where vehicles are
    * required to stop, for example, in front of a traffic light. Stop lines
    * are usually accompanied by stop signs or traffic lights.
    * Depending on local regulations, different rules apply how to act at stop
    * lines. Also, the lines can have different shapes, widths, or colors.
    */
  STOP_LINE,

  /**
    * Transverse line on a road surface. Indicates where vehicles are
    * required to slow down and give way to other traffic.
    * Waiting lines are also called yield lines or give-way lines. Waiting lines
    * are often accompanied by yield signs.
    * Depending on local regulations, different rules apply how to act at waiting
    * lines. Also, the lines can have different shapes, widths, or colors.
    */
  WAITING_LINE,
};

/*!

## Road Surface Relations

Road surfaces can have a direct relation to lane groups and lanes.
A road surface can be related to one or more lane groups, which enables
applications to load only those road surfaces within the proximity of a
lane group.

If a road surface has a relation to a lane, the
road surface is located within the boundaries of the related lane.

For road surfaces that are logically connected to more than one lane, multiple
lane IDs are stored. If a road surface cannot be associated with any lane,
`hasLaneRelation` is set to `false`.

!*/

rule_group RoadSurfaceRelationRules
{
  /*!
  Storing of Road Surfaces Related to a Lane Group:

  If a road surface is related to a lane group, then it shall be stored in
  the same container, that is, in the same smart layer tile, smart layer path,
  or in the same smart layer object.
  !*/

  rule "lane-2ph9qo";
};

/** Relation from road surfaces to lane groups or lanes. */
struct RoadSurfaceLaneGroupRelation
{
  /** ID of the lane group that is related to one or more road surfaces. */
  LaneGroupId laneGroupId;

  /**
    * Indicator whether the road surface is related to a lane.
    * Set to `true` if there is a relation between the road surface and a lane.
    */
  bool hasLaneRelation;

  /**
    * List of lane IDs to which the road surface is related. There is no further
    * information on the kind of relation.
    */
  LaneId laneId[] if hasLaneRelation;

  /** Number of road surfaces to which the lane group is related. */
  varsize numSurfaces;

  /** List of road surface IDs to which the lane group is related. */
  RoadSurfaceId relatedSurfaces[numSurfaces];
};
