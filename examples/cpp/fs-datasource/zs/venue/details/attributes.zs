/*!

# Venue Attributes

This package defines the attributes that are available in the venue attribute layers.

**Dependencies**

!*/

package venue.details.attributes;

import venue.details.types.*;
import core.vehicle.*;

/*!

## Parking Facility Attributes

Depending on the type of the parking facility element, different attributes
are used to store information such as:

- Parking facility: Total number of parking spots that are available in the
  parking facility.
- Parking level: Designation of the parking level.
- Parking facilities, levels, and sections: Access prohibitions, for example,
  height clearance information.
- Parking row: Orientation of parking spots within a parking row.
- Parking spot: Parking restrictions of that parking spot, for example,
  only for persons with disabilities or only for women.


Other attributes include names and numbers of sections, rows, spots and more
details on the metadata of the facility.


## Parking Facility Attribute Type

!*/

/** Attributes that describe parking facilities. */
enum varuint16 ParkingFacilityAttributeType
{
  /** Total number of parking spots in the parking facility. */
  PARKING_FACILITY_SIZE,

  /** Access to the parking facility is prohibited under certain conditions. */
  PROHIBITED_ACCESS,
};

choice ParkingFacilityAttributeValue(ParkingFacilityAttributeType type) on type
{
  case PARKING_FACILITY_SIZE:
    ParkingFacilitySize size;
  case PROHIBITED_ACCESS:
    ProhibitedAccess prohibitedAccess;
};

/*!

## Parking Level Attribute Type

!*/

/** Attributes that describe parking levels. */
enum varuint16 ParkingLevelAttributeType
{
  /** Designation of parking floor or level. */
  PARKING_LEVEL_NAME,

  /** Access to the parking level is prohibited under certain conditions. */
  PROHIBITED_ACCESS,

  /**
    * Overall slope of the complete parking level. Can be used for parking
    * levels that resemble ramps.
    */
  PARKING_LEVEL_SLOPE,
};

choice ParkingLevelAttributeValue(ParkingLevelAttributeType type) on type
{
  case PARKING_LEVEL_NAME:
    ParkingLevelName parkingLevelName;
  case PROHIBITED_ACCESS:
    ProhibitedAccess prohibitedAccess;
  case PARKING_LEVEL_SLOPE:
    ParkingLevelSlope slope;
};


/*!

## Parking Section Attribute Type

!*/

/** Attributes that describe parking sections. */
enum varuint16 ParkingSectionAttributeType
{
  /** Detailed type information of the parking section. */
  PARKING_SECTION_TYPE,

  /** Access to the parking section is prohibited under certain conditions. */
  PROHIBITED_ACCESS,
};

choice ParkingSectionAttributeValue(ParkingSectionAttributeType type) on type
{
  case PARKING_SECTION_TYPE:
    ParkingSectionType parkingSectionType;
  case PROHIBITED_ACCESS:
    ProhibitedAccess prohibitedAccess;
};


/*!

## Parking Row Attribute Type

!*/

/** Attributes that describe parking rows. */
enum varuint16 ParkingRowAttributeType
{
  /** Designation of the parking row. */
  PARKING_ROW_NAME,

  /** Orientation of parking spots within the parking row. */
  PARKING_ROW_LAYOUT,

  /**
    * Parking restrictions of the parking row, for example, persons
    * with impaired mobility only.
    */
  PARKING_RESTRICTIONS,
};

choice ParkingRowAttributeValue(ParkingRowAttributeType type) on type
{
  case PARKING_ROW_NAME:
    ParkingRowName parkingRowName;
  case PARKING_ROW_LAYOUT:
    ParkingRowLayout parkingRowLayout;
  case PARKING_RESTRICTIONS:
    ParkingRestrictions parkingRowRestrictions;
};


/*!

## Parking Spot Attribute Type

!*/

/** Attributes that describe parking spots. */
enum varuint16 ParkingSpotAttributeType
{
  /** Number of the parking spot. */
  PARKING_SPOT_NUMBER,

  /** Indicates whether the parking spot is available. */
  PARKING_SPOT_AVAILABLE,

  /**
    * Parking restrictions of individual parking spots, for example, persons
    * with impaired mobility only.
    */
  PARKING_RESTRICTIONS,

  /** Detailed information on private parking spots. */
  PARKING_SPOT_PRIVATE_PARKING_DETAILS,
};

choice ParkingSpotAttributeValue(ParkingSpotAttributeType type) on type
{
  case PARKING_SPOT_NUMBER:
    ParkingSpotNumber parkingSpotNumber;
  case PARKING_SPOT_AVAILABLE:
    Available available;
  case PARKING_RESTRICTIONS:
    ParkingRestrictions parkingSpotRestrictions;
  case PARKING_SPOT_PRIVATE_PARKING_DETAILS:
    PrivateParkingDetails privateParkingDetails;
};
