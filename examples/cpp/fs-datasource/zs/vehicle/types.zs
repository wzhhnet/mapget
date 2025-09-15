/*!

# Vehicle Types

This package defines common structures that are used in the Vehicle module.

**Dependencies**

!*/

package vehicle.types;

import vehicle.reference.types.*;

import core.types.*;
import core.geometry.*;
import core.vehicle.*;
import core.location.*;

/**
  * Horizon that is made up of multiple paths. The paths are connected and form
  * a network.
  */
struct Horizon
{
  /** Number of paths in the horizon. */
  varsize numPaths;

  /** All paths in the horizon. */
  HorizonPath horizon[numPaths];

  /** One or more paths of the horizon that are most likely to be followed by
    * the vehicle.
    */
  HorizonPathId mostProbablePath[];
};

/** Horizon path that is connected with other paths using the identifier. */
struct HorizonPath
{
  /** Identifier of the path. */
  HorizonPathId pathId;

  /** Identifier of the path that the current path is connected to. */
  HorizonPathId parentPathId;

  /**
    * Position of the path segment within the parent path after which the
    * current path starts.
    */
  varsize parentSegmentIndex;

  /** Path geometry and segment details. */
  RoadLocationPath path;
};

/**
  * The vehicle's pose is matched to a road path. The pose is map matched and
  * its reference system is a horizon path.
  */
struct PoseRoadPathMatched
{
  /** TODO: doc missing. */
  HorizonPathId             id;

  /** TODO: doc missing. */
  HorizonPathOffset         offset;

  /** Optional height above WGS reference ellipsoid in cm. */
  optional varint32 altitude;

  /** Optional absolute heading of the vehicle. */
  optional Heading          heading;

  /** Optional speed of the vehicle.
    * The value is always stored in kilometers per hour and must be calculated to
    * miles per hour if required.
    */
  optional SpeedKmh  speed;

  /** Optional matching probability. */
  optional MatchProbability probability;
};
