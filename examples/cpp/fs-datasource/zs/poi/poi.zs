/*!

# POI

This package describes how POIs are modeled. POIs are organized into categories
and they can have relations to other POIs. Each POI can have a reference to a POI
icon set or a brand icon set that is stored in the corresponding icon layer.

For more information about POI relations and POI categories, see [POI
Types](types.zs).

__Note:__ POI names are defined in the `PoiNameLayer` of the Name module.

**Dependencies**

!*/

package poi.poi;

import core.types.*;
import core.geometry.*;
import poi.reference.types.*;
import poi.types.*;
import poi.attributes.*;
import poi.instantiations.*;


/** Basic properties of a POI. */
struct Poi
{
    /** Identifier of the POI. */
    PoiId                       poiId;

    /** Absolute position of the POI in full resolution. */
    Position2D(0)  position;

    /** List of categories to which the POI belongs. */
    PoiCategoryId               categoryIdList[];

    /** Optional reference to an individual icon set for the POI. */
    optional PoiIconSetReference poiIconSetReference;

    /** Optional reference to a brand icon set for the POI. */
    optional BrandIconSetReference brandIconSetReference;

    /** The POI is a parent of the listed child POIs. */
    optional PoiRelation relatedChildren[];

    /** The POI is a child of the listed parent POIs. */
    optional PoiRelation relatedParents[];
};

/*!

## Relations between POIs and Other Features

The POI relation layer allows to define relations between roads, lanes, or
display features and access point POIs. For example, a display area can be
identified as the entrance to a POI.

For relations between POIs themselves, see [POI Relations](types.zs#poi-relations).

!*/


/** Reference to the entrance of a POI. */
subtype PoiReference PoiEntranceReference;

/** Reference to the exit of a POI. */
subtype PoiReference PoiExitReference;

/** Reference to the entrance and exit of a POI. */
subtype PoiReference PoiEntranceAndExitReference;


/** Types of relations between POIs and road locations. */
enum uint8 PoiRoadPositionRelationType
{
  /** The related road location represents the entrance of the POI. */
  ENTRY,

  /** The related road location represents the exit of the POI. */
  EXIT,

  /** The related road location represents the entrance and exit of the POI. */
  ENTRY_AND_EXIT,
};

choice PoiRoadPositionRelationValue(PoiRoadPositionRelationType type) on type
{
  case ENTRY:
    PoiEntranceReference poiEntrance;
  case EXIT:
    PoiExitReference poiExit;
  case ENTRY_AND_EXIT:
    PoiEntranceAndExitReference poiEntranceAndExit;
};


/** Types of relations between POIs and lanes or lane groups. */
enum uint8 PoiLanePositionRelationType
{
  /** The related lane or lane group represents the entrance of the POI. */
  ENTRY,

  /** The related lane or lane group represents the exit of the POI. */
  EXIT,

  /** The related lane or lane group represents the entrance and exit of the POI. */
  ENTRY_AND_EXIT,
};

choice PoiLanePositionRelationValue(PoiLanePositionRelationType type) on type
{
  case ENTRY:
    PoiEntranceReference poiEntrance;
  case EXIT:
    PoiExitReference poiExit;
  case ENTRY_AND_EXIT:
    PoiEntranceAndExitReference poiEntranceAndExit;
};

/** Types of relations between POIs and display areas. */
enum uint8 PoiDisplayAreaRelationType
{
  /** The related display area represents the complete POI. */
  COMPLETE,

  /** The related display area represents the entry to the POI. */
  ENTRY,

  /** The related display area represents the exit of the POI. */
  EXIT,

  /** The related display area represents the entrance and exit of the POI.*/
  ENTRY_AND_EXIT,
};

choice PoiDisplayAreaRelationValue(PoiDisplayAreaRelationType type) on type
{
  case COMPLETE:
    PoiReference poiComplete;
  case ENTRY:
    PoiEntranceReference poiEntrance;
  case EXIT:
    PoiExitReference poiExit;
  case ENTRY_AND_EXIT:
    PoiEntranceAndExitReference poiEntranceAndExit;
};

/** Types of relations between POIs and polygon meshes for 3D display. */
enum uint8 PoiDisplayMesh3DRelationType
{
  /** The related polygon mesh represents the complete POI. */
  COMPLETE,

  /** The related polygon mesh represents the entry to the POI. */
  ENTRY,

  /** The related polygon mesh represents the exit of the POI. */
  EXIT,

  /** The related polygon mesh represents the entrance and exit of the POI.*/
  ENTRY_AND_EXIT,
};

choice PoiDisplayMesh3DRelationValue(PoiDisplayMesh3DRelationType type) on type
{
  case COMPLETE:
    PoiReference poiComplete;
  case ENTRY:
    PoiEntranceReference poiEntrance;
  case EXIT:
    PoiExitReference poiExit;
  case ENTRY_AND_EXIT:
    PoiEntranceAndExitReference poiEntranceAndExit;
};