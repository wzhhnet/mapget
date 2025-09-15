/*!

# Localization Attributes

This package defines attributes that are used to relate localization objects to
other map features.

**Dependencies**

!*/

package localization.attributes;

import localization.types.*;

/*!

Landmarks can have relations to other map features like roads or lanes.
These relations are expressed via an attribute map.

!*/

/** Attribute types for landmark relations to roads or lanes. */
enum uint8 LandmarkRelationAttributeType
{
  /** Visibility of a landmark from a road or a lane. */
  LANDMARK_VISIBILITY,
};

choice LandmarkRelationAttributeValue(LandmarkRelationAttributeType type) on type
{
  case LANDMARK_VISIBILITY:
          LandmarkId    id;
};

/*!

Occupancy grids can have relations to other map features like roads or lanes.
These relations are expressed via an attribute map.

!*/

/** Attribute types for occupancy grid relations to roads or lanes. */
enum uint8 OccupancyGridRelationAttributeType
{
  /** Visibility of an occupancy grid from a road or a lane. */
  OCCUPANCY_GRID_VISIBILITY,
};

choice OccupancyGridRelationAttributeValue(OccupancyGridRelationAttributeType type) on type
{
  case OCCUPANCY_GRID_VISIBILITY:
          OccupancyGridId    id;
};
