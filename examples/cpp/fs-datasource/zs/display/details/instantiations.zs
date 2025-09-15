/*!

# Display Attribute Instantiations

This helper package instantiates templates that are used in the Display Details module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package display.details.instantiations;

import core.attributemap.*;
import display.reference.types.*;
import display.details.attributes.*;
import display.details.properties.*;

/*!

**Definitions**

!*/

instantiate AttributeMetadata<
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* PROP_T */     display.details.properties.DisplayPropertyType> DisplayAreaAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* PROP_T */     display.details.properties.DisplayPropertyType> DisplayLineAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* PROP_T */     display.details.properties.DisplayPropertyType> DisplayPointAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* PROP_T */     display.details.properties.DisplayPropertyType> Display3dMeshAttributeMetadata;

instantiate AttributeMapList<
  /* REF */        display.reference.types.DisplayAreaId,
  /* VAL */        display.reference.types.DisplayAreaValidity,
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayAreaAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayAreaAttributeMapList;

instantiate AttributeMapList<
  /* REF */        display.reference.types.DisplayLineReference,
  /* VAL */        display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayLineAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayLineAttributeMapList;

instantiate AttributeMapList<
  /* REF */        display.reference.types.DisplayPointId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayPointAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayPointAttributeMapList;

instantiate AttributeMapList<
  /* REF */        display.reference.types.DisplayMesh3dId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* ATTR_V */     display.details.attributes.Display3dMeshAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> Display3dMeshAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType> DisplayAreaAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType> DisplayLineAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType> DisplayPointAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType> Display3dMeshAttributeMapListHeader;

instantiate AttributeMap<
  /* REF */        display.reference.types.DisplayAreaId,
  /* VAL */        display.reference.types.DisplayAreaValidity,
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayAreaAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayAreaAttributeMap;

instantiate AttributeMap<
  /* REF */        display.reference.types.DisplayLineReference,
  /* VAL */        display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayLineAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayLineAttributeMap;

instantiate AttributeMap<
  /* REF */        display.reference.types.DisplayPointId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayPointAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayPointAttributeMap;

instantiate AttributeMap<
  /* REF */        display.reference.types.DisplayMesh3dId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* ATTR_V */     display.details.attributes.Display3dMeshAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> Display3dMeshAttributeMap;

instantiate Attribute<
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayAreaAttributeValue> DisplayAreaAttribute;

instantiate Attribute<
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayLineAttributeValue> DisplayLineAttribute;

instantiate Attribute<
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayPointAttributeValue> DisplayPointAttribute;

instantiate Attribute<
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* ATTR_V */     display.details.attributes.Display3dMeshAttributeValue> Display3dMeshAttribute;

instantiate Property<
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayProperty;

instantiate AttributeSet<
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayAreaAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayAreaAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayLineAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayLineAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayPointAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayPointAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* ATTR_V */     display.details.attributes.Display3dMeshAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> Display3dMeshAttributeSet;

instantiate FullAttribute<
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayAreaAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayAreaFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayLineAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayLineFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayPointAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayPointFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* ATTR_V */     display.details.attributes.Display3dMeshAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> Display3dMeshFullAttribute;

instantiate PropertyList<
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayPropertyList;

instantiate AttributeSetMap<
  /* REF */        display.reference.types.DisplayAreaId,
  /* VAL */        display.reference.types.DisplayAreaValidity,
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayAreaAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayAreaAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        display.reference.types.DisplayLineReference,
  /* VAL */        display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayLineAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayLineAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        display.reference.types.DisplayPointId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayPointAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayPointAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        display.reference.types.DisplayMesh3dId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* ATTR_V */     display.details.attributes.Display3dMeshAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> Display3dMeshAttributeSetMap;

instantiate AttributeSetList<
  /* REF */        display.reference.types.DisplayAreaId,
  /* VAL */        display.reference.types.DisplayAreaValidity,
  /* ATTR_T */     display.details.attributes.DisplayAreaAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayAreaAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayAreaAttributeSetList;

instantiate AttributeSetList<
  /* REF */        display.reference.types.DisplayLineReference,
  /* VAL */        display.reference.types.DisplayLineRangeValidity,
  /* ATTR_T */     display.details.attributes.DisplayLineAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayLineAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayLineAttributeSetList;

instantiate AttributeSetList<
  /* REF */        display.reference.types.DisplayPointId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.DisplayPointAttributeType,
  /* ATTR_V */     display.details.attributes.DisplayPointAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> DisplayPointAttributeSetList;

instantiate AttributeSetList<
  /* REF */        display.reference.types.DisplayMesh3dId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     display.details.attributes.Display3dMeshAttributeType,
  /* ATTR_V */     display.details.attributes.Display3dMeshAttributeValue,
  /* PROP_T */     display.details.properties.DisplayPropertyType,
  /* PROP_V */     display.details.properties.DisplayPropertyValue> Display3dMeshAttributeSetList;