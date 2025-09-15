/*!

# Lanes

This package defines lanes.

Lanes are stored in containers called lane groups, which are defined in the
`lane.lanegroups` package, see [Lane Groups](lanegroups.zs). Lane boundary details
are defined in the `lane.boundaries` package, see [Lane Boundaries](boundaries.zs).

**Dependencies**

!*/

package lane.lanes;

import lane.reference.types.*;
import core.types.*;
import core.geometry.*;

import lane.boundaries.*;
import lane.types.*;

/*!

A lane as an object corresponds to the part of a real-world lane that is
stored inside a lane group. Each lane has an identifier and provides information
on lane geometry, connectivity, boundaries, traversability, and relations.

The digitization direction of a lane is from `previousLanes`
to `nextLanes`. All geometries are stored in digitization direction, see also
[Lane Geometry](#lane-geometry). In lane groups with ordered lanes, the lane IDs
are stored with directed IDs, indicating for each lane whether it is digitized in
the same or opposite direction as the lane group. Lane groups with unordered
lanes have no digitization direction. Because of this, in such lane groups the
lane IDs are stored with undirected IDs.

Lane boundaries are stored in boundary sets, which are sequentially ordered
in digitization direction of the lane, that is, from the start of the lane to
the end of the lane. For more information, see [Lane Boundaries](boundaries.zs).

All lanes store topology information of the lanes to which they are connected
using lane connectors. For more information, see [Lane Connectors](#lane-connectors).

The legal traversability between lanes indicates whether a lane boundary to an
adjacent lane on the left or right may be crossed. For more information, see
[Lane Traversability](#lane-traversability).

The travel direction on a lane is derived from the `PROHIBITED_PASSAGE` attribute.
If the `PROHIBITED_PASSAGE` attribute is not assigned in any direction, a lane
is open for travel in both directions.

__Note:__
The modeling of travel direction and prohibitions for roads and lanes is
described in the Rules module.

!*/

rule_group LaneRules
{
  /*!
  Unique Lane IDs:

  Lane IDs shall be unique per tile or object defined by the smart layer service.
  !*/

  rule "lane-n4cdso";

  /*!
  Direction of Lane Geometries:

  All lane geometries shall be stored in digitization direction.
  !*/

  rule "lane-0vk2t5";

  /*!
  Unstored Ranges of `openToLeft` and `openToRight`:

  The ranges of `openToLeft` and `openToRight` that are not stored shall be
  treated as legally closed.
  !*/

  rule "lane-0xwsrs-I";

  /*!
  Boundary Set Order in Lists `boundariesRight` and `boundariesLeft`:

  Boundary sets in the lists `boundariesRight` and `boundariesLeft` shall
  always be ordered sequentially from start of the lane to end of the lane.
  !*/

  rule "lane-0yyv00";

  /*!
  Subsequent Boundary Set Content:

  Subsequent boundary sets in the lists `boundariesRight` and `boundariesLeft`
  shall not have the same content.
  !*/

  rule "lane-2c94wo";

  /*!
  Lane Connectors in Lists `previousLanes` and `nextLanes`:

  All lane connectors in the lists `previousLanes` and `nextLanes` shall only
  have one major lane, that is, `LaneConnector.LaneSplitMergePriority.MAJOR`.
  !*/

  rule "lane-20se6n";

  /*!
  Lane Connector with `LaneSplitMergePriority` Value `MINOR`:

  If one lane connector in the lists `previousLanes` and `nextLanes` has
  `LaneSplitMergePriority` set to `MINOR`, the same list shall also contain
  either one lane connector with value `MAJOR` or at least two lane connectors
  with value `EQUAL`.
  !*/

  rule "lane-232t00";

  /*!
  Lane Connector with `LaneSplitMergePriority` Value `EQUAL`:

  If one lane connector in the lists `previousLanes` and `nextLanes` has
  `LaneSplitMergePriority` set to `EQUAL`, the same list shall contain at
  least one other lane connector with value `EQUAL`.
  !*/

  rule "lane-23uxto";

  /*!
  Lane Connector with `LaneSplitMergePriority` Value `MAJOR`:

  If one lane connector in the lists `previousLanes` and `nextLanes` has
  `LaneSplitMergePriority` set to `MAJOR`, the same list shall contain
  no lane connector with value `EQUAL`.
  !*/

  rule "lane-25dnrs";

  /*!
  Left/Right Assignment of Lane Boundaries:

  Boundaries shall always be fully assigned to the right or left of
  the lane center line. Exception: In splitting or merging situations the
  lane center line can intersect with a lane boundary.
  The following figure illustrates the rule: Lane boundary 31 is fully stored
  in the `boundariesRight` list of lane 101 even though in reality it is located
  on the left side of that lane for a short stretch.
  ![Left/right assignment of lane boundaries rule](assets/lanes_boundary_assignment_rule.png)
  !*/

  rule "lane-2kbk92";
};

/**
  * Lane ID with an additional sign bit describing the digitization direction of the lane
  * with respect to the digitization direction of the lane group it is contained in.
  */
subtype Var4ByteDirectedReference DirectedLaneId;

/** A part of a lane that is stored inside a lane group. */
struct Lane(LaneLayoutType layout, bool hasBoundaryGeometry)
{
  /** Directed identifier of the lane in case of ordered lane groups. */
  DirectedLaneId          directedLaneId if layout == LaneLayoutType.ORDERED;

  /** Undirected identifier of the lane in case of unordered lane groups. */
  LaneId                         laneId if layout == LaneLayoutType.UNORDERED;

  /** Lane connectors to the previous lanes. */
  LaneConnector previousLanes[]
                : lengthof(previousLanes) > 0;

  /** Lane connectors to the next lanes. */
  LaneConnector nextLanes[]
                : lengthof(nextLanes) > 0;

  /** Length of the lane in centimeters. */
  LaneLength      length;

  /**
    * Reference to a lane center line geometry.
    * In artificial intersection lane groups, value `NO_CENTER_LINE_GEOMETRY` can
    * be used to indicate that no center line geometry is available.
    */
  LaneCenterLineGeometryId    centerLineGeometryRef;

  /** Relations to other lanes inside an intersection lane group. */
  LaneRelation laneRelations[] if layout == LaneLayoutType.UNORDERED;

  /** Legal traversability of the lane to the adjacent lane on the left in digitization direction of the lane. */
  LaneTraversability  openToLeft;

  /** Legal traversability of the lane to the adjacent lane on the right in digitization direction of the lane. */
  LaneTraversability  openToRight;

  /** List of lane boundary sets on the left side of the lane. */
  BoundarySet(hasBoundaryGeometry) boundariesLeft[];

  /** List of lane boundary sets on the right side of the lane. */
  BoundarySet(hasBoundaryGeometry) boundariesRight[];

};

/*!

## Zero-Length Lanes

Zero-length lanes are a special type of lane and only exist for topology reasons.
Zero-length lanes are used in lane groups at tile borders and in fork lane groups
to connect lanes with each other.

In contrast to the fully-featured default lanes, zero-length lanes have
no other information than connectivity.

To enable connectivity of lanes at tile borders, the lane groups in both tiles
have the same layout. The zero-length lane shall not need to be connected to the
lane on the other side of the tile border.
For more information, see [Lane Groups](lanegroups.zs).

!*/

/** Definition of a zero-length lane. */
struct ZeroLengthLane(bool onBorder)
{
  /** Identifier of the zero-length lane.*/
  LaneId          laneId;

  /** Lane connectors to the previous lanes. */
  LaneConnector previousLanes[]
            : lengthof(previousLanes) > 0;

  /** Lane connectors to the next lanes. */
  LaneConnector nextLanes[] if !onBorder
            : lengthof(nextLanes) > 0;
};

/*!

## Lane Connectors

Lane connectors connect lanes of two lane groups or inside an intersection
lane group. Lane connectors have predefined connectivity types and indicate
merge/split priority.

In most cases, a lane connects to another lane using the identifier
of the other lane. The direction of the reference to the other lane
indicates to which end of the other lane the current lane is connected to.
If the lane connector is connected to the start of the other lane, the reference
is in negative direction. If the lane is connected to the end of the other lane,
the reference is in positive direction.

The following figure shows how lanes are connected using directed references:

![Connected lanes](assets/connected_lanes.png)


If lanes terminate, that is, if they start or end without splitting or merging,
the lane connector has special values:

- If the lane connectivity is unknown, but probably exists, the type `UNKNOWN` is used.
- If it is known that the lane starts or ends, the type `TERMINATES` is used.
- If the lane ends on a tile border, but is connected to a lane in the other tile,
  the type `CONNECTED_OTHER_TILE` is used.

Merge/split priority describes whether one of the connected lanes has priority over
the other in terms of lane topology. Major lanes follow the main traffic flow
whereas minor lanes split or merge.
Using the priority information, the application can find out easily whether a
lane splits or merges and which lane has to give right of way in merge situations
without having to analyze geometries.

The following figure shows the lane connector values that are stored for a lane
merge or split.

![Connected lanes with priority](assets/connected_lanes_priority.png)

The lane connectors of lanes 101 and 102 both store `MAJOR` priority in the
counterpart connectors to lane 100. To find out the correct priority in case of
a lane merge or split, an application must analyze the connector that has two or
more entries. In this case, this applies to the end connector of lane 100, even
if a vehicle approaches the lane merge from lane 102.

In cases without clear priority, the value `EQUAL` is used to indicate that
the lanes require equal treatment.
Whether the lane splits or merges, depends on the travel direction but can
easily be derived.

!*/

rule_group LaneConnectorRules
{
  /*!
  Priority of Lanes with One-to-one Relations:

  If lanes of two lane groups have a one-to-one relation, `LaneConnector.priority`
  shall be set to `MAJOR`.
  !*/

  rule "lane-27aoe9";

  /*!
  Geometric Connection of Logically Connected Lanes:

  If lanes are logically connected via `LaneConnectionType.BY_IDENTIFIER`,
  their lane center line geometries shall also be connected, that is, they share
  the respective start and end positions. Exception: Lanes in
  `ArtificialRoadLaneGroup` and `ArtificialIntersectionLaneGroup` are excluded
  from this rule.
  !*/

  rule "lane-2k7mt6";

  /*!
  Lane Connectors at Tile Borders:

  If a road lane group ends at a tile border, lanes contained in that lane group shall only have the
  `LaneConnectionType.CONNECTED_OTHER_TILE` type. This ensures that the requirements
  regarding road lane groups starting or ending at tile borders can be met (see #lane-0apb5s).
  If lanes end at the tile border in reality, a border lane group shall be introduced
  for which this rule does not apply.
  !*/

  rule "lane-qgt6yu";

  /*!
  Usage of Lane Connection Types:

  If a lane has a start or end connector of `LaneConnectionType` = `TERMINATES`,
  `UNKNOWN`, or `CONNECTED_OTHER_TILE`, then the corresponding array in
  `previousLanes` or `nextLanes` shall only have one entry, that is, for this
  connector.

  !*/

  rule "lane-yu8n4n";

  };

/** Connector to another lane. */
struct LaneConnector
{
  /** Type of connection. */
  LaneConnectionType type;

  /** Priority for split and merge situations. */
  LaneSplitMergePriority priority = LaneSplitMergePriority.MAJOR;

  /**
    * Directed reference to the connected lane.
    * Set to `positive` if connected to the end of the other lane.
    * Set to `negative` if connected to the start of the other lane.
    */
  DirectedLaneReference connectedLaneId if type == LaneConnectionType.BY_IDENTIFIER;
};

/** Connection type between lanes. */
enum bit:4 LaneConnectionType
{
  /** The lane is connected to another lane using its directed lane ID. */
  BY_IDENTIFIER,

  /**
    * The lane is not connected to another lane. Its real-world connectivity is
    * unknown.
    *
    * This value is used if the connected lane is not captured, or if
    * the lane data coverage ends. An application cannot assume that the
    * lane terminates in reality.
    */
  UNKNOWN,

  /**
    * The lane starts or ends in the real world. This value is used if the data
    * provider knows that a lane physically terminates.
    */
  TERMINATES,

  /**
    * The lane starts or ends on a tile border and is connected to a lane in the
    * other tile.
    */
  CONNECTED_OTHER_TILE,
};

/** Priority of lanes in split and merge situations. */
enum bit:4 LaneSplitMergePriority
{
  /** This lane is the major lane and traffic flow follows this priority path. */
  MAJOR,

  /** This lane is equal to other lanes and the lanes share the same priority of traffic. */
  EQUAL,

  /** This lane is a minor lane that splits off or merges into a major lane. */
  MINOR,
};

/*!

## Lane Traversability

Lane traversability is stored on each lane for the adjacent lanes in digitization
direction of the lane. Only those ranges are stored where the vehicle may cross
from one lane to the other.
All other ranges are implicitly considered to be closed.

Traversability reflects the legal ability to change from one lane into
another. In most cases, this is consistent with the lane markings.
But there can be cases where the legal rule and the markings differ, for example,
in case of a center turning lane.

The definition of legal traversability depends on the lane group type:

- In road lane groups, traversability between two lanes is expressed as
a range along the lane center line geometry.
- In intersection lane groups, traversability is expressed using dedicated
relations to other lanes. A relation includes a range on the current lane for
which the relation is valid, a relation type, and the lane ID of the other lane.

!*/

rule_group LaneTraversabilityRules
{
  /*!
  No Overlapping of Ranges in `LaneTraversability`:

  Ranges defined in `LaneTraversability` shall not overlap.
  !*/

  rule "lane-289si2";

  /*!
  Traversability Ranges:

  Ranges defined in `LaneTraversability` shall be in the bounds of the lane
  center line geometry.
  !*/

  rule "lane-29usin";
};

/** Lane traversability per range on the lane center line geometry. */
struct LaneTraversability
{
  /** A list of ranges on the lane for which the traversability is valid. */
  LaneGeometryRange   ranges[];
};

/*!

## Lane Relations

A lane relation describes how one lane relates to another lane in the same lane group.
A lane relation is only valid for specific ranges on both lanes. With lane
relations, the directions left and right are evaluated in digitization direction
of the lane.

Lane relations are symmetric, that is, a lane relation and its inverse relation
have the same type. For example, if lane 1 has a relation of type `CROSSING` to
lane 2, then the inverse relation from lane 2 to lane 1 also has the type `CROSSING`.

Two lanes are considered to be adjacent if they are physically next to each other, regardless
of the digitization direction. For two adjacent lanes, it is possible to determine the
relative digitization directions by evaluating the corresponding lane relation. If
two adjacent lanes have the same lane relation type, they have opposing digitization
directions. If two adjacent lanes have different lane relation types, they have
the same digitization direction.

Splitting occurs if a lane is forming out of another lane and continues to be adjacent
to it. In a similar manner, two lanes are considered to be merging if a lane is ending
on another lane after being adjacent to it. Lanes are considered to be splitting until
they are fully formed. Lanes are considered to be merging until they are fully unformed.

Forking is similar to splitting and merging in the sense that there is a lane
beginning or ending on another lane. However, forking differs from splitting or
merging in that the lanes are not adjacent before or after. Lanes are considered
to be forking until they are fully formed.

Two lanes are considered to be overlapping if their surfaces overlap but their center lines
do not cross.

The following figure shows simple examples of lane relations and the corresponding
lane relation types. The example of adjacency illustrates how the digitization
direction can be determined from the lane relation types.

![Simple examples of lane relations.](assets/lane-relations-types.png)

The following figure shows a scenario in which two lanes fork of two adjacent lanes.

![Lane relations with forking and crossing lanes](assets/lane-relations-fork.png)

The following figure shows selected lanes on a typical urban intersection.

![Lane relations on an urban intersection](assets/lane-relations-urban-intersection.png)

The following figure shows a complex scenario with both forking and splitting lanes.
Note the difference between forking and splitting or merging. Lane 3 and lane 5
fork because they have not been adjacent before. Lane 3 and lane 4 split because
they continue to be adjacent.

![Lane relations with forking and splitting lanes](assets/lane-relations-fork-split-merge.png)

The following figure shows ranges of selected lane relations. This example also
shows, that ranges of lane relations may overlap, as long as the combination of
relation type and target lane is unique.

![Ranges of selected lane relations.](assets/lane-relations-ranges.png)

!*/

rule_group LaneRelationRules
{
  /*!
  Overlapping Ranges in Lane Relations List:

  If ranges in `Lane.laneRelations[]` overlap geometrically, the combination
  of relation type and target lane shall be unique.
  !*/

  rule "lane-2c7mdj";

  /*!
  Crossing Lanes Do Not Overlap:

  The lane relation type `OVERLAP` shall not be used if the center lines of the
  two related lanes cross. `OVERLAP` may be used if the center lines only touch
  each other.
  !*/

  rule "lane-2kjr57";

  /*!
  Symmetric Lane Relations:

  Lane relation types shall be consistent with each other.
  If a lane relation has the type `CROSSING`, the inverse relation shall also have the type `CROSSING`.
  If a lane relation has the type `ADJACENT_*`, the inverse relation shall also have the type `ADJACENT_*`.
  If a lane relation has the type `SPLIT_MERGE_*`, the inverse relation shall also have the type `SPLIT_MERGE_*`.
  If a lane relation has the type `FORK_*`, the inverse relation shall also have the type `FORK_*`.
  If a lane relation has the type `OVERLAP`, the inverse relation shall also have the type `OVERLAP`.
  !*/

  rule "lane-tiqh6h";
};

/** Relations to other lanes in the same lane group. */
struct LaneRelation
{
  /** Type of relation between the current lane and the other lane. */
  LaneRelationType laneRelationType;

  /** Range on the current lane for which the relation is valid. */
  LaneGeometryRange range;

  /** Identifier of the other lane in the same lane group. */
  LaneId otherLane;

  /** Range on the other lane for which the relation is valid. */
  LaneGeometryRange otherLaneRange;

  /**
    * Set to `true` if the other lane has the same digitization direction as the
    * current lane.
    */
  bool otherLaneSameDigitizationDirection if laneRelationType != LaneRelationType.CROSSING;

};

/** Lane relation types.*/
enum uint8 LaneRelationType
{
  /** The center line of the related lane crosses the center line of the current lane. */
  CROSSING,

  /** The related lane is adjacent on the left of the current lane. */
  ADJACENT_LEFT,

  /** The related lane is adjacent on the right of the current lane.*/
  ADJACENT_RIGHT,

  /**
    * The related lane splits to or merges from the left of the current lane.
    * The related lane is forming or ending and is adjacent to the left on its
    * further or previous course.
    */
  SPLIT_MERGE_LEFT,

  /**
    * The related lane splits to or merges from the right of the current lane.
    * The related lane is forming or ending and is adjacent to the right on its
    * further or previous course.
    */
  SPLIT_MERGE_RIGHT,

  /**
    * The related lane forks to the left from the current lane or it forks into
    * the current lane from the left side.
    * The related lane is continuing or ending and is later not or has been
    * adjacent to the current lane.
    */
  FORK_LEFT,

  /**
    * The related lane forks to the right from the current lane or it forks into
    * the current lane from the right side.
    * The related lane is continuing or ending and is later not or has been
    * adjacent to the current lane.
    */
  FORK_RIGHT,

  /** REMOVED. Use `ADJACENT_LEFT` or `ADJACENT_RIGHT` plus attribute `LANE_WIDTH_STATE` for overlapping lanes. */
  @removed OVERLAP,
};

/*!

## Lane Geometry

There are two important types of geometries for lanes:

- Center line geometry
- Boundary geometry

The center line geometry is used to map attributes to lanes.
Center line geometries are stored in digitization direction of the
lane.

Boundary geometries are used to indicate the exact borders of lanes.
For more information about boundary geometries, see
[Lane Boundaries](boundaries.zs).



!*/

rule_group CenterLineGeometryRules
{
  /*!
  Properties of Lane Center Lines:

  Lane center lines shall be continuous and smooth across lane groups.
  Exception: This rule does not apply to artificial road lane groups or
  artificial intersection lane groups.
  !*/

  rule "lane-2gqw2e-I";

  /*!
  No Lane Center Line Geometry in Artificial Intersection Lane Group:

  The value `NO_CENTER_LINE_GEOMETRY` shall only be used for
  `centerLineGeometryRef` in `ArtificialIntersectionLaneGroup.lanes`.
  !*/

  rule "lane-2g562e";
};

/** Type to store the identifier of the lane center line geometry. */
subtype varuint32 LaneCenterLineGeometryId;

/**
  * Special value to indicate that a lane in an artificial intersection lane
  * group has no center line geometry.
  */
const LaneCenterLineGeometryId NO_CENTER_LINE_GEOMETRY = 0;