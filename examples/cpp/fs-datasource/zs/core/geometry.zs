/*!

# Core Geometries

This package provides generic data structures to define geometries.
It provides a template for a geometry layer, which carries all geometry primitives
available in NDS.Live, see [Geometry Layer](#geometry-layer).

The package also contains helper structs for describing spatial
extent for use in metadata, see [Spatial Extent](#spatial-extent).

**Dependencies**

!*/

package core.geometry;

import core.types.*;

/*!

## Geometry Layer

A geometry layer stores geometries and maps them to geometry IDs. Geometry IDs
are used by feature layers to reference the corresponding geometries.
Geometry IDs are defined in the module that uses these geometries.

Each geometry layer only stores one type of geometric primitives. If more
primitives are needed, multiple layers may be stacked in the corresponding modules.

The following geometric primitives can be used:

- [Positions](#positions)
- [Lines](#lines)
- Polygons and Meshes:
    - [Ring-based Polygons](#ring-based-polygons)
    - [Triangulated Polygons and Meshes](#triangulated-polygons-and-meshes)

!*/

rule_group GeometryLayerRules
{
  /*!
  Ignore z-level for 2D Geometries:

  If the geometries stored in `GeometryLayer` are 2-dimensional,
  `coordShiftZ` shall be set but is ignored.
  !*/

  rule "core-0aqoek";

  /*!
  Usage of Empty `GeometryType`:

  The empty prototype declaration `GeometryType` shall be used in template
  instantiations that do not use geometry types.
  !*/

  rule "core-0eoe2j";

  /*!
  Usage of Empty `GeometryId`:

  The empty prototype declaration `GeometryId` shall be used in template
  instantiations that do not use geometry IDs.
  !*/

  rule "core-0fm0mo";
};

/** Stores geometries and maps them to geometry IDs. */
struct GeometryLayer<GEOMETRY_ID, GEOMETRY_TYPE>(GeometryLayerType type, bool hasIds, bool hasTypes)
{
  /** Coordinate shift for longitude and latitude values. */
  CoordShift coordShiftXY;

  /** Coordinate shift for elevation values. */
  CoordShift coordShiftZ;

align(8):
  /**
    * Number of geometries stored in the layer. Also acts as implicit index for
    * mapping geometry IDs to the elements stored in the buffers.
    */
  varsize numElements;

  /** Optional list of geometry IDs inside the layer. */
  packed GEOMETRY_ID identifier[numElements] if hasIds;

align(8):
  /** Optional list of geometry types mapped to the geometries. */
  packed GEOMETRY_TYPE types[numElements] if hasTypes;

align(8):
  /** Buffer structures for the geometries. */
  Buffers(type, coordShiftXY, coordShiftZ, numElements) buffers;
};

/** Type of geometries stored in the layer. */
enum uint8 GeometryLayerType
{
  /** List of 2-dimensional positions. */
  POSITION_2D,

  /** List of 3-dimensional positions. */
  POSITION_3D,

  /** 2-dimensional lines using non-indexed storage. */
  LINE_2D,

  /** 3-dimensional lines using non-indexed storage. */
  LINE_3D,

  /** Triangulated 2-dimensional polygons using indexed storage. */
  POLYGON_2D,

  /** Triangulated 3-dimensional polygons using indexed storage. */
  POLYGON_3D,

  /** Triangulated 3-dimensional meshes using indexed storage. */
  MESH_3D,

  /** Non-triangulated 2-dimensional simple polygons using non-indexed storage. */
  SIMPLE_POLYGON_2D,

  /**
    * Sets of non-triangulated 2-dimensional simple polygons using non-indexed
    * storage.
    */
  SIMPLE_POLYGON_SET_2D,
};

/**
  * Choice of buffers for the different geometry types described in the layer
  * type.
  */
choice Buffers(GeometryLayerType type, CoordShift shiftXY, CoordShift shiftZ, varsize numElements) on type
{
  /** List of 2-dimensional positions. */
  case POSITION_2D:
          packed Position2D(shiftXY) positions2D[numElements];

  /** List of 3-dimensional positions. */
  case POSITION_3D:
          packed Position3D(shiftXY, shiftZ) positions3D[numElements];

  /** 2-dimensional lines using non-indexed storage. */
  case LINE_2D:
          Line2D(shiftXY) lines2D[numElements];

  /** 3-dimensional lines using non-indexed storage. */
  case LINE_3D:
          Line3D(shiftXY, shiftZ) lines3D[numElements];

  /** Triangulated 2-dimensional polygons using indexed storage. */
  case POLYGON_2D:
          Polygon2DBuffers(shiftXY, numElements) polygons2D;

  /** Triangulated 3-dimensional polygons using indexed storage. */
  case POLYGON_3D:
          PolyMesh3DBuffers(shiftXY, shiftZ, numElements, PolyMesh3DType.POLYGON) polygons3D;

  /** Triangulated 3-dimensional meshes using indexed storage. */
  case MESH_3D:
          PolyMesh3DBuffers(shiftXY, shiftZ, numElements, PolyMesh3DType.MESH) meshes3D;

  /** Non-triangulated 2-dimensional simple polygons using non-indexed storage. */
  case SIMPLE_POLYGON_2D:
          SimplePolygon2D(shiftXY) simplePolygons2D[numElements];

  /**
    * Non-triangulated 2-dimensional sets of simple polygons using non-indexed
    * storage.
    */
  case SIMPLE_POLYGON_SET_2D:
          SimplePolygonSet2D(shiftXY) simplePolygonSets2D[numElements];
};

/** Empty prototype declaration for geometry types. */
subtype Empty GeometryType;

/** Empty prototype declaration for geometry IDs. */
subtype Empty GeometryId;

/*!

## Coordinates

NDS coordinates comprise both actual geographic coordinates as well as
coordinate differences. Coordinates are stored according to WGS 84, see [Using
NDS Live > Architecture > Coordinate
Encoding](https://developer.nds.live/using-nds.live/architecture/coordinate-encoding).

The full resolution of NDS coordinates is 31 bit, plus one sign bit. To
statically reduce the resolution to the required level, coordinates can be
shifted to the right using coordinate shift. Before reading, the values have to
be shifted back to the left. Values for coordinate shift are defined once per
geometry layer.

Coordinate payload can further be reduced via coordinate width. Coordinate width
limits the size of a coordinate dynamically to a chosen number of bits.

The following picture shows an example of how coordinate shift and coordinate
width are used to reduce coordinate payload. The coordinate is in a layer that
does not require the level of detail encoded in the last 4 bits. Thus, the
coordinate is shifted 4 bits to the right. Furthermore, the coordinate is part
of a position buffer in which the most significant byte is never used. The
coordinate width is therefore limited to 20 bits.

![Coordinate shift and coordinate
width](assets/geometry-coordinate-shift-width.png)

!*/

/** Longitude in NDS coordinates. */
subtype int32 Longitude;

/** Latitude in NDS coordinates. */
subtype int32 Latitude;

/** Elevation in cm above or below WGS 84 reference ellipsoid. */
subtype varint32 Elevation;

/** Longitudinal delta to other longitude. */
subtype Longitude DeltaLongitude;

/** Latitudinal delta to other latitude. */
subtype Latitude DeltaLatitude;

/** Elevation delta to other elevation. */
subtype Elevation DeltaElevation;

/** Number of bits to shift coordinate values to reduce precision. */
subtype bit:5 CoordShift;

/**
  * Number of bits to encode a coordinate after coordinate shift has been
  * applied.
  */
subtype bit:5 CoordWidth;

/*!

## Map Projection Method

The map projection method defines how to place images such as orthoimages
or terrain models on the earth's surface.

The WGS 84 projection georeferences points on the earth's surface to WGS 84
coordinates. Image data is resampled to geographical areas of an appropriate level,
depending on coverage and pixel resolution. The resampling process also
resolves distortions that can result from the fact that the west-to-east
distance in meters decreases with increasing latitude. Because one pixel
of an image corresponds to a distance in WGS 84 degrees and not in meters,
a tile corresponds to a trapezoid rather than a rectangle on the earth's surface.
This effect increases from equator towards the poles.

The Web Mercator projection preserves angles and has distortion only towards the
poles. For this reason, many applications transform WGS 84 data to Web Mercator for
map display. Storing images directly with Web Mercator projection enhances map
display performance for such applications.

!*/

/** Map projection methods according to the EPSG Geodetic Parameter Dataset. */
enum uint8 MapProjectionMethod
{
  /** WGS 84 projection, defined by EPSG:4326. */
  WGS_84_EPSG_4326,

  /** Web Mercator Projection, defined by EPSG:3857. */
  WEB_MERCATOR_EPSG_3857,
};

/*!

## Positions

Geographic positions can be stored as 2-dimensional values or as 3-dimensional
values, including elevation. Geographic positions are either defined as
absolute positions or as offset positions.

Geographic positions are stored in position buffers. Position buffers store
positions as offset positions relative to an absolute base position.

The following picture illustrates the principle behind position buffers:

![Position buffer](assets/geometry-position-buffers.png)

!*/

/**
  * Absolute 2-dimensional geographic position using NDS coordinates.
  * 2-dimensional positions are encoded with variable size.
  * Coordinate shift is applied.
  */
struct Position2D(CoordShift shift)
{
  /** Longitude. */
  int<(31-shift) + 1> longitude;

  /** Latitude. */
  int<(31-shift) + 1> latitude;

  /** Shift longitude value back to the left. */
  function Longitude lon()
  {
    return (longitude << shift);
  }

  /** Shift latitude value back to the left. */
  function Latitude lat()
  {
    return (latitude << shift);
  }
};

/**
  * 2-dimensional offset position using NDS coordinates.
  * Coordinate shift is applied.
  */
struct PositionOffset2D(CoordWidth numBits, CoordShift shift)
{
  /** Longitudinal delta to base geographic position. */
  int<numBits + 1> deltaLongitude;

  /** Latitudinal delta to base geographic position. */
  int<numBits + 1> deltaLatitude;

  /** Shift longitude value back to the left. */
  function DeltaLongitude lon()
  {
    return deltaLongitude << shift;
  }

  /** Shift latitude value back to the left. */
  function DeltaLatitude lat()
  {
    return deltaLatitude << shift;
  }
};

/** Absolute 3-dimensional geographic position using NDS coordinates.
  * 3-dimensional positions are encoded with variable size.
  * Coordinate shift is applied.
*/
struct Position3D(CoordShift shiftXY, CoordShift shiftZ)
{
  /** Longitude. */
  int<(31-shiftXY) + 1> longitude;

  /** Latitude. */
  int<(31-shiftXY) + 1> latitude;

  /** Elevation in cm above/below WGS 84 reference ellipsoid. */
  int<31-shiftZ + 1> elevation;

  /** Shift longitude value back to the left. */
  function Longitude lon()
  {
    return longitude << shiftXY;
  }

  /** Shift latitude value back to the left. */
  function Latitude lat()
  {
    return latitude << shiftXY;
  }

  /** Shift elevation value back to the left. */
  function Elevation ele()
  {
    return elevation << shiftZ;
  }
};

/**
  * 3-dimensional offset position using NDS coordinates.
  * Coordinate shift is applied.
  */
struct PositionOffset3D(CoordWidth numBitsXY, CoordWidth numBitsZ, CoordShift shiftXY, CoordShift shiftZ)
{
  /** Longitudinal delta to base geographic position. */
  int<numBitsXY + 1> deltaLongitude;

  /** Latitudinal delta to base geographic position. */
  int<numBitsXY + 1> deltaLatitude;

  /** Elevation delta to base geographic position. */
  int<numBitsZ + 1> deltaElevation;

  /** Shift longitude value back to the left. */
  function DeltaLongitude lon()
  {
    return deltaLongitude << shiftXY;
  }

  /** Shift latitude value back to the left. */
  function DeltaLatitude lat()
  {
    return deltaLatitude << shiftXY;
  }

  /** Shift elevation value back to the left. */
  function DeltaElevation ele()
  {
    return deltaElevation << shiftZ;
  }
};

/*!

## Lines

Lines are stored as lists of positions ordered from start to end of the line.

Lines can be 2-dimensional or 3-dimensional, in which case they include elevation.

!*/

rule_group LineRules
{
  /*!
  Start and End Positions in `LineRangeUnchecked`:

  The start and end positions of an unchecked line range shall be within the
  bounds of the referenced line's position indexes.
  !*/

  rule "core-0hkj8x";
};

/**
  * 2-dimensional line using NDS coordinates.
  * Coordinate shift is applied to all positions.
  */
  struct Line2D(CoordShift shift)
  {
    /** Number of positions in the line. */
    varsize numPositions : numPositions > 0;

    /** List of positions. */
    packed Position2D(shift) positions[numPositions];

    /**
      * Returns the index of the last position of the line.
      * Can be used for range checks.
      */
    function varsize lastPositionIdx()
    {
      return (numPositions - 1);
    }
  };

  /** Position on a line geometry with an offset from the underlying geometry. */
  struct LinePositionOffset2D(CoordShift shift)
  {
    /** Position after which the offset position has to be inserted. */
    LinePosition linePosition;

    /** Coordinate width of the offset position. */
    CoordWidth numBits;

    /** Offset to the position at `linePosition`. */
    PositionOffset2D(numBits, shift) offset;
  };

  /**
    * 3-dimensional line using NDS coordinates.
    * Coordinate shift is applied to all positions.
    */
  struct Line3D(CoordShift shiftXY, CoordShift shiftZ)
  {

    /** Number of positions in the line. */
    varsize numPositions : numPositions > 0;

    /** List of positions. */
    packed Position3D(shiftXY, shiftZ) positions[numPositions];

    /**
      * Returns the index of the last position of the line.
      * Can be used for range checks.
      */
    function uint32 lastPositionIdx()
    {
      return numPositions - 1;
    }
  };

  /** Position on a 3D line geometry with an offset from the underlying geometry. */
  struct LinePositionOffset3D(CoordShift shiftXY, CoordShift shiftZ)
  {
    /** Position after which the offset position has to be inserted. */
    LinePosition linePosition;

    /** Coordinate width of the offset position's lat/lon. */
    CoordWidth numBitsXY;

    /** Coordinate width of the offset position's height. */
    CoordWidth numBitsZ;

    /** Offset to the position at `linePosition`. */
    PositionOffset3D(numBitsXY, numBitsZ, shiftXY, shiftZ) offset;
  };

  /** A position on a 2D or 3D line. Starts with index 0 == p0. */
  subtype varsize LinePosition;

/*!

### Line Ranges

Ranges on a line are described using the index of a start position and the
index of an end position. Start position and end position are included in the
range.

!*/

/** Range on a 2-dimensional line. The end position is checked. */
struct LineRange2D(Line2D line)
{
  /** Index of start position on the line. */
  LinePosition start;

  /** Index of end position on the line. */
  LinePosition end : end > start
                  && end <= line.lastPositionIdx();
};

/** Range on a 3-dimensional line. The end position is checked. */
struct LineRange3D(Line3D line)
{
  /** Index of start position on the line. */
  LinePosition start;

  /** Index of end position on the line. */
  LinePosition end : end > start
                  && end <= line.lastPositionIdx();
};

/** Range on a line. */
struct LineRangeUnchecked
{
  /** Index of start position on the line. */
  LinePosition start;

  /** Index of end position on the line. */
  LinePosition end : end > start;
};

/** Defines which positions have an offset within a range. */
enum bit:2 RangeOffsetType
{
  /** Only start position has offset. */
  START,

  /** Only end position has offset. */
  END,

  /** Both positions (start, end) have offsets. */
  START_AND_END,
};

/** Range on line geometry with offsets for start and end positions. */
struct LineRangeOffset2D(CoordShift shift)
{
  /** Defines which positions have an offset. */
  RangeOffsetType offsetType;

  /** Coordinate width of the offset position. */
  CoordWidth numBits;

  /** Start position on the line geometry. */
  LinePosition startPosition;

  /** End position on the line geometry. */
  LinePosition endPosition;

  /** Offset to the `startPosition`. */
  PositionOffset2D(numBits, shift) startOffset
                          if offsetType == RangeOffsetType.START
                          || offsetType == RangeOffsetType.START_AND_END;

  /** Offset to the `endPosition`. */
  PositionOffset2D(numBits, shift) endOffset
                          if offsetType == RangeOffsetType.END
                          || offsetType == RangeOffsetType.START_AND_END;
};

/** Range on a 3D line geometry with offsets for start and end positions. */
struct LineRangeOffset3D(CoordShift shiftXY, CoordShift shiftZ)
{
  /** Defines which positions have an offset. */
  RangeOffsetType offsetType;

  /** Coordinate width of the offset position's lon/lat. */
  CoordWidth numBitsXY;

  /** Coordinate width of the offset position's height. */
  CoordWidth numBitsZ;

  /** Start position on the line geometry. */
  LinePosition startPosition;

  /** End position on the line geometry. */
  LinePosition endPosition;

  /** Offset to the `startPosition`. */
  PositionOffset3D(numBitsXY, numBitsZ, shiftXY, shiftZ) startOffset
                          if offsetType == RangeOffsetType.START
                          || offsetType == RangeOffsetType.START_AND_END;

  /** Offset to the `endPosition`. */
  PositionOffset3D(numBitsXY, numBitsZ, shiftXY, shiftZ) endOffset
                          if offsetType == RangeOffsetType.END
                          || offsetType == RangeOffsetType.START_AND_END;
};

/*!

### Line Rings

A ring is a closed line. The last position of the
line is connected to the first position of the line, forming a ring. The
line forming the ring does not intersect itself. There can be 2-dimensional rings
or 3-dimensional rings.

!*/

rule_group LineRingRules
{
   /*!
  No Self-Intersecting Line Rings:

  The line formed by any `Ring2D` or `Ring3D` structure shall not intersect itself.
  !*/

  rule "core-v55s9c";
};

/** 2-dimensional ring. */
subtype Line2D Ring2D;

/** 3-dimensional ring. */
subtype Line3D Ring3D;

/*!

## Spatial Extent

A spatial extent uses a 2-dimensional bounding box with full coordinate resolution
to roughly describe the position of the feature it is associated with.
All corners of the bounding box are included.

A 2-dimensional bounding polygon describes the spatial extent of
the feature in more detail. The 2-dimensional bounding polygon is described
by an outline (outer ring) and optional inner rings for holes.
All vertices of the outline and the holes are included in the
bounding polygon.

!*/

rule_group SpatialExtentRules
{
  /*!
  No Overlapping Holes in `BoundingPolygon2D`:

  The inner rings of the holes in the bounding polygon shall not intersect or touch
  each other.
  !*/

  rule "core-sui5pj";

  /*!
  Bounding Polygon in `SpatialExtent` Is Inside of Bounding Box:

  If a bounding polygon is present in a spatial extent, this polygon shall be
  encompassed by the bounding box, that is, all vertices of the bounding
  polygon shall lie within the bounding box.
  !*/

  rule "core-0cu5m7";
};

/** The spatial extent and position of the associated feature. */
struct SpatialExtent
{
  /** Bounding box roughly describing the position of the feature. */
  BoundingBox2D               boundingBox;

  /** Optional bounding polygon describing the spatial extent in more detail. */
  optional BoundingPolygon2D(0)    boundingPolygon;
};

/** 2-dimensional bounding box. All corners are inclusive.
  * No coordinate shift is applied. */
struct BoundingBox2D
{
    /** South-west position of the bounding box. */
    Position2D(0) southWestPosition;

    /** North-east position of the bounding box. */
    Position2D(0) northEastPosition;
};

/** 2-dimensional bounding polygon. */
struct BoundingPolygon2D(CoordShift shift)
{
  /** Outer ring describing the outline. */
  Ring2D(shift) outline;

  /** True if the bounding polygon has holes. */
  bool hasHoles;

  /** Optional list of inner rings to describe holes. */
  Ring2D(shift) holes[] if hasHoles;
};

/*!

## Ring-based Polygons

Polygons based on line rings can be created in 2D or 3D. The following types are
available:

- Simple 2D polygons
- 3-dimensional bounding polygons

### Simple 2D Polygons

A simple polygon is defined by a closed ring of positions that are stored in
counterclockwise order. The line forming the ring does not intersect
itself.

Simple polygons can be stored in simple polygon sets, also called multipolygons.
Simple polygon sets are used to describe more complex shapes that cannot be
described by a single simple polygon, for example, shapes containing holes.

A simple polygon set has one or more outer rings that describe the outlines
and zero or more inner rings that describe holes. The following
applies to the rings in a simple polygon set:

- The positions in outer rings are stored in counterclockwise order.
- The positions in inner rings are stored in clockwise order.
- Outer rings do not intersect each other.
- Inner rings do not intersect each other.
- Outer rings do not intersect inner rings or touch inner rings, and vice versa.

The following figure shows a simple polygon set with two outer rings and one
inner ring. The positions in the outer or inner rings are stored
in counterclockwise or clockwise order, respectively.

![Simple polygon set with outer and inner rings](assets/geometry-simple-polygon-set.png)

!*/

rule_group SimplePolygonRules
{
  /*!
  Storage Order of Line Rings in Simple Polygons:

  The positions within each `Ring2D` structure used in `SimplePolygon2D`
  shall be stored in counterclockwise order.
  !*/

  rule "core-kf2f9t";

  /*!
  Storage Order of Outer Rings in Simple Polygon Sets:

  The positions within each `Ring2D` structure used in `SimplePolygonSet2D.outlines`
  shall be stored in counterclockwise order.
  !*/

  rule "core-mrczd4";

  /*!
  Storage Order of Inner Rings in Simple Polygon Sets:

  The positions within each `Ring2D` structure used in `SimplePolygonSet2D.holes`
  shall be stored in clockwise order.
  !*/

  rule "core-vpqttt";

  /*!
  No Overlapping Outlines in Simple Polygon Sets:

  The lines of the outer rings defined in the list `SimplePolygonSet2D.outlines`
  shall not intersect each other.
  !*/

  rule "core-pu6xhi";

  /*!
  No Overlapping Holes in Simple Polygon Sets:

  The lines of the inner rings defined in the list `SimplePolygonSet2D.holes`
  shall not intersect each other.
  !*/

  rule "core-je720h";

  /*!
  Outer and Inner Rings in Simple Polygon Sets:

  Outer rings defined in the list `SimplePolygonSet2D.outlines`
  shall not intersect inner rings or touch inner rings defined in the list
  `SimplePolygonSet2D.holes`, and vice versa.
  !*/

  rule "core-5sqf75";
};

/** 2-dimensional simple polygon. */
subtype Ring2D SimplePolygon2D;

/** Set of 2-dimensional simple polygons. Also known as multipolygon. */
struct SimplePolygonSet2D(CoordShift shift)
{
  /** List of outer rings describing the outlines of the simple polygon set. */
  Ring2D(shift) outlines[];

  /** Set to `true` if the simple polygon set has holes. */
  bool hasHoles;

  /** List of inner rings describing the holes of the simple polygon set. */
  Ring2D(shift) holes[] if hasHoles;
};

/*!

### 3-Dimensional Bounding Polygons

A 3-dimensional bounding polygon is a planar shape in a 3-dimensional space.
The 3-dimensional bounding polygon is described by an outline (outer ring) and
optional inner rings for holes.

The surface normal of a 3-dimensional polygon describes in which
direction the polygon is facing, but the normal is not stored explicitly for
3D polygons. To find the direction, a plane is formed based on the first three
positions of the bounding polygon using the right-hand rule:

- The first position is at the tip of the first finger.
- The second position is the origin of the NDS coordinate system. For more
  information on the NDS coordinate system, see [Using NDS Live > Architecture >
  Coordinate
  Encoding](https://developer.nds.live/using-nds.live/architecture/coordinate-encoding).
- The third position is at the tip of the second finger.
- The surface normal of the resulting plane points in the direction of the
  thumb.

The following figure illustrates how to apply the right-hand rule to find the
direction that a 3-dimensional polygon is facing.

![Determine the orientation of a 3-dimensional bounding polygon](assets/geometry_3d_polygon.png)

!*/

rule_group BoundingPolygon3DRules
{
  /*!
  No Overlapping Holes in `BoundingPolygon3D`:

  The inner rings of the holes in the bounding polygon shall not intersect or touch
  each other.
  !*/

  rule "core-mpge6n";

  /*!
  `BoundingPolygon3D` is a plane polygon:

  All vertices of the polygon shall lie on one plane.
  !*/

  rule "core-fsxjw4";
};

/** 3-dimensional plane bounding polygon. */
struct BoundingPolygon3D(CoordShift xyShift, CoordShift zShift)
{
  /** Outer ring describing the outline. */
  Ring3D(xyShift, zShift) outline;

  /** True if the bounding polygon has holes. */
  bool hasHoles;

  /** Optional list of inner rings to describe holes. */
  Ring3D(xyShift, zShift) holes[] if hasHoles;
};

/*!

## Triangulated Polygons

Triangulated polygons are polygons that are partitioned into triangles and
stored in buffers. These buffers comprise a position buffer, an index buffer,
and the actual planar polygon or mesh.

The definition of triangulated polygons in NDS.Live is based on the concepts of
the OpenGL standard. The following types of triangulated polygons are available:

- Triangulated 2D polygons: Represent planar objects in a 2-dimensional space,
  such as water areas.
- Triangulated 3D polygons: Represent planar objects in a 3-dimensional space,
  such as sign faces or flat road surfaces.
- Polygon meshes: Represent full 3D objects consisting of vertices, edges, and
  faces. Examples are 3-dimensional boxes or houses.

Triangulated polygons are defined by a range of vertices in the index buffer.
Index buffers are used to allow for the re-use and sorting of vertices.

The following index types are available:

- `TRIANGLES`: Vertices are ordered so that 3 consecutive vertices in the index
  form a simple triangle.
- `TRIANGLE_STRIP`: Every group of 3 adjacent vertices in the index forms a
  triangle. A stream of n vertices forms n-2 triangles, which is a more
  space-efficient method than storing simple triangles. Any two successive
  triangles in the triangle strip share a common edge. A sequence of vertices
  ABCDEF represents a triangle strip where the triangles are composed as
  follows: ABC, BCD, CDE, DEF. The first triangle is stored in face direction,
  following triangles are stored with alternating face direction.
- `TRIANGLE_FAN`: The first vertex is held fixed. From there on, every group of
  2 adjacent vertices forms a triangle with the first.

For 3D polygons, the index type determines whether `PolyMesh3D` represents a
planar polygon or a mesh of non-coplanar polygon faces.

The following figure shows examples of each of the three index types and how to
store the triangle positions in the index buffer.

![Index types and storing of
triangles](assets/geometry-polygon-index-types.png)

Simple triangles as well as the first triangle in a triangle strip or a triangle
fan are always stored with front-facing orientation. In detail, this means:

- In 2D, the vertices are stored with counterclockwise order using the NDS
  coordinate system.
- In 3D, triangles are front-facing if the calculated surface normal points to
  the viewer or if the vertices are stored in counterclockwise order when the
  polygon is projected to 2D space using the NDS coordinate system.

To determine the orientation of a 3D polygon by calculating the surface normal,
the right-hand rule can be applied as follows:

- Index [1] is the origin of the NDS coordinate system.
- The first finger corresponds to the line from [1] to [2].
- The second finger corresponds to the line from [1] to [0].
- The thumb points in the direction of the surface normal of the resulting
  plane.

__Note:__
For more information about the NDS coordinate system, see [Using NDS Live >
Architecture > Coordinate Encoding](https://developer.nds.live/using-nds.live/architecture/coordinate-encoding).

![Orientation of triangles in 3D](assets/geometry-triangle-3D-surface-normal.png)


### Connecting Triangle Strips

Multiple separate triangle strips can be joined by adding degenerate triangles
to bridge the gap:

- Additional indices are added to the index buffer that allow to add degenerate
  triangles in such a way that the first triangle in each triangle strip is
  stored with the correct face direction.
- At least the last vertex in the first triangle strip and the first vertex in
  the next triangle strip have to be duplicated to get the required indices.

The following figure shows how to store three triangle strips with a different
number of triangles that are connected using degenerate triangles.

![Connected triangle strips](assets/geometry-triangle-strip-combined.png)


### Rendering 3D Polygons

To render 3D polygons, applications need to ensure that the orientation of the
triangles is correct. Reading the vertices from the index buffer and calculating
the surface normal result in the same orientation.

The following figure shows in which order the vertices from the index buffer
are drawn to achieve front-facing orientation of the 3D polygons. For example,
a triangle strip that is stored as ABCDEF is rendered in the order ABC, CBD,
CDE, EDF.

![Triangle drawing order](assets/geometry-polygon-drawing-order.png)

!*/

rule_group TriangulatedPolygonRules
{
  /*!
  Storage Order of Simple Triangles in 2D:

  If the index type `TRIANGLE` is used for a triangulated 2D polygon, the
  triangle shall be stored in face direction, that is, the vertices are stored
  in counterclockwise order.
  !*/

  rule "core-nbeett";

  /*!
  Storage Order of Triangle Strips in 2D:

  If the index type `TRIANGLE_STRIP` is used for a triangulated 2D polygon, the
  first triangle shall be stored in face direction, that is, the vertices are
  stored in counterclockwise order. The following triangles shall be stored with
  alternating face direction.
  !*/

  rule "core-p7b7kx";

  /*!
  Storage Order of Triangle Fans in 2D:

  If the index type `TRIANGLE_FAN` is used for a triangulated 2D polygon, all
  triangles shall be stored in face direction, that is, the vertices are stored
  in counterclockwise order.
  !*/

  rule "core-7jait0";
};

/** Buffer for 2-dimensional polygons. */
struct Polygon2DBuffers(CoordShift shift, varsize numElements)
{
  /** Number of positions in the position buffer. */
  varsize numPositions;

  /** All positions of the buffer. */
  packed Position2D(shift) positions[numPositions];

  /** Index that points to the positions buffer. */
  IndexBuffer(numPositions) indexBuffer;

  /** Polygons are described by ranges on the index buffer. */
  packed Polygon2D(indexBuffer) polygons[numElements];
};

/** Buffer for 3-dimensional polygons or meshes. */
struct PolyMesh3DBuffers(CoordShift shiftXY, CoordShift shiftZ, varsize numElements, PolyMesh3DType type)
{
  /** Number of positions in the position buffer. */
  varsize numPositions;

  /** All positions of the buffer. */
  packed Position3D(shiftXY, shiftZ) positions[numPositions];

  /** Index that points to the positions buffer. */
  IndexBuffer(numPositions) indexBuffer;

  /** Polygons or meshes are described by ranges on the index buffer. */
  packed PolyMesh3D(indexBuffer, type) polymeshes[numElements];
};

/** 2-dimensional polygon. */
struct Polygon2D(IndexBuffer ib)
{
  /** Index type describing the order of the range in the index buffer. */
  IndexType indexType;

  /** 
    * Start index within the index buffer. 
    * The start index refers to the first position of the polygon. 
    */
  varsize startIndex;

  /** 
    * Number of entries in the index buffer that describe the polygon, 
    * including the start position.
    * (`startIndex`+`numPositions` - 1) refers to the last position of the polygon.
    */
  varsize numPositions : (startIndex + numPositions) <=  ib.numEntries
                      && numPositions > 0;

  /** Returns the index of the last position of the polygon. */
  function varsize lastPositionIdx()
  {
    return (startIndex + numPositions - 1);
  }
};

/** 3-dimensional polygon or mesh. */
struct PolyMesh3D(IndexBuffer ib, PolyMesh3DType type)
{
  /** Index type describing the order of the range in the index buffer. */
  IndexType indexType;

  /** 
    * Start index within the index buffer. 
    * The start index refers to the first position of the polygon. 
    */
  varsize startIndex;

  /** 
    * Number of entries in the index buffer that describe the polygon, 
    * including the start position.
    * (`startIndex`+`numPositions` - 1) refers to the last position of the polygon.
    */
  varsize numPositions : (startIndex + numPositions) <= ib.numEntries
                      && numPositions > 0;

  function bool isPlanar()
  {
    return (type == PolyMesh3DType.POLYGON) ? true : false;
  }

  /** Returns the index of the last position of the polygon. */
  function varsize lastPositionIdx()
  {
    return (startIndex + numPositions - 1);
  }
};

/** The index buffer maps positions to triangle strips, fans, etc. */
struct IndexBuffer(varsize positionBufferSize)
{
  /** Number of entries in the index buffer. */
  varsize numEntries;

  /** Index of the entry into the vertex buffer. */
  packed IndexBufferEntry(positionBufferSize) indices[numEntries];
};

/** The index type describes how the index buffer is ordered. */
enum uint8 IndexType
{
  /** Indices are ordered so that 3 consecutive indices form one triangle. */
  TRIANGLES,

  /** Indices are ordered using triangle strips. */
  TRIANGLE_STRIP,

  /** Indices are ordered using triangle fan ordering. */
  TRIANGLE_FAN,
};

/** Defines whether the object is a planar polygon or a mesh of polygon faces. */
enum uint8 PolyMesh3DType
{
  /** Planar polygon. */
  POLYGON,

  /** Mesh, where at least 2 faces are not coplanar. */
  MESH,
};

/** Entry in the index buffer with range check. */
struct IndexBufferEntry(varsize positionBufferSize)
{
  bit<numbits(positionBufferSize)> index : index < positionBufferSize;
};
