/*!

# Localization Types

This package defines types that are used by localization objects:

- [Landmarks](#landmarks)
- [Obstacles](#obstacles)
- [Occupancy grids](#occupancy-grids)

**Dependencies**

!*/

package localization.types;

import signs.warning.*;
import core.types.*;
import core.geometry.*;

/*!

## Landmarks

Landmarks have different types, based on the used type of geometry:

- [Landmarks using line geometries](#landmarks-using-line-geometries)
- [Landmarks using planar polygon geometries](#landmarks-using-planar-polygon-geometries)
- [Landmarks using mesh geometries](#landmarks-using-poly-mesh-geometries)

Compound landmarks can consist of multiple landmark types, for example, a sign and
a post. Compound landmarks are realized using the same landmark ID for the different
geometries, for example, a planar polygon for the sign and a 3D line for the
corresponding pole.

Landmarks are also used to model objects inside buildings like a parking garage.

The following figure shows two compound landmarks, one for a traffic light and
one for a right-of-way sign.

![Compound landmarks](assets/landmark_compound_sign.png)

!*/

rule_group LandmarkRules
{
  /*!
  Tile-unique Landmark IDs:

  Landmark IDs shall be tile unique. For compound landmarks, multiple landmark
  objects may share the same ID, but they shall represent the same real-world
  object.
  !*/

  rule "localization-uc6xja-I";
};



/** Identifier of a landmark. */
subtype varuint32 LandmarkId;

/** Confidence of a landmark in percent. Use values between 0-100 (included). */
subtype uint8 LandmarkConfidence;


/*!

### Landmarks Using Line Geometries

Line landmarks are used to model poles and pole-like objects. They can represent
vertical or horizontal structures. Line landmarks have a specific type and
optionally a diameter.

Poles and posts are vertical line landmarks that usually hold some other object,
for example, a sign or a traffic light.
Horizontal line landmarks are parallel to the road, for example, a barrier,
guardrail, or fence.

Parallel lines of a landmark such as a fence can be represented as
a compound landmark using the same landmark ID. The line landmarks of
such a compound localization object are stored in order from top to bottom in
the line geometry layer.
The first polyline for a landmark ID represents the upper edge of the barrier
and the last line for that landmark ID represents the lower edge or the ground
it is standing on.

The following figure shows the line landmarks for two barriers on both sides of
a road. Both landmarks consist of multiple 3D lines.

![Barrier landmarks](assets/landmark_barrier.png)


!*/

/** Details of a landmark that is represented as a line geometry. */
struct LandmarkLine
{
  /** Type of the line landmark. */
  LandmarkLineType type;

  /** Diameter of the line. */
  optional WidthCentimeters diameter;

  /** Confidence value of the landmark in percentage (0-100). */
  optional LandmarkConfidence confidence : confidence <= 100;

};

/** Types of line landmarks. */
enum uint8 LandmarkLineType
{
  /** A guardrail post mounts a guardrail on solid ground. */
  GUARDRAIL_POST,

  /** Light pole. */
  LIGHT_POLE,

  /** Delineator post. */
  DELINEATOR_POST,

  /** Reflector post. */
  REFLECTOR_POST,

  /** Pole of a gantry. */
  GANTRY_POLE,

  /** Signpost pole. */
  SIGNPOST_POLE,

  /** Unknown pole type. */
  POLE_UNKNOWN,

  /** Curb - vertical edge of a raised floor that is next to a drivable area. */
  CURB,

  /** A flat wall, simplified as line representation. */
  WALL_FLAT,

  /** A tunnel wall, simplified as line representation. */
  WALL_TUNNEL,

  /** Jersey barrier. */
  BARRIER_JERSEY,

  /** Sound barrier. */
  BARRIER_SOUND,

  /** Cable barrier. */
  BARRIER_CABLE,

  /** Guardrail. */
  GUARDRAIL,

  /** Fence. */
  FENCE,

  /** Edge of a cliff. */
  CLIFF,

  /** Edge of a ditch. */
  DITCH,
};

/*!

### Landmarks Using Planar Polygon Geometries

Polygon landmarks are used to model sign faces, perpendicular walls, or
overhead structures. Optionally, a color can be provided.

The shape of a sign is either represented as a specific type or using a bounding
box. Optionally, further details for a sign can be provided, for example,
regarding the meaning of the sign or the text on the sign.

The following figure shows how sign landmarks are stored using bounding boxes.
For the large sign, multiple sign faces are grouped in one bounding box and
treated as one sign landmark.

![Polygon landmarks with bounding boxes](assets/landmark_signs_bounding_box.png)

The following figure shows the same Autobahn sign, but in this case, the sign is
modeled using a detailed shape.

![Polygon landmarks with bounding boxes](assets/landmark_signs_detailed_shape.png)

Perpendicular walls and overhead structures are never parallel to the road,
but they do not need to be strictly perpendicular to the road center line.
The angle can deviate for a maximum of 30°, resulting in a range from 60° to 120°
relative to the road center line.
Perpendicular walls usually have a width greater than one meter.

The following figure shows a tunnel wall that is represented as two perpendicular
wall landmarks and one overhead structure.

![Polygon landmarks with bounding boxes](assets/landmark_perpendicular_wall_and_overhead_structure.png)

Walls that are tilted to the vertical in reality are also represented as
perpendicular walls. The following figure shows two perpendicular walls
that are represented as identical planar polygons even though, in reality, one
wall is tilted and the other wall is not.

![Polygon landmarks with bounding boxes](assets/landmark_perpendicular_wall_tilted.png)

!*/

rule_group PolygonLandmarkRules
{
  /*!
  Angle of Perpendicular Walls and Overhead Structures:

  Perpendicular walls and overhead structures shall be perpendicular or
  nearly perpendicular to the road center line. The angle can deviate for a
  maximum of 30°, resulting in a range from 60° to 120° relative to the road
  center line.
  !*/

  rule "localization-i7yxii-I";

  /*!
  No Perpendicular Walls Above Road Surface:

  Perpendicular walls shall not be used to define faces above the road surface.
  For such structures, `OVERHEAD_STRUCTURE` can be used instead.
  !*/

  rule "localization-bhmrfu-I";

  /*!
  Diameter for Round Signs Only:

  The value `LandmarkSignDetails.diameter` shall only be stored for
  landmarks of sign type `ROUND`.
  !*/

  rule "localization-duspmt";

  /*!
  Detailed Shape for Signs without Bounding Box Only:

  The landmark sign type `DETAILED_SHAPE` shall only be used for landmarks of
  type `SIGN`.
  !*/

  rule "localization-9b560d";
};

/** Details of a landmark that is represented as a planar polygon geometry. */
struct LandmarkPolygon
{
  /** Type of the landmark. */
  LandmarkPolygonType type;

  /** Sign shape type of the landmark if it is a sign. */
  LandmarkSignType signType if type == LandmarkPolygonType.SIGN || type == LandmarkPolygonType.SIGN_BOUNDING_BOX;

  /** Indicates whether additional details are available for a sign. */
  bool hasSignDetails if type == LandmarkPolygonType.SIGN || type == LandmarkPolygonType.SIGN_BOUNDING_BOX;

  /** Sign details like meaning, content of the sign, etc. */
  LandmarkSignDetails signDetails
    if (type == LandmarkPolygonType.SIGN || type == LandmarkPolygonType.SIGN_BOUNDING_BOX) && hasSignDetails;

  /** Details of a fiducial marker, for example, the used marker system and value/index of the marker. */
  FiducialMarkerDetails markerDetails if type == LandmarkPolygonType.FIDUCIAL_MARKER;

  /** Color of the landmark. */
  optional LandmarkColor color;

  /** Confidence value of the landmark in percentage (0-100). */
  optional LandmarkConfidence confidence : confidence <= 100;
};

/** Types of polygon landmarks. */
enum uint8 LandmarkPolygonType
{
  /** Bounding box of a sign face. The landmark geometry is a bounding rectangle. */
  SIGN_BOUNDING_BOX,

  /** Detailed shape of a sign. */
  SIGN,

  /**
   * Faces of walls that are perpendicular to the road center line, for example,
   * tunnel portals. To cover the area directly above the road surface,
   * `OVERHEAD_STRUCTURE` is used instead.
   */
  PERPENDICULAR_WALL,

  /** Faces of walls directly above the road surface. */
  OVERHEAD_STRUCTURE,

  /** Speed bump on the floor of a drivable area, used to slow motor-vehicle traffic. */
  SPEED_BUMP,

  /** Door of a building. */
  BUILDING_DOOR,

  /** Window of a building. */
  BUILDING_WINDOW,

  /** Visible part of a roof. */
  BUILDING_ROOF,

  /** Building element to improve structural performance of a building. */
  BUILDING_BRACE,

  /** Used to calculate a camera's position and orientation (relative to a fiducial marker). */
  FIDUCIAL_MARKER,
};

/**
  * Type of shape of the sign. For landmarks of type `SIGN`, the original shape
  * of the sign face defines the geometry of the landmark. For landmarks of type
  * `SIGN_BOUNDING_BOX`, the geometry of the landmark is a bounding rectangle.
  */
enum uint8 LandmarkSignType
{
  /** Sign with a detailed shape, to be used for `LandmarkPolygonType.SIGN` only. */
  DETAILED_SHAPE,

  /** Original shape of the sign is a triangle with the tip pointing up. */
  TRIANGLE_TIP_UP,

  /** Original shape of the sign is a triangle with the tip pointing down. */
  TRIANGLE_TIP_DOWN,

  /** Original shape of the sign is a rectangle. */
  RECTANGLE,

  /** Original shape of the sign is a circle. */
  ROUND,

  /** Original shape of the sign is an octagon. */
  OCTAGON,

  /** Original shape of the sign is a diamond. */
  DIAMOND,

  /** Original shape of the sign is a crossbuck. */
  CROSSBUCK,

  /** Original shape of the sign is an ellipse. */
  ELLIPSE,

  /** Sign with an unknown shape. */
  UNKNOWN,
};

/** Details of a sign. */
struct LandmarkSignDetails
{
  /** Detail types that are stored for the sign. */
  LandmarkSignDetailsType detailType;

  /** Meaning of the sign if it is a warning sign. */
  WarningSign meaning
      if isset(detailType, LandmarkSignDetailsType.MEANING);

  /** Diameter of the sign. */
  WidthCentimeters diameter
      if isset(detailType, LandmarkSignDetailsType.DIAMETER);

  /** Content of the sign represented as a number, for example, the value of a speed limit. */
  varuint64 number
      if isset(detailType, LandmarkSignDetailsType.NUMBER);

  /** Content of the sign represented as a string, for example, text or QR codes. */
  string text
      if isset(detailType, LandmarkSignDetailsType.TEXT);
};

/** Bitmask to indicate which details of a sign are provided. */
bitmask varuint16 LandmarkSignDetailsType
{
  /** The meaning of the sign is stored. */
  MEANING,

  /** The diameter of the sign is stored. */
  DIAMETER,

  /** Additional textual content of the sign is stored, including QR codes, etc. */
  TEXT,

  /** Additional number content of the sign is stored, for example, the value of a speed limit. */
  NUMBER,

};

/** Color of a landmark represented as RGB values. */
struct LandmarkColor
{
  uint8 red;

  uint8 green;

  uint8 blue;
};

/** Type of fiducial marker system. */
enum uint8 FiducialMarkerSystemType
{
  /** ARToolKit marker system. */
  AR_TOOLKIT,

  /** ARTag marker system. */
  AR_TAG,

  /** ArUco marker system. */
  AR_UCO,

  /** AprilTag marker system. */
  APRIL_TAG
};

/** Details of a fiducial marker. */
struct FiducialMarkerDetails
{
  /** Used marker system. */
  FiducialMarkerSystemType type;

  /** Index of the marker within the used marker dictionary. */
  varuint16 dictionaryIndex;
};

/*!

### Landmarks Using Polygon Mesh Geometries

Polygon mesh landmarks are used to model 3D objects if the shape of a polyhedral
object is required, for example, for traffic lights, a newspaper box, or a wall.
Polygon mesh landmarks have a specific type and optionally a color.

With polygon mesh geometries, it is possible to model only parts of a landmark,
for example, the side of a pillar that is facing the road.

!*/

/** Details of a landmark that is represented as a polygon mesh geometry. */
struct LandmarkMesh
{
  /** Type of the landmark. */
  LandmarkMeshType type;

  /** Color of the landmark. */
  optional LandmarkColor color;

  /** Confidence value of the landmark in percentage (0-100). */
  optional LandmarkConfidence confidence : confidence <= 100;
};

/** Types of polygon mesh landmarks. */
enum uint8 LandmarkMeshType
{
  /** Traffic light. */
  TRAFFIC_LIGHT_BOX,

  /**
    * Box, booth, or similar road furniture. Example: Phone booth, post box,
    * newspaper box, or grit bin.
    */
  BOX,

  /**
    * Bridge pillar or other structure that is too big for a pole.
    * Any cylindrical or half-cylindrical element can be stored as a pillar.
    */
  PILLAR,

  /** Street light. */
  STREET_LIGHTS,

  /** Any wall structure on the side of the road. */
  WALL,

  /** Booth next to an entrance/exit of a building or next to an area with restricted access. */
  ACCESS_BOOTH,

  /** Ticket machine, for example, inside a parking garage. */
  TICKET_MACHINE,

  /** Beam at the ceiling of a building. */
  BUILDING_CEILING_BEAM,

  /** Column of a building. */
  BUILDING_COLUMN,

  /** A ramp connecting two levels of a parking garage. */
  BUILDING_CONNECTING_RAMP,

  /** Visible part of stairs. */
  BUILDING_STAIRS,

};

/*!

## Obstacles

Obstacles are simplified localization objects. Obstacles represent generic,
stationary objects that reside along the road and can be used for positioning,
for example, guardrails, walls, fences, lamp posts, or small hills near the road.

Obstacles are represented as horizontal or vertical 3D lines. In contrast to
landmarks, obstacles do not provide any additional detail information and
they do not have IDs.

The following figure shows a road with horizontal obstacles on both sides and
one vertical obstacle for a pole.

![Obstacles](assets/obstacles.png)

!*/

/** Obstacle types. Obstacles are represented as 3D lines. */
enum bit:1 ObstacleType
{
  /** Obstacle represented as horizontal 3D line. */
  HORIZONTAL,

  /** Obstacle represented as vertical 3D line. */
  VERTICAL,
};

/*!

## Occupancy Grids

Occupancy grids divide the world into evenly spaced cells, which are assigned a
defined occupancy status. For each cell, the compiler stores the probability
that the cell is occupied by an object. The probability threshold for
considering a cell to be occupied depends on the application.

Overlapping occupancy grids can be stored to prevent incorrect occupancy
information, for example, due to a vertical compression of occupancy data. The
following figure shows an example of data loss that occurs when multiple
occupancy grid layers are reduced to one layer.

![Compression of occupancy
data](assets/occupancy_vertical_compression.png)

The following figure shows an example of overlapping occupancy grids along two
intersecting roads. The occupancy grids can be assigned to the same road or to
different roads.

![Overlapping occupancy grids](assets/occupancy_overlapping_grids.png)

!*/

/** ID of an occupancy grid. */
subtype varuint32 OccupancyGridId;

/** Occupancy probability of a cell of a grid. Probabilities have 0.5 % accuracy. */
struct OccupancyProbability
{
  /** Probability value provided in steps of 0.5 %. */
  uint8 value: value <= 200;
};
