/*!

# Traffic Instantiations

This helper package instantiates templates that are used in the Traffic module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

!*/

package traffic.instantiations;

import road.reference.types.*;
import road.reference.location.*;
import lane.reference.types.*;
import display.reference.types.*;
import core.attributemap.*;
import core.types.*;
import traffic.attributes.*;
import traffic.properties.*;
import traffic.types.*;

instantiate AttributeMetadata<
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* PROP_T = */ traffic.properties.TrafficPropertyType> TrafficRoadRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* PROP_T = */ traffic.properties.TrafficPropertyType> TrafficLaneRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
  /* PROP_T = */ traffic.properties.TrafficPropertyType> TrafficDisplayLineRangeAttributeMetadata;


instantiate AttributeMetadata<
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* PROP_T = */ traffic.properties.TrafficPropertyType> TrafficTransitionAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectRoadRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficLaneRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectLaneRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficDisplayLineRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficDisplayLineRangeAttributeMapList;


instantiate AttributeMapListHeader<
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType> TrafficRoadRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType> TrafficLaneRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType> TrafficTransitionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType> TrafficDisplayLineRangeAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectRoadRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficLaneRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectLaneRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficTransitionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationTransitionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficDisplayLineRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficDisplayLineRangeAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue> TrafficRoadRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue> TrafficLaneRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue> TrafficTransitionAttribute;

instantiate Attribute<
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficDisplayLineRangeAttributeValue> TrafficDisplayLineRangeAttribute;

instantiate Property<
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficProperty;

instantiate AttributeSet<
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficLaneRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficTransitionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficDisplayLineRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficDisplayLineRangeAttributeSet;

instantiate FullAttribute<
    /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
    /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
    /* PROP_T = */ traffic.properties.TrafficPropertyType,
    /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadRangeFullAttribute;

instantiate FullAttribute<
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficLaneRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
    /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
    /* PROP_T = */ traffic.properties.TrafficPropertyType,
    /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficTransitionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
    /* ATTR_V = */ traffic.attributes.TrafficDisplayLineRangeAttributeValue,
    /* PROP_T = */ traffic.properties.TrafficPropertyType,
    /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficDisplayLineRangeFullAttribute;


instantiate PropertyList<
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficPropertyList;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficLaneRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectLaneRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficDisplayLineRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficDisplayLineRangeAttributeSetMap;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectRoadRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficRoadRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficRoadRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficLaneRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficLaneRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficLaneRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficIndirectLaneRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ traffic.attributes.TrafficTransitionAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficTransitionAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficRoadLocationTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ traffic.attributes.TrafficDisplayLineRangeAttributeType,
  /* ATTR_V = */ traffic.attributes.TrafficDisplayLineRangeAttributeValue,
  /* PROP_T = */ traffic.properties.TrafficPropertyType,
  /* PROP_V = */ traffic.properties.TrafficPropertyValue> TrafficDisplayLineRangeAttributeSetList;
