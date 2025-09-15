/*!

# Display Attributes

This package defines the attributes that are available in the display attribute layer.

**Dependencies**

!*/

package display.details.attributes;

import display.details.types.*;
import core.geometry.*;
import core.types.*;


rule_group DisplayAttributeRules
{
  /*!
  Assignment of `DRAWING_ORDER` Attribute:

  The `DRAWING_ORDER` attribute shall only be assigned if the default drawing
  order rules do not apply.
  !*/

  rule "display.details-eb8yfz-I";

  /*!
  Usage of Delta Elevation with Base Elevation:

  If the `ELEVATION_DELTA` attribute is present in a layer, then
  `DisplayAttributeLayer.baseElevation` shall be set.
  !*/

  rule "display.details-nmpe6o";

  /*!
  No Mixed Usage of Elevation Attributes:

  If the `ELEVATION_LEVEL` attribute is assigned in a layer, then `baseElevation`
  shall not be set and the `ELEVATION_DELTA` attribute shall not be assigned in
  that layer. Likewise, if the `ELEVATION_DELTA` attribute is present in a layer, then
  the `ELEVATION_LEVEL` attribute shall not be present in that layer.
  !*/

  rule "display.details-mgtw0w";

  /*!
  No Overlapping Display Attributes:

  If the same display attribute is assigned multiple times to the same display
  feature in the same layer, then the range validities shall not overlap, for
  example, the attributes shall not have overlapping percentage ranges or a
  validity range that overlaps with a percentage range.
  !*/

  rule "display.details-xrh96s";

  /*!
  Evaluation of z-Level vs. Drawing Order:

  If two intersecting display lines have the same drawing order and `Z_LEVEL`
  attributes are present, then the display line with the higher `Z_LEVEL` value
  shall be rendered on top.
  !*/

  rule "display.details-t2crma-I";
};


/** Attribute types for display areas. */
enum varuint16 DisplayAreaAttributeType
{
  /** Drawing order of the display area if different than the default drawing order. */
  DRAWING_ORDER,

  /** Total number of floors of a building. */
  BUILDING_FLOOR_COUNT,

  /** Height of a building. */
  BUILDING_HEIGHT,

  /**
    * Ground height of the building or part of the building. Can be used to
    * render buildings on top of other buildings.
    */
  GROUND_HEIGHT,

  /** Color of a building roof. */
  ROOF_COLOR,

  /** Color of the walls of a building. */
  WALL_COLOR,

  /**
    * Elevation of a display area in centimeters,
    * relative to the base elevation value of the layer.
    */
  ELEVATION_DELTA,

  /**
    * Elevation of a display area, described in discrete level values. Can be used
    * if no detailed elevation data is available or allowed to be stored in the map.
    */
  ELEVATION_LEVEL,

  /**
    * A display area has a corresponding 3D representation in a 3D display
    * layer.
    */
  HAS_3D_REPRESENTATION,

  /** Global source identifier of the display area. */
  GLOBAL_SOURCE_ID,
};

/** Attribute values for display areas. */
choice DisplayAreaAttributeValue(DisplayAreaAttributeType type) on type
{
  case DRAWING_ORDER:
    DrawingOrder drawingOrder;
  case BUILDING_FLOOR_COUNT:
    BuildingFloorCount buildingFloorCount;
  case BUILDING_HEIGHT:
    BuildingHeight buildingHeight;
  case GROUND_HEIGHT:
    GroundHeight groundHeight;
  case ROOF_COLOR:
    RoofColor roofColor;
  case WALL_COLOR:
    WallColor wallColor;
  case ELEVATION_DELTA:
    DeltaElevation elevationDelta;
  case ELEVATION_LEVEL:
    ElevationLevel elevationLevel;
  case HAS_3D_REPRESENTATION:
    Has3dRepresentation has3dRepresentation;
  case GLOBAL_SOURCE_ID:
    GlobalSourceId globalSourceId;
};


/** Attribute types for display lines. */
enum varuint16 DisplayLineAttributeType
{
  /** Drawing order of the display line if different than the default drawing order. */
  DRAWING_ORDER,

  /**
    * Defines the relative height of a line feature relative to the z-level of
    * other lines.
    */
  Z_LEVEL,

  /**
    * The line feature is detached from the terrain, for example,
    * a flat road that crosses a river. The attribute can be used to render an
    * interpolated, straight elevation between the two positions where a road
    * crosses a river valley.
    */
  DETACHED_FROM_TERRAIN,

  /**
    * Elevation of a display line in centimeters,
    * relative to the base elevation value of the layer.
    */
  ELEVATION_DELTA,

  /**
    * Elevation of a display line, described in discrete level values. Can be used
    * if no detailed elevation data is available or allowed to be stored in the map.
    */
  ELEVATION_LEVEL,
};

/** Attribute values for display lines. */
choice DisplayLineAttributeValue(DisplayLineAttributeType type) on type
{
  case DRAWING_ORDER:
    DrawingOrder drawingOrder;
  case Z_LEVEL:
    ZLevel zLevel;
  case DETACHED_FROM_TERRAIN:
    DetachedFromTerrain detachedFromTerrain;
  case ELEVATION_DELTA:
    DeltaElevation elevationDelta;
  case ELEVATION_LEVEL:
    ElevationLevel elevationLevel;
};


/** Attribute types for display points. */
enum varuint16 DisplayPointAttributeType
{
  /** Approximate number of inhabitants in a location, for example, a city. */
  POPULATION,

  /** Drawing order of the display point if deviating from the default drawing order. */
  DRAWING_ORDER,

  /**
    * Elevation of a display point in centimeters,
    * relative to the base elevation value of the layer.
    */
  ELEVATION_DELTA,

  /**
    * Elevation of a display point, described in discrete level values. Used
    * if no detailed elevation data is available or allowed to be stored in the map.
    */
  ELEVATION_LEVEL,
};

/** Attribute values for display points. */
choice DisplayPointAttributeValue(DisplayPointAttributeType type) on type
{
  case POPULATION:
    Population population;
  case DRAWING_ORDER:
    DrawingOrder drawingOrder;
  case ELEVATION_DELTA:
    DeltaElevation elevationDelta;
  case ELEVATION_LEVEL:
    ElevationLevel elevationLevel;
};

/** Attribute types for 3D polygon meshes. */
enum varuint16 Display3dMeshAttributeType
{
  /** Additional feature class for 3D polygon meshes. */
  ADDITIONAL_3D_FEATURE_CLASS,

  /**
    * Original height values of a 3D polygon mesh. Provides information for
    * height adjustment when used together with a terrain model to prevent
    * floating or sunken objects.
    */
  ORIGINAL_POINT_HEIGHTS,
};

/** Attribute values for 3D polygon meshes. */
choice Display3dMeshAttributeValue(Display3dMeshAttributeType type) on type
{
  case ADDITIONAL_3D_FEATURE_CLASS:
    Additional3dFeatureClass additional3dFeatureClass;
  case ORIGINAL_POINT_HEIGHTS:
    OriginalPointHeights originalPointHeights;
};