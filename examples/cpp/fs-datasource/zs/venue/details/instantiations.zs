/*!

# Venue Attribute Instantiations

This helper package instantiates templates that are used in the Venue Details module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package venue.details.instantiations;

import core.attributemap.*;
import venue.reference.types.*;
import venue.details.attributes.*;
import venue.details.properties.*;

/*!

**Definitions**

!*/

instantiate AttributeMetadata<
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* PROP_T */     venue.details.properties.VenuePropertyType> ParkingFacilityAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* PROP_T */     venue.details.properties.VenuePropertyType> ParkingLevelAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* PROP_T */     venue.details.properties.VenuePropertyType> ParkingSectionAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* PROP_T */     venue.details.properties.VenuePropertyType> ParkingRowAttributeMetadata;

instantiate AttributeMetadata<
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* PROP_T */     venue.details.properties.VenuePropertyType> ParkingSpotAttributeMetadata;

instantiate AttributeMapList<
  /* REF */        venue.reference.types.ParkingFacilityId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingFacilityAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingFacilityAttributeMapList;

instantiate AttributeMapList<
  /* REF */        venue.reference.types.ParkingLevelId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingLevelAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingLevelAttributeMapList;

instantiate AttributeMapList<
  /* REF */        venue.reference.types.ParkingSectionId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSectionAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSectionAttributeMapList;

instantiate AttributeMapList<
  /* REF */        venue.reference.types.ParkingRowId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingRowAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingRowAttributeMapList;

instantiate AttributeMapList<
  /* REF */        venue.reference.types.ParkingSpotId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSpotAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSpotAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType> ParkingFacilityAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType> ParkingLevelAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType> ParkingSectionAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType> ParkingRowAttributeMapListHeader;

instantiate AttributeMapListHeader<
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType> ParkingSpotAttributeMapListHeader;

instantiate AttributeMap<
  /* REF */        venue.reference.types.ParkingFacilityId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingFacilityAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingFacilityAttributeMap;

instantiate AttributeMap<
  /* REF */        venue.reference.types.ParkingLevelId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingLevelAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingLevelAttributeMap;

instantiate AttributeMap<
  /* REF */        venue.reference.types.ParkingSectionId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSectionAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSectionAttributeMap;

instantiate AttributeMap<
  /* REF */        venue.reference.types.ParkingRowId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingRowAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingRowAttributeMap;

instantiate AttributeMap<
  /* REF */        venue.reference.types.ParkingSpotId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSpotAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSpotAttributeMap;

instantiate Attribute<
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingFacilityAttributeValue> ParkingFacilityAttribute;

instantiate Attribute<
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingLevelAttributeValue> ParkingLevelAttribute;

instantiate Attribute<
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSectionAttributeValue> ParkingSectionAttribute;

instantiate Attribute<
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingRowAttributeValue> ParkingRowAttribute;

instantiate Attribute<
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSpotAttributeValue> ParkingSpotAttribute;

instantiate Property<
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> VenueProperty;

instantiate AttributeSet<
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingFacilityAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingFacilityAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingLevelAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingLevelAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSectionAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSectionAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingRowAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingRowAttributeSet;

instantiate AttributeSet<
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSpotAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSpotAttributeSet;

instantiate FullAttribute<
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingFacilityAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingFacilityFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingLevelAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingLevelFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSectionAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSectionFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingRowAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingRowFullAttribute;

instantiate FullAttribute<
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSpotAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSpotFullAttribute;

instantiate PropertyList<
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> VenuePropertyList;

instantiate AttributeSetMap<
  /* REF */        venue.reference.types.ParkingFacilityId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingFacilityAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingFacilityAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        venue.reference.types.ParkingLevelId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingLevelAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingLevelAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        venue.reference.types.ParkingSectionId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSectionAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSectionAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        venue.reference.types.ParkingRowId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingRowAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingRowAttributeSetMap;

instantiate AttributeSetMap<
  /* REF */        venue.reference.types.ParkingSpotId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSpotAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSpotAttributeSetMap;

instantiate AttributeSetList<
  /* REF */        venue.reference.types.ParkingFacilityId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingFacilityAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingFacilityAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingFacilityAttributeSetList;

instantiate AttributeSetList<
  /* REF */        venue.reference.types.ParkingLevelId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingLevelAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingLevelAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingLevelAttributeSetList;

instantiate AttributeSetList<
  /* REF */        venue.reference.types.ParkingSectionId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSectionAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSectionAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSectionAttributeSetList;

instantiate AttributeSetList<
  /* REF */        venue.reference.types.ParkingRowId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingRowAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingRowAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingRowAttributeSetList;

instantiate AttributeSetList<
  /* REF */        venue.reference.types.ParkingSpotId,
  /* VAL */        core.attributemap.Validity,
  /* ATTR_T */     venue.details.attributes.ParkingSpotAttributeType,
  /* ATTR_V */     venue.details.attributes.ParkingSpotAttributeValue,
  /* PROP_T */     venue.details.properties.VenuePropertyType,
  /* PROP_V */     venue.details.properties.VenuePropertyValue> ParkingSpotAttributeSetList;

