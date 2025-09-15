/*!

# Characteristics Instantiations

This helper package instantiates templates that are used in the Characteristics module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package characteristics.instantiations;

import road.reference.types.*;
import road.reference.location.*;
import lane.reference.types.*;
import display.reference.types.*;
import core.attributemap.*;
import characteristics.attributes.*;
import characteristics.properties.*;

instantiate AttributeMetadata<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType> CharacsRoadRangeAttributeMetadata;

instantiate AttributeMetadata<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType> CharacsRoadPositionAttributeMetadata;

instantiate AttributeMetadata<
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType> CharacsLaneRangeAttributeMetadata;

instantiate AttributeMetadata<
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType> CharacsLanePositionAttributeMetadata;

instantiate AttributeMetadata<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType> CharacsDisplayLineRangeAttributeMetadata;

instantiate AttributeMetadata<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType> CharacsDisplayLinePositionAttributeMetadata;

instantiate AttributeMetadata<
    /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType> CharacsTransitionAttributeMetadata;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadPositionAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadPositionAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadRangeAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadRangeAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLaneRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLaneRangeAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLanePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLanePositionAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationRangeAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationPositionAttributeMapList;
    
instantiate AttributeMapList<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLineRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLineRangeAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLinePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLinePositionAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.TransitionReference,
    /* VAL    = */ core.attributemap.Validity,
    /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsTransitionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsTransitionAttributeMapList;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType> CharacsRoadPositionAttributeMapListHeader;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType> CharacsRoadRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType> CharacsLaneRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType> CharacsLanePositionAttributeMapListHeader;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType> CharacsDisplayLineRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType> CharacsDisplayLinePositionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType> CharacsTransitionAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadPositionAttributeMap;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadPositionAttributeMap;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadRangeAttributeMap;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadRangeAttributeMap;

instantiate AttributeMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLaneRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLaneRangeAttributeMap;

instantiate AttributeMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLanePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLanePositionAttributeMap;

instantiate AttributeMap<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationRangeAttributeMap;

instantiate AttributeMap<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationPositionAttributeMap;

instantiate AttributeMap<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLineRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLineRangeAttributeMap;

instantiate AttributeMap<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLinePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLinePositionAttributeMap;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.TransitionReference,
    /* VAL    = */ core.attributemap.Validity,
    /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsTransitionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsTransitionAttributeMap;

instantiate Attribute<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue> CharacsRoadRangeAttribute;

instantiate Attribute<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue> CharacsRoadPositionAttribute;

instantiate Attribute<
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLaneRangeAttributeValue> CharacsLaneRangeAttribute;

instantiate Attribute<
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLanePositionAttributeValue> CharacsLanePositionAttribute;

instantiate Attribute<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLineRangeAttributeValue> CharacsDisplayLineRangeAttribute;

instantiate Attribute<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLinePositionAttributeValue> CharacsDisplayLinePositionAttribute;

instantiate Attribute<
    /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsTransitionAttributeValue> CharacsTransitionAttribute;

instantiate Property<
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsProperty;

instantiate AttributeSet<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadRangeAttributeSet;

instantiate AttributeSet<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadPositionAttributeSet;

instantiate AttributeSet<
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLaneRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLaneRangeAttributeSet;

instantiate AttributeSet<
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLanePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLanePositionAttributeSet;

instantiate AttributeSet<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLineRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLineRangeAttributeSet;

instantiate AttributeSet<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLinePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLinePositionAttributeSet;

instantiate AttributeSet<
    /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsTransitionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsTransitionAttributeSet;

instantiate FullAttribute<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadPositionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLaneRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLaneRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLanePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLanePositionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLineRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLineRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLinePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLinePositionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsTransitionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsTransitionFullAttribute;

instantiate PropertyList<
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsPropertyList;

instantiate AttributeSetMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadPositionAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadPositionAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLaneRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLaneRangeAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLanePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLanePositionAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationRangeAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationPositionAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLineRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLineRangeAttributeSetMap;

instantiate AttributeSetMap<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLinePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLinePositionAttributeSetMap;

instantiate AttributeSetMap<
    /* REF_V  = */ road.reference.types.TransitionReference,
    /* VAL    = */ core.attributemap.Validity,
    /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsTransitionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsTransitionAttributeSetMap;

instantiate AttributeSetList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadPositionAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadPositionAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadRangeAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ road.reference.types.RoadReferenceIndirect,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsIndirectRoadRangeAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLaneRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLaneRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLaneRangeAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsLanePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsLanePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsLanePositionAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationRangeAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsRoadPositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsRoadPositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsRoadLocationPositionAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLinePositionAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLinePositionAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLinePositionAttributeSetList;

instantiate AttributeSetList<
    /* REF    = */ display.reference.types.DisplayLineReference,
    /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
    /* ATTR_T = */ characteristics.attributes.CharacsDisplayLineRangeAttributeType,
    /* ATTR_V = */ characteristics.attributes.CharacsDisplayLineRangeAttributeValue,
    /* PROP_T = */ characteristics.properties.CharacsPropertyType,
    /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsDisplayLineRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ characteristics.attributes.CharacsTransitionAttributeType,
  /* ATTR_V = */ characteristics.attributes.CharacsTransitionAttributeValue,
  /* PROP_T = */ characteristics.properties.CharacsPropertyType,
  /* PROP_V = */ characteristics.properties.CharacsPropertyValue> CharacsTransitionAttributeSetList;