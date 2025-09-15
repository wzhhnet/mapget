/*!

# Vehicle Reference Layer Types

This package defines generic structures that are used by all vehicle reference layer entities.
!*/

package vehicle.reference.types;

/** The identifier of a horizon path. */
subtype varuint32 HorizonPathId;

/**
  * Constant for no path. Shall only be used for parent-child relations when
  * there is no parent.
  */
const HorizonPathId NO_PATH = 0;

/** Offset on horizon path in centimeters. Starting point is the paths origin coordinate. */
subtype varuint32 HorizonPathOffset;