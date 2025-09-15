/*!

# Core Road Locations

This package defines road location references. A road location is a logical
entity that describes a path along one or more real-world roads. A road location
has a globally unique ID, is directed, and has no gaps in its path.

!*/

package core.location;

import core.types.*;
import core.geometry.*;


/*!

## Road Location Path

A road location path contains a location geometry and multiple location segments.
Each location segment represents a part of a road between real-world intersections or
decision points. A decision point is a point where a map matcher needs to
decide which path to follow, including bifurcations or similar road
structures. All location segments contain an absolute bearing to the previous
and next location segment.

The following picture illustrates the principle behind road location paths:

![Road location](assets/location-road-location.png)

In addition to the decision points, further positions may be added as location
points. This may help the map matching process on some rare occasions.

The start of the road location path is encoded using the full resolution of its
coordinate. All other coordinates are delta-encoded offsets from this origin.

!*/

/** Path of a road location. */
struct RoadLocationPath
{
  /** Geographic coverage of the road location path. */
  LocationGeometry pathGeometry;

  /**
   * A list of road location segments that refer to the location geometry and
   * attach more detailed information to each segment of the path.
   */
  packed LocationSegment(pathGeometry) locationPathSegments[];

};

/*!

## Road Location Geometry

The road location geometry is a 2-dimensional line that describes the complete geometry
of a road location path.

!*/

/** Geometry of a road location path. */
struct LocationGeometry
{
  /**
    * 2-dimensional line with full-resolution start position.
    * In contrast to the normal use of `Line2D`, the coordinate shift is fixed to
    * value 0.
    */
  Line2D(0) line;
};

/*!

## Road Location Segment

The road location segment describes a continuous segment on a range of the location
path. It includes absolute bearings to the previous and next location segment and the
physical length of the location segment in meters.

The absolute bearing is the clockwise angle between north and a reference point
on the road geometry. The decision point constitutes the origin. The reference
point is constructed by following the road geometry for 15 meters. If the road
is shorter than 15 m, the next decision point is used as reference point instead.

The following picture illustrates the calculation of the absolute bearing.
α is the absolute bearing at the start of the location segment.
β is the absolute bearing at the end of the location segment.

![Absolute Bearing](assets/location-absolute-bearing.png)

In addition, the functional road class of the segment and an optional list of road
properties are stored to simplify map matching. Not every segment inside a
location path needs the same amount of properties to match correctly.

!*/

rule_group RoadLocationSegmentRules
{
  /*!
  Reference Point for Absolute Bearing:

  The reference point for calculating the bearing shall be 15 meters apart
  from the decision point. The distance shall be measured along the road
  geometry. If the road geometry is shorter than 15 meters, the next decision
  point shall be used instead.
  !*/

  rule "core-2ivfvu";
};

/** Continuous segment on a range of the location path. */
struct LocationSegment(LocationGeometry pathGeometry)
{
  /** Range on the path covered by this segment. */
  LocationPathRange(pathGeometry.line) range;

  /*
   * Absolute bearing at the start of the location segment in
   * digitization direction.
   */
  AbsoluteBearing absoluteBearingStart;

  /*
   * Absolute bearing at the end of the location segment in opposite
   * digitization direction.
   */
  AbsoluteBearing absoluteBearingEnd;

  /** Real-world length of the location segment in meters. */
  LengthMeters         length;

  /** Functional road class of the location segment. */
  optional FunctionalRoadClass frc;

  /** Optional bitmask of road types that are valid for the segment. */
  optional RoadType roadtypes;

  /** Optional road name. */
  optional string roadName;

  /** Optional road number. */
  optional string roadNumber;
};

/**
  * The absolute bearing for crossing an intersection in steps of ~1.4 degrees.
  * Value 0 indicates north; values increase clockwise.
  */
subtype uint8 AbsoluteBearing;


/** Range on the location path geometry. */
subtype LineRange2D LocationPathRange;

/*!

## Road Location ID

A road location ID is a globally unique identifier that corresponds to a road
location.

__Note:__
The road location ID also allows to assign NDS.Live data to NDS.Classic
source locations, which are defined in the Location extension, see the
[Location FTX Documentation](https://doc.nds-association.org/version_ftx_location).

Road locations can have multiple branches, for example, if a road location
covers two road features that are parallel but physically split. Branches of the
same road location have road location IDs that are identical except for the
branch ID at the end.


!*/

/**
  * Globally unique identifier of a road location.
  *
  * 16 byte as defined in `RoadLocationIdDefinition` plus 1 byte to identify
  * the branch of the road location.
  */
struct RoadLocationId
{
  /** Byte array that stores the road location ID in network byte order. */
  uint8 value[16];

  /**
    * Identifier of the branch of this road location. If the road location does not
    * have branches, the branch ID is set to 0. This is the default value.
    */
  RoadLocationBranchId branchId = NO_BRANCH;
};

/**
  * Identifier of a road location branch. The branch ID is unique within a
  * road location and part of the road location ID.
  */
subtype uint8 RoadLocationBranchId;

/** Default branch ID value for road locations that do not have branches. */
const RoadLocationBranchId NO_BRANCH = 0;

/** Definition of the encoding of the road location ID. */
enum uint8 RoadLocationIdDefinition
{
  /** UUID as described by RFC 4122 stored in network byte order. */
  UUID_RFC_4122,

  /** 64-bit integer stored in network byte order, filling up the first 8 bytes. */
  INTEGER_64,

  /** 32-bit integer stored in network byte order, filling up the first 4 bytes. */
  INTEGER_32,

  /** 16 bytes in a format defined by the user. */
  BYTES,
};

/** Defines a range on a road location. */
struct RoadLocationIdRange
{
  /**
   * Start position of a part of a road location.
   * The position is defined in centimeters from the absolute
   * start of the location.
   */
  LengthCentimeters startPosition;

  /**
   * End position of a part of a road location.
   * The position is defined in centimeters from the absolute
   * start of the location.
   */
  LengthCentimeters endPosition  : endPosition >= startPosition;
};

/**
  * Position on a road location. The position is defined in centimeters from
  * the absolute start of the location.
  */
subtype LengthCentimeters RoadLocationIdPosition;