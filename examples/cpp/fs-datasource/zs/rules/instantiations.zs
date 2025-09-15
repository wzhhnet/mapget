/*!

# Rules Instantiations

This helper package instantiates templates that are used in the Rules module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

!*/

package rules.instantiations;

import road.reference.types.*;
import road.reference.location.*;
import lane.reference.types.*;
import display.reference.types.*;
import core.attributemap.*;
import core.types.*;
import rules.attributes.*;
import rules.properties.*;
import rules.types.*;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesRoadRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesRoadPositionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesLaneRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesLanePositionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesTransitionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesLaneTransitionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesRegionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesDisplayLineRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
  /* PROP_T = */ rules.properties.RulesPropertyType> RulesDisplayLinePositionAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationPositionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadPositionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadPositionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLaneRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLanePositionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLanePositionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ core.types.RegionId,
  /* VAL    = */ rules.types.RegionValidity,
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRegionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRegionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLineRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLineRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLinePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLinePositionAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType> RulesRoadRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType> RulesRoadPositionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType> RulesLaneRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType> RulesLanePositionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType> RulesTransitionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType> RulesLaneTransitionAttributeMapListHeader;


instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType> RulesRegionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType> RulesDisplayLineRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType> RulesDisplayLinePositionAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationPositionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadPositionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadPositionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLaneRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLanePositionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLanePositionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneTransitionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesTransitionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationTransitionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ core.types.RegionId,
  /* VAL    = */ rules.types.RegionValidity,
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRegionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRegionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLineRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLineRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLinePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLinePositionAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue> RulesRoadRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue> RulesRoadPositionAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue> RulesLaneRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue> RulesLanePositionAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue> RulesTransitionAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneTransitionAttributeValue> RulesLaneTransitionAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRegionAttributeValue> RulesRegionAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLineRangeAttributeValue> RulesDisplayLineRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLinePositionAttributeValue> RulesDisplayLinePositionAttribute;

instantiate Property<
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesProperty;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRegionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRegionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadPositionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLanePositionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesTransitionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneTransitionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLineRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLineRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLinePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLinePositionAttributeSet;

instantiate FullAttribute<
    /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
    /* ATTR_V = */ rules.attributes.RulesRegionAttributeValue,
    /* PROP_T = */ rules.properties.RulesPropertyType,
    /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRegionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
    /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
    /* PROP_T = */ rules.properties.RulesPropertyType,
    /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
    /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
    /* PROP_T = */ rules.properties.RulesPropertyType,
    /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadPositionFullAttribute;

instantiate FullAttribute<
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneRangeFullAttribute;

instantiate FullAttribute<
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLanePositionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
    /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
    /* PROP_T = */ rules.properties.RulesPropertyType,
    /* PROP_V = */ rules.properties.RulesPropertyValue> RulesTransitionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
    /* ATTR_V = */ rules.attributes.RulesLaneTransitionAttributeValue,
    /* PROP_T = */ rules.properties.RulesPropertyType,
    /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneTransitionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
    /* ATTR_V = */ rules.attributes.RulesDisplayLineRangeAttributeValue,
    /* PROP_T = */ rules.properties.RulesPropertyType,
    /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLineRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
    /* ATTR_V = */ rules.attributes.RulesDisplayLinePositionAttributeValue,
    /* PROP_T = */ rules.properties.RulesPropertyType,
    /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLinePositionFullAttribute;

instantiate PropertyList<
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesPropertyList;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationPositionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadPositionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadPositionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLaneRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLanePositionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLanePositionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ core.types.RegionId,
  /* VAL    = */ rules.types.RegionValidity,
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRegionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRegionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLineRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLineRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLinePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLinePositionAttributeSetMap;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.location.RoadLocationReference,
  /* VAL    = */ road.reference.location.RoadLocationPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationPositionAttributeSetList;
  
instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadPositionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReferenceIndirect,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesRoadPositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRoadPositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectRoadPositionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLanePositionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ rules.attributes.RulesLanePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLanePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLanePositionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupReferenceIndirect,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesLaneRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesIndirectLaneRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesLaneTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesLaneTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesLaneTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.location.RoadLocationTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ rules.attributes.RulesTransitionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesTransitionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRoadLocationTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ core.types.RegionId,
  /* VAL    = */ rules.types.RegionValidity,
  /* ATTR_T = */ rules.attributes.RulesRegionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesRegionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesRegionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLineRangeAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLineRangeAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLineRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLinePositionValidity,
  /* ATTR_T = */ rules.attributes.RulesDisplayLinePositionAttributeType,
  /* ATTR_V = */ rules.attributes.RulesDisplayLinePositionAttributeValue,
  /* PROP_T = */ rules.properties.RulesPropertyType,
  /* PROP_V = */ rules.properties.RulesPropertyValue> RulesDisplayLinePositionAttributeSetList;
