/*!

# Drive Path Attributes

This package defines the attributes that are available in the drive path
attribute layer.

**Dependencies**

!*/

package drivepath.attributes;

import core.types.*;
import drivepath.types.*;

rule_group DrivePathAttributeRules
{
  /*!
  No Combining of Confidence Property with Confidence Attribute:

  The `ATTRIBUTE_CONFIDENCE` property from the Core module shall not
  be used with the `CONFIDENCE` attribute from the Drive Path module.
  !*/

  rule "drivepath-ne59mk";

  /*!
  Validity of Confidence Attribute:

  The `CONFIDENCE` attribute of the Drive Path module shall always be assigned
  to the complete drive path.
  !*/

  rule "drivepath-mn60ra";
};

/** Drive path attributes describe a range on a drive path in more detail. */
enum varuint16 DrivePathRangeAttributeType
{
  /** Average speed on the drive path range in kilometers per hour. */
  AVERAGE_SPEED,

  /** Global source ID of the drive path. */
  GLOBAL_SOURCE_ID,

  /**
    * The range on the drive path is to be used under certain conditions, which
    * are described in the corresponding attribute map or attribute set.
    */
  CONDITIONAL_USAGE,

  /** Confidence value of the drive path expressed in percent (0-100%). */
  CONFIDENCE,

    /** Speed profile for the driving speed on a single drive path. */
  DRIVING_SPEED,

  /** Speed profile for the driving speed along a sequence of drive paths. */
  DRIVING_SPEED_PATH,
};

choice DrivePathRangeAttributeValue(DrivePathRangeAttributeType type) on type
{
  case AVERAGE_SPEED:
    SpeedKmh averageSpeed;
  case GLOBAL_SOURCE_ID:
    GlobalSourceId globalSourceId;
  case CONDITIONAL_USAGE:
    ConditionalUsage conditionalUsage;
  case CONFIDENCE:
    DrivePathConfidence confidence : confidence <= 100;
  case DRIVING_SPEED:
    DrivingSpeedPointList drivingSpeed;
  case DRIVING_SPEED_PATH:
    DrivingSpeedPath drivingSpeedPath;
};

/**
  * Drive path position attributes describe a position on a drive path
  * in more detail.
  */
enum varuint16 DrivePathPositionAttributeType
{
  /** Position where vehicles usually stop without indicating the reason for stopping. */
  STOPPING_LOCATION,
};

choice DrivePathPositionAttributeValue(DrivePathPositionAttributeType type) on type
{
  case STOPPING_LOCATION:
    StoppingLocation stoppingLocation;
};
