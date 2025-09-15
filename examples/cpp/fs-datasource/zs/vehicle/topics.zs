/*!

# Vehicle Topics

This package defines vehicle topics.

TODO: extend description

**Dependencies**

!*/

package vehicle.topics;

import vehicle.reference.types.*;
import core.vehicle.*;
import core.types.*;
import vehicle.types.*;

/*!
## Pose Raw Topic

This topic provides a ground truth time stamp of the raw vehicle pose.
For example, this may be the time when the GPS sensor collected the data.
Depending on the used setup of sensors this may vary though.
The ground truth is defined as the moment when
the car was there.

Publishers of the topic have to take care that these rules apply.
Subscribers shall not need to apply any correction logic.

!*/

struct PoseRawTopic
{
  /** Ground truth time stamp. */
  TimeStamp   stamp;

  /** Pose of the vehicle. */
  PoseRaw     pose;
};

/*!

## Pose Geo Matched Topic

!*/

struct PoseGeoMatchedTopic
{
  /** Time stamp. */
  TimeStamp stamp;

  /**
   * List of matched geo positions ordered by relevance. The most relevant entry
   * is the first entry in the list.
   */
  PoseGeoMatched poseMatchedCandidates[];

};

/*!

## Geo Road Network Topic

!*/

// TODO: First draft only. Is way short of actual planned behavior.
struct GeoRoadNetworkTopic
{
  /** Time stamp. */
  TimeStamp stamp;

  /** A list of paths that span the probable road network ahead. */
  Horizon  roadNetwork;
};

/*!

## Matched Geo Road Network Topic

A matched road path network. This can be used if different maps are used.

Example: Generate `GeoRoadNetwork` based on supplier A's SD map.
Supplier B receives this `GeoRoadNetwork` and generates a `MatchedGeoRoadNetwork`
that reassembles the original road network mapped onto the HD topology of
Supplier B. In addition to a new network the `MatchedGeoRoadNetwork` indicates
which of its paths are added without directly matching supplier's A network.

REQ: https://confluence.nds-association.org/x/DQCt

!*/

struct MatchedGeoRoadNetworkTopic
{
  /** Time stamp. */
  TimeStamp stamp;

  /**
   * A road network that has been matched using a `GeoRoadNetworkTopic` as origin.
   * It is not guaranteed to be connected. A publisher may also leave gaps between paths
   * if really no matching was possible, for example, because of coverage issues.
   */
  Horizon matchedRoadNetwork;

  /**
   * All IDs of the `matchedRoadNetwork` that do not have a clear representation
   * in the origin network.
   */
  HorizonPathId unmatchedPaths[];
};

/*!

## Most Probable Path (MPP) Topic

!*/

struct MppTopic
{
  /** Time stamp. */
  TimeStamp time;

  /** Sequence of road path IDs that make up the current MPP. */
  HorizonPathId   mpp[];
};

pubsub VehicleTopicCollection
{
  /** Raw pose topic. Wildcard is vehicle identifier. */
  topic("nds/vehicle/+/pose/raw") PoseRawTopic poseRaw;

  /** Geo matched pose topic. Wildcard is vehicle identifier. */
  topic("nds/vehicle/+/pose/geomatched") PoseGeoMatchedTopic poseGeoMatched;

  /** Probable road network ahead of the vehicle. */
  topic("nds/vehicle/+/path/network") GeoRoadNetworkTopic geoRoadNetwork;

  /** MPP based on the published road network ahead. */
  topic("nds/vehicle/+/path/mpp") MppTopic mpp;

  /** TODO: doc missing. */
  topic("nds/vehicle/+/path/network/matched") MatchedGeoRoadNetworkTopic matchedGeoRoadNetwork;
};
