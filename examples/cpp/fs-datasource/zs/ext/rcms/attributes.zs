/*!

# RCMS Attributes

This package defines the attributes that are available in the
RCMS layer.

**Dependencies**

!*/

package ext.rcms.attributes;

import core.types.*;
import core.geometry.*;
import ext.rcms.types.*;

/*!

## RCMS Attributes for Roads

!*/

/** RCMS attributes that correspond to a range on a road. */
enum varuint16 RcmsRoadRangeAttributeType
{
  /** Checksum. */
  CHECKSUM,

  /** Convenience parameters. */
  CONVENIENCE_PARAMETERS,

  /** Data Validity. */
  DATA_VALIDITY,

  /** Generic configuration. */
  GENERIC_CONFIGURATION,

  /** LX level of the road. */
  LX_LEVEL,

  /** Rollout indicator. */
  ROLLOUT,

  /** MonArch Source ID. */
  SOURCE_ID,

  /** Rollout ID. */
  ROLLOUT_ID,

  /** Vehicle version. */
  VEHICLE_VERSION,
};

choice RcmsRoadRangeAttributeValue(RcmsRoadRangeAttributeType type) on type
{
  case CHECKSUM:
    string checksum;
  case CONVENIENCE_PARAMETERS:
    string convenienceParameters;
  case DATA_VALIDITY:
    string dataValidity;
  case GENERIC_CONFIGURATION:
    string genericConfiguration;
  case LX_LEVEL:
    string lxLevel;
  case ROLLOUT:
    Rollout rollout;
  case SOURCE_ID:
    string sourceId;
  case ROLLOUT_ID:
    string rolloutId;
  case VEHICLE_VERSION:
    string vehicleVersion;
};
