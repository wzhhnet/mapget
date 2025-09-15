/*!

# POI Instantiations

This helper package instantiates templates that are used in the POI module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package poi.instantiations;

import core.attributemap.*;
import core.properties.*;
import poi.reference.types.*;
import poi.attributes.*;
import poi.poi.*;
import poi.properties.*;
import lane.reference.types.*;
import road.reference.types.*;
import road.reference.location.*;
import display.reference.types.*;

instantiate AttributeMetadata<
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* PROP_T */     poi.properties.PoiPropertyType> PoiAttributeMetadata;

instantiate AttributeMapList<
  /* REF */        poi.reference.types.PoiReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiAttributeMapList;

instantiate AttributeMapList<
  /* REF */        poi.reference.types.PoiReferenceIndirect,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiIndirectAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     poi.attributes.PoiAttributeType> PoiAttributeMapListHeader;

instantiate AttributeMap<
  /* REF */        poi.reference.types.PoiReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiAttributeMap;

instantiate AttributeMap<
  /* REF */        poi.reference.types.PoiReferenceIndirect,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiIndirectAttributeMap;

instantiate Attribute<
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue> PoiAttribute;

instantiate Property<
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiProperty;

instantiate AttributeSet<
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiAttributeSet;

instantiate FullAttribute<
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiFullAttribute;

instantiate PropertyList<
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiPropertyList;

instantiate AttributeSetMap<
  /* REF */        poi.reference.types.PoiReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        poi.reference.types.PoiReferenceIndirect,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiIndirectAttributeSetMap;

instantiate AttributeSetList<
  /* REF */        poi.reference.types.PoiReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiAttributeSetList;

instantiate AttributeSetList<
  /* REF */        poi.reference.types.PoiReferenceIndirect,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.attributes.PoiAttributeType,
  /* ATTR_V */     poi.attributes.PoiAttributeValue,
  /* PROP_T */     poi.properties.PoiPropertyType,
  /* PROP_V */     poi.properties.PoiPropertyValue> PoiIndirectAttributeSetList;

instantiate AttributeMetadata<
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* PROP_T */     core.properties.CorePropertyType> PoiRoadPositionRelationMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     poi.poi.PoiDisplayAreaRelationType,
  /* PROP_T */     core.properties.CorePropertyType> PoiDisplayAreaRelationMetadata;

instantiate AttributeMapList<
  /* REF */        display.reference.types.DisplayAreaId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.poi.PoiDisplayAreaRelationType,
  /* ATTR_V */     poi.poi.PoiDisplayAreaRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiDisplayAreaRelationMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     poi.poi.PoiDisplayAreaRelationType> PoiDisplayAreaRelationMapListHeader;

instantiate AttributeMap<
  /* REF */        display.reference.types.DisplayAreaId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.poi.PoiDisplayAreaRelationType,
  /* ATTR_V */     poi.poi.PoiDisplayAreaRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiDisplayAreaRelationMap;

instantiate Attribute<
  /* ATTR_T */     poi.poi.PoiDisplayAreaRelationType,
  /* ATTR_V */     poi.poi.PoiDisplayAreaRelationValue> PoiDisplayAreaRelation;

  
instantiate AttributeMetadata<
/* ATTR_T */     poi.poi.PoiDisplayMesh3DRelationType,
/* PROP_T */     core.properties.CorePropertyType> PoiDisplayMesh3DRelationMetadata;

instantiate AttributeMapList<
  /* REF */        display.reference.types.DisplayMesh3dId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.poi.PoiDisplayMesh3DRelationType,
  /* ATTR_V */     poi.poi.PoiDisplayMesh3DRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiDisplayMesh3DRelationMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     poi.poi.PoiDisplayMesh3DRelationType> PoiDisplayMesh3DRelationMapListHeader;

instantiate AttributeMap<
  /* REF */        display.reference.types.DisplayMesh3dId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     poi.poi.PoiDisplayMesh3DRelationType,
  /* ATTR_V */     poi.poi.PoiDisplayMesh3DRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiDisplayMesh3DRelationMap;

instantiate Attribute<
  /* ATTR_T */     poi.poi.PoiDisplayMesh3DRelationType,
  /* ATTR_V */     poi.poi.PoiDisplayMesh3DRelationValue> PoiDisplayMesh3DRelation;

instantiate AttributeMapList<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        road.reference.types.RoadPositionValidity,
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* ATTR_V */     poi.poi.PoiRoadPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiRoadPositionRelationMapList;

instantiate AttributeMapList<
  /* REF */        road.reference.types.RoadReferenceIndirect,
  /* VAL */        road.reference.types.RoadPositionValidity,
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* ATTR_V */     poi.poi.PoiRoadPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiRoadIndirectPositionRelationMapList;

instantiate AttributeMapList<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationPositionValidity,
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* ATTR_V */     poi.poi.PoiRoadPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiRoadLocationPositionRelationMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType> PoiRoadPositionRelationMapListHeader;

instantiate AttributeMap<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        road.reference.types.RoadPositionValidity,
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* ATTR_V */     poi.poi.PoiRoadPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiRoadPositionRelationMap;

instantiate AttributeMap<
  /* REF */        road.reference.types.RoadReferenceIndirect,
  /* VAL */        road.reference.types.RoadPositionValidity,
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* ATTR_V */     poi.poi.PoiRoadPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiRoadIndirectPositionRelationMap;

instantiate AttributeMap<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationPositionValidity,
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* ATTR_V */     poi.poi.PoiRoadPositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiRoadLocationPositionRelationMap;

instantiate Attribute<
  /* ATTR_T */     poi.poi.PoiRoadPositionRelationType,
  /* ATTR_V */     poi.poi.PoiRoadPositionRelationValue> PoiRoadPositionRelation;

instantiate AttributeMetadata<
  /* ATTR_T */     poi.poi.PoiLanePositionRelationType,
  /* PROP_T */     poi.properties.PoiPropertyType> PoiLanePositionRelationMetadata;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T */     poi.poi.PoiLanePositionRelationType,
  /* ATTR_V */     poi.poi.PoiLanePositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiLanePositionRelationMapList;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL */        lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T */     poi.poi.PoiLanePositionRelationType,
  /* ATTR_V */     poi.poi.PoiLanePositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiLaneIndirectPositionRelationMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     poi.poi.PoiLanePositionRelationType> PoiLanePositionRelationMapListHeader;

instantiate AttributeMap<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T */     poi.poi.PoiLanePositionRelationType,
  /* ATTR_V */     poi.poi.PoiLanePositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiLanePositionRelationMap;

instantiate AttributeMap<
  /* REF */        lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL */        lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T */     poi.poi.PoiLanePositionRelationType,
  /* ATTR_V */     poi.poi.PoiLanePositionRelationValue,
  /* PROP_T */     core.properties.CorePropertyType,
  /* PROP_V */     core.properties.CorePropertyValue> PoiLaneIndirectPositionRelationMap;

instantiate Attribute<
  /* ATTR_T */     poi.poi.PoiLanePositionRelationType,
  /* ATTR_V */     poi.poi.PoiLanePositionRelationValue> PoiLanePositionRelation;
