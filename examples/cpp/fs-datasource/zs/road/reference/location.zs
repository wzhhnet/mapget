/*!

# Road Location References

This packages defines references to road locations that can be used in NDS.Live
services. For example, road locations can be used to add dynamic
attributes to map features as an alternative to using direct road or lane
references.

__Note:__
The location ID can also point to a source location from NDS.Classic, which is
defined in the Location extension, see the
[Location FTX Documentation](https://doc.nds-association.org/version_ftx_location).

!*/

package road.reference.location;

import core.types.*;
import core.location.*;
import core.geometry.*;

/*!

The road location reference in NDS.Live is a directed reference. The direction
describes in which direction on the road location the attributes are valid.

In addition to referencing one road location, it is also possible to reference
transitions from one road location to another road location.
Such a transition reference can include intermediate road locations, which
are listed in the order in which they have to be passed by the vehicle.

Road location references can be valid for a complete road location or
for one or multiple ranges on the road location.

!*/

rule_group RoadLocationReferenceRules
{
  /*!
  Order of Locations in Transition Reference:

  If a `RoadLocationTransitionReference` contains intermediate locations,
  then these locations shall be stored in the order in which they have to be
  passed.
  !*/

  rule "road.reference-wg0pok-I";
};

/** Reference to a road location. */
struct RoadLocationReference
{
  /**
    * Direction of the road location reference in relation to direction of the
    * road location.
    */
  Direction direction;

  /** Identifier of the road location. */
  RoadLocationId locationId;
};

/**
  * A reference to a transition from one road location to another road
  * location.
  */
struct RoadLocationTransitionReference
{
  /** Start location of the transition. */
  RoadLocationReference startLocation;

  /** End location of the transition. */
  RoadLocationReference endLocation;

  /** Intermediate locations ordered in sequence from start to end location. */
  optional RoadLocationReference intermediateLocations[];
};


/** Type of validity of a road location reference. */
enum uint8 RoadLocationRangeValidityType
{
  /** The complete road location is affected. */
  COMPLETE,

  /** Validity is described as a range on the road location. */
  RANGE,
};

/** Range validity on a road location. */
struct RoadLocationRangeValidity(CoordShift shift)
{
  /** Type of the validity. */
  RoadLocationRangeValidityType type;

  /** Number of ranges on the road location that are included in this validity. */
  varsize numRanges if type != RoadLocationRangeValidityType.COMPLETE;

  /** Validity ranges on the road location. */
  RoadLocationRangeChoice(type) ranges[numRanges] if type != RoadLocationRangeValidityType.COMPLETE;
};

choice RoadLocationRangeChoice(RoadLocationRangeValidityType type) on type
{
  case COMPLETE:
      ;
  case RANGE:
      RoadLocationIdRange range;
};

/** Position validity on a road location. */
struct RoadLocationPositionValidity(CoordShift shift)
{
  /** Number of positions on the road location that are included in this validity. */
  varsize numPositions;

  /** Validity positions on the road location. */
  RoadLocationIdPosition positions[numPositions];
};
