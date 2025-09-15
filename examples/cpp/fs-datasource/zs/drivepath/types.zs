/*!

# Drive Path Types

This package defines the types that are used within the Drive Path module.

**Dependencies**

!*/

package drivepath.types;

import core.types.*;
import core.geometry.*;
import road.reference.types.*;

/*!

## Types for Identifiers, Relations, and Validities

!*/

/** Tile-unique identifier of a drive path. */
subtype Var4ByteId DrivePathId;

/** Relates a drive path to a range on a road. */
enum uint8 DrivePathRoadRangeRelationType
{
  /* The complete drive path is related to the range on the road. */
  DRIVE_PATH,
};

choice DrivePathRoadRangeRelationValue(DrivePathRoadRangeRelationType type) on type
{
  case DRIVE_PATH:
    DrivePathId drivePathId;
};

/** Relates a drive path to a range on a lane. */
enum uint8 DrivePathLaneRangeRelationType
{
  /* The complete drive path is related to the range on the lane. */
  DRIVE_PATH,
};

choice DrivePathLaneRangeRelationValue(DrivePathLaneRangeRelationType type) on type
{
  case DRIVE_PATH:
    DrivePathId drivePathId;
};

/** Range validity on a drive path. */
struct DrivePathRangeValidity(CoordShift shift)
{
  /** Type of validity used for the drive path. */
  DrivePathValidityType type : type != DrivePathValidityType.COMPLETE;

  /** Number of validity ranges on the drive path. */
  varsize numRanges : numRanges > 0;

  /** Validity ranges on the drive path. */
  DrivePathRangeChoice(type, shift) ranges[numRanges];
};

choice DrivePathRangeChoice(DrivePathValidityType type, CoordShift shift) on type
{
  case COMPLETE:
    ;
  case POSITION:
    DrivePathValidityRange(shift) validityRange;
  case GEOMETRY:
    DrivePathGeometryRange geometryRange;
  case GEOMETRY_OFFSET:
    DrivePathGeometryOffsetRange(shift) geometryOffsetRange;
  case PERCENTAGE:
    DrivePathPercentageRange percentageRange;
};

/** Position validity on a drive path. */
struct DrivePathPositionValidity(CoordShift shift)
{
  /** Type of validity used for the drive path. */
  DrivePathValidityType type : type != DrivePathValidityType.COMPLETE;

  /** Number of validity positions on the drive path. */
  varsize numPositions : numPositions > 0;

  /** Validity positions on the drive path. */
  DrivePathPositionChoice(type, shift) positions[numPositions];
};

choice DrivePathPositionChoice(DrivePathValidityType type, CoordShift shift) on type
{
  case COMPLETE:
    ;
  case POSITION:
    DrivePathValidityPosition(shift) validityPosition;
  case GEOMETRY:
    DrivePathGeometryPosition geometryPosition;
  case GEOMETRY_OFFSET:
    DrivePathGeometryOffsetPosition(shift) geometryOffsetPosition;
  case PERCENTAGE:
    DrivePathPercentagePosition percentagePosition;
};

/**
  * Validity range on a drive path using additional positions that are matched to
  * the drive path geometry.
  */
struct DrivePathValidityRange(CoordShift shift)
{
  /** Start of the validity. */
  DrivePathValidityPosition(shift) start;

  /** End of the validity. */
  DrivePathValidityPosition(shift) end;
};


/**
  * Validity position that is matched onto a drive path. The validity position
  * does not have to be part of the geometry of the drive path.
  */
struct DrivePathValidityPosition(CoordShift shift)
{
  /** Position on the drive path. */
  Position2D(shift) position;

  /**
    * Hint to indicate where the position is located on the drive path.
    * Helps to correctly identify the position on the target feature
    * in rare cases like zigzag curves.
    */
  optional PercentageIndication positionIndication;
};

/**
  * Percentage indication for a position on a drive path based on the feature length.
  * Allowed value range is between 0.0 and 100.0.
  */
subtype float16 PercentageIndication;

/** Position on a drive path. */
subtype LinePosition DrivePathGeometryPosition;

/** Range on a drive path. */
subtype LineRangeUnchecked DrivePathGeometryRange;

/** Position on the geometry of a drive path with an offset to the underlying geometry. */
subtype LinePositionOffset2D DrivePathGeometryOffsetPosition;

/** Range on the geometry of a drive path with an offset from the underlying geometry. */
subtype LineRangeOffset2D DrivePathGeometryOffsetRange;

/** Percentage position on a drive path. */
subtype PercentagePosition DrivePathPercentagePosition;

/** Percentage range on a drive path. */
subtype PercentageRange DrivePathPercentageRange;


/** Type of validity on a drive path. */
enum uint8 DrivePathValidityType
{
  /** The complete drive path is affected. */
  COMPLETE,

  /**
    * Validity is described by independent positions that are
    * matched onto the geometry of the drive path.
    */
  POSITION,

  /** Validity is described using the shape of the drive path. */
  GEOMETRY,

  /** Validity is described using the shape of the drive path including offsets. */
  GEOMETRY_OFFSET,

  /**
    * Validity is described using a start position and an end position percentage
    * value based on the geometry of the drive path.
    */
  PERCENTAGE,
};


/*!

## Driving Speed

Driving speed is described by a speed profile that is assigned to one or more
drive paths. The speed profile is defined by single points that are assigned to
positions on the drive path. For each position, multiple speed values for
different types of driving behavior can be stored.

Speed profiles use the linear profile representation. The linear profile
represents calculated values for profile coordinates along-track that are
calculated by interpolating two consecutive profile spots. An application
interpolates between the points to get the driving speed for any position on the
drive path.

!*/

rule_group DrivingSpeedRules
{
  /*!
  Drive Path List in Driving Speed Path:

  The drive path list in `DrivingSpeedPath` shall not include the drive path
  that `DrivingSpeedPath` is assigned to.
  !*/

  rule "drivepath-bz45de";
};

/** Speed profile for driving speed along a sequence of drive paths. */
struct DrivingSpeedPath
{
  /** Number of drive paths in the speed profile. */
  uint8 numDrivePaths : numDrivePaths > 0;

  /** Speed values on the drive path that `DrivingSpeedPath` is assigned to. */
  DrivingSpeedPointList speedPoints;

  /** List of drive paths and associated speed values. */
  DrivingSpeedDrivePath drivePaths[numDrivePaths];
};

/** Speed profile for driving speed on a single drive path that is part of `DrivingSpeedPath`. */
struct DrivingSpeedDrivePath
{
  /** Identifier of the drive path. */
  DrivePathId drivePathId;

  /** Speed values on the drive path. */
  DrivingSpeedPointList speedPoints;
};

/** List of speed values for a sequence of positions on a drive path. */
struct DrivingSpeedPointList
{
  /** Number of speed values. */
  varsize numSpeedPoints : numSpeedPoints > 0;

  /** Speed values. */
  DrivingSpeedPoint speedPoints[numSpeedPoints];
};

/** Driving speed for a single position. */
struct DrivingSpeedPoint
{
  /** Position on the drive path. */
  PercentagePosition position;

  /** Normal speed value at the position. */
  SpeedKmh normalSpeed;

  /** Comfortable speed value at the position. */
  optional SpeedKmh comfortableSpeed;

  /** Sportive speed value at the position. */
  optional SpeedKmh sportiveSpeed;
};

/*!

## Other Types

!*/


/** Position where vehicles usually stop without indicating the reason for stopping. */
subtype Flag StoppingLocation;

/**
  * Conditional usage of a drive path. Conditions are listed in the corresponding
  * attribute map or attribute set.
  */
subtype Flag ConditionalUsage;

/**
  * Drive path confidence value. Describes the confidence in the trustworthiness
  * of a drive path. Confidence may include, but is not restricted to
  * confidence in the existence of the drive path, confidence in the accuracy
  * of the drive path, or confidence in the correct geometry.
  * These types of confidence are all included in one value.
  * Confidence is expressed in percent (0-100%). The value 100 represents 100%.
  */
subtype uint8 DrivePathConfidence;
