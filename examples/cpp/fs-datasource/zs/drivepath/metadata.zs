/*!

# Drive Path Metadata

This package defines metadata of the drive path layers. The metadata provides
information about the content of the geometry layer, the attribute layer, and
the relation layer for drive paths.

**Dependencies**

!*/

package drivepath.metadata;

import core.icons.*;
import core.language.*;
import core.types.*;
import core.location.*;
import core.vehicle.*;
import drivepath.attributes.*;
import drivepath.instantiations.*;
import drivepath.types.*;

/** Metadata of the drive path layer. */
struct DrivePathLayerMetadata
{
  /** Vehicle specifications for which drivepaths are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Metadata of the drive path attribute layer. */
struct DrivePathAttributeLayerMetadata
{
  /** Content of the drive path attribute layer. */
  DrivePathAttributeLayerContent content;

  /** Metadata for drive path range attributes. */
  DrivePathRangeAttributeMetadata drivePathRangeAttributeMetadata
        if isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_RANGE_ATTRIBUTE_MAPS)
        || isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_RANGE_ATTRIBUTE_SETS);

  DrivePathPositionAttributeMetadata drivePathPositionAttributeMetadata
        if isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_POSITION_ATTRIBUTE_MAPS)
        || isset(content, DrivePathAttributeLayerContent.DRIVE_PATH_POSITION_ATTRIBUTE_SETS);
};

/** Content of the drive path attribute layer. */
bitmask varuint32 DrivePathAttributeLayerContent
{
  /** Layer contains attribute maps for drive path range attributes. */
  DRIVE_PATH_RANGE_ATTRIBUTE_MAPS,

  /** Layer contains attribute sets for drive path range attributes. */
  DRIVE_PATH_RANGE_ATTRIBUTE_SETS,

  /** Layer contains attribute maps for drive path position attributes. */
  DRIVE_PATH_POSITION_ATTRIBUTE_MAPS,

  /** Layer contains attribute sets for drive path position attributes. */
  DRIVE_PATH_POSITION_ATTRIBUTE_SETS,
};

/** Metadata of the drive path relation layer. */
struct DrivePathRelationLayerMetadata
{
  /** Content of the drive path relation layer. */
  DrivePathRelationLayerContent content;

  /** Drive path relation types used in attribute maps for relations to road ranges. */
  DrivePathRoadRangeRelationMetadata drivePathRoadRangeRelationMetadata
            if isset(content, DrivePathRelationLayerContent.ROAD_RANGE_MAPS)
            || isset(content, DrivePathRelationLayerContent.ROAD_LOCATION_RANGE_MAPS);

  /** Drive path relation types used in attribute maps for relations to lane ranges. */
  DrivePathLaneRangeRelationMetadata drivePathLaneRangeRelationMetadata
            if isset(content, DrivePathRelationLayerContent.LANE_RANGE_MAPS);

  /** Encoding of the road location IDs used in the drive path relation layer. */
  RoadLocationIdDefinition roadLocationIdEncoding
            if isset(content, DrivePathRelationLayerContent.ROAD_LOCATION_RANGE_MAPS);
};

/** Content bitmask for the drive path relation layer. */
bitmask varuint32 DrivePathRelationLayerContent
{
  /**
    * Layer contains attribute maps containing relations to lane ranges
    * using direct references.
    */
  LANE_RANGE_MAPS,

  /**
    * Layer contains attribute maps containing relations to road ranges
    * using direct references.
    */
  ROAD_RANGE_MAPS,

  /**
    * Layer contains attribute maps containing relations to road ranges
    * using road location IDs.
    */
  ROAD_LOCATION_RANGE_MAPS,
};