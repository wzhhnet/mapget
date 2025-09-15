/*!

# Instructions Instantiations

This helper package instantiates templates that are used in the Instructions module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package instructions.instantiations;

import road.reference.types.*;
import road.reference.location.*;
import lane.reference.types.*;
import core.attributemap.*;
import instructions.attributes.*;
import instructions.properties.*;

instantiate AttributeMetadata<
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType> InstructionsTransitionAttributeMetadata;

  instantiate AttributeMetadata<
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType> InstructionsLaneTransitionAttributeMetadata;

instantiate AttributeMapList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsTransitionAttributeMapList;

instantiate AttributeMapList<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsLaneTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsLaneTransitionAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType> InstructionsTransitionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType> InstructionsLaneTransitionAttributeMapListHeader;

instantiate AttributeMap<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsLaneTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsLaneTransitionAttributeMap;

instantiate AttributeMap<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsTransitionAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsTransitionAttributeValue> InstructionsTransitionAttribute;

instantiate Attribute<
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsLaneTransitionAttributeValue> InstructionsLaneTransitionAttribute;


instantiate Property<
    /* PROP_T = */ instructions.properties.InstructionsPropertyType,
    /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsProperty;

instantiate AttributeSet<
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsTransitionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsLaneTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsLaneTransitionAttributeSet;

instantiate FullAttribute<
    /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
    /* ATTR_V = */ instructions.attributes.InstructionsTransitionAttributeValue,
    /* PROP_T = */ instructions.properties.InstructionsPropertyType,
    /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsTransitionFullAttribute;

instantiate FullAttribute<
    /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
    /* ATTR_V = */ instructions.attributes.InstructionsLaneTransitionAttributeValue,
    /* PROP_T = */ instructions.properties.InstructionsPropertyType,
    /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsLaneTransitionFullAttribute;

instantiate PropertyList<
    /* PROP_T = */ instructions.properties.InstructionsPropertyType,
    /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsPropertyList;

instantiate AttributeSetMap<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsLaneTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsLaneTransitionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_V  = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsTransitionAttributeSetMap;

instantiate AttributeSetList<
  /* REF    = */ lane.reference.types.LaneGroupTransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsLaneTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsLaneTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsLaneTransitionAttributeSetList;

instantiate AttributeSetList<
  /* REF    = */ road.reference.types.TransitionReference,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ instructions.attributes.InstructionsTransitionAttributeType,
  /* ATTR_V = */ instructions.attributes.InstructionsTransitionAttributeValue,
  /* PROP_T = */ instructions.properties.InstructionsPropertyType,
  /* PROP_V = */ instructions.properties.InstructionsPropertyValue> InstructionsTransitionAttributeSetList;