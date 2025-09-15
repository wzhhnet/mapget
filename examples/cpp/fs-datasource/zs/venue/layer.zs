/*!

# Venue Layers

This package defines the layers that are available in the Venue module.


**Dependencies**

!*/

package venue.layer;

import system.types.*;
import venue.metadata.*;
import venue.instantiations.*;
import venue.parking.*;

/*!

## Parking Facility Layer

!*/

/**
  * Parking facility layer. Contains the hierarchy information of one or more
  * parking facilities.
  */
struct ParkingFacilityLayer
{
  /** List of parking facilities. */
  packed ParkingFacility parkingFacilities[];

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};

/*!

## Parking Facility Relation Layer

To find the correct parking spot, it is crucial to know which parking road
surface connects to the lane topology at what point.
This information is stored in the parking facility relation layer.

The parking facility relation layer serves the following purposes:

1. Relate lane groups and road surfaces to parking sections.
2. Relate road surfaces to parking rows or spots.
3. Describe positions and ranges on the lanes or lane groups from where
   the corresponding parking facility elements can be accessed.
4. Relate POIs to parking facility elements.


**Example**

The following figure shows a parking section with a lane group that has
two lanes. The lower lane has one parking row attached on one side. The upper lane
has seven parking spots attached on the other side.
The parking row and the parking spots are represented as road surfaces.
The lane group and the road surfaces of the parking row and parking spots are
related to the same parking section.

__Note:__
The following figure is an unfinished draft.

![Parking facility relations](assets/parking_facility_relations.png)

In this example, the following relations are stored:

- `parkingLaneRangeRelationMapList` contains one entry of type
  `PART_OF_SECTION` for the lane group. This entry relates the lane group
  to the parking section.
- `parkingRoadSurfaceRelationMapList` contains entries of type `PART_OF_SECTION`
  for the road surfaces. These entries relate the road surfaces to the parking section.
- `parkingRoadSurfaceRelationMapList` contains additional entries of type `IS_ROW`
  or `IS_SPOT` for each road surface that distinctly describes a parking row or
  parking spot. These entries relate the IDs of the parking rows or parking spots
  to the corresponding road surfaces.
- `parkingLanePositionRelationMapList` contains entries of type `ACCESS_PARKING_SPOT`
  and `parkingLaneRangeRelationMapList` contains entries of type `ACCESS_PARKING_ROW`.
  These entries define relations for accessing the parking row and the parking
  spots. The relations are mapped to either a range on the lane group or lane
  (parking rows) or a position on the lane group (parking spot) from where
  they can be accessed.

!*/

rule_group ParkingFacilityRelationLayerRules
{
  /*!
  Parking Facility Relations to POIs:

  Relations to POIs stored in `parkingPoiRelationMapList` shall only use
  the `ParkingRelationType` values `PART_OF_SECTION`, `PART_OF_ROW`, and
  `PART_OF_SPOT`.
  !*/

  rule "venue-ts05i2";
};

/**
  * Parking facility relation layer. Stores information about the connection
  * between a parking road surface and lane topology.
  */
struct ParkingFacilityRelationLayer
{
  /** Content of the parking facility relation layer. */
  ParkingFacilityRelationLayerContent content;

  /** Relations to ranges on lane groups and lanes. */
  ParkingLaneRangeRelationMapList(0) parkingLaneRangeRelationMapList
      if isset(content, ParkingFacilityRelationLayerContent.LANE_RANGE_MAPS);

  /** Relations to positions on lane groups and lanes. */
  ParkingLanePositionRelationMapList(0) parkingLanePositionRelationMapList
      if isset(content, ParkingFacilityRelationLayerContent.LANE_POSITION_MAPS);

  /** Relations to road surfaces. */
  ParkingRoadSurfaceRelationMapList(0) parkingRoadSurfaceRelationMapList
      if isset(content, ParkingFacilityRelationLayerContent.ROAD_SURFACE_MAPS);

  /** Relations to POIs. */
  ParkingPoiRelationMapList(0) parkingPoiRelationMapList
      if isset(content, ParkingFacilityRelationLayerContent.POI_MAPS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.RELATION;
  }
};
