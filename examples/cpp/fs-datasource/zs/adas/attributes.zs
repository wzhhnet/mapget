/*!

# ADAS Attributes

This package defines the attributes that are available in the ADAS
attribute layers.

ADAS attributes such as slope and curvature values can be assigned to
transitions, roads, road locations, or lanes using separate attribute layers. For
more information about these layers, see [ADAS Attribute Layers](layer.zs).

**Dependencies**

!*/

package adas.attributes;

import adas.types.*;


rule_group AdasAttributeTypeRules
{
  /*!
  Assigning `COMFORTABLE_SPEED_PATH` Attribute:

  The `COMFORTABLE_SPEED_PATH` attribute shall only be assigned to the first road
  of a comfortable speed path.
  !*/

  rule "adas-0crucj";

  /*!
  Assigning `CURVATURE_PATH`:

  The `CURVATURE_PATH` attribute shall only be assigned to transitions of
  reference type `TRANSITION_PATH` or `TRANSITION_GEO_PATH`.
  !*/

  rule "adas-0kmxtr";

  /*!
  Assigning `CURVATURE`:

  The `CURVATURE` attribute shall always be assigned in both directions to a
  feature. In detail, this means the following:

  - If `CURVATURE` is assigned to a road, `RoadReference.isDirected` shall be
    set to `false`.
  - If `CURVATURE` is assigned to a road location, `RoadLocationReference.direction`
    shall be set to `IN_BOTH_DIRECTIONS`.
  - If `CURVATURE` is assigned to a lane, `LaneValidityDirection` in
    `LaneGroupRangeValidity` shall be set to `IN_BOTH_DIRECTIONS` for that lane.

  The stored curvature values apply in positive digitization direction. In negative
  digitization direction, an application shall interpret the values accordingly.

  !*/

  rule "adas-w9wini";

  /*!
  Assigning `SLOPE_ARRAY`:

  The `SLOPE_ARRAY` attribute shall always be assigned in both directions to a
  feature. In detail, this means the following:

  - If `SLOPE_ARRAY` is assigned to a road, `RoadReference.isDirected` shall be
    set to `false`.
  - If `SLOPE_ARRAY` is assigned to a road location, `RoadLocationReference.direction`
    shall be set to `IN_BOTH_DIRECTIONS`.
  - If `SLOPE_ARRAY` is assigned to a lane, `LaneValidityDirection` in
    `LaneGroupRangeValidity` shall be set to `IN_BOTH_DIRECTIONS` for that lane.

  The stored slope values apply in positive digitization direction. In negative
  digitization direction, an application shall interpret the values accordingly.
  !*/

  rule "adas-jm8bpy";
};

/** ADAS attributes for transitions. */
enum varuint16 AdasTransitionAttributeType
{
  /** Describes a comfortable driving speed through a transition. */
  COMFORTABLE_SPEED,

  /** Describes a turn geometry curvature value for a transition. */
  TURN_GEOMETRY_CURVATURE,

  /** Describes the curvature along a transition path. */
  CURVATURE_PATH,

  /** Describes a comfortable driving speed along a transition path.*/
  COMFORTABLE_SPEED_PATH,
};

/** ADAS attributes for lane transitions. */
enum varuint16 AdasLaneTransitionAttributeType
{
  /** Describes a comfortable driving speed through a lane group transition. */
  COMFORTABLE_SPEED_PATH,

  /** Describes a curvature path for a lane group transition. */
  CURVATURE_PATH,
};

/** ADAS attributes for roads. */
enum varuint16 AdasRoadAttributeType
{
  /** Represents the curvature of a road given by a sequence of curvature values. */
  CURVATURE,

  /** Describes the change in height on a road.*/
  SLOPE_ARRAY,

  /** Describes a clothoid.*/
  CLOTHOID,

  /** Describes a gradient.*/
  GRADIENT,

  /** Defines whether enhanced geometry data is available for a road. */
  ENHANCED_GEOMETRY,

  /** REMOVED. Use corresponding transition attribute instead! */
  @removed CURVATURE_PATH,

  /** REMOVED. Use corresponding transition attribute instead! */
  @removed COMFORTABLE_SPEED_CURVE,

  /** Describes a comfortable driving speed along a sequence of roads.*/
  COMFORTABLE_SPEED_PATH,

  /**
   * Gives height information for individual line positions of a road
   * in 1 cm units.
   */
  ELEVATION_ARRAY,
};

/** ADAS attributes for lanes. */
enum varuint16 AdasLaneAttributeType
{
  /** Represents the curvature of a road given by a sequence of curvature values.*/
  CURVATURE,

  /** Describes the change in height on a road.*/
  SLOPE_ARRAY,

  /** Describes a comfortable driving speed through a curve.*/
  COMFORTABLE_SPEED_CURVE,
};

choice AdasRoadAttributeValue(AdasRoadAttributeType type) on type
{
  case SLOPE_ARRAY:
    SlopeArray slopeArray;
  case CLOTHOID:
    Clothoid clothoid;
  case GRADIENT:
    Gradient gradient;
  case ENHANCED_GEOMETRY:
    EnhancedGeometry enhancedGeometry;
  case CURVATURE:
    CurvaturePointList curvaturePointList;
  case CURVATURE_PATH:
    CurvaturePath curvaturePath;
  case COMFORTABLE_SPEED_CURVE:
    ComfortableSpeedPointList comfortableSpeedCurve;
  case COMFORTABLE_SPEED_PATH:
    ComfortableSpeedPath comfortableSpeedPath;
  case ELEVATION_ARRAY:
    ElevationArray elevationArray;
};

choice AdasTransitionAttributeValue(AdasTransitionAttributeType type) on type
{
  case TURN_GEOMETRY_CURVATURE:
    Curvature turnGeometryCurvature;
  case COMFORTABLE_SPEED:
    ComfortableSpeed comfortableSpeed;
  case CURVATURE_PATH:
    CurvatureTransitionPath curvaturePath;
  case COMFORTABLE_SPEED_PATH:
    ComfortableSpeedTransitionPath comfortableSpeedPath;
};

choice AdasLaneTransitionAttributeValue(AdasLaneTransitionAttributeType type) on type
{
  case COMFORTABLE_SPEED_PATH:
    ComfortableSpeedLaneGroupTransitionPath comfortableSpeedPath;
  case CURVATURE_PATH:
    CurvatureLaneGroupTransitionPath curvaturePath;
};

choice AdasLaneAttributeValue(AdasLaneAttributeType type) on type
{
  case SLOPE_ARRAY:
    SlopeArray slopeArray;
  case CURVATURE:
    CurvaturePointList curvaturePointList;
  case COMFORTABLE_SPEED_CURVE:
    ComfortableSpeedPointList comfortableSpeedCurve;
};

/*!

## Interpolation of ADAS Attributes

Curvature and slope use the linear profile representation. The linear profile
represents calculated values for profile coordinates (s) along-track that are
calculated by interpolating two consecutive profile spots.
The ADASIS Standardization Forum also uses this representation for profile
information on map-based track previews.

The following figure shows different kinds of interpolation for profiles.

![Different kinds of interpolation for profiles (profile view)](assets/adas_interpolation.png)

!*/
