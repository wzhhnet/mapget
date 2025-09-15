/*!

# Venue Instantiations

This helper package instantiates templates that are used in the Venue module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package venue.instantiations;

import core.attributemap.*;
import core.properties.*;
import venue.parking.*;
import venue.reference.types.*;
import lane.reference.types.*;
import poi.reference.types.*;

/*!

**Definitions**

!*/

instantiate AttributeMetadata<
  /* ATTR_T */     venue.parking.ParkingRelationType,
  /* PROP_T */     core.properties.CorePropertyType> ParkingRelationMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     venue.parking.ParkingRangeRelationType,
  /* PROP_T */     core.properties.CorePropertyType> ParkingRangeRelationMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     venue.parking.ParkingPositionRelationType,
  /* PROP_T */     core.properties.CorePropertyType> ParkingPositionRelationMetadata;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.RoadSurfaceId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.parking.ParkingRelationType,
  /* ATTR_V */     venue.parking.ParkingRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingRoadSurfaceRelationMapList;

instantiate AttributeMapList<
  /* REF */        poi.reference.types.PoiId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.parking.ParkingRelationType,
  /* ATTR_V */     venue.parking.ParkingRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingPoiRelationMapList;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     venue.parking.ParkingRangeRelationType,
  /* ATTR_V */     venue.parking.ParkingRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingLaneRangeRelationMapList;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T */     venue.parking.ParkingPositionRelationType,
  /* ATTR_V */     venue.parking.ParkingPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingLanePositionRelationMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.parking.ParkingRangeRelationType> ParkingRangeRelationMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.parking.ParkingPositionRelationType> ParkingPositionRelationMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.parking.ParkingRelationType> ParkingRelationMapListHeader;

instantiate AttributeMap<
  /* REF */        lane.reference.types.RoadSurfaceId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.parking.ParkingRelationType,
  /* ATTR_V */     venue.parking.ParkingRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingRoadSurfaceRelationMap;

instantiate AttributeMap<
  /* REF */        poi.reference.types.PoiId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.parking.ParkingRelationType,
  /* ATTR_V */     venue.parking.ParkingRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingPoiRelationMap;

instantiate AttributeMap<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     venue.parking.ParkingRangeRelationType,
  /* ATTR_V */     venue.parking.ParkingRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingLaneRangeRelationMap;

instantiate AttributeMap<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T */     venue.parking.ParkingPositionRelationType,
  /* ATTR_V */     venue.parking.ParkingPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> ParkingLanePositionRelationMap;

instantiate Attribute<
  /* ATTR_T */     venue.parking.ParkingRangeRelationType,
  /* ATTR_V */     venue.parking.ParkingRangeRelationValue> ParkingRangeRelation;

instantiate Attribute<
  /* ATTR_T */     venue.parking.ParkingPositionRelationType,
  /* ATTR_V */     venue.parking.ParkingPositionRelationValue> ParkingPositionRelation;

instantiate Attribute<
  /* ATTR_T */     venue.parking.ParkingRelationType,
  /* ATTR_V */     venue.parking.ParkingRelationValue> ParkingRelation;

instantiate Property<
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> CoreProperty;

instantiate PropertyList<
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> CorePropertyList;
