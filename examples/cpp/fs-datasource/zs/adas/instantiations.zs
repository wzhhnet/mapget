/*!

# ADAS Instantiations

This helper package instantiates templates that are used in the ADAS module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package adas.instantiations;

import road.reference.types.*;
import road.reference.location.*;
import lane.reference.types.*;
import core.attributemap.*;
import adas.attributes.*;
import adas.properties.*;

instantiate AttributeMetadata<
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* PROP_T */     adas.properties.AdasPropertyType> AdasRoadAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* PROP_T */     adas.properties.AdasPropertyType> AdasTransitionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* PROP_T */     adas.properties.AdasPropertyType> AdasLaneTransitionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* PROP_T */     adas.properties.AdasPropertyType> AdasLaneAttributeMetadata;

instantiate AttributeMapList<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadAttributeMapList;

instantiate AttributeMapList<
  /* REF */        road.reference.types.TransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.LaneGroupTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneAttributeMapList;

instantiate AttributeMapList<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationAttributeMapList;

instantiate AttributeMapList<
  /* REF */        road.reference.location.RoadLocationTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationTransitionAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType> AdasRoadAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType> AdasTransitionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType> AdasLaneTransitionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType> AdasLaneAttributeMapListHeader;

instantiate AttributeMap<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadAttributeMap;

instantiate AttributeMap<
  /* REF */        road.reference.types.TransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasTransitionAttributeMap;

instantiate AttributeMap<
  /* REF */        lane.reference.types.LaneGroupTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneTransitionAttributeMap;

instantiate AttributeMap<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneAttributeMap;

instantiate AttributeMap<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationAttributeMap;

instantiate AttributeMap<
  /* REF */        road.reference.location.RoadLocationTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationTransitionAttributeMap;

instantiate Attribute<
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue> AdasRoadAttribute;

instantiate Attribute<
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue> AdasTransitionAttribute;

instantiate Attribute<
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneTransitionAttributeValue> AdasLaneTransitionAttribute;

instantiate Attribute<
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneAttributeValue> AdasLaneAttribute;

instantiate Property<
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasProperty;

instantiate AttributeSet<
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasTransitionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneTransitionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneAttributeSet;

instantiate FullAttribute<
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasTransitionFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneTransitionFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneFullAttribute;

instantiate PropertyList<
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasPropertyList;

instantiate AttributeSetMap<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        road.reference.types.TransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        lane.reference.types.LaneGroupTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        road.reference.location.RoadLocationTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationTransitionAttributeSetMap;

instantiate AttributeSetList<
  /* REF */        road.reference.types.RoadReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadAttributeSetList;

instantiate AttributeSetList<
  /* REF */        road.reference.types.TransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF */        lane.reference.types.LaneGroupTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasLaneTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF */        lane.reference.types.LaneGroupId,
  /* VAL */        lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T */     adas.attributes.AdasLaneAttributeType,
  /* ATTR_V */     adas.attributes.AdasLaneAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasLaneAttributeSetList;

instantiate AttributeSetList<
  /* REF */        road.reference.location.RoadLocationReference,
  /* VAL */        road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T */     adas.attributes.AdasRoadAttributeType,
  /* ATTR_V */     adas.attributes.AdasRoadAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationAttributeSetList;

instantiate AttributeSetList<
  /* REF */        road.reference.location.RoadLocationTransitionReference,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     adas.attributes.AdasTransitionAttributeType,
  /* ATTR_V */     adas.attributes.AdasTransitionAttributeValue,
  /* PROP_T */     adas.properties.AdasPropertyType,
  /* PROP_V */     adas.properties.AdasPropertyValue> AdasRoadLocationTransitionAttributeSetList;

