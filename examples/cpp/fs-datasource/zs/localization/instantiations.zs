/*!

# Localization Instantiations

This helper package instantiates templates that are used in the Localization module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package localization.instantiations;

import core.attributemap.*;
import core.geometry.*;
import core.grid.*;

import lane.reference.types.*;
import road.reference.types.*;

import localization.attributes.*;
import localization.properties.*;
import localization.types.*;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     core.geometry.GeometryId,
  /* GEOMETRY_TYPE */   localization.types.ObstacleType> ObstacleGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     localization.types.LandmarkId,
  /* GEOMETRY_TYPE */   localization.types.LandmarkLine> LandmarkLineGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     localization.types.LandmarkId,
  /* GEOMETRY_TYPE */   localization.types.LandmarkPolygon> LandmarkPolygonGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     localization.types.LandmarkId,
  /* GEOMETRY_TYPE */   localization.types.LandmarkMesh> LandmarkMeshGeometryLayer;

instantiate GridLayer<
  /*GRID_ID*/         localization.types.OccupancyGridId,
  /*GRID_TYPE*/       core.grid.GridType,
  /*CELL_VALUE_TYPE*/ localization.types.OccupancyProbability> OccupancyProbabilityGridLayer;

instantiate Grid<
  /*VALUE_TYPE*/ localization.types.OccupancyProbability> OccupancyProbabilityGrid;

instantiate AttributeMetadata<
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* PROP_T = */ localization.properties.LocalizationPropertyType> LandmarkAttributeMetadata;

instantiate AttributeMapList<
  /* REF_T  = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkLaneAttributeMapList;

instantiate AttributeMapList<
  /* REF_T  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkRoadAttributeMapList;

instantiate AttributeMapList<
  /* REF_T  = */ lane.reference.types.RoadSurfaceId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkRoadSurfaceAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType> LandmarkAttributeMapListHeader;

instantiate AttributeMap<
  /* REF_T  = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkLaneAttributeMap;

instantiate AttributeMap<
  /* REF_T  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkRoadAttributeMap;

instantiate AttributeMap<
  /* REF_T  = */ lane.reference.types.RoadSurfaceId,
  /* VAL    = */ core.attributemap.Validity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkRoadSurfaceAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue> LandmarkAttribute;

instantiate Property<
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LocalizationProperty;

instantiate AttributeSet<
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkAttributeSet;

instantiate FullAttribute<
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkFullAttribute;

instantiate PropertyList<
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkPropertyList;

instantiate AttributeSetMap<
  /* REF_T  = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkLaneAttributeSetMap;

instantiate AttributeSetMap<
  /* REF_T  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkRoadAttributeSetMap;

instantiate AttributeSetList<
  /* REF_T  = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkLaneAttributeSetList;

instantiate AttributeSetList<
  /* REF_T  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ localization.attributes.LandmarkRelationAttributeType,
  /* ATTR_V = */ localization.attributes.LandmarkRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> LandmarkRoadAttributeSetList;

instantiate AttributeMetadata<
  /* ATTR_T = */ localization.attributes.OccupancyGridRelationAttributeType,
  /* PROP_T = */ localization.properties.LocalizationPropertyType> OccupancyGridAttributeMetadata;

instantiate AttributeMapList<
  /* REF_T  = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ localization.attributes.OccupancyGridRelationAttributeType,
  /* ATTR_V = */ localization.attributes.OccupancyGridRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> OccupancyGridLaneAttributeMapList;

instantiate AttributeMapList<
  /* REF_T  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ localization.attributes.OccupancyGridRelationAttributeType,
  /* ATTR_V = */ localization.attributes.OccupancyGridRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> OccupancyGridRoadAttributeMapList;

instantiate AttributeMapListHeader<
  /* ATTR_T = */ localization.attributes.OccupancyGridRelationAttributeType> OccupancyGridAttributeMapListHeader;

instantiate AttributeMap<
  /* REF_T  = */ lane.reference.types.LaneGroupId,
  /* VAL    = */ lane.reference.types.LaneGroupRangeValidity,
  /* ATTR_T = */ localization.attributes.OccupancyGridRelationAttributeType,
  /* ATTR_V = */ localization.attributes.OccupancyGridRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> OccupancyGridLaneAttributeMap;

instantiate AttributeMap<
  /* REF_T  = */ road.reference.types.RoadReference,
  /* VAL    = */ road.reference.types.RoadRangeValidity,
  /* ATTR_T = */ localization.attributes.OccupancyGridRelationAttributeType,
  /* ATTR_V = */ localization.attributes.OccupancyGridRelationAttributeValue,
  /* PROP_T = */ localization.properties.LocalizationPropertyType,
  /* PROP_V = */ localization.properties.LocalizationPropertyValue> OccupancyGridRoadAttributeMap;

instantiate Attribute<
  /* ATTR_T = */ localization.attributes.OccupancyGridRelationAttributeType,
  /* ATTR_V = */ localization.attributes.OccupancyGridRelationAttributeValue> OccupancyGridAttribute;