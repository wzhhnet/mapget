/*!

# ADAS Metadata

This package defines the metadata of the ADAS attribute layers. The metadata provides
information about the content of the attribute layers.


**Dependencies**

!*/

package adas.metadata;

import core.types.*;
import core.location.*;
import core.vehicle.*;
import adas.instantiations.*;


/*!

## ADAS Attribute Layer for Roads

!*/

rule_group AdasRoadLayerMetadataRules
{
  /*!
  Metadata of ADAS Attribute Layer for Roads:

  `AdasRoadLayerMetadata` shall be used for `AdasRoadLayer`.
  !*/

  rule "adas-vdhxnw";
};


/** Metadata of the ADAS attribute layer for roads. */
struct AdasRoadLayerMetadata
{
  /** Contained attribute maps or sets. */
  AdasRoadLayerContent content;

  /** Metadata for road attributes using ADAS geometry. */
  AdasRoadAttributeMetadata roadAttributeMetadata
        if isset(content, AdasRoadLayerContent.ROAD_MAPS)
        || isset(content, AdasRoadLayerContent.ROAD_SETS);

  /** Metadata for transitions. */
  AdasTransitionAttributeMetadata transitionAttributeMetadata
        if isset(content, AdasRoadLayerContent.TRANSITION_MAPS)
        || isset(content, AdasRoadLayerContent.TRANSITION_SETS)
        || isset(content, AdasRoadLayerContent.TRANSITION_GEOMETRY_MAPS)
        || isset(content, AdasRoadLayerContent.TRANSITION_GEOMETRY_SETS);

  /** Road types for which ADAS attributes are provided. */
  RoadType coveredRoadTypes[];

  /** Vehicle specifications for which ADAS attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** Metadata for road attributes using road geometry. */
  AdasRoadAttributeMetadata roadGeometryAttributeMetadata
        if isset(content, AdasRoadLayerContent.ROAD_GEOMETRY_MAPS)
        || isset(content, AdasRoadLayerContent.ROAD_GEOMETRY_SETS);
};

/** Content bitmask for the ADAS attribute layer for roads. */
bitmask varuint32 AdasRoadLayerContent
{
  /** Layer contains attribute maps for road attributes using ADAS geometry. */
  ROAD_MAPS,

  /** Layer contains attribute sets for road attributes using ADAS geometry. */
  ROAD_SETS,

  /** Layer contains attribute maps for transition attributes. */
  TRANSITION_MAPS,

  /** Layer contains attribute sets for transition attributes. */
  TRANSITION_SETS,

  /** Layer contains attribute maps for road attributes using road geometry. */
  ROAD_GEOMETRY_MAPS,

  /** Layer contains attribute sets for road attributes using road geometry. */
  ROAD_GEOMETRY_SETS,

  /** Layer contains attribute maps for transition attributes using road geometry. */
  TRANSITION_GEOMETRY_MAPS,

  /** Layer contains attribute sets for transition attributes using road geometry. */
  TRANSITION_GEOMETRY_SETS,
};

/** Metadata of the ADAS attribute layer for road locations. */
struct AdasRoadLocationLayerMetadata
{
  /** Contained attribute maps or sets. */
  AdasRoadLocationLayerContent content;

  /**
    * Metadata for roads. Reused from roads because the ADAS attribute layer for
    * road locations uses the same attributes.
    */
  AdasRoadAttributeMetadata roadLocationAttributeMetadata
        if isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_MAPS)
        || isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_SETS);

  /**
    * Metadata for transitions. Reused from roads because the ADAS attribute layer
    * for road locations uses the same attributes.
    */
  AdasTransitionAttributeMetadata roadLocationTransitionAttributeMetadata
        if isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_TRANSITION_MAPS)
        || isset(content, AdasRoadLocationLayerContent.ROAD_LOCATION_TRANSITION_SETS);

  /** Road types for which ADAS attributes are provided. */
  RoadType coveredRoadTypes[];

  /**
    * Encoding of the road location IDs used in the ADAS attribute layer for
    * road locations.
    */
  RoadLocationIdDefinition roadLocationIdDefinition;

  /** Vehicle specifications for which ADAS attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/*!

## ADAS Attribute Layer for Road Locations

!*/

rule_group AdasRoadLocationLayerMetadataRules
{
  /*!
  Metadata of ADAS Attribute Layer for Road Locations:

  `AdasRoadLocationLayerMetadata` shall be used for `AdasRoadLocationLayer`.
  !*/

  rule "adas-862ohc";
};

/** Content bitmask for the ADAS attribute layer for road locations. */
bitmask varuint32 AdasRoadLocationLayerContent
{
  /** Layer contains attribute maps for road attributes. */
  ROAD_LOCATION_MAPS,

  /** Layer contains attribute sets for road attributes. */
  ROAD_LOCATION_SETS,

  /** Layer contains attribute maps for transition attributes. */
  ROAD_LOCATION_TRANSITION_MAPS,

  /** Layer contains attribute sets for transition attributes. */
  ROAD_LOCATION_TRANSITION_SETS,
};

/*!

## ADAS Attribute Layer for Lanes

!*/

rule_group AdasLaneLayerMetadataRules
{
  /*!
  Metadata of ADAS Attribute Layer for Lanes:

  `AdasLaneLayerMetadata` shall be used for `AdasLaneLayer`.
  !*/

  rule "adas-nro43c";
};

/** Metadata of the ADAS attribute layer for lanes. */
struct AdasLaneLayerMetadata
{
  /** Contained attribute maps or sets. */
  AdasLaneLayerContent content;

  /** Metadata for ADAS lane attributes using lane geometry. */
  AdasLaneAttributeMetadata laneAttributeMetadata;

  /** Lane types for which ADAS attributes are provided. */
  LaneType coveredLaneTypes[];

  /** Vehicle specifications for which ADAS attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** Metadata for ADAS lane attributes using ADAS geometry. */
  AdasLaneAttributeMetadata laneAdasGeometryAttributeMetadata
        if isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_MAPS)
        || isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_SETS);

  /** Metadata for lane group transitions. */
  AdasLaneTransitionAttributeMetadata laneTransitionAttributeMetadata
        if isset(content, AdasLaneLayerContent.LANE_TRANSITION_MAPS)
        || isset(content, AdasLaneLayerContent.LANE_TRANSITION_SETS)
        || isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_TRANSITION_MAPS)
        || isset(content, AdasLaneLayerContent.LANE_ADAS_GEOMETRY_TRANSITION_SETS);
};

/** Content bitmask for the ADAS attribute layer for lanes. */
bitmask varuint32 AdasLaneLayerContent
{
  /** Layer contains attribute maps for lane attributes using lane geometry. */
  LANE_MAPS,

  /** Layer contains attribute sets for lane attributes using lane geometry. */
  LANE_SETS,

  /** Layer contains ADAS geometries for complete lane groups. */
  LANE_GROUP_GEOMETRIES,

  /** Layer contains ADAS geometries for individual lanes. */
  LANE_GEOMETRIES,

  /** Layer contains attribute maps for lane attributes using ADAS geometry. */
  LANE_ADAS_GEOMETRY_MAPS,

  /** Layer contains attribute sets for lane attributes using ADAS geometry. */
  LANE_ADAS_GEOMETRY_SETS,

  /** Layer contains attribute maps for lane transitions using lane geometry. */
  LANE_TRANSITION_MAPS,

  /** Layer contains attribute sets for lane transitions using lane geometry. */
  LANE_TRANSITION_SETS,

  /** Layer contains attribute maps for lane transitions using ADAS geometry. */
  LANE_ADAS_GEOMETRY_TRANSITION_MAPS,

  /** Layer contains attribute sets for lane transitions using ADAS geometry. */
  LANE_ADAS_GEOMETRY_TRANSITION_SETS,
};
