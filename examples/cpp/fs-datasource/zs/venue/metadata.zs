/*!

# Venue Metadata

This package defines venue metadata.

**Dependencies**

!*/

package venue.metadata;

import core.vehicle.*;
import core.types.*;
import venue.instantiations.*;
import venue.types.*;

/*!

## Parking Facility Metadata

The metadata of the layers for parking facilities provides information about
the content of the layers.

!*/

/** Metadata of the parking facility layer. */
struct ParkingFacilityLayerMetadata
{
  /** Road types for which parking facilities are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which parking facilities are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Metadata of the parking facility relation layer. */
struct ParkingFacilityRelationLayerMetadata
{
  /** Content of the parking facility relation layer. */
  ParkingFacilityRelationLayerContent content;

  /** Parking relation types used in attributes map/sets for relations to road surfaces. */
  ParkingRelationMetadata parkingRoadSurfaceRelationMetadata
            if isset(content, ParkingFacilityRelationLayerContent.ROAD_SURFACE_MAPS);

  /** Parking range relation types used in attributes map/sets for relations to lane ranges. */
  ParkingRangeRelationMetadata parkingRangeRelationMetadata
            if isset(content, ParkingFacilityRelationLayerContent.LANE_RANGE_MAPS);

  /** Parking position relation types used in attributes map/sets for relations to lane positions. */
  ParkingPositionRelationMetadata parkingPositionRelationMetadata
            if isset(content, ParkingFacilityRelationLayerContent.LANE_POSITION_MAPS);

  /** Parking relation types used in attributes map/sets for relations to POIs. */
  ParkingRelationMetadata parkingPoiRelationMetadata
            if isset(content, ParkingFacilityRelationLayerContent.POI_MAPS);
};

/** Content bitmask for the parking facility relation layer. */
bitmask varuint32 ParkingFacilityRelationLayerContent
{
  /**
    * Layer contains attribute maps containing relations to ranges on lane groups
    * and lanes.
    */
  LANE_RANGE_MAPS,

  /** Layer contains attribute maps containing relations to positions on lane
    * groups and lanes.
    */
  LANE_POSITION_MAPS,

  /** Layer contains attribute maps containing relations to road surfaces. */
  ROAD_SURFACE_MAPS,

  /** Layer contains attribute maps containing relations to POIs. */
  POI_MAPS,
};
