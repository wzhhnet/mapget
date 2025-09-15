/*!

# Lane Types

This package defines types that are reused in other packages of the Lane module.

**Dependencies**

!*/

package lane.types;

/*!

## Lane Layout Type

The lane layout type defines how lanes are ordered within a lane group.
Depending on the lane group type, lanes in a lane group can either be unordered
or ordered. The ordering direction is from right to left in
digitization direction of the lane group, regardless of left-hand or
right-hand traffic.

!*/

/**
  * Defines whether lanes are ordered or unordered within a lane group. Ordering
  * is from right to left in digitization direction of the lane group.
  */
enum uint8 LaneLayoutType
{
  /** Lanes are ordered. */
  ORDERED,

  /** Lanes are unordered. */
  UNORDERED,
};

/*!

## Lane Boundary Element Type

There are four types of lane boundary elements:
- Logical, see [Logical Boundary Types](#logical-boundary-types)
- Marking, see [Marking Boundary Types](#marking-boundary-types)
- Physical divider, see [Physical Divider Boundary Types](#physical-divider-boundary-types)
- Physical marking, see [Physical Marking Boundary Types](#physical-marking-boundary-types)

!*/

/** Boundary element types. */
enum uint8 BoundaryElementType
{
  /** Logical boundary element. */
  LOGICAL,

  /** Marking boundary element. */
  MARKING,

  /** Physical divider boundary element. */
  PHYSICAL_DIVIDER,

  /** Physical marking boundary element. */
  PHYSICAL_MARKING,
};

/*!

## Physical Divider Boundary Types

Physical divider boundary elements describe a physical divider on the lane
boundary. The boundary geometry of physical dividers is on the ground and
represents a logical line where the physical divider would be located if
projected to the road surface. Physical divider boundaries are not
intended to be crossed, therefore there is a limited risk of crossing traffic
from adjacent lanes.

Physical divider boundary elements can have further characteristics
such as width or material, but have no color.


|Example                                                                                 |Boundary type  |Description                                                                                                                |
|----------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------------------------------|
|![Physical divider type: curb.](assets/boundarytype_curb.jpg)                     |CURB           |Physical boundary between lane and side of the road. Vehicles are not allowed to cross curbs in normal traffic situations. |
|![Physical divider type: straight wall.](assets/boundarytype_wall_flat.jpg)       |WALL_FLAT      |Straight wall on the curbside of a lane.                                                                                   |
|![Physical divider type: wall in tunnel.](assets/boundarytype_wall_tunnel.jpg)    |WALL_TUNNEL    |Wall inside a tunnel.                                                                                                      |
|![Physical divider type: jersey barrier.](assets/boundarytype_barrier_jersey.jpg) |BARRIER_JERSEY |Modular concrete or plastic barrier.                                                                                       |
|![Physical divider type: sound barrier.](assets/boundarytype_barrier_sound.jpg)   |BARRIER_SOUND  |Wall beside the road that is intended to protect the surrounding area against noise.                                       |
|![Physical divider type: cable barrier.](assets/boundarytype_barrier_cable.jpg)   |BARRIER_CABLE  |Safety barrier consisting of metal cables.                                                                                 |
|![Physical divider type: guardrail.](assets/boundarytype_guardrail.jpg)           |GUARDRAIL      |Safety barrier consisting of metal sheets.                                                                                 |
|![Physical divider type: fence.](assets/boundarytype_fence.jpg)                   |FENCE          |Barrier that can consist of different materials, for example, chain links.                                                 |
|![Physical divider type: ditch.](assets/boundarytype_ditch.jpg)                   |DITCH          |Long narrow excavation that is dug in the earth along a road and holds water.                                              |
|![Physical divider type: snowbank.](assets/boundarytype_snowbank.jpg)             |SNOWBANK       |Large pile of snow along the side of a road.                                                                               |

!*/

/** Types of physical dividers. */
enum uint8 PhysicalDividerBoundaryType
{
  /** Curb. */
  CURB,

  /** Flat wall. */
  WALL_FLAT,

  /** Tunnel wall. */
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

  /** Ditch. */
  DITCH,

  /** Snowbank. */
  SNOWBANK,

  /** Type of physical divider is unknown. */
  UNKNOWN = 255
};

/*!

## Physical Marking Boundary Types

Physical marking boundary elements describe markings that are not painted
on the ground, but that physically describe a lane boundary. This boundary
type also includes physical boundaries that can be crossed.

Physical marking boundary elements can have further characteristics like
material and width, but have no color.

!*/

/** Types of physical markings. */
enum uint8 PhysicalMarkingBoundaryType
{
  /**
    * Traversable curb. Traffic is legally allowed to cross this lane
    * boundary in normal traffic situations.
    */
  CURB_TRAVERSABLE,

  /**
    * Pylons provide no physical protection between the adjacent lanes.
    * Traffic is legally not allowed to cross pylons in normal traffic situations.
    */
  PYLONS,

  /**
    * Delineator posts provide no physical protection between the adjacent lanes.
    * Traffic is legally not allowed to cross delineator posts in normal
    * traffic situations.
    */
  DELINEATOR_POSTS,

  /** Type of physical marking is unknown. */
  UNKNOWN = 255
};

/*!

## Logical Boundary Types

Logical boundary elements only have a semantic meaning. They do not have any
physical characteristics. Their semantics usually describe a certain situation
that begins on the other side of the lane boundary when looking at it from the
lane.

The borders of the logical boundaries, for example, a solid line or curb, are
modeled with additional, physical boundaries.

!*/

/** Types of logical boundaries. */
enum uint8 LogicalBoundaryType
{
  /**
    * No lane marking or physical boundary is available. A purely virtual lane boundary
    * that does not induce any kind of meaning.
    */
  PURE_VIRTUAL,

  /**
   * Boundary to a gore area, which is a paved area between two lanes that
   * can be crossed physically.
   *
   * While gore areas can be crossed physically, it is usually not allowed to
   * cross them legally, at least in parts.
   */
  GORE,

  /**
   * Boundary to a walking area for pedestrians along the road, for example,
   * a sidewalk, waiting area of a bus stop, trail, or end of a pedestrian zone.
   */
  WALKING_AREA,

  /** Boundary to a shaded area. */
  SHADED_AREA,

  /** Cliff. */
  CLIFF,

  /** End of the road surface, for example, end of pavement or gravel. */
  END_OF_ROAD_SURFACE,

  /**
    * Boundary to parking facility.
    *
    * There is a higher probability that vehicles enter the road from
    * behind this boundary.
    */
  PARKING_AREA,

  /**
    * Boundary to driveway, which is entering the road.
    *
    * There is a higher probability of other road users entering the lane from behind
    * this boundary.
    */
  DRIVEWAY,

  /**
    * Boundary to a waiting area of a public transport stop, for example, a bus stop.
    *
    * There is a higher probability of pedestrians located behind or
    * entering the lane from behind this boundary.
    */
  PUBLIC_TRANSPORT_WAITING_AREA,

  /**
    * Boundary to an area of road construction, often delimited by pylons or
    * other light physical boundaries.
    */
  CONSTRUCTION_AREA,

  /** Boundary to an area where bicycles ride. */
  BICYCLE_AREA,
};

/*!

## Marking Boundary Types

Marking boundary elements describe painted markings along a lane.
They have further physical characteristics such as width, color, or material.

!*/

/** Marking boundary types. */
enum uint8 MarkingBoundaryType
{
  /** Dashed line. */
  DASHED_LINE,

  /** Solid line. */
  SOLID_LINE,

  /** Shaded area. A line that borders the shaded area. */
  SHADED_AREA_BORDER,

  /** Dashed blocks. */
  DASHED_BLOCKS,

  /** Marking for a crossing that looks like a zigzag line. */
  CROSSING_ALERT,

  /** Type of painted marking is unknown. */
  UNKNOWN = 255
};

/*!

## Material Types

!*/

/** Material type of physical boundaries. */
enum uint8 PhysicalBoundaryMaterial
{
  /** Unknown. */
  UNKNOWN,

  /** Metal. */
  METAL,

  /** Concrete. */
  CONCRETE,

  /** Stone. */
  STONE,

  /** Wood. */
  WOOD,

  /** Plastic. */
  PLASTIC,

  /** Transparent. */
  TRANSPARENT_MATERIAL,
};

/** Material type of marking boundaries. */
enum uint8 MarkingMaterial
{
  /** Unknown. */
  UNKNOWN,

  /**
    * Raised markings or markings cut into the road.
    * Examples: Botts' dots, cat's eyes, or rumble strips without paint.
    */
  VIBRATION_MARKINGS,

  /**
    * Combination of painted markings with vibration markings.
    * Example: rumble strips with paint.
    */
  PAINTED_VIBRATION_DIVIDER,

  /** Marking is painted. */
  PAINTED,
};

/*!

## Tile Border Indicator

The tile border indicator is used in a lane group connector. It defines in which
adjacent tile a matching border position can be found.

!*/

/** Tile border indicator. */
enum bit:4 TileBorderIndicator
{
  /** Tile with matching position can be found to the north. */
  NORTH,
  /** Tile with matching position can be found to the northeast. */
  NORTH_EAST,
  /** Tile with matching position can be found to the east. */
  EAST,
  /** Tile with matching position can be found to the southeast. */
  SOUTH_EAST,
  /** Tile with matching position can be found to the south. */
  SOUTH,
  /** Tile with matching position can be found to the southwest. */
  SOUTH_WEST,
  /** Tile with matching position can be found to the west. */
  WEST,
  /** Tile with matching position can be found to the northwest. */
  NORTH_WEST,
};
