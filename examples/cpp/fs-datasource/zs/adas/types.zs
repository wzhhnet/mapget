/*!

# ADAS Types

This package defines the types that are used for ADAS attributes
and attribute properties.

**Dependencies**

!*/

package adas.types;

import road.reference.types.*;
import lane.reference.types.*;
import core.types.*;
import core.geometry.*;
import core.location.*;

/*!

## ADAS Geometry

ADAS geometry is the geometry of a road that is used to assign ADAS attributes.
In contrast to the positions of road, road location, or lane geometries, ADAS
geometry is stored with ADAS precision as needed by the attributes. The ADAS
geometry is independent of the feature geometry and can contain different
positions than the geometry of a road, road location, or lane.

The following figure illustrates the difference between ADAS geometries and
regular feature geometries. In this example, the ADAS geometry has more positions
than the road geometry. These positions are used to assign slope and curvature
values.

![ADAS geometry](assets/types-adas-geometry.png)

Whether an ADAS attribute refers to a position on the ADAS geometry or to a
position on the feature geometry depends on the attribute map type, for example:

- If stored in `adasRoadGeometryAttributeMaps`, then the
  `AdasGeometryPosition` of the ADAS attribute refers to the road geometry
  provided with the road.
- If stored in `adasRoadAttributeMaps`, then the `AdasGeometryPosition` of the
  ADAS attribute refers to an ADAS geometry.

At lane level, ADAS geometry can be used to assign attributes to complete lane
groups, sets of lanes within a lane group, or individual lanes. Example: An
artificial road lane group with two exit lanes and three normal lanes uses one
ADAS geometry to assign ADAS lane attributes to the exit lanes.

!*/

rule_group AdasGeometryRules
{
  /*!
  Road Attributes Using ADAS Geometry:

  Every `AdasGeometryPosition` used by ADAS road attributes in
  `adasRoadAttributeMaps` shall refer to the `AdasGeometry` that is associated
  with that road.
  !*/

  rule "adas-039awe";

  /*!
  Road Attributes Using Road Geometry:

  Every `AdasGeometryPosition` used by ADAS road attributes in
  `adasRoadGeometryAttributeMaps` shall refer to the geometry of the associated
  road.
  !*/

  rule "adas-z4tnx8";

  /*!
  Lane Attributes Using ADAS Geometry:

  Every `AdasGeometryPosition` used by ADAS lane attributes in
  `adasLaneAdasGeometryAttributeMaps` shall refer to the `AdasGeometry` that is
  associated with that lane.
  !*/

  rule "adas-nybocz";

  /*!
  Lane Attributes Using Lane Geometry:

  Every `AdasGeometryPosition` used by ADAS lane attributes in
  `adasLaneAttributeMaps` shall refer to the geometry of the associated lane.
  !*/

  rule "adas-03ufw8";

  /*!
  Direction of ADAS Geometry:

  The ADAS geometry of a road shall have the same digitization direction as the
  corresponding road geometry.
  !*/

  rule "adas-20nv7n";
};

/** List of ADAS geometries for roads. */
struct AdasGeometryList(CoordShift shift)
{

  /** Number of road references that have ADAS geometry assigned. */
  varsize numRoadReferences;

  /** List of references to roads. ADAS geometry is always valid for both directions. */
  RoadId   road[numRoadReferences];

  /** List of ADAS geometries using the provided precision. */
  Line2D(shift)  adasGeometry[numRoadReferences];
};

/** List of ADAS geometries for road locations. */
struct AdasRoadLocationGeometryList(CoordShift shift)
{
  /** Number of road location references that have ADAS geometry assigned. */
  varsize numRoadLocationReferences;

  /** List of references to road locations. ADAS geometry is always valid for both directions. */
  RoadLocationId roadLocation[numRoadLocationReferences];

  /** List of ADAS geometries using the provided precision. */
  Line2D(shift) adasGeometry[numRoadLocationReferences];
};

/** List of ADAS geometries for complete lane groups. */
struct AdasLaneGroupGeometryList(CoordShift shift)
{
  /** Number of lane group references that have ADAS geometry assigned. */
  varsize numLaneGroupReferences;

  /** List of references to lane groups. ADAS geometry is always valid for both directions. */
  LaneGroupId laneGroup[numLaneGroupReferences];

  /** List of ADAS geometries using the provided precision. */
  Line2D(shift) adasGeometry[numLaneGroupReferences];
};

/** List of ADAS geometries for individual lanes or sets of lanes. */
struct AdasLaneGeometryList(CoordShift shift)
{
  /** Number of ADAS geometries assigned to lanes or sets of lanes. */
  varsize numAdasGeometries;

  /** List of references to lanes. ADAS geometry is always valid for both directions. */
  AdasGeometryLaneSetList reference[numAdasGeometries];

  /** List of ADAS geometries using the provided precision. */
  Line2D(shift) adasGeometry[numAdasGeometries];
};

/** List of lanes for which ADAS geometry is provided. */
struct AdasGeometryLaneSetList
{
  /** Number of lane references. */
  varsize numLaneReferences;

  /**
    * List of directed lane references.
    * The reference direction describes the relation between the lane
    * digitization direction and the ADAS geometry digitization direction.
    */
  DirectedLaneReference lane[numLaneReferences];
};

/**
  * Position on a geometry used for assigning ADAS attribute values.
  *
  * Depending on the attribute map type, this position either refers to a
  * position on the ADAS geometry or to a position on the geometry of a road or
  * lane.
  */
subtype LinePosition AdasGeometryPosition;

/*!

### ADAS Attributes and Tile Borders

The data in the ADAS attributes for roads or lanes is self-contained per tile
so that applications do not need to load data from adjacent tiles for their
calculations.

At tile borders, the start point and the end point of connected ADAS geometries
have the same position on the tile border and are stored in both tiles. An
application loads the ADAS geometries from multiple tiles and uses the geometry
points at the tile borders to stitch the geometries together. The geometry points
in adjacent tiles that correspond to each other are identified based on their
position.

The following figure shows a real-world road that crosses tile borders and that
is represented as the ADAS geometries AG1, AG2, and AG3. Each ADAS
geometry contains a geometry point for the start point or the end point at the
tile border. Because the points at the tile borders of the adjacent tiles have the
same position, the geometries can be stitched together seamlessly.

![ADAS geometries across tile borders](assets/adas_attributes_tiles.png)


## Comfortable Speed

Comfortable speed values can be assigned to transitions or a transition
path.

**Example**

The `COMFORTABLE_SPEED` attribute describes a comfortable driving speed through
a transition that is used by the autonomous driving functionality to adapt
the speed to a comfortable level.

!*/

rule_group ComfortableSpeedRules
{
  /*!
  Road List in `ComfortableSpeedPath`:

  The road list in `ComfortableSpeedPath` shall not include the road that
  `ComfortableSpeedPath` is assigned to.
  !*/

  rule "adas-0cyobq";
};

/** Describes a comfortable speed along a sequence of roads. */
struct ComfortableSpeedPath
{
  /** Number of roads in the comfortable speed path. */
  uint8 numOfRoads;

  /** Comfortable speed values on the road that `ComfortableSpeedPath` is assigned to. */
  ComfortableSpeedPointList speedPoints;

  /** List of directed references to roads and comfortable speeds. */
  ComfortableSpeedRoad road[numOfRoads];
};

/** Describes the comfortable speed values on a single road in a `ComfortableSpeedPath`. */
struct ComfortableSpeedRoad
{
  /** Reference to the road. */
  DirectedRoadReference featureReference;

  /** Comfortable speed values on this road. */
  ComfortableSpeedPointList speedPoints;
};

/** Comfortable speed values for a road transition path. */
struct ComfortableSpeedTransitionPath
{
  /**
    * Number of roads within the same tile in the transition path.
    * Shall match the number of roads in the transition reference.
    */
  varsize numRoads;

  /** Comfortable speed points for each road of the transition. */
  ComfortableSpeedPointList speedPointLists[numRoads];

  /** Comfortable speed values for path geometry of a transition geo path. */
  optional ComfortableSpeedPointList geoPathSpeedPoints;

};

/** Comfortable speed values for lane group transition paths. */
struct ComfortableSpeedLaneGroupTransitionPath
{
  /**
    * Number of lane groups within the same tile in the transition path.
    * Shall match the number of lane groups in the transition reference.
    */
  varsize numLaneGroups;

  /** Comfortable speed points for each lane group that is part of the transition path. */
  ComfortableSpeedLaneGroupTransition lanegroupTransitions[numLaneGroups];

  /** Comfortable speed values for path geometries of a transition geo path. */
  optional ComfortableSpeedPointList geoPathSpeedPoints[];
};

/** Comfortable speed values for lane group transitions. */
struct ComfortableSpeedLaneGroupTransition
{
  /**
    * Options inside the lane group transition. Shall match the number of
    * options in the lane group transition reference. If set to 0 the `laneGroupSpeedPoints`
    * are valid for the complete lane group transition.
    */
  OptionsInTransition numOptions;

  /** Comfortable speed points for each option inside the lane group transition. */
  ComfortableSpeedLaneGroupOption options[numOptions] if numOptions > 0;

  /** Comfortable speed points for the complete lane group transition. */
  ComfortableSpeedPointList laneGroupSpeedPoints if numOptions == 0;
};

/** Comfortable speed values for lanes inside a transition option. */
struct ComfortableSpeedLaneGroupOption
{
  /** Number of lanes inside the transition option. */
  LanesInOption numLanes;

  /** Reference to the lane inside the option. */
  DirectedLaneReference laneReference[numLanes];

  /** Comfortable speed values for the lane referenced in laneReference[numLanes]. */
  ComfortableSpeedPointList speedPoints[numLanes];
};

/** List of comfortable speed values for a sequence of points. */
struct ComfortableSpeedPointList
{
  /** Number of comfortable speed points.*/
  varuint16 numOfValues;

  /** List of comfortable speed values. */
  ComfortableSpeedPoint speedPoints[numOfValues];
};

/** Comfortable speed value for a single point. */
struct ComfortableSpeedPoint
{
  /** Position on the ADAS geometry of the feature. */
  AdasGeometryPosition position;

  /** Comfortable speed value. */
  ComfortableSpeed comfortableSpeed;
};

/*!

## Slope

Slope is the change in height along a road. The slope of a road is described
using a sequence of points with slope values. Each slope point in a
sequence is described by an index to the point slope value.

**Example**

Slope is used to warn the driver when the vehicle approaches steep
road segments and for other ADAS functions.

!*/

rule_group SlopeRules
{
  /*!
  Increments of Slope Values:

  Slope values shall be stored in increments of 0.2 %.
  !*/

  rule "adas-0dtw4-I";

  /*!
  Encoding of Slopes from 0 to 24.8 %:

  For slopes from 0 to 24.8 %, the values 0 to 124 shall be used.
  !*/

  rule "adas-0fpxq5-I";

  /*!
  Encoding of Slopes from 25 to 30 %:

  For slopes from 25 % <= slope <= 30 %, the value 125 shall be used.
  !*/

  rule "adas-0g7pxm5-I";

  /*!
  Encoding of Slopes Greater than 30 %:

  For slopes > 30 %, the value 126 shall be used.
  !*/

  rule "adas-0ipd4p-I";

  /*!
  Encoding of Slopes without Slope Value:

  For slopes without slope value, the value 127 shall be used.
  !*/

  rule "adas-0jd3x0-I";

  /*!
  Encoding of Inclines and Declines:

  Inclines shall be stored with positive values. Declines shall be stored with
  negative values.
  !*/

  rule "adas-0jdp5c-I";
};

/** Sequence of points with slope values. */
struct SlopeArray
{
  /** Number of slope points. */
  varuint16   numOfValues;

  /** List of slope values. */
  SlopePoint  slopePoint[numOfValues];
};

/** Slope point on an ADAS geometry. */
struct SlopePoint
{
  /** Position on the ADAS geometry of the road. */
  AdasGeometryPosition point;

  /** Slope value of the slope point. */
  Slope slope;
};

/** Slope value. */
subtype int8 Slope;

/*!

## Curvature (as in ADASIS version 2)

The curvature of a road is described using a sequence of points with curvature
values. The curvature along a path is described using a sequence of curvature
values that are assigned to a sequence of roads. Each curvature point in a
sequence is described by an index to the point curvature value.

At tile borders, no curvature values need to be stored for the geometry points
at the tile border if there is no more curvature value between the tile border
and the end of the road or lane.

If the `TURN_GEOMETRY_CURVATURE` attribute is assigned, then the turn
geometry is used instead of the value of the last curvature point. If
`TURN_GEOMETRY_CURVATURE` is not assigned, then the curvature value assigned to
the curvature point of the intersection is used.

The package [examples.zs](examples.zs) provides some detailed examples that
demonstrate how to assign curvature attributes.

**Curvature Interpretation**

The curvature profile is modeled as a piecewise linear function. The curvature
values change by fixed steps that are constant within 16 consecutive blocks
of a 64-bit span each. High curvature values for sharp curves (meaning curves with
a small radius) are coded with a low resolution. Low curvature values (meaning curves
with a big radius) are coded with a high resolution. The coding is based on simple
functions with power of 2 factors to allow easy calculation also on simple
processing units without FPU capability. The piecewise linear functions are
defined by a set of simple systematic formulas. Negative values shall be
mirrored by the curvature value 0. Positive values represent right curves,
negative values left curves. Left curves with curvature < -0.16192 shall be
coded with value 0, right curves with curvature > 0.16192 shall be coded with
value 1022. Value 1023 means invalid. Some values at the very high and very
low end of the radius scala are not very meaningful from the application
point of view.

The coding based on curvature values c leads to integer representations having
a resolution of 10^-5 [1/m]. All coding and decoding calculation then
involves only add, subtract or bit-shift operations. Especially decoding can
be handled by simple controller units not having an integrated FPU.

**Coding Method**

The ADAS module uses the curvature encoding/decoding algorithm as specified
in ADASIS v2.0.4.

- `c` is the curvature value in 1/m units to be represented.
- `value` is the coded curvature, represented as a 10-bit integer value.
- `|x|` represents the absolute value of `x`.
- `SIGN(c)` represents the value -1 or +1 when curvature < 0 or >= 0, respectively.
- `ROUND(x)` represents the (signed) integer closest to `x`.

````

if            `|c| < 0.00064` then `value = 511 + ROUND (c * 100000 )`
if `0.00064 <= |c| < 0.00192` then `value = 511 + ROUND ((c * 100000 ) / 2 + SIGN ( c ) * 32)`
if `0.00192 <= |c| < 0.00448` then `value = 511 + ROUND ((c * 100000 ) / 4 + SIGN ( c ) * 80)`
if `0.00448 <= |c| < 0.00960` then `value = 511 + ROUND ((c * 100000 ) / 8 + SIGN ( c ) * 136)`
if `0.00960 <= |c| < 0.01984` then `value = 511 + ROUND ((c * 100000 ) / 16 + SIGN ( c ) * 196)`
if `0.01984 <= |c| < 0.04032` then `value = 511 + ROUND ((c * 100000 ) / 32 + SIGN ( c ) * 258)`
if `0.04032 <= |c| < 0.08128` then `value = 511 + ROUND ((c * 100000 ) / 64 + SIGN ( c ) * 321)`
if `0.08128 <= |c| < 0.16192` then `value = 511 + ROUND ((c * 100000 ) / 128 + SIGN ( c ) * 384.5)`
if `0.16192 <= |c|`           then `value = 511 + SIGN ( c ) * 511`
````

**Decoding Method**

- `value` is the 10-bit coded curvature value.
- A value of 1023 signifies 'curvature unknown'.
- `C = value - 511` (signed Integer).
- `SIGN(C)` represents the value -1 or +1 when C < 0 or C >= 0,
respectively curvature is the decoded curvature value in 1/m units.

```

if        `|C| <   64`, then `curvature =   C / 100000`
if `64  <= |C| <  128`, then `curvature =   2 * (C - SIGN(C) *  32  ) / 100000`
if `128 <= |C| <  192`, then `curvature =   4 * (C - SIGN(C) *  80  ) / 100000`
if `192 <= |C| <  256`, then `curvature =   8 * (C - SIGN(C) * 136  ) / 100000`
if `256 <= |C| <  320`, then `curvature =  16 * (C - SIGN(C) * 196  ) / 100000`
if `320 <= |C| <  384`, then `curvature =  32 * (C - SIGN(C) * 258  ) / 100000`
if `384 <= |C| <  448`, then `curvature =  64 * (C - SIGN(C) * 321  ) / 100000`
if `448 <= |C| <= 511`, then `curvature = 128 * (C - SIGN(C) * 384.5) / 100000`
````

!*/

rule_group CurvatureRules
{
  /*!
  Road List in `CurvaturePath`:

  The road list in `CurvaturePath` shall not include the road to which
  `CurvaturePath` is assigned.
  !*/

  rule "adas-0q37xg";

  /*!
  Order of Roads in Road List of `CurvaturePath`:

  The roads in `CurvaturePath.road[]` shall be ordered in the direction
  that the path is traveled so that a micro route can be calculated.
  !*/

  rule "adas-qd0wty";

  /*!
  No Gaps in Road List of `CurvaturePath`:

  The roads in `CurvaturePath.road[]` shall be connected without
  any gaps.
  !*/

  rule "adas-g8xy2i";

  /*!
  Sharp Right Curves:

  Right curves with curvature > 0.16192 shall be coded with curvature value 1022.
  !*/

  rule "adas-0q8g7g-I";

  /*!
  Sharp Left Curves:

  Left curves with curvature < -0.16192 shall be coded with curvature value 0.
  !*/

  rule "adas-0qay3g-I";

  /*!
  Invalid Curvature Values:

  Invalid values shall be coded with curvature value 1023.
  !*/

  rule "adas-0r86uy-I";
};

/** Curvature along a path. */
struct CurvaturePath
{
  /** Number of roads in the curvature path. */
  uint8 numOfRoads;

  /** Curvature points on this path. */
  CurvaturePointList curvaturePoints;

  /** List of directed references to roads and curvature values. */
  CurvaturePathRoad road[numOfRoads];
};

/** Curvature values for a road transition path. */
struct CurvatureTransitionPath
{
  /**
    * Number of roads within the same tile in the transition path.
    * Shall match the number of roads in the transition reference.
    */
  varsize numRoads;

  /** Curvature points for each road of the transition. */
  CurvaturePointList curvaturePoints[numRoads];

  /** Curvature values for path geometry of a transition geo path. */
  optional CurvaturePointList geoPathCurvaturePoints;

};

/** A single road of a `CurvaturePath` and its curvature values. */
struct CurvaturePathRoad
{
  /** Directed reference to the road. */
  DirectedRoadReference featureReference;

  /** List of curvature points on the road. */
  CurvaturePointList curvaturePoints;
};

/** Curvature values for a lane group transition path. */
struct CurvatureLaneGroupTransitionPath
{
  /**
    * Number of lane groups within the same tile in the transition path.
    * Shall match the number of lane groups in the transition reference.
    */
  varsize numLaneGroups;

  /** Curvature points for each lane group that is part of the transition path. */
  CurvatureLaneGroupTransition lanegroupTransitions[numLaneGroups];

  /** Curvature values for path geometries of a transition geo path. */
  optional CurvaturePointList geoPathCurvaturePoints[];
};

/** Curvature values for lane group transitions. */
struct CurvatureLaneGroupTransition
{
  /**
    * Options inside the lane group transition. Shall match the number of
    * options in the lane group transition reference. If set to 0 the `laneGroupCurvaturePoints`
    * are valid for the complete lane group transition.
    */
  OptionsInTransition numOptions;

  /** Curvature points for each option inside the lane group transition. */
  CurvatureLaneGroupOption options[numOptions] if numOptions > 0;

  /** Curvature points for the complete lane group transition. */
  CurvaturePointList laneGroupCurvaturePoints if numOptions == 0;
};

/** Curvature values for lanes inside a transition option. */
struct CurvatureLaneGroupOption
{
  /** Number of lanes inside the transition option. */
  LanesInOption numLanes;

  /** Reference to the lane inside the option. */
  DirectedLaneReference laneReference[numLanes];

  /** Curvature values for the lane referenced in laneReference[numLanes]. */
  CurvaturePointList curvaturePoints[numLanes];
};

/** Curvature values for a sequence of points. */
struct CurvaturePointList
{
  /** Number of curvature points. */
  varuint16   numOfValues;

  /** List of curvature values. */
  CurvaturePoint  curvaturePoint[numOfValues];
};

/** Curvature point on an ADAS geometry. */
struct CurvaturePoint
{
  /** Position on the ADAS geometry of the feature. */
  AdasGeometryPosition point;

  /** Curvature value of the curvature point. */
  Curvature curvature;
};

/** Curvature as in ADASIS */
subtype bit:10 Curvature;


/*!

## Clothoids

A clothoid is described by a sequence of data sets. Each data set contains
a position, a start and an end tangent angle, and/or a delta chainage. Several
clothoids can be assigned to a road.

__Note:__
The clothoid may run outside a tile even if the corresponding coordinate is
located within the tile.

!*/

rule_group ClothoidRules
{
  /*!
  Maximum Length of Clothoids:

  Clothoids shall not be longer than 6553.5 m.
  !*/

  rule "adas-0rabdv";

  /*!
  Cutting of Clothoids:

  Clothoids shall be cut when the corresponding coordinate is stored in another
  tile.
  !*/

  rule "adas-0rj006-I";
};

/** Clothoid described by a sequence of data sets. */
struct Clothoid
{
  /** Number of data sets in the clothoid. */
  varuint16   numOfValues;

  /**
    * Clothoid data sets containing position, start and end tangent angle,
    * and/or a delta chainage.
    */
  ClothoidData  clothoidData[numOfValues];
};


/*!

### Clothoid Data

All ranges are chosen to ensure a numerical accuracy of approximately 0.2 m to
0.3 m if needed.

!*/

/** Data set for a clothoid. */
struct ClothoidData
{
  /**
   * Describes available contents and global determinants for the
   * clothoid data.
   */
   ClothoidDataDescription  clothoidDataDescription;

   /** Defines a clothoid start or end position on the road's ADAS geometry. */
   AdasGeometryPosition clothoidPosition
       if clothoidDataDescription.hasCoordDiff
       == true;

   /**
    * Tangent arc start: Determined as the clockwise arc between the y-axis
    * (north of WGS84) and the tangent direction.
    * The angle is called 'ellipsoidal azimuth'.
    * A value from 0,1,2... to 65535 means an arc from 0.00, 0.0055, 0.011
    * .... to 359.9945 -- 0 == 360.
    */
   TangentArc  tangentArcStart
     if clothoidDataDescription.hasTStart
       == true;

   /**
    * Tangent arc end: Determined as the clockwise arc between the y-axis
    * (north of WGS84) and the tangent direction.
    * The angle is called 'ellipsoidal azimuth'.
    * A value from 0,1,2... to 65535 means an arc from 0.00, 0.0055, 0.011
    * .... to 359.9945 -- 0 == 360.
    */
   TangentArc  tangentArcEnd
     if clothoidDataDescription.hasTEnd
       == true;

   /**
    * Describes the curvature at the start of the clothoid.
    *
    * If `clothoidDataDescription.hasTStart == true` and
    * `clothoidDataDescription.hasCStart == false`,
    * the curvature is implicitly given as 0 [1/m].
    */
   ClothoidCurvature curvatureStart if clothoidDataDescription.hasCStart == true;

   /**
    * Describes the curvature at the end of the clothoid.
    *
    * If `clothoidDataDescription.hasTEnd == true` and
    * `clothoidDataDescription.hasCEnd == false`,
    * the curvature is implicitly given as 0 [1/m].
    */
   ClothoidCurvature curvatureEnd if clothoidDataDescription.hasCEnd == true;

   /**
    * This value gives the delta chainage (horizontal road length) with respect
    * to the previous clothoid data description.
    *
    * A value from 0,1,2... means an chainage offset from 0, 1, 2.... dm from the
    * predecessor.
    */
   varsize  deltaChainage if clothoidDataDescription.hasChainageDiff == true;
};

/*!

### Clothoid Data Description

An imaginary cursor forwards in the road's `AdasGeometry` by a defined
number of steps to locate the coordinate referenced by the followed clothoid data.

Instead of an absolute index to the coordinate, an index delta between
the previous related coordinate and the current related coordinate
point is used. The current coordinate number is the sum of all previous steps.

!*/

rule_group ClothoidDataDescriptionRules
{
  /*!
  Number of Bits for Clothoid Data Description:

  `ClothoidDataDescription.numBits` shall only be set to 0 if `hasCoordDiff` is
  set to `false`.
  !*/

  rule "adas-0rxkrk";
};

/**
  * Locates the coordinate referenced by the clothoid data. Describes
  * the content and global determinants of the clothoid data.
  */
struct ClothoidDataDescription
{
   /**
    * Index delta between previous related coordinate and current related
    * coordinate point.
    */
   varuint16  numberOfSteps;

   /**
    * Number of bits excluding the sign bit for coordinate deltas used
    * in the `ClothoidData` structure.
    */
   bit:5 numBits;

   /** True if coordinate difference dx,dy present. */
   bool  hasCoordDiff;

   /** True if tangent Tstart is present. */
   bool  hasTStart;

   /** True if tangent Tend is present (Tend != Tstart). */
   bool  hasTEnd;

   /** True, if curvature curvatureStart is present. */
   bool hasCStart;

   /** True, if curvature curvatureEnd is present. */
   bool hasCEnd;

   /** True, if chainage difference is present. */
   bool  hasChainageDiff;
};

/**
 * Defines the tangential angle for definition of clothoid start and end.
 * Determined as the clockwise arc between the y-axis (north of WGS84) and
 * the tangent direction.
 * The angle is called 'ellipsoidal azimuth'.
 * Encoding: 360/65536 = 0,0054931640625
 * Calculate the lateral shift for the tile diagonal of 3,5 km:
 * ls = sin(0,0054931640625) * 3500 m = 0,336 m
 */
subtype uint16 TangentArc;

/*!

### Clothoid Curvature

The clothoid curvature is defined to enable a wider range of curvature values
compared to the plain curvature type.

**Curvature Interpretation**

The curvature profile is modeled as a piecewise linear function. The curvature
values change by fixed steps that are constant within 16 consecutive blocks of
64 states each. High curvature values for sharp curves (meaning curves with a small
radius) are coded with a low resolution. Low curvature values (meaning curves with
a large radius) are coded with a high resolution. The piecewise linear functions
are defined by a set of simple systematic formula.
Negative values shall be mirrored by the curvature value 0.
Positive values represent right curves, negative values left curves.
Left curves with curvature < -1.006024096 shall be coded with value 0,
right curves with curvature > 1.006024096 shall be coded with value 1022.
Value 1023 means invalid, since some values at the very high and very low
end of the radius scala are not very meaningful from the application point of view.

**Coding Method**

- `c` is the curvature value in 1/m units to be represented.
- `value` is the coded curvature, represented as a 10-bit integer value.
- `|x|` represents the absolute value of `x`.
- `SIGN(c)` represents the value -1 or +1 when curvature < 0 or >= 0, respectively.
- `ROUND(x)` represents the (signed) integer closest to `x`.


````

if `|c| < 0.000009613`, then `value = 511`
if `0.000009613  <= |c| < 0.000040923`, then `value = 511 + SIGN(c) * (-19) + ROUND(c * 1038539554 / 512)` [Attention: „-19“ is correct here.]
if `0.000040923  <= |c| < 0.0001737565`, then `value = 511 + SIGN(c) * 44 + ROUND(c * 988894254  / 2048)`
if `0.0001737565 <= |c| < 0.0007367915`, then `value = 511 + SIGN(c) * 108 + ROUND(c * 932923357  / 8192)`
if `0.0007367915 <= |c| < 0.003124597`, then `value = 511 + SIGN(c) * 172 + ROUND(c * 879961330  / 32768)`
if `0.003124597  <= |c| < 0.013250953`, then `value = 511 + SIGN(c) * 236 + ROUND(c * 829979357  / 131072)`
if `0.013250953  <= |c| < 0.0561949885`, then `value = 511 + SIGN(c) * 300 + ROUND(c * 782847732  / 524288)`
if `0.0561949885 <= |c| < 0.238348775`, then `value = 511 + SIGN(c) * 364 + ROUND(c * 738390903  / 2097152)`
if `0.238348775  <= |c| < 1.006024096`, then `value = 511 + SIGN(c) * 428 + ROUND(c * 696254464  / 8388608)`
if `1.006024096  <= |c|`, then `value = 511 + SIGN(c) * 511`
````

**Decoding Method**

- `value` is the 10-bit coded curvature value.
- A value of `1023` signifies 'curvature unknown'.
- `C = value - 511` (signed Integer)
- `SIGN(C)` represents the value -1 or +1 when C < 0 or C >= 0
- `curvature` is the decoded curvature value in 1/m units.

````

if `C   == 0`,   then `curvature =       0`
if `1 <= |C| <  64`, then `curvature =     512 * (C + SIGN(C) *  19) / 1038539554` [Attention: „+“ is correct here.]
if `64 <= |C| <  128`, then `curvature =    2048 * (C - SIGN(C) *  44) / 988894254`
if `128 <= |C| <  192`, then `curvature =    8192 * (C - SIGN(C) * 108) / 932923357`
if `192 <= |C| <  256`, then `curvature =   32768 * (C - SIGN(C) * 172) / 879961330`
if `256 <= |C| <  320`, then `curvature =  131072 * (C - SIGN(C) * 236) / 829979357`
if `320 <= |C| <  384`, then `curvature =  524288 * (C - SIGN(C) * 300) / 782847732`
if `384 <= |C| <  448`, then `curvature = 2097152 * (C - SIGN(C) * 364) / 738390903`
if `448 <= |C| <= 511`, then `curvature = 8388608 * (C - SIGN(C) * 428) / 696254464`
````

!*/

/**
  * Curvature along a clothoid. Enables a wider range of curvature values
  * compared to the plain curvature type.
  */
subtype bit:10 ClothoidCurvature;

/*!

### Clothoid Metadata

Clothoid metadata is stored as an attribute property of a clothoid attribute.

!*/

rule_group ClothoidMetadataRules
{
  /*!
  Number of Clothoid Metadata Definitions for Roads:

  One road shall have at most one clothoid metadata definition.
  !*/

  rule "adas-0t6uo8";
};

/** Metadata of a clothoid stored as an attribute property of a clothoid attribute. */
struct ClothoidMetaData
{
   /** ADAS accuracy level. */
   AdasAccuracy   adasAccuracy;

   /** Relative curvature deviation. */
   RelativeCurvatureDeviation  relativeCurvatureDeviation;

   /** Number of points minus 1 (or n-1) used to calculate the clothoid of the road. */
   DegreeOfFreedom  degreeOfFreedom;

   /** Indicates whether a gradient is related to the clothoid geometry `Gradient`. */
   bool  hasGradient;
};

/*!

### Relative Curvature Deviation

The relative curvature deviation represents the accuracy of a clothoid’s curvature.
To evaluate the relative curvature deviation, a reference curve that reflects the
reality is given. For a set of sample points, the clothoid curvature is divided
by the corresponding curvature of the reference curve. If the minimum
of those quotients is smaller than 1, the clothoid’s curvature is underrepresented.
In this case, the relative curvature deviation d is set to the minimum quotient.
Otherwise, the clothoid’s curvature is overrepresented and the relative curvature
deviation d is set to the maximum quotient.

The relative curvature deviation is represented with a uint8 value. Relative curvature
deviations smaller than 0.2 are stored with value 0. Relative curvature
deviations larger than or equal to 2 are stored with value 255. All other values
are interpolated linearly. For example, value 127 represents relative curvature
deviations from 1.0929 to 1.1.

!*/

/**
  * Relative deviation of a curvature that represents the accuracy of a
  * clothoid's curvature.
  */
subtype uint8  RelativeCurvatureDeviation;

/*!

## Gradient

A gradient is described by a sequence of data sets for which a chainage offset,
height, and radius are given.

__Note:__
A clothoid may run outside a tile even if the corresponding coordinate is within.

!*/

rule_group GradientRules
{
  /*!
  Cutting of Gradients:

  Gradients shall be cut when the corresponding coordinate is stored in another
  tile.
  !*/

  rule "adas-0u5uxw-I";

  /*!
  Number of Gradient Metadata Definitions:

  `Gradient` shall be associated with at most one `GradientMetaData` definition.
  !*/

  rule "adas-0u9w3n";
};

/** Gradient described by a sequence of data sets. */
struct Gradient
{
    /** Number of gradient values. */
    varuint16   numOfValues;

    /** Gradient data. */
    GradientData  gradientData[numOfValues];
};

/** Metadata associated with a gradient. */
struct GradientMetaData
{
   /** ADAS accuracy level. */
   AdasAccuracy   adasAccuracy;

   /** Standard deviation between gradient and shape points. */
   StandardDeviation  standardDeviation;

   /** Number of points minus 1 (or n-1) used to calculate the gradient. */
   DegreeOfFreedom  degreeOfFreedom;

   /**
    * Encoding for absolute grade line elevation from 0, 1, 2...4095 means
    * 0, 2, 4...8190 m. 4096 indicates a relative grade line.
    * The absolute grade line elevation refers to the Earth Gravitational Model
    * EGM96.
    */
   bit:12 absoluteGradeLineElevation;

   /**
    * Defines the chainage offset in dm of the first tangent intersection point
    * of the grade line. To obtain a complete definition of the grade line, the
    * grade line definition may start with a negative chainage, although the
    * clothoid always starts with chainage = 0.
    */
   int16 deltaChainageStart;
};

/** Data set for a gradient value.*/
struct GradientData
{
    /**
     * Defines whether this gradient data has a radius value.
     * If set to `false`, then there is a straight connection with the
     * previous gradient data point.
     */
    bool hasRadiusValue;

    /**
     * Value from 0,1,2... means a chainage offset from 0, 1, 2.... dm from the
     * predecessor.
     * The chainage starts counting at the start coordinate of the road and ends
     * at the last coordinate.
     * Only delta values to previous chainages are stored to be more compact.
     * The maximum delta value is equal to the length of the road.
     */
    varsize  chainageOffset;

    /**
     * A value from -127....0...127 means a relative elevation from
     * -127 m.....0....127 m. The value -128 is reserved.
     * The elevation of a grade line data point is calculated as follows:
     * absoluteGradeLineElevation + sum of relativeGradeLineElevations.
     */
    int8   relativeGradeLineElevation;

    /**
     * Radius encoding of the grade line.
     * The radius value is decoded by following scheme:
     *
     * n = value + 4
     *
     * radius = 15 + n*(n+1)/2
     *
     * This encoding leads to a higher relative error for low radii of 20 % for
     * value 0 and quickly decreases to a relative error of less than 5 % for
     * values larger than 35.
     *
     * The decoded radius starts at 25 (value 0) and ends with 33685 (value 255).
     * The unit of the decoded radius is m.
     */
    uint8  radiusValue if hasRadiusValue == true;
};


/*!

## Other ADAS Types and Subtypes

!*/

/**
  * The ADAS accuracy level of an ADAS geometry is described by a set of
  * predefined values.
  */
enum bit:2 AdasAccuracy
{
  /** ADAS accuracy is unknown. */
  UNKNOWN    = 0,

  /**
   * Low ADAS accuracy: Data is digitized with differential GPS or
   * comparable measurement method.
   */
  LOW        = 1,

  /** Medium ADAS accuracy. */
  MIDDLE     = 2,

  /**
   * High ADAS accuracy: Data is digitized with IMU support (inertial
   * measurement unit) or a comparable measurement method.
   */
  HIGH         = 3
};


/** Array of height values for the line positions of a feature. */
struct ElevationArray
{
  /** Number of elevation values. */
  varuint16 numValues;

  /** Position on the ADAS geometry of the road for each elevation value. */
  packed AdasGeometryPosition point[numValues];

  /** Elevation value. */
  packed Elevation elevation[numValues];
};

/** Absolute elevation value in centimeters. */
subtype varint32 Elevation;


/**
  * Degree of freedom for clothoids and gradients.
  * Describes the number of points minus 1 (or n-1) used to calculate the
  * geometry elements of the road.
  */
subtype uint16 DegreeOfFreedom;

/**
  * Standard deviation of a clothoid or gradient.
  *
  * To be interpreted as a multiple of 4 cm:
  * The values 0,1,2... to 255 correspond to a standard deviation of
  * 0, 4, 8.... to 1020 cm.
  */
subtype uint8 StandardDeviation;

/** Comfortable speed. */
subtype SpeedKmh ComfortableSpeed;

/** Indicates whether enhanced geometry is available on the feature. */
subtype Flag EnhancedGeometry;
