/*!

# Road Metadata

This package defines the metadata of the Road module. The metadata is
used in the Smart Layer and Registry components to gather additional information
on the contents of the road layer.

**Dependencies**

!*/

package road.metadata;

import core.types.*;
import core.vehicle.*;

rule_group FeatureLayerMetadataRules
{
  /*!
  Road Feature Metadata for Smart Layer Services:

  The structure `FeatureLayerMetadata` shall be used to populate the external
  structure `layerMetadata` in smart layer services that provide road features.
  !*/

  rule "road-2498ff";
};

/**
  * Metadata of the feature layers of the Road module.
  * Stores information about the content of the layer it is provided with, that
  * is, roads and intersections.
*/
struct FeatureLayerMetadata
{
  /** Type of feature layer. */
  FeatureLayerType  layerType;

  /** Covered road types. */
  RoadType          includedRoadTypes[];

  /** Vehicle specifications for which roads are provided. */
  VehicleSpecification coveredVehicleSpecifications[];
};

/** Metadata of the matched road path layer. */
subtype FeatureLayerMetadata MatchedRoadPathLayerMetadata;

/** Holds metadata of the geometry layers of the Road module. */
struct GeometryLayerMetadata
{
  /** Type of geometry layer. */
  GeometryLayerType layerType;
};

/** Type of feature layer. */
enum uint8  FeatureLayerType
{
    /** Shall be set for the road layer. */
    ROADS_INTERSECTIONS = 1,
};

/** Type of geometry layer. */
enum uint8 GeometryLayerType
{
  /** Shall be set for the road geometry layer. */
  ROAD_GEOMETRY,
};
