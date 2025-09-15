/*!

# Lane Boundaries

This package defines lane boundaries, including their physical properties
like width, color, or type.

**Dependencies**

!*/

package lane.boundaries;

import core.types.*;
import core.geometry.*;
import lane.reference.types.*;

import lane.types.*;

/*!

Each lane has a list of directed references to boundaries on its left and on its
right side. The boundary references are stored within the lane layer. Each
boundary object has an ID and contains a reference to a boundary geometry. In
general, a dedicated boundary geometry is provided for each boundary object. The
following figure shows a lane with two boundaries, one on each side of lane 1.

![Lane with two boundaries](assets/boundaries_introduction.png)

Parallel boundary lines are stored as separate boundary objects, regardless of
whether a meaning is derived from the combination of the two lines. For example,
two boundaries are stored for a double-solid line.

The following figure shows the lane boundary definitions for the parallel
boundaries between two lanes, lane 201 and lane 101. There are two boundary
objects and each boundary object has its own ID and a reference to a dedicated
boundary geometry. The figure also shows that each boundary object consists of
two parts with different boundary elements, a solid line and a dashed line.
These parts are defined in lane boundary elements, see [Lane Boundary Element
Definitions](#lane-boundary-element-definitions).

![Two boundaries with two boundary geometries](assets/boundaries_geometry-per-boundary.png)

Even though storing separate boundary geometries for each boundary object is the
preferred method, it is technically possible to reference the same boundary
geometry in two parallel boundary objects. However, in this case it is
impossible to determine how far apart the two parallel lines are. Therefore,
this option should only be used if dedicated boundary geometries cannot be
provided for each boundary object. The following figure shows the same scenario
as before, but with only one boundary geometry that is referenced by both
boundary objects.

![Lane boundaries](assets/boundaries_one-geometry-for-all-boundaries.png)

!*/

rule_group LaneBoundaryRules
{
  /*!
  Mapping Direction of Element Ranges in Lane Boundaries:

  The element ranges in `Boundary.boundaryElementRanges` shall be mapped in
  digitization direction of the boundary geometry, that is, from the start
  of the line to the end of the line.
  !*/

  rule "lane-2qx0xk";

  /*!
  No Overlapping Element Ranges in Lane Boundaries:

  To store parallel boundaries of different types using one common geometry,
  separate `Boundary` objects shall be used that refer to the same boundary
  geometry.

  !*/

  rule "lane-mu7m0p";

};

/**
  * Describes a lane boundary, including a reference to the boundary
  * geometry and a list of boundary elements.
  */
struct Boundary
{
  /** Identifier of the lane boundary. */
  BoundaryId id;

  /** Reference to a boundary geometry. */
  BoundaryGeometryReference geometryReference;

  /** List of boundary elements mapped onto a range of the lane boundary. */
  BoundaryElementRange boundaryElementRanges[] : lengthof(boundaryElementRanges) > 0;
};

/*!

## Lane Boundary Element Definitions

A lane boundary may consist of multiple elements, which are stored in a boundary
element list. That way, sequential parts of a boundary can have different
properties, for example, a solid line followed by a dashed line.

Boundary elements are defined once and are reused using their identifier.

`BoundaryElement` defines the properties of a specific lane boundary element,
for example, its type, width, color, or material. The following types are
available:

- [Logical Boundary Elements](#logical-boundary-elements)
- [Marking Boundary Elements](#marking-boundary-elements)
- [Physical Divider Boundary Elements](#physical-divider-boundary-elements)
- [Physical Marking Boundary Elements](#physical-marking-boundary-elements)

If a boundary geometry is available, the boundary elements are mapped to
positions on that boundary. If no boundary geometry is available, boundary
elements are mapped to the lane center line geometry using boundary sets, see
[Boundary Sets](#boundary-sets).

The following figure shows the boundary elements that are stored for boundary
17, which has a reference to a boundary geometry. The boundary elements are
mapped to line positions on the boundary geometry.

![Boundary elements with geometry](assets/boundary_elements.png)

!*/

/** List of boundary elements that are mapped to ranges on a lane boundary. */
struct BoundaryElementDefinitions
{
    /** List of lane boundary elements. */
    BoundaryElement boundaryElementList[];
};

/**
  * Defines the type of a specific lane boundary element and, depending on the type,
  * further properties like width, color, or material.
  */
struct BoundaryElement
{
    /** Identifier of the lane boundary element. */
    BoundaryElementId    id;

    /** Type of the lane boundary element. */
    BoundaryElementType  type;

    /** Boundary details based on the type of the lane boundary. */
    BoundaryElementDetails(type) details;
};

choice BoundaryElementDetails(BoundaryElementType type) on type
{
  case LOGICAL:
          LogicalBoundaryElement logicalElement;

  case MARKING:
          MarkingBoundaryElement markingElement;

  case PHYSICAL_DIVIDER:
          PhysicalDividerBoundaryElement physicalDividerElement;

  case PHYSICAL_MARKING:
          PhysicalMarkingBoundaryElement physicalMarkingElement;
};

struct BoundaryElementRange
{
  /** Identifier of the boundary element. */
  BoundaryElementId boundaryElementId;

  /** Range on the lane boundary for which the boundary element is valid. */
  BoundaryGeometryRange range;
};


/*!

### Logical Boundary Elements

Logical boundary elements are only described by a type. This type describes
the logical meaning of the boundary. For more information on the available types,
see [Lane Types](types.zs).

!*/

/**
  * Boundary element that is only described by its logical meaning, for example,
  * the logical end of the road surface.
  */
struct LogicalBoundaryElement
{
  /** Type of logical boundary. */
  LogicalBoundaryType type;
};

/*!

### Marking Boundary Elements

Marking boundary elements represent painted line markings on the
road surface. They have a type, a material, a color, and geometry information,
such as the width, the length of dashes, or the spacing between dashes.
For more information on the available types, materials, and colors,
see [Lane Types](types.zs).

For dashed marking boundary elements, additional details can be modeled,
for example, the length of the dashes and whether the painted marking starts or
ends with a space. For example, this information is important to determine
whether the boundary element for a dashed line starts at the first painted dash
or at the end of the previous marking boundary element. This is demonstrated
in the following figure, which shows a solid marking boundary element that is
followed by a marking boundary element for a line with dashed blocks and spaces
at the start and the end. The third marking boundary element is a dashed line
with no space at the start.

![Marking boundary elements with space at start and end](assets/boundary_dashed_start_end.png)

!*/

/**
  * Boundary element that describes a marking, including detailed information
  * such as type, material, color, and width.
  */
struct MarkingBoundaryElement
{
  /** Type of the marking boundary. */
  MarkingBoundaryType type;

  /** Material of the marking boundary. */
  MarkingMaterial material;

  /** Color of the marking boundary. */
  MarkingColor color;

  /** Width of the marking boundary. */
  BoundaryWidth width;

  /** Detailed information on the boundary marking dashes. */
  BoundaryMarkingDashDetails dashDetails
                    if type == MarkingBoundaryType.DASHED_LINE
                    || type == MarkingBoundaryType.DASHED_BLOCKS;
};

/** Detailed information on boundary marking dashes, like length and spacing. */
struct BoundaryMarkingDashDetails
{
  /** Length of the marking boundary dashes. */
  BoundaryMarkingDashLength dashLength;

  /** Spacing between the boundary marking dashes. */
  BoundaryMarkingDashSpacing dashSpacing;

  /** Set to `true` if the boundary marking starts with a space. */
  bool spaceAtStart if dashSpacing != UNKNOWN_MARKING_DASH_SPACING;

  /** Set to `true` if the boundary marking ends with a space. */
  bool spaceAtEnd if dashSpacing != UNKNOWN_MARKING_DASH_SPACING;
};

/*!

### Physical Divider Boundary Elements

Physical divider boundary elements represent physical barriers. These barriers are
projected to the ground and have a type, a material, and a width.
For more information on the available types and materials,
see [Lane Types](types.zs).

!*/

/**
  * Boundary element that describes a physical divider, including detailed
  * information such as type, material, and width.
  */
struct PhysicalDividerBoundaryElement
{
  /** Type of the physical divider boundary. */
  PhysicalDividerBoundaryType type;

  /** Material of the physical divider boundary. */
  PhysicalBoundaryMaterial material;

  /** Width of the physical divider boundary. */
  BoundaryWidth width;
};

/*!

### Physical Marking Boundary Elements

Physical marking boundary elements represent physical markings. These are
projected to the ground and have a type, a material, and a width.
For more information on the available types and materials,
see [Lane Types](types.zs).

!*/

/**
  * Boundary element that describes a physical marking, including detailed information such as type, material, and width.
  * Examples: Pylons or delineator posts.
  */
struct PhysicalMarkingBoundaryElement
{
  /** Type of the physical marking boundary. */
  PhysicalMarkingBoundaryType type;

  /** Material of the physical marking boundary. */
  PhysicalBoundaryMaterial material;

  /** Width of the physical marking boundary. */
  BoundaryWidth width;
};


/*!

## Boundary Sets

For each side of a lane, there is a list of boundary sets that are ordered
sequentially along the corresponding side of the lane. Each boundary set in the
list contains references to one or more parallel boundaries along a part of that
lane. Boundary sets are cut each time that the type of one or more lane
boundaries changes, that is, when a boundary element starts or ends.

Lane boundaries do not need to be cut to fit the ranges of boundary sets. A
boundary set is valid from its start position (included) on the lane center line
to the start position of the next boundary set (excluded). The last boundary set
in the list is valid until the end of the lane.

Depending on the availability of boundary geometries, a boundary set contains
direct references to boundary objects or boundary elements:

- If boundary geometries are available, a boundary set contains directed
  references to parallel lane boundaries that are ordered from lane center to
  the outside of the lane. Each reference contains a position that indicates
  where the boundary set starts on the boundary geometry, regardless of the
  digitization direction of the boundary geometry. Based on the boundary ID and
  the position on the geometry, the application can find the corresponding
  boundary element, which includes the type of the boundary element and provides
  additional details.
- If no boundary geometries are available, a boundary set contains references to
  boundary elements instead.

**Example: Boundary Set with Boundary Geometries**

The boundary sets in the following figure represent the left side of lane 101
and the left side of lane 201. Depending on the digitization direction of the
boundaries, the references are stored in positive or negative direction. The
boundary sets are cut on both lanes each time that a boundary starts or ends.

![Boundary sets with boundary geometry](assets/boundary_sets.png)

Because a lane boundary can extend over multiple boundary sets, the application
sometimes needs to know the range on the geometry of a lane boundary that is
covered by a boundary set. For that, the application needs to determine the
position on the boundary geometry that corresponds to the end position of the
boundary set. This is described in detail in [Boundary Sets – Determine the End
Position on a Boundary Geometry](examples.zs).


**Example: Boundary Set without Boundary Geometries**

The boundary sets in the following figure represent the left side of lane 101
and the left side of lane 201. The boundary sets directly reference the
corresponding boundary elements. The boundary sets are cut on both lanes each
time that a boundary element starts or ends.

![Boundary sets without boundary geometry](assets/boundary_sets_no_geometries.png)

!*/

rule_group BoundarySetRules
{
  /*!
  Cutting of Boundary Sets:

  Boundary sets with and without boundary geometries shall be cut each time a new
  boundary or boundary element starts or ends. Applies to `boundariesWithStartPosition`
  if boundary geometries are available or to `boundaryTypes` if no boundary
  geometries are available.
  !*/

  rule "lane-02noak";

  /*!
  Ordering of Boundary Sets:

  Lane boundary elements inside a boundary set shall be ordered from the inside
  to the outside of the lane. If boundary geometries are available, the lane
  boundary elements correspond to the referenced boundaries in
  `boundariesWithStartPosition`. If no boundary geometries are available, the
  lane boundary elements are referenced in `boundaryTypes`.
  !*/

  rule "lane-03y200";

  /*!
  Matching Reference Positions:

  If a boundary set references the same boundary geometry multiple times, the
  reference positions on this geometry shall match.
  !*/

  rule "lane-a6swy8";

  /*!
  Start Position of Boundary Set:

  The start position of the first boundary set of a lane shall have the value 0.
  !*/

  rule "lane-7dw5qd";

};

/**
  * Set of parallel lane boundary parts along a lane.
  * Contains directed references to lane boundaries or references to boundary
  * elements.
  */
struct BoundarySet(bool hasGeometry)
{
  /**
    * Position on the lane where the boundary set starts.
    * The set is valid from this start position (included) to the start position
    * of the next boundary set (excluded). The last boundary set in the list of
    * boundary sets is valid until the end of the lane (included).
    */
  LaneGeometryPosition startPosition;

  /**
    * References to lane boundaries ordered from inside to outside of the lane
    * if boundary geometries are available. `BoundaryReferenceWithPosition.position`
    * indicates where the boundary set starts on the boundary geometry. Based
    * on the position, the corresponding lane boundary elements are found.
    */
  BoundaryReferenceWithPosition boundariesWithStartPosition[] if hasGeometry;

  /**
    * Lane boundary elements ordered from inside to outside of the lane if
    * no boundary geometries are available.
    */
  BoundaryElementId boundaryTypes[] if !hasGeometry;
};

/** Reference to a boundary geometry including a position on the boundary geometry.*/
struct BoundaryReferenceWithPosition
{
  /** Reference to a lane boundary. */
  BoundaryReference reference;

  /** Position on the geometry of the referenced boundary. */
  BoundaryGeometryPosition position;
};

/*!
## Basic Subtypes

The following subtypes are used in the Lane Boundary package.

!*/

/** Identifier of a boundary geometry. */
subtype Var4ByteId BoundaryGeometryId;

/** Identifier of a lane boundary. */
subtype Var4ByteId BoundaryId;

/** Directed reference to a lane boundary. */
subtype Var4ByteDirectedReference BoundaryReference;

/** Reference to a boundary geometry. */
subtype BoundaryGeometryId BoundaryGeometryReference;

/** Width of a lane boundary. */
subtype WidthCentimeters BoundaryWidth;

/** Width of boundary is unknown. */
const BoundaryWidth UNKNOWN_BOUNDARY_WIDTH = 0;

/** Length of a marking boundary dash. */
subtype LengthCentimeters BoundaryMarkingDashLength;

/** Length of boundary marking dashes is unknown. */
const BoundaryMarkingDashLength UNKNOWN_MARKING_DASH_LENGTH = 0;

/** Spacing between two dashes of a marking boundary. */
subtype LengthCentimeters BoundaryMarkingDashSpacing;

/** Spacing between two dashes of a marking boundary is unknown. */
const BoundaryMarkingDashSpacing UNKNOWN_MARKING_DASH_SPACING = 0;

/** Identifier of a lane boundary element. */
subtype varuint16 BoundaryElementId;

/** Position on a boundary geometry. */
subtype LinePosition BoundaryGeometryPosition;
