/*!

# Attribute Instantiations

This helper package instantiates templates that are used in the Road module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package ext.road.instantiations;

import road.reference.types.*;
import core.attributemap.*;
import core.location.*;
import core.properties.*;
import lane.reference.types.*;
import ext.road.types.*;
import ext.road.attributes.*;
import ext.road.properties.*;
import venue.parking.*;

/*************************************************************************************/
/** relationship between lane group and road.*/
instantiate AttributeMetadata<
  /* ATTR_T = */ ext.road.attributes.LaneRoadRangeAttributeType,
  /* PROP_T = */ ext.road.properties.RoadPropertyType> LaneRoadRangeAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ ext.road.attributes.LaneRoadRangeAttributeType,
  /* ATTR_V = */ ext.road.attributes.LaneRoadRangeAttributeValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> LaneRoadRangeAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ ext.road.attributes.LaneRoadRangeAttributeType> LaneRoadRangeAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ ext.road.attributes.LaneRoadRangeAttributeType,
  /* ATTR_V = */ ext.road.attributes.LaneRoadRangeAttributeValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> LaneRoadRangeAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ ext.road.attributes.LaneRoadRangeAttributeType,
  /* ATTR_V = */ ext.road.attributes.LaneRoadRangeAttributeValue> LaneRoadRangeAttribute;

/*************************************************************************************/
instantiate Property<
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> RoadProperty;

instantiate PropertyList<
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> RoadPropertyList;
  
/*************************************************************************************/
/** relationship between road and lane group.*/
instantiate AttributeMetadata<
  /* ATTR_T = */ ext.road.attributes.RoadLaneRangeAttributeType,
  /* PROP_T = */ ext.road.properties.RoadPropertyType> RoadLaneRangeAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ ext.road.attributes.RoadLaneRangeAttributeType,
  /* ATTR_V = */ ext.road.attributes.RoadLaneRangeAttributeValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> RoadLaneRangeAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ ext.road.attributes.RoadLaneRangeAttributeType> RoadLaneRangeAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ ext.road.attributes.RoadLaneRangeAttributeType,
  /* ATTR_V = */ ext.road.attributes.RoadLaneRangeAttributeValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> RoadLaneRangeAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ ext.road.attributes.RoadLaneRangeAttributeType,
  /* ATTR_V = */ ext.road.attributes.RoadLaneRangeAttributeValue> RoadLaneRangeAttribute;

/*************************************************************************************/
/** relationship between road and parking spot.*/
instantiate AttributeMetadata<
  /* ATTR_T = */ venue.parking.ParkingRelationType,
  /* PROP_T = */ ext.road.properties.RoadPropertyType> ParkingFacilityRoadRangeAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadValidityRange,
  /* ATTR_T = */ venue.parking.ParkingRelationType,
  /* ATTR_V = */ venue.parking.ParkingRelationValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> ParkingFacilityRoadRangeAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ venue.parking.ParkingRelationType> ParkingFacilityRoadRangeAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadValidityRange,
  /* ATTR_T = */ venue.parking.ParkingRelationType,
  /* ATTR_V = */ venue.parking.ParkingRelationValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> ParkingFacilityRoadRangeAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ venue.parking.ParkingRelationType,
  /* ATTR_V = */ venue.parking.ParkingRelationValue> ParkingFacilityRoadRangeAttribute;

/*************************************************************************************/
instantiate AttributeMetadata<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExAttributeType,
    /* PROP_T = */ ext.road.properties.RoadPropertyType> CharacsRoadRangeExAttributeMetadata;
instantiate AttributeMetadata<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadPositionExAttributeType,
    /* PROP_T = */ ext.road.properties.RoadPropertyType> CharacsRoadPositionExAttributeMetadata;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadRangeExAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> CharacsRoadRangeExAttributeMapList;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ ext.road.attributes.CharacsRoadPositionExAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadPositionExAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> CharacsRoadPositionExAttributeMapList;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadPositionExAttributeType> CharacsRoadPositionExAttributeMapListHeader;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExAttributeType> CharacsRoadRangeExAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadRangeExAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> CharacsRoadRangeExAttributeMap;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadPositionValidity,
    /* ATTR_T = */ ext.road.attributes.CharacsRoadPositionExAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadPositionExAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> CharacsRoadPositionExAttributeMap;

instantiate Attribute<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadRangeExAttributeValue> CharacsRoadRangeExAttribute;

instantiate Attribute<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadPositionExAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadPositionExAttributeValue> CharacsRoadPositionExAttribute;

/*************************************************************************************/
instantiate AttributeMetadata<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExtendAttributeType,
    /* PROP_T = */ ext.road.properties.RoadPropertyType> CharacsRoadRangeExtendAttributeMetadata;

instantiate AttributeMapList<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExtendAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadRangeExtendAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> CharacsRoadRangeExtendAttributeMapList;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExtendAttributeType> CharacsRoadRangeExtendAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.RoadReference,
    /* VAL    = */ road.reference.types.RoadRangeValidity,
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExtendAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadRangeExtendAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> CharacsRoadRangeExtendAttributeMap;

instantiate Attribute<
    /* ATTR_T = */ ext.road.attributes.CharacsRoadRangeExtendAttributeType,
    /* ATTR_V = */ ext.road.attributes.CharacsRoadRangeExtendAttributeValue> CharacsRoadRangeExtendAttribute;

/*************************************************************************************/
instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.road.attributes.IntersectionRelationAttributeType> IntersectionRelationAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ road.reference.types.TransitionReference,
    /* VAL    = */ core.attributemap.Validity,
    /* ATTR_T = */ ext.road.attributes.IntersectionRelationAttributeType,
    /* ATTR_V = */ ext.road.attributes.IntersectionRelationAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,	
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> IntersectionRelationAttributeMap;
	
instantiate AttributeMapList<
    /* REF    = */ road.reference.types.TransitionReference,
    /* VAL    = */ core.attributemap.Validity,
    /* ATTR_T = */ ext.road.attributes.IntersectionRelationAttributeType,
    /* ATTR_V = */ ext.road.attributes.IntersectionRelationAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,	
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> IntersectionRelationAttributeMapList;
/*************************************************************************************/
instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.road.attributes.LaneGroupLaneProtInfoAttributeType> LaneGroupLaneProtAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ ext.road.types.LaneGroupLocationId,
    /* VAL    = */ core.attributemap.Validity,
    /* ATTR_T = */ ext.road.attributes.LaneGroupLaneProtInfoAttributeType,
    /* ATTR_V = */ ext.road.attributes.LaneGroupLaneProtInfoAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,    
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> LaneGroupLaneProtAttributeMap;
    
instantiate AttributeMapList<
    /* REF    = */ ext.road.types.LaneGroupLocationId,
    /* VAL    = */ core.attributemap.Validity,
    /* ATTR_T = */ ext.road.attributes.LaneGroupLaneProtInfoAttributeType,
    /* ATTR_V = */ ext.road.attributes.LaneGroupLaneProtInfoAttributeValue,
    /* PROP_T = */ ext.road.properties.RoadPropertyType,    
    /* PROP_V = */ ext.road.properties.RoadPropertyValue> LaneGroupLaneProtAttributeMapList;
/*************************************************************************************/
/** roadConnect*/
instantiate AttributeMetadata<
  /* ATTR_T = */ ext.road.attributes.RoadConnectAttributeType,
  /* PROP_T = */ ext.road.properties.RoadPropertyType> RoadConnectAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.RoadId,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ ext.road.attributes.RoadConnectAttributeType,
  /* ATTR_V = */ ext.road.attributes.RoadConnectAttributeValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> RoadConnectAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ ext.road.attributes.RoadConnectAttributeType> RoadConnectAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.RoadId,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ ext.road.attributes.RoadConnectAttributeType,
  /* ATTR_V = */ ext.road.attributes.RoadConnectAttributeValue,
  /* PROP_T = */ ext.road.properties.RoadPropertyType,
  /* PROP_V = */ ext.road.properties.RoadPropertyValue> RoadConnectAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ ext.road.attributes.RoadConnectAttributeType,
  /* ATTR_V = */ ext.road.attributes.RoadConnectAttributeValue> RoadConnectAttribute;
/*************************************************************************************/