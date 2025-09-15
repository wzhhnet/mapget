/*!

# Venue Details Metadata

This package defines the metadata of the venue attribute layers. The metadata provides
information about the content of the attribute layers.

**Dependencies**

!*/

package venue.details.metadata;

import core.types.*;
import core.vehicle.*;
import venue.details.instantiations.*;
import venue.details.types.*;


/** Metadata of the parking facility attribute layer. */
struct ParkingFacilityAttributeLayerMetadata
{
  /** Content of the attribute layer. */
  ParkingFacilityAttributeLayerContent content;

  /** Metadata for parking facility attributes. */
  ParkingFacilityAttributeMetadata parkingFacilityAttributeMetadata
        if isset(content, ParkingFacilityAttributeLayerContent.PARKING_FACILITY_MAPS)
        || isset(content, ParkingFacilityAttributeLayerContent.PARKING_FACILITY_SETS);

  /** Metadata for parking level attributes. */
  ParkingLevelAttributeMetadata parkingLevelAttributeMetadata
        if isset(content, ParkingFacilityAttributeLayerContent.PARKING_LEVEL_MAPS)
        || isset(content, ParkingFacilityAttributeLayerContent.PARKING_LEVEL_SETS);

  /** Metadata for parking section attributes. */
  ParkingSectionAttributeMetadata parkingSectionAttributeMetadata
        if isset(content, ParkingFacilityAttributeLayerContent.PARKING_SECTION_MAPS)
        || isset(content, ParkingFacilityAttributeLayerContent.PARKING_SECTION_SETS);

  /** Metadata for parking row attributes. */
  ParkingRowAttributeMetadata parkingRowAttributeMetadata
        if isset(content, ParkingFacilityAttributeLayerContent.PARKING_ROW_MAPS)
        || isset(content, ParkingFacilityAttributeLayerContent.PARKING_ROW_SETS);

  /** Metadata for parking spot attributes. */
  ParkingSpotAttributeMetadata parkingSpotAttributeMetadata
        if isset(content, ParkingFacilityAttributeLayerContent.PARKING_SPOT_MAPS)
        || isset(content, ParkingFacilityAttributeLayerContent.PARKING_SPOT_SETS);

  /** Road types for which parking facility attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which parking facility attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Content bitmask of the parking facility attribute layer. */
bitmask varuint32 ParkingFacilityAttributeLayerContent
{
  /** Layer contains attribute maps for complete parking facilities. */
  PARKING_FACILITY_MAPS,

  /** Layer contains attribute sets for complete parking facilities. */
  PARKING_FACILITY_SETS,

  /** Layer contains attribute maps for levels of parking facilities. */
  PARKING_LEVEL_MAPS,

  /** Layer contains attribute sets for levels of parking facilities. */
  PARKING_LEVEL_SETS,

  /** Layer contains attribute maps for sections of parking facilities. */
  PARKING_SECTION_MAPS,

  /** Layer contains attribute sets for sections of parking facilities. */
  PARKING_SECTION_SETS,

  /** Layer contains attribute maps for parking rows. */
  PARKING_ROW_MAPS,

  /** Layer contains attribute sets for parking rows. */
  PARKING_ROW_SETS,

  /** Layer contains attribute maps for parking spots. */
  PARKING_SPOT_MAPS,

  /** Layer contains attribute sets for parking spots. */
  PARKING_SPOT_SETS,
};
