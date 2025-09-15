/*!

# Characteristics Instantiations

This helper package instantiates templates that are used in the Characteristics module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package ext.rcms.instantiations;

import road.reference.location.*;
import core.attributemap.*;
import ext.rcms.attributes.*;
import ext.rcms.properties.*;

instantiate AttributeMetadata<
    /* ATTR_T = */ ext.rcms.attributes.RcmsRoadRangeAttributeType,
    /* PROP_T = */ ext.rcms.properties.RcmsPropertyType> RcmsRoadLocationRangeAttributeMapListMetadata;

instantiate AttributeMapList<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
    /* ATTR_T = */ ext.rcms.attributes.RcmsRoadRangeAttributeType,
    /* ATTR_V = */ ext.rcms.attributes.RcmsRoadRangeAttributeValue,
    /* PROP_T = */ ext.rcms.properties.RcmsPropertyType,
    /* PROP_V = */ ext.rcms.properties.RcmsPropertyValue> RcmsRoadLocationRangeAttributeMapList;

instantiate AttributeMapListHeader<
    /* ATTR_T = */ ext.rcms.attributes.RcmsRoadRangeAttributeType> RcmsRoadLocationRangeAttributeMapListHeader;

instantiate AttributeMap<
    /* REF    = */ road.reference.location.RoadLocationReference,
    /* VAL    = */ road.reference.location.RoadLocationRangeValidity,
    /* ATTR_T = */ ext.rcms.attributes.RcmsRoadRangeAttributeType,
    /* ATTR_V = */ ext.rcms.attributes.RcmsRoadRangeAttributeValue,
    /* PROP_T = */ ext.rcms.properties.RcmsPropertyType,
    /* PROP_V = */ ext.rcms.properties.RcmsPropertyValue> RcmsRoadLocationRangeAttributeMap;

instantiate Attribute<
    /* ATTR_T = */ ext.rcms.attributes.RcmsRoadRangeAttributeType,
    /* ATTR_V = */ ext.rcms.attributes.RcmsRoadRangeAttributeValue> RcmsRoadLocationRangeAttribute;

instantiate Property<
    /* PROP_T = */ ext.rcms.properties.RcmsPropertyType,
    /* PROP_V = */ ext.rcms.properties.RcmsPropertyValue> RcmsProperty;

instantiate PropertyList<
    /* PROP_T = */ ext.rcms.properties.RcmsPropertyType,
    /* PROP_V = */ ext.rcms.properties.RcmsPropertyValue> RcmsPropertyList;
