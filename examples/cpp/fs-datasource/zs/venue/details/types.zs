/*!

# Venue Types

This package defines the types that are used by venue attributes.

**Dependencies**

!*/

package venue.details.types;

import core.types.*;


/**
  * Access to a venue or venue element is prohibited under certain conditions.
  * Conditions in the attribute map have to be checked.
  */
subtype Flag ProhibitedAccess;

/** Logical types of parking sections. */
enum uint8 ParkingSectionType
{
  /** Section for self parking.*/
  SELF,

  /** Customer parking. */
  CUSTOMER,

  /** Section reserved for a car rental agency. Special restrictions may apply. */
  RENTAL,

  /** Section reserved for a hotel or similar facility. Special restrictions may apply. */
  HOTEL,

  /** Section reserved for private parking. Special restrictions may apply. */
  PRIVATE,

  /** Section reserved for valet parking. */
  VALET,

  /** Section reserved for automated valet parking. */
  AUTOMATED_VALET,

  /** Drop-off section reserved for automated valet parking. */
  AVP_DROP_OFF,

  /** Pick-up section reserved for automated valet parking. */
  AVP_PICK_UP,

  /** Combined drop-off and pick-up section reserved for valet parking. */
  AVP_DROP_OFF_PICK_UP,
};

/** Bitmask describing detailed parking allowances on a parking row or spot. */
bitmask varuint16 ParkingRestrictions
{
  /**
    * No special restrictions. If the attribute is used with this value,
    * conditions need to be checked, for example, for motorcycle or bus
    * parking, time-based conditions, or vehicle dimension restrictions.
    */
  CONDITIONAL_ONLY = 0,

  /** Parking spot is reserved for persons with impaired mobility. */
  ACCESSIBLE,

  /** Parking spot is reserved for electric vehicles. */
  ELECTRIC_VEHICLE,

  /** Parking spot is reserved for families. */
  FAMILY,

  /** Parking spot is reserved for women. */
  WOMEN,

  /** Parking spot is not open to the public, it is reserved for a specific user. */
  PRIVATE,

  /** Parking spot is reserved for visitors. */
  VISITOR,
};

/** Orientation of the parking spots within a parking row. */
enum uint8 ParkingOrientation
{
  /** The parking spots are parallel to the row. */
  PARALLEL,

  /** The parking spots are oriented in a 45° angle to the parking row. */
  DEGREE_45,

  /** The parking spots are oriented in a 60° angle to the parking row. */
  DEGREE_60,

  /** The parking spots are oriented in a 75° angle to the parking row. */
  DEGREE_75,

  /** The parking spots are oriented perpendicular to the parking row. */
  DEGREE_90,
};

/** Layout type of a parking row. */
struct ParkingRowLayout
{
  /**
    * Set to `true` if the parking in the row is structured using spots that
    * are delimited by markings.
    */
  bool structuredParking;

  /**
    * Set to `true` if parking spots are interlocked with spots from another
    * parking row.
    */
  bool interlockedSpots;

  /** Orientation of the parking spots within the row. */
  ParkingOrientation orientation;
};

/** Details on private parking spots. */
struct PrivateParkingDetails
{
  /**
    * Hint that indicates to whom the private parking applies.
    * This can be a company name, a license plate, or something else.
    */
  string hint;
};

/** Size of a parking facility in number of parking spots. */
subtype varuint16 ParkingFacilitySize;

/** Description of the floor or level on which a parking facility element is located. */
subtype string ParkingLevelName;

/** Description of a parking row. */
subtype string ParkingRowName;

/** Number of a parking spot. */
subtype string ParkingSpotNumber;

/** The parking spot is available/free. */
subtype Flag Available;

/** Slope value of the complete parking level in increments of 0.2 %. */
subtype varuint16 ParkingLevelSlope;
