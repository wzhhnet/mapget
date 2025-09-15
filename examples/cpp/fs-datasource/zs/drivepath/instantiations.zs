/*!

# Drive Path Instantiations

This helper package instantiates templates that are used in the Drive Path module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package drivepath.instantiations;

import core.attributemap.*;
import core.properties.*;
import core.geometry.*;
import drivepath.attributes.*;
import drivepath.properties.*;
import drivepath.types.*;
import lane.reference.types.*;
import road.reference.types.*;
import road.reference.location.*;

instantiate AttributeMetadata<
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType> DrivePathRangeAttributeMetadata;

instantiate AttributeMetadata<
/* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
/* PROP_T */     drivepath.properties.DrivePathPropertyType> DrivePathPositionAttributeMetadata;

instantiate AttributeMapList<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathRangeValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathRangeAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathPositionValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathPositionAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathPositionAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType> DrivePathRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType> DrivePathPositionAttributeMapListHeader;

instantiate AttributeMap<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathRangeValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathRangeAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathRangeAttributeMap;

instantiate AttributeMap<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathPositionValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathPositionAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathPositionAttributeMap;

instantiate Attribute<
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathRangeAttributeValue> DrivePathRangeAttribute;

instantiate Attribute<
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathPositionAttributeValue> DrivePathPositionAttribute;

instantiate Property<
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathProperty;

instantiate AttributeSet<
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathRangeAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathPositionAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathPositionAttributeSet;

instantiate FullAttribute<
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathRangeAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathPositionAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathPositionFullAttribute;

instantiate PropertyList<
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathPropertyList;

instantiate AttributeSetMap<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathRangeValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathRangeAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathPositionValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathPositionAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathPositionAttributeSetMap;

instantiate AttributeSetList<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathRangeValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathRangeAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathRangeAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF */        drivepath.types.DrivePathId,
  /* VAL */        drivepath.types.DrivePathPositionValidity,
  /* ATTR_T */     drivepath.attributes.DrivePathPositionAttributeType,
  /* ATTR_V */     drivepath.attributes.DrivePathPositionAttributeValue,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType,
  /* PROP_V */     drivepath.properties.DrivePathPropertyValue> DrivePathPositionAttributeSetList;

instantiate AttributeMetadata<
  /* ATTR_T */     drivepath.types.DrivePathRoadRangeRelationType,
  /* PROP_T */     core.properties.CorePropertyType> DrivePathRoadRangeRelationMetadata;

instantiate AttributeMapList<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        road.reference.types.RoadRangeValidity,
  /* ATTR_T */     drivepath.types.DrivePathRoadRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathRoadRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> DrivePathRoadRangeRelationMapList;

instantiate AttributeMapList<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T */     drivepath.types.DrivePathRoadRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathRoadRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> DrivePathRoadLocationRangeRelationMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     drivepath.types.DrivePathRoadRangeRelationType> DrivePathRoadRangeRelationMapListHeader;

instantiate AttributeMap<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        road.reference.types.RoadRangeValidity,
  /* ATTR_T */     drivepath.types.DrivePathRoadRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathRoadRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> DrivePathRoadRangeRelationMap;

instantiate AttributeMap<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T */     drivepath.types.DrivePathRoadRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathRoadRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> DrivePathRoadLocationPositionRelationMap;

instantiate Attribute<
  /* ATTR_T */     drivepath.types.DrivePathRoadRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathRoadRangeRelationValue> DrivePathRoadRangeRelation;

instantiate AttributeMetadata<
  /* ATTR_T */     drivepath.types.DrivePathLaneRangeRelationType,
  /* PROP_T */     drivepath.properties.DrivePathPropertyType> DrivePathLaneRangeRelationMetadata;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     drivepath.types.DrivePathLaneRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathLaneRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> DrivePathLaneRangeRelationMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     drivepath.types.DrivePathLaneRangeRelationType> DrivePathLaneRangeRelationMapListHeader;

instantiate AttributeMap<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     drivepath.types.DrivePathLaneRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathLaneRangeRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> DrivePathLaneRangeRelationMap;

instantiate Attribute<
  /* ATTR_T */     drivepath.types.DrivePathLaneRangeRelationType,
  /* ATTR_V */     drivepath.types.DrivePathLaneRangeRelationValue> DrivePathLaneRangeRelation;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     drivepath.types.DrivePathId,
  /* GEOMETRY_TYPE */   core.geometry.GeometryType> DrivePathGeometryLayer;