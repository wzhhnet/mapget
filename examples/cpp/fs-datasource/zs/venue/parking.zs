/*!

# Parking Facilities

This package defines how parking facilities are modeled.

__Note:__
Attributes that describe parking facilities in more detail are defined in
the Venue Details module.

**Dependencies**

!*/

package venue.parking;

import venue.types.*;
import venue.reference.types.*;
import lane.reference.types.*;
import road.reference.types.*;
import core.geometry.*;

/*!

To model parking facilities, the following parking facility elements are provided:

- Parking facility
- Parking level
- Parking section
- Parking row
- Parking spot

The parking facility elements form a hierarchy with the facility as the
entry point or root node of that hierarchy.
A minimal parking facility with one parking spot contains one parking facility,
one element of each type listed above. No level of the hierarchy can be left out.

To model the connections
between the parking facility elements, a parking level can have a list
of directly connected parking levels and a parking section can have a list
of directly connected parking sections.

The following figure shows the hierarchical elements of such a parking facility
and demonstrates the connections between the parking facility elements.

![Hierarchical elements of a parking facility](assets/parking_facility.png)


!*/


rule_group ParkingFacilityRules
{
  /*!
  Connected Parking Levels:

  If two parking levels are connected to each other, then each parking
  level shall be included in the `connectedLevels` list of the other
  parking level.
  !*/

  rule "venue-mruhb7";

  /*!
  Connected Parking Sections:

  If two parking sections are connected to each other, then each parking
  section shall be included in the `connectedSections` list of the other
  parking section.
  !*/

  rule "venue-b5zv6h";
};


/** All elements of a parking facility in a hierarchical structure. */
struct ParkingFacility
{
  /** Identifier of the parking facility. */
  ParkingFacilityId id;

  /** Parking levels within the facility. */
  ParkingLevel levels[];
};

/** Physical parking level. */
struct ParkingLevel
{
  /** Identifier of the parking level. */
  ParkingLevelId id;

  /** Parking sections on the level. */
  ParkingSection sections[];

  /**
    * Parking levels that are connected to this parking level.
    * The connection is stored in both connected levels.
    */
  optional ParkingLevelConnector connectedLevels[];
};

/** Connector between two parking levels. */
struct ParkingLevelConnector
{
  /** Identifier of the connected parking level. */
  ParkingLevelId levelId;

  /**
    * Bounding polygon that describes the transitional area between the
    * connected source and destination levels.
    */
  optional BoundingPolygon3D(0,0) transitionPolygon;
};

/** Logical section of a parking facility. */
struct ParkingSection
{
  /** Identifier of the parking section. */
  ParkingSectionId id;

  /** Parking rows of the section. */
  ParkingRow rows[];

  /** Connected parking sections.
    * The connection is stored in both connected sections.
    */
  optional ParkingSectionConnector connectedSections[];
};

/** Connector between two parking sections. */
struct ParkingSectionConnector
{
  /** Identifier of the connected parking section. */
  ParkingSectionId sectionId;

  /**
   * Bounding polygon that describes the transitional area between the
    * connected source and destination sections.
    */
  optional BoundingPolygon2D(0) transitionPolygon;
};

/*!

## Parking Rows and Spots

Parking rows and parking spots are physically represented as road surface
polygons. A road surface has an identifier and a combined type.
The type consists of a physical type and a logical type.

Typically, the road surfaces of parking rows and parking spots use
the following road surface polygon types:

- Physical type is `PAVED`.
- Logical type is `PARKING`.

Markings between parking spots are represented as road surface lines of logical
type `MARKING_LINE`. The extended marking type includes more information about
the marking, for example, dash type, width, and color of the marking.

The polygons and lines of the parking rows and spots are stored in the
road surface layer, which is defined in the Lane module.

!*/

/** A row of parking spots. */
struct ParkingRow
{
  /** Identifier of the parking row. */
  ParkingRowId id;

  /** Parking spots of the parking row. */
  ParkingSpot spots[];
};

/** A single parking spot. */
struct ParkingSpot
{
  /** Identifier of the parking spot. */
  ParkingSpotId id;
};

/*!

## Relations to Lanes, Road Surfaces, and Landmarks

Parking facility elements can be related to ranges or positions on the following
features:

- Lane groups and lanes
- Road surfaces
- Localization landmarks

Examples:

- A parking section has a relation to the range of a lane that runs
  through that section.
- A parking spot has a relation to the position on a lane from which the
  parking spot is accessed.

Relations are stored in the parking facility relation layer, see
[Venue Layers](layer.zs).

!*/

/**
  * Range relation type. Relates a parking facility element to a range on
  * another feature, such as a lane or a lane group.
  */
enum uint8 ParkingRangeRelationType
{
  /**
    * Relates a parking facility element of type `ParkingSection` to a
    * range on the feature.
    */
  PART_OF_SECTION,

  /**
    * Range on the feature from which a parking facility element of type
    * `ParkingRow` can be accessed.
    */
  ACCESS_PARKING_ROW,
};

choice ParkingRangeRelationValue(ParkingRangeRelationType type) on type
{
  case PART_OF_SECTION:
        ParkingSectionId sectionId;
  case ACCESS_PARKING_ROW:
        ParkingRowId parkingRowId;
};

/**
  * Position relation type. Relates a parking facility element to a position on
  * another feature, such as a lane or a lane group.
  */
enum uint8 ParkingPositionRelationType
{
  /**
    * Relates a parking facility element of type `ParkingSection` to a
    * position on the feature.
    */
  PART_OF_SECTION,

  /**
    * Position on the feature from which a parking facility element of type
    * `ParkingSpot` can be accessed.
    */
  ACCESS_PARKING_SPOT,

  /**
    * Relates a position on the feature (lane or lane group) inside the
    * parking facility to a road of the outside road network.
    */
  ROAD_NETWORK_ACCESS_ROAD_REFERENCE,

  /**
    * Relates a position on the feature (lane or lane group) inside the
    * parking facility to a lane group of the outside road network.
    */
  ROAD_NETWORK_ACCESS_LANE_REFERENCE,

  /** Indicates a position on the feature (lane or lane group) to be the
    * entry or exit of the parking facility. */
  ROAD_NETWORK_ACCESS,
};

choice ParkingPositionRelationValue(ParkingPositionRelationType type) on type
{
  case PART_OF_SECTION:
        ParkingSectionId sectionId;
  case ACCESS_PARKING_SPOT:
        ParkingSpotId parkingSpotId;
  case ROAD_NETWORK_ACCESS_ROAD_REFERENCE:
        RoadNetworkAccessRoadReference outsideRoadReference;
  case ROAD_NETWORK_ACCESS_LANE_REFERENCE:
        RoadNetworkAccessLaneReference outsideLaneReference;
  case ROAD_NETWORK_ACCESS:
        RoadNetworkAccess roadNetworkAccess;
};

/**
  * Simple relation type. Relates a parking facility element to
  * another feature that does not have any validities, such as a road surface.
  */
enum uint8 ParkingRelationType
{
  /**
    * Relates a parking facility element of type `ParkingSection` to a
    * feature. The feature does not distinctly describe that section, but
    * it is a part of the section.
    * Examples: road surfaces describing walkways, arrows.
    */
  PART_OF_SECTION,

  /**
    * Relates a parking facility element of type `ParkingRow` to a
    * feature. The feature does not distinctly describe that row, but
    * it is a part of the row.
    * Example: road surfaces describing arrows.
    */
  PART_OF_ROW,

  /**
    * Relates a parking facility element of type `ParkingSpot` to a
    * feature. The feature does not distinctly describe that parking spot, but
    * it is a part of the spot.
    * Example: road surfaces describing arrows.
    */
  PART_OF_SPOT,

  /**
    * Relates a parking facility element of type `ParkingSection` to a
    * feature. The feature distinctly describes that parking section.
    */
  IS_SECTION,

  /**
    * Relates a parking facility element of type `ParkingRow` to a
    * feature. The feature distinctly describes that parking row.
    */
  IS_ROW,

  /**
    * Relates a parking facility element of type `ParkingSpot` to a
    * feature. The feature distinctly describes that parking spot.
    */
  IS_SPOT,
};

choice ParkingRelationValue(ParkingRelationType type) on type
{
  case PART_OF_SECTION:
        ParkingSectionId partOfSectionId;
  case PART_OF_ROW:
        ParkingRowId partOfRowId;
  case PART_OF_SPOT:
        ParkingSpotId partOfSpotId;
  case IS_SECTION:
        ParkingSectionId sectionId;
  case IS_ROW:
        ParkingRowId rowId;
  case IS_SPOT:
        ParkingSpotId spotId;
};

/** Access to the road network outside the venue using road references.
  * Direct references using identifiers can only be used in case the venue layer
  * and the road layer are in the same smart layer container and same tile
  * (which is the case for smart layer path and tile services).
  * Indirect references have to be used to connect to a road layer from a different
  * service, for example, smart layer object service.
  */
struct RoadNetworkAccessRoadReference
{
  /** Identifier of the facility that is connected. */
  ParkingFacilityId facilityId;

  /** Describes whether the linked features represent an entry or exit or both. */
  RoadNetworkAccessType type;

  /** Set to `true` if indirect referencing is used. Application needs to map match in that case. */
  bool hasIndirectReference;

  /** An indirect feature reference to the outside road network. */
  RoadReferenceIndirect indirectReference if hasIndirectReference;

  /** A direct feature reference to the outside road network. */
  RoadReference reference if !hasIndirectReference;

  /** Full precision position on the outside network road feature where the inside feature is connected to. */
  RoadPositionValidity(0) validity;
};

/** Access to the road network outside the venue using lane group references.
  * Indirect references have to be used to connect to a lane layer from a different
  * service, for example, smart layer object service.
  * In case the venue layer is placed in a smart layer that also contains a lane layer
  * that is covering the complete road network, then it is sufficient to use
  * the `ROAD_NETWORK_ACCESS` relation that simply indicates whether the position
  * on lane group is an entry or exit of the venue.
  *
  */
struct RoadNetworkAccessLaneReference
{
  /** Identifier of the facility that is connected. */
  ParkingFacilityId facilityId;

  /** Describes whether the linked features represent an entry or exit or both. */
  RoadNetworkAccessType type;

  /** An indirect feature reference to the outside road network. */
  LaneGroupReferenceIndirect indirectReference;

  /** Position on the outside network lane group feature where the inside feature is connected to. */
  LaneGroupPositionValidity(0) validity;
};

/**
  * Indicator that the parking facility is entered/left. Can only be used
  * in case the venue layer is placed in a smart layer that also contains a lane layer
  * that is covering the complete road network.
  */
struct RoadNetworkAccess
{
  /** Identifier of the facility that is connected. */
  ParkingFacilityId facilityId;

  /** Describes whether the position represents an entry, an exit, or both. */
  RoadNetworkAccessType type;
};

/** Type of access to the road network from the venue. */
enum bit:2 RoadNetworkAccessType
{
  /** The related road network feature is an entry to the venue. */
  ENTRY,

  /** The related road network feature is an exit of the venue. */
  EXIT,

  /** The related road network feature is an entry and an exit to the venue. */
  ENTRY_AND_EXIT,
};
