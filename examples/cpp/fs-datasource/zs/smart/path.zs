/*!
# Smart Layer Paths

This package defines smart layer paths, which provide mixed map content for
multiple layers of a path.

A smart layer path combines `DataLayer` objects from different NDS.Live modules. The
concept is similar to smart layer tiles and the only difference is the addressability.

**Dependencies**
!*/

package smart.path;

import smart.types.*;
import core.location.*;
import core.types.*;
import core.vehicle.*;



/*!
## Smart Layer Path Reference

`SmartLayerPathReference` is the input value of the `SmartLayerPathService`
getter APIs.

It defines the geographic coverage of the entire path. Ranges are used to define
subparts. Data layers are retrieved for each of the ranges if available.

!*/

/** Road location path data along a provided path reference. */
subtype RoadLocationPath SmartLayerPathReference;

/*!
## Smart Layer Path and Smart Layer Path List

`SmartLayerPath` and `SmartLayerPathList` are return values of the
`SmartLayerPathService`.

`SmartLayerPath` contains a path and path segments that match each range in the provided
`SmartLayerPathReference`. The path and its segments may differ from the provided path in the
request, but it is the closest match that the service can provide. The geometry
of the path may differ from the geometry provided in the `SmartLayerPathReference`.


`SmartLayerPathSegment` represents the layered result for one segment of the
requested range. It contains a list of `DataLayer` objects. In addition,
the tile ID is included to make identifiers unique within the path because most
IDs are tile unique and not globally unique. Uniqueness is achieved by
combining the tile ID with the identifiers retrieved from the data layers.

!*/

/** Smart layer path data along a provided path reference. */
struct SmartLayerPath
{
  /** Header structure that associates data layers with data layer definitions. */
  SmartLayerHeader header;

  /** Number of segments in the path. */
  varsize numSegments : numSegments > 0;

  /** Indicates that the returned path exactly matches the provided path. */
  bool exactMatch;

  /**
    * Location path geometry and ranges on the path for which the segments are valid
    * in case the path consists of more than one segment or consists of one
    * segment but does not exactly match the provided path.
    */
  SmartLayerPathLocation(numSegments) pathLocation if !(exactMatch && numSegments == 1);

  /**
    * `DataLayer` objects for the requested segments of the path.
    * The index `numSegments` relates the data layer to the range described
    * in `pathLocation.ranges[numSegments]`.
    */
  SmartLayerPathSegment(header) segments[numSegments];
};

/** List of smart layer paths within a list of tiles. */
struct SmartLayerPathList
{
  /** Number of paths. */
  varsize numPaths;

  /** List of paths. */
  SmartLayerPath pathList[numPaths];
};



/** Provides a path geometry and ranges on that geometry. */
struct SmartLayerPathLocation(varsize numSegments)
{
  /** Geometry of the path for which the data is provided. */
  LocationGeometry path;
  /**
    * Range on the location geometry that the `DataLayer` objects are used for.
    * If the `SmartLayerPath` only consists of one segment, the range is
    * useless and therefore omitted.
    */
  LocationPathRange(path.line) ranges[numSegments] if numSegments > 1;
};

/** Layered result for one segment of the requested range. */
struct SmartLayerPathSegment(SmartLayerHeader header)
{
    /** Identifier of the tile where the segment runs through. */
    PackedTileId tileId;

    /**
      * Indicates whether the data layers contain the complete
      * tile content, that is, all available data in the tile.
      */
    bool completeTileContent;

    /** BLOBs with data as prescribed by the associated data layer definitions. */
    DataLayer layers[header.numDataLayers];
};


/*!
## Smart Layer Location ID Path

`SmartLayerLocationIdPath` is a return value of the `SmartLayerPathService` when using
location identifiers instead of geometry-based locations.

`SmartLayerLocationIdPath` contains the NDS.Classic location ID and path segments
that match ranges on the location ID.

`SmartLayerLocationIdPathSegment` represents the layered result for one requested range
on an NDS.Classic location ID. It contains the range as well as a list of
`DataLayer` objects. In addition, the tile ID is included to make identifiers
unique within the path because most IDs are tile unique and not globally unique.
Uniqueness is achieved by combining the tile ID with the identifiers retrieved
from the data layers.

!*/

/** Smart layer path data along a provided NDS.Classic location ID. */
struct SmartLayerLocationIdPath
{
  /** Header structure that associates data layers with data layer definitions. */
  SmartLayerHeader header;

  /** NDS.Classic location ID for which the data is provided. */
  RoadLocationId locationId;

  /** `DataLayer` objects for the requested path segments. */
  SmartLayerLocationIdPathSegment(header) segments[];
};

/** Layered result for one requested range on an NDS.Classic location ID. */
struct SmartLayerLocationIdPathSegment(SmartLayerHeader header)
{
    /** Range on the road location ID that the `DataLayer` objects are used for. */
    RoadLocationIdRange range;

    /** Identifier of the tile where the segment runs through. */
    PackedTileId tileId;

    /** BLOBs with data as prescribed by the associated data layer definitions. */
    DataLayer layers[header.numDataLayers];
};

/*!

## SmartLayerPosePathRequest

A `SmartLayerPosePathRequest` is a request object that is based on a timed
sequence of raw poses.

!*/

/** Request object that is based on a timed sequence of raw poses. */
struct SmartLayerPosePathRequest
{
  /**
    * List of timed vehicle poses.
    * Latest position shall be on top of the list (index 0).
    * Ordering of the list shall be from newest to oldest pose.
    */
  TimedRawPose poses[];
};
