/*!

# Name Instantiations

This helper package instantiates templates that are used in the Name module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

!*/

package name.instantiations;

import road.reference.types.*;
import lane.reference.types.*;
import display.reference.types.*;
import poi.reference.types.*;
import core.attributemap.*;
import core.types.*;
import name.attributes.*;
import name.properties.*;
import name.types.*;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameRoadRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameRoadPositionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameLaneRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameLanePositionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameTransitionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameDisplayLineRangeAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameDisplayAreaAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NameDisplayPointAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ name.attributes.NamePoiAttributeType,
  /* PROP_T = */ name.properties.NamePropertyType> NamePoiAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadPositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadPositionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameLaneRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLaneRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* ATTR_V = */ name.attributes.NameLanePositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLanePositionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
  /* ATTR_V = */ name.attributes.NameTransitionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayLineRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayLineRangeAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ display.reference.types.DisplayAreaId,
  /* VAL    = */ display.reference.types.DisplayAreaValidity,
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayAreaAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayAreaAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ display.reference.types.DisplayPointId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayPointAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayPointAttributeMapList;

instantiate AttributeMapList<
  /* REF =    */ poi.reference.types.PoiId,
  /* VAL =    */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NamePoiAttributeType,
  /* ATTR_V = */ name.attributes.NamePoiAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NamePoiAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType> NameRoadRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType> NameRoadPositionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType> NameLaneRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType> NameLanePositionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType> NameTransitionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType> NameDisplayLineRangeAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType> NameDisplayAreaAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType> NameDisplayPointAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ name.attributes.NamePoiAttributeType> NamePoiAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadPositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadPositionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameLaneRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLaneRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* ATTR_V = */ name.attributes.NameLanePositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLanePositionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
  /* ATTR_V = */ name.attributes.NameTransitionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameTransitionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayLineRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayLineRangeAttributeMap;

instantiate AttributeMap<
  /* REF    = */ display.reference.types.DisplayAreaId,
  /* VAL    = */ display.reference.types.DisplayAreaValidity,
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayAreaAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayAreaAttributeMap;

instantiate AttributeMap<
  /* REF    = */ display.reference.types.DisplayPointId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayPointAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayPointAttributeMap;

instantiate AttributeMap<
  /* REF    = */ poi.reference.types.PoiId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NamePoiAttributeType,
  /* ATTR_V = */ name.attributes.NamePoiAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NamePoiAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadRangeAttributeValue> NameRoadRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadPositionAttributeValue> NameRoadPositionAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameLaneRangeAttributeValue> NameLaneRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* ATTR_V = */ name.attributes.NameLanePositionAttributeValue> NameLanePositionAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
  /* ATTR_V = */ name.attributes.NameTransitionAttributeValue> NameTransitionAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayLineRangeAttributeValue> NameDisplayLineRangeAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayAreaAttributeValue> NameDisplayAreaAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayPointAttributeValue> NameDisplayPointAttribute;

instantiate Attribute<
  /* ATTR_T = */ name.attributes.NamePoiAttributeType,
  /* ATTR_V = */ name.attributes.NamePoiAttributeValue> NamePoiAttribute;

instantiate Property<
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameProperty;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadPositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadPositionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameLaneRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLaneRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* ATTR_V = */ name.attributes.NameLanePositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLanePositionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
  /* ATTR_V = */ name.attributes.NameTransitionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameTransitionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayLineRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayLineRangeAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayAreaAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayAreaAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayPointAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayPointAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ name.attributes.NamePoiAttributeType,
  /* ATTR_V = */ name.attributes.NamePoiAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NamePoiAttributeSet;

instantiate FullAttribute<
    /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
    /* ATTR_V = */ name.attributes.NameRoadRangeAttributeValue,
    /* PROP_T = */ name.properties.NamePropertyType,
    /* PROP_V = */ name.properties.NamePropertyValue> NameRoadRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
    /* ATTR_V = */ name.attributes.NameRoadPositionAttributeValue,
    /* PROP_T = */ name.properties.NamePropertyType,
    /* PROP_V = */ name.properties.NamePropertyValue> NameRoadPositionFullAttribute;

instantiate FullAttribute<
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameLaneRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLaneRangeFullAttribute;

instantiate FullAttribute<
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* ATTR_V = */ name.attributes.NameLanePositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLanePositionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
    /* ATTR_V = */ name.attributes.NameTransitionAttributeValue,
    /* PROP_T = */ name.properties.NamePropertyType,
    /* PROP_V = */ name.properties.NamePropertyValue> NameTransitionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
    /* ATTR_V = */ name.attributes.NameDisplayLineRangeAttributeValue,
    /* PROP_T = */ name.properties.NamePropertyType,
    /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayLineRangeFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
    /* ATTR_V = */ name.attributes.NameDisplayAreaAttributeValue,
    /* PROP_T = */ name.properties.NamePropertyType,
    /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayAreaFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
    /* ATTR_V = */ name.attributes.NameDisplayPointAttributeValue,
    /* PROP_T = */ name.properties.NamePropertyType,
    /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayPointFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ name.attributes.NamePoiAttributeType,
    /* ATTR_V = */ name.attributes.NamePoiAttributeValue,
    /* PROP_T = */ name.properties.NamePropertyType,
    /* PROP_V = */ name.properties.NamePropertyValue> NamePoiFullAttribute;

instantiate PropertyList<
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NamePropertyList;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadPositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadPositionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameLaneRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLaneRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* ATTR_V = */ name.attributes.NameLanePositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLanePositionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
  /* ATTR_V = */ name.attributes.NameTransitionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayLineRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayLineRangeAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ display.reference.types.DisplayAreaId,
  /* VAL    = */ display.reference.types.DisplayAreaValidity,
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayAreaAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayAreaAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ display.reference.types.DisplayPointId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayPointAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayPointAttributeSetMap;

instantiate AttributeSetMap<
  /* REF    = */ poi.reference.types.PoiId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NamePoiAttributeType,
  /* ATTR_V = */ name.attributes.NamePoiAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NamePoiAttributeSetMap;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ name.attributes.NameRoadRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadPositionValidity,
  /* ATTR_T = */ name.attributes.NameRoadPositionAttributeType,
  /* ATTR_V = */ name.attributes.NameRoadPositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameRoadPositionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
  /* ATTR_T = */ name.attributes.NameLanePositionAttributeType,
  /* ATTR_V = */ name.attributes.NameLanePositionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLanePositionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ name.attributes.NameLaneRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameLaneRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameLaneRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameTransitionAttributeType,
  /* ATTR_V = */ name.attributes.NameTransitionAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ display.reference.types.DisplayLineReference,
  /* VAL    = */ display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T = */ name.attributes.NameDisplayLineRangeAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayLineRangeAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayLineRangeAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ display.reference.types.DisplayAreaId,
  /* VAL    = */ display.reference.types.DisplayAreaValidity,
  /* ATTR_T = */ name.attributes.NameDisplayAreaAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayAreaAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayAreaAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ display.reference.types.DisplayPointId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NameDisplayPointAttributeType,
  /* ATTR_V = */ name.attributes.NameDisplayPointAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NameDisplayPointAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ poi.reference.types.PoiId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ name.attributes.NamePoiAttributeType,
  /* ATTR_V = */ name.attributes.NamePoiAttributeValue,
  /* PROP_T = */ name.properties.NamePropertyType,
  /* PROP_V = */ name.properties.NamePropertyValue> NamePoiAttributeSetList;