/*!

# Roads and Intersections

This package defines roads and intersections of the Road module.

**Dependencies**

!*/

package road.road;

import core.types.*;
import core.geometry.*;

import road.reference.types.*;


/*!

Roads and intersections form the basic topology, which is then attributed.

Roads only have an identifier and a length. Intersections have an identifier and
position information, as well as information about the roads that are connected
to the intersection. The road and intersection IDs are unique within the
tile in which they are stored.

Roads and intersections are independent from each other. To find out which
intersections are connected to which roads, intersections provide a list of
connected roads using directed references. A reference in positive direction
indicates the start intersection of that road. A reference in negative direction
indicates the end intersection of that road.

The following figure shows how roads are connected to intersections.

![Intersections with connected roads](assets/road_start_end_intersection.png)

The road geometry is stored in a separate layer and ranges from the start
intersection to the end intersection, including the corresponding positions.
That way, road geometries can be connected without having to read position
information from the intersection structures.

If roads and intersections are digitized at the same time, the start position of
a road geometry usually corresponds to the position information in the
corresponding intersection structure. However, if the road geometries are
updated, it may be beneficial to keep the positions of the corresponding
intersections stable to connect roads across tile borders, see [Connecting Roads
and Intersections Across Tile
Borders](#connecting-roads-and-intersections-across-tile-borders).

The following figure shows two versions of the same tile with two road
geometries and the corresponding intersections. Two intersections are placed on
the tile borders. In version 1 of the tile, the start and end positions of the
road geometries match the intersection positions. In version 2, the road
geometries are updated, while the intersection positions are kept stable:

![Road geometry with intersection positions](assets/road_geometry_and_intersection.png)

!*/

rule_group RoadAndIntersectionRules
{
  /*!
  No Intersections with Identical Positions:

  There shall be no two intersections that have the same `position` and `zLevel`
  values.
  !*/

  rule "road-2jb6eo";

  /*!
  Sorting of Roads on Intersections:

  The roads connected to an intersection shall be sorted in ascending order by
  their respective angle against north in clockwise direction.
  !*/

  rule "road-e89e7k";
};

/** Definition of a road.*/
struct Road
{
    /** Identifier of the road. */
    RoadId      id;

    /** Real-world length of the road in centimeters. */
    RoadLength  length;
};

/** Definition of an intersection.*/
struct Intersection(CoordShift coordShift)
{
    /** Identifier of the intersection. */
    IntersectionId id;

   /**
     * Set to `true` if the intersection is artificially added on a tile
     * border. Set to `false` if the intersection is a real intersection within
     * a tile or on a tile border.
     */
    bool isArtificial;

    /** z-level of the intersection.*/
    IntersectionZLevel zLevel;

    /** Number of roads that are connected to the intersection within the tile. */
    uint8 numRoads : ((isArtificial && (numRoads <= 1))
                  || (!isArtificial && (numRoads > 0 && numRoads < 181)));

    /** Position of the intersection.*/
    Position2D(coordShift) position;

align(8):
    /** Directed references to the roads connected to the intersection. */
    IntersectionRoadReference(isArtificial) connectedRoads[numRoads];
};

/*!

## Connecting Roads and Intersections Across Tile Borders

Roads are tile independent, they are split at tile borders. This is done by
introducing artificial intersections on the tile borders. To allow for
references across tiles, the application loads roads from multiple tiles and
uses the artificial intersections to stitch the roads together. The artificial
intersections are placed directly on the tile border. Two corresponding
artificial intersections in adjacent tiles are identified based on their
position.

Artificial intersections also contain an arbitrary z-level, which is not used
for rendering. The z-level is required to distinguish two overlaying artificial
intersections that have the same 2-dimensional coordinates. This is the case if
two roads cross the tile border at the same position but do not cross each
other, that is, the roads have a different elevation.

The following figure shows two roads that cross the tile border at the same
position but do not have a common intersection in the real world. For the tiles
B and C, both artificial intersections are stored with the same 2-dimensional
coordinates but with different z-levels.

![Artificial intersection with different z-levels per
tile](assets/artificial_intersection_zlevel.png)

As an exception, the general south-west rule for tiles does not apply to
artificial or real intersections on tile borders. By the south-west rule,
positions are only stored in one tile, but intersections on tile borders are
explicitly stored in both adjacent tiles or in all four adjacent tiles if the
intersection is located on the tile corner. Matching corresponding intersections
in adjacent tiles enables applications to resolve references across these tiles.

In case there is a real-world intersection on a tile border but no connected
roads in the adjacent tiles, then an artificial intersection with no connected
roads is created in the adjacent tiles. This approach has the advantage that the
application can handle these intersections the same way as if roads were
connected to the intersection. Also, a missing artificial intersection in the
adjacent tile can be an indication of an error.

!*/

rule_group RoadsAndIntersectionsAcrossTilesRules
{
  /*!
  Splitting of Roads at Tile Borders:

  Roads shall be artificially split at tile borders. An artificial
  intersection shall be added on the tile border. Artificial intersections
  shall only be added on tile borders.
  !*/

  rule "road-26o75q";

  /*!
  Roads Along Tile Borders:

  If a road runs along a tile border and is connected to two real intersections
  on the same tile border, then the road shall only be stored in one of the
  neighboring tiles according to the south-west rule.
  !*/

  rule "road-2amgnu";

  /*!
  Intersections on Tile Borders:

  If an intersection is located on a tile border, then the intersection shall be
  stored in both adjacent tiles or in all four adjacent tiles if the
  intersection is located on the tile corner. This rule applies to real-world
  intersections that are located on the tile border and artificial intersections
  that are created because a road crosses the tile border. If a real-world
  intersection is located on a tile border but has no road in the adjacent tiles,
  then an artificial intersection with no connected roads shall be created in
  the adjacent tiles.

  The following figure demonstrates these three scenarios:

  ![Intersections on tile border](assets/intersections_on_tile_border.png)
  !*/

  rule "road-2b2p2w";
};

/*!

## Road and Intersection Lists

Roads and intersections are stored in lists, which are part of
feature or geometry layers in the Road module.

!*/

rule_group RoadAndIntersectionListRules
{
  /*!
  Ordering Lists along Smart Layer Paths:

  If lists are stored in layers that are supplied through a smart layer path
  interface, then the lists shall be ordered from the start to the end of
  the path.
  !*/

  rule "road-2dfpns";

  /*!
  Connectivity of Roads in Matched Road Segment:

  The roads that are referenced in a `MatchedRoadSegment` shall be connected,
  that is, there shall be no gaps between the roads.
  !*/

  rule "road-9fww9m";
};

/** Stores a list of roads. */
struct RoadList
{
    /** List of roads. */
    packed Road    roads[];
};


/** Stores a list of intersections. */
struct IntersectionList(CoordShift shift)
{
    /** List of intersections. */
    packed Intersection(shift)  intersections[];
};

/*!

## Matched Road Segment

A matched road segment is a list of matched roads that form a segment of a
matched road path.

!*/

/** List of matched roads that form a segment of a matched road path. */
struct MatchedRoadSegment
{
  /** Road references to the matched roads.*/
  packed DirectedRoadReference matchedRoads[];
};

/*!

## Routing Information in Road Tiles

Road tiles can contain routing information on different levels. Each level provides a
different degree of detail of the road network. For example, the road network on
level 13 is more detailed than the road network on level 11.
This allows to aggregate roads on upper levels (for example, 0-8) and to minimize
the amount of data that routing applications need to read.

Intersections connect different levels of a road tile. If the position of an
aggregated intersection on an upper level equals the position of an
intersection on a lower level, then they both represent the same
real-world intersection and a routing algorithm can change between the levels.

This mechanism requires the same coordinate shift on all levels of the
road layer, which means that upper levels need the same coordinate
precision for intersections as lower levels.

An application can connect the intersections of two or more tiles on
different levels by comparing their intersection lists. The application can create
virtual upward and downward references by relating all intersections that have
the same position on different levels. Therefore, all intersections that are
required for virtual upward and downward references are stored on all relevant levels.

The following figure shows different levels with routing information. The
road network on level 13 is more detailed than the road network on levels 12 and 11.
On levels 12 and level 11, several lower-level roads and intersections are
aggregated to a single feature. The first and the last intersection of an
aggregated road on level 12 have the same positions as the related intersections
on level 13.

![Aggregated roads and intersections](assets/aggregation_intersections_3levels.png)

To correctly resolve the downward references of an aggregated road, an
application needs to do the following:

1. Identify the start and end intersection of an aggregated road on the upper
   level.
1. On the lower level, find the intersection with the same position as the start
   intersection.
1. Evaluate the connected roads of that intersection and find all roads with the
   same functional road class as the aggregated road on the upper level.
1. From those roads, select the one road that is connected at the same angle as
   the road on the upper level.
1. Follow that road to the next intersection and evaluate the connected roads to
   find the next road with this functional road class.
1. Continue until the intersection on the lower level matches the end
   intersection on the upper level.

To ensure stable topological connections, it can be necessary to never change
the position of intersections over the map lifetime even if the coordinates
change slightly in reality. This does not influence attribution because the
coordinates of the intersection structure itself are not used for that purpose.
The real position of the intersection is redundantly stored in the road
geometry.

!*/

rule_group RoadTilesRoutingLevelsRules
{
  /*!
  Aggregation of Roads:

  Two roads shall only be aggregated if all of the following conditions are true:

  - The roads have the same functional road class.
  - No additional roads with the same functional road class are connected
    to the intersection that is removed during aggregation.
  !*/

  rule "road-mcvvb2";

  /*!
  No Loops in Aggregated Roads:

  To maintain the correct topology of the routing network, the two intersections
  of a road shall not be aggregated if the result would form a loop.

  !*/

  rule "road-pbwh2c-I";

  /*!
  Same Coordinate Shift on All Levels of the Road Tile:

  All levels of a road tile shall have the same coordinate shift.

  !*/

  rule "road-020ekf";

  /*!
  Identical Angles for Roads Referenced in `connectedRoads` on All Levels:

  To resolve downward references, the angles of the roads that are referenced in
  `connectedRoads` shall be identical on all levels.

  !*/

  rule "road-zghfbb";
};