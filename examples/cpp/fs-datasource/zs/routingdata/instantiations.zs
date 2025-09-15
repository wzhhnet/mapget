/*!

# Routing Instantiations

This helper package instantiates templates that are used in the Routing Data module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package routingdata.instantiations;

import road.reference.types.*;
import road.reference.location.*;
import lane.reference.types.*;
import core.attributemap.*;
import routingdata.attributes.*;
import routingdata.properties.*;

instantiate AttributeMetadata<
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType> RoutingRoadRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType> RoutingRoadTransitionAttributeMetadata;

instantiate AttributeMetadata<
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType> RoutingLaneRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType> RoutingLaneTransitionAttributeMetadata;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingRoadTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadTransitionAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingLaneTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneTransitionAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType> RoutingRoadRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType> RoutingRoadTransitionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType> RoutingLaneRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType> RoutingLaneTransitionAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingRoadTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadTransitionAttributeMap;

instantiate AttributeMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingLaneTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneTransitionAttributeMap;

instantiate Attribute<
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadRangeAttributeValue> RoutingRoadRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingRoadTransitionAttributeValue> RoutingRoadTransitionAttribute;

instantiate Attribute<
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneRangeAttributeValue> RoutingLaneRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingLaneTransitionAttributeValue> RoutingLaneTransitionAttribute;

instantiate Property<
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingProperty;

instantiate PropertyList<
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingPropertyList;

instantiate AttributeSet<
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingRoadTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadTransitionAttributeSet;

instantiate AttributeSet<
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingLaneTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneTransitionAttributeSet;

instantiate FullAttribute<
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadTransitionAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadTransitionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneTransitionAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneTransitionFullAttribute;

instantiate AttributeSetMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingRoadTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadTransitionAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingLaneTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneTransitionAttributeSetMap;

instantiate AttributeSetList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingRoadRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingRoadRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingRoadTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingRoadTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingRoadTransitionAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ routingdata.attributes.RoutingLaneRangeAttributeType,
    /* ATTR_V = */ routingdata.attributes.RoutingLaneRangeAttributeValue,
    /* PROP_T = */ routingdata.properties.RoutingPropertyType,
    /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneRangeAttributeSetList;


instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ routingdata.attributes.RoutingLaneTransitionAttributeType,
  /* ATTR_V = */ routingdata.attributes.RoutingLaneTransitionAttributeValue,
  /* PROP_T = */ routingdata.properties.RoutingPropertyType,
  /* PROP_V = */ routingdata.properties.RoutingPropertyValue> RoutingLaneTransitionAttributeSetList;
