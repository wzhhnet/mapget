/*!

# Attribute Instantiations

This helper package instantiates templates that are used in the ext lane module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package ext.lane.instantiations;

import lane.reference.types.*;
import core.attributemap.*;
import display.reference.types.*;
import ext.lane.properties.*;
import ext.lane.attributes.*;
import ext.lane.types.*;


/*************************************************************************************/
/** relationship between 2d lane group id and 3d object id.*/
instantiate AttributeMetadata<
  /* ATTR_T = */ ext.lane.attributes.Lane2ThreeDRelationAttributeType,
  /* PROP_T = */ ext.lane.properties.LanePropertyType> Lane2ThreeDRelationAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T = */ ext.lane.attributes.ThreeD2LaneRelationAttributeType,
  /* PROP_T = */ ext.lane.properties.LanePropertyType> ThreeD2LaneRelationAttributeMetadata;

/** relationship between 2d lane group id and link id.*/
instantiate AttributeMetadata<
  /* ATTR_T = */ ext.lane.attributes.Lane2LinkRelationAttributeType,
  /* PROP_T = */ ext.lane.properties.LanePropertyType> Lane2LinkRelationAttributeMetadata;  

instantiate AttributeMapListHeader<
  /* ATTR_T = */ ext.lane.attributes.Lane2ThreeDRelationAttributeType>  Lane2ThreeDRelationAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ ext.lane.attributes.ThreeD2LaneRelationAttributeType>  ThreeD2LaneRelationAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ ext.lane.attributes.Lane2LinkRelationAttributeType>  Lane2LinkRelationAttributeMapListHeader;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ ext.lane.attributes.Lane2ThreeDRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.Lane2ThreeDRelationAttributeValue,
  /* PROP_T = */ ext.lane.properties.LanePropertyType,
  /* PROP_V = */ ext.lane.properties.LanePropertyValue> Lane2ThreeDRelationAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ ext.lane.types.ThreeDLocationId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ ext.lane.attributes.ThreeD2LaneRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.ThreeD2LaneRelationAttributeValue,
  /* PROP_T = */ ext.lane.properties.LanePropertyType,
  /* PROP_V = */ ext.lane.properties.LanePropertyValue> ThreeD2LaneRelationAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ ext.lane.attributes.Lane2LinkRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.Lane2LinkRelationAttributeValue,
  /* PROP_T = */ ext.lane.properties.LanePropertyType,
  /* PROP_V = */ ext.lane.properties.LanePropertyValue> Lane2LinkRelationAttributeMapList;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ ext.lane.attributes.Lane2ThreeDRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.Lane2ThreeDRelationAttributeValue,
  /* PROP_T = */ ext.lane.properties.LanePropertyType,
  /* PROP_V = */ ext.lane.properties.LanePropertyValue> Lane2ThreeDRelationAttributeMap;

instantiate AttributeMap<
  /* REF    = */ ext.lane.types.ThreeDLocationId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ ext.lane.attributes.ThreeD2LaneRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.ThreeD2LaneRelationAttributeValue,
  /* PROP_T = */ ext.lane.properties.LanePropertyType,
  /* PROP_V = */ ext.lane.properties.LanePropertyValue> ThreeD2LaneRelationAttributeMap;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ ext.lane.attributes.Lane2LinkRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.Lane2LinkRelationAttributeValue,
  /* PROP_T = */ ext.lane.properties.LanePropertyType,
  /* PROP_V = */ ext.lane.properties.LanePropertyValue> Lane2LinkRelationAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ ext.lane.attributes.Lane2ThreeDRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.Lane2ThreeDRelationAttributeValue> Lane2ThreeDRelationAttribute;

instantiate Attribute<
  /* ATTR_T = */ ext.lane.attributes.ThreeD2LaneRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.ThreeD2LaneRelationAttributeValue> ThreeD2LaneRelationAttribute;

instantiate Attribute<
  /* ATTR_T = */ ext.lane.attributes.Lane2LinkRelationAttributeType,
  /* ATTR_V = */ ext.lane.attributes.Lane2LinkRelationAttributeValue> Lane2LinkRelationAttribute;
/*************************************************************************************/

instantiate AttributeMetadata<
    /* ATTR_T = */ ext.lane.attributes.CharacsLaneRangeExAttributeType,
    /* PROP_T = */ ext.lane.properties.LanePropertyType> CharacsLaneRangeExAttributeMetadata;
instantiate AttributeMetadata<
    /* ATTR_T = */ ext.lane.attributes.CharacsLanePositionExAttributeType,
    /* PROP_T = */ ext.lane.properties.LanePropertyType> CharacsLanePositionExAttributeMetadata;

instantiate AttributeMapList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ ext.lane.attributes.CharacsLaneRangeExAttributeType,
    /* ATTR_V = */ ext.lane.attributes.CharacsLaneRangeExAttributeValue,
    /* PROP_T = */ ext.lane.properties.LanePropertyType,
    /* PROP_V = */ ext.lane.properties.LanePropertyValue> CharacsLaneRangeExAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
    /* ATTR_T = */ ext.lane.attributes.CharacsLanePositionExAttributeType,
    /* ATTR_V = */ ext.lane.attributes.CharacsLanePositionExAttributeValue,
    /* PROP_T = */ ext.lane.properties.LanePropertyType,
    /* PROP_V = */ ext.lane.properties.LanePropertyValue> CharacsLanePositionExAttributeMapList;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.lane.attributes.CharacsLanePositionExAttributeType> CharacsLanePositionExAttributeMapListHeader;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.lane.attributes.CharacsLaneRangeExAttributeType> CharacsLaneRangeExAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
    /* ATTR_T = */ ext.lane.attributes.CharacsLaneRangeExAttributeType,
    /* ATTR_V = */ ext.lane.attributes.CharacsLaneRangeExAttributeValue,
    /* PROP_T = */ ext.lane.properties.LanePropertyType,
    /* PROP_V = */ ext.lane.properties.LanePropertyValue> CharacsLaneRangeExAttributeMap;

instantiate AttributeMap<
    /* REF    = */ lane.reference.types.LaneGroupId,
    /* VAL    = */ lane.reference.types.LaneGroupPositionValidity,
    /* ATTR_T = */ ext.lane.attributes.CharacsLanePositionExAttributeType,
    /* ATTR_V = */ ext.lane.attributes.CharacsLanePositionExAttributeValue,
    /* PROP_T = */ ext.lane.properties.LanePropertyType,
    /* PROP_V = */ ext.lane.properties.LanePropertyValue> CharacsLanePositionExAttributeMap;


instantiate Attribute<
    /* ATTR_T = */ ext.lane.attributes.CharacsLaneRangeExAttributeType,
    /* ATTR_V = */ ext.lane.attributes.CharacsLaneRangeExAttributeValue> CharacsLaneRangeExAttribute;

instantiate Attribute<
    /* ATTR_T = */ ext.lane.attributes.CharacsLanePositionExAttributeType,
    /* ATTR_V = */ ext.lane.attributes.CharacsLanePositionExAttributeValue> CharacsLanePositionExAttribute;


