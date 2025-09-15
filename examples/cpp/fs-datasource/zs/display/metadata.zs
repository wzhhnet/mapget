/*!

# Display Metadata

This package defines the metadata of the Display module. The metadata is
used in the smart layer and registry components to gather additional information
about the content of the display layers.

**Dependencies**

!*/

package display.metadata;

import core.geometry.*;
import core.icons.*;
import core.types.*;
import core.vehicle.*;
import display.types.*;


/*!

## Metadata of the 2D Display Feature Layer

!*/

rule_group Display2DLayerMetadataRules
{
  /*!
  Metadata of 2D Display Feature Layer:

  `Display2DLayerMetadata` shall be used for `Display2DLayer`.
  !*/

  rule "display-vktynj";
};

/** Metadata of the 2D display feature layer. */
struct Display2DLayerMetadata
{
  /** Content of the layer. */
  Display2DContent content;

  /** Point feature types used in the layer. */
  DisplayPointType availableDisplayPointTypes[]
    if isset(content, Display2DContent.POINTS);

  /** Line feature types used in the layer. */
  DisplayLineType availableDisplayLineTypes[]
    if isset(content, Display2DContent.LINES);

  /** Area feature types used in the layer. */
  DisplayAreaType availableDisplayAreaTypes[]
    if isset(content, Display2DContent.AREAS)
    || isset(content, Display2DContent.SIMPLE_AREAS)
    || isset(content, Display2DContent.SIMPLE_AREA_SETS);


  /** Default drawing order of each display feature type. */
  DrawingOrderMapping defaultDrawingOrders;

  /** Relations between display area types. */
  DisplayAreaTypeHierarchyRelation displayAreaTypeRelations[]
    if isset(content, Display2DContent.AREA_TYPE_RELATIONS);

  /** Relations between display line types. */
  DisplayLineTypeHierarchyRelation displayLineTypeRelations[]
    if isset(content, Display2DContent.LINE_TYPE_RELATIONS);

  /** Relations between display point types. */
  DisplayPointTypeHierarchyRelation displayPointTypeRelations[]
    if isset(content, Display2DContent.POINT_TYPE_RELATIONS);

  /** Mapping of tile levels to scale ranges. */
  DisplayScaleTileLevelMapping displayScaleTileLevelMapping;

  /** Road types for which display line features are provided. */
  RoadType coveredRoadTypes[]
    if isset(content, Display2DContent.LINES);

  /** Vehicle specifications for which display line features are provided. */
  VehicleSpecification coveredVehicleSpecifications[]
    if isset(content, Display2DContent.LINES);
};

/** Content type of the 2D display feature layer. */
bitmask varuint32 Display2DContent
{
  /** The layer contains display point features. */
  POINTS,

  /** The layer contains display line features. */
  LINES,

  /** The layer contains display area features using triangulated polygons. */
  AREAS,

  /** The layer contains parent-child relations between display area types. */
  AREA_TYPE_RELATIONS,

  /** The layer contains parent-child relations between display line types. */
  LINE_TYPE_RELATIONS,

  /** The layer contains parent-child relations between display point types. */
  POINT_TYPE_RELATIONS,

  /**
    * The layer contains display area features using non-triangulated polygons,
    * so-called simple polygons.
    */
  SIMPLE_AREAS,

  /**
    * The layer contains display area features using sets of non-triangulated
    * polygons, so-called simple polygon sets.
    */
  SIMPLE_AREA_SETS,
};

/**
  * Mapping of tile levels to scale ranges. Designed as a column store using
  * `numLevels` as a common iterator over the lists.
  */
struct DisplayScaleTileLevelMapping
{
  /** Number of supported levels. */
  bit:4 numLevels;

  /** Tile level for which the scale range applies. */
  bit:4 tileLevel[numLevels];

  /** Scale range applicable for the respective level. */
  packed ScaleRange scaleRange[numLevels];
};

/*!

## Metadata of the 3D Display Layers

!*/

/** Metadata of the 3D display feature layer. */
struct Display3DLayerMetadata
{
  /** Content of the layer. */
  Display3DContent content;

  /** Mapping of tile levels to scale ranges. */
  DisplayScaleTileLevelMapping displayScaleTileLevelMapping;
};

/** Content bitmask for the 3D display feature layer. */
bitmask varuint32 Display3DContent
{
  /** The layer contains polygon mesh features for 3D display. */
  MESH_3D,
};

/** Metadata of the 3D display style layer. */
struct Display3DStyleLayerMetadata
{
  /** Content of the 3D display style layer. */
  Display3DStyleLayerContent content;

  /** Texture metadata. */
  TextureContentDescriptor textureMetadata if (content.hasTextures);
};

/** Content of the 3D display style layer. */
struct Display3DStyleLayerContent
{
  /** Set to `true` if the layer has textures. */
  bool hasTextures;

  /** Set to `true` if the layer has a color pallette. */
  bool hasColors;
};

/** Describes available formats, rendering types, and usage types of a texture. */
struct TextureContentDescriptor
{
  /** Available formats of the texture. */
  TextureFormat textureFormats[];

  /** Available rendering types of the texture. */
  TextureRenderingUsageType textureRenderingUsageTypes[];

  /**
    * Available usage types of the texture, that is, under which conditions the
    * texture is used, for example, depending on the weather or time of day.
    */
  TextureConditionUsageType textureConditionUsageTypes;
};


/** Metadata of the 3D display layer for glTF data. */
struct GltfLayerMetadata
{
  /** glTF version used by the layer. */
  GltfVersion gltfVersion;

  /** glTF extensions used by the layer. */
  GltfExtensionId usedExtensions[];

  /** Mapping of tile levels to scale ranges. */
  DisplayScaleTileLevelMapping displayScaleTileLevelMapping;
};


/*!

## Metadata of the Heightmap Layer

The metadata of the heightmap layer describes the content of the layer, for
example, whether the layer is optimized for a specific use case or which
map projection method is used.

!*/

/** Metadata of the heightmap layer. */
struct HeightmapLayerMetadata
{
  /** Terrain optimization types used in the layer. */
  TerrainOptimizationType availableUsageTypes[];

  /** Map projection method used in the layer. */
  HeightmapMapProjection mapProjection;

  /**
    * Number of grid cells that are added to the tile as a buffer.
    * The buffer size applies to all four borders of the tile.
    *
    * Example: If `tileBufferSize` is set to 1, the heightmap grid at each border
    * of the tile is extended by one grid cell.
    */
  varuint16 tileBufferSize;

  /**
    * Maximum latitude value in NDS coordinate units. This value is only required
    * if Web Mercator projection is used.
    */
  int32 maximumLatitude if mapProjection
                           == HeightmapMapProjection.WEB_MERCATOR_EPSG_3857;

  /** Mapping of tile levels to scale ranges. */
  DisplayScaleTileLevelMapping displayScaleTileLevelMapping;
};

/*!

## Metadata of the BDAM Layer

The metadata of the heightmap layer describes the content of the layer.

!*/

/** Metadata of the BDAM layer. */
struct BdamLayerMetadata
{
  /** Mapping of tile levels to scale ranges. */
  DisplayScaleTileLevelMapping displayScaleTileLevelMapping;
};


/*!

## Default Drawing Order of Display Features

Because features overlay each other in the map display, an application needs to
know in which order to draw the features. The drawing order mapping assigns a
distinct drawing order value to each display feature type.

The following figure shows a map cutout of an urban scenario with a river,
park areas, roads of different road classes, and some display points.
Typically, an application draws display areas first, followed by display lines,
followed by display points.
In this example, the display features get assigned the following default drawing
order values:

1. Urban area (background)
2. Water areas
3. Park areas
4. Minor roads
5. Major roads
6. Railway lines
7. Display points

![Default drawing order example](assets/display_drawing_order.png)


__Note:__
The `DRAWING_ORDER` attribute from the NDS.Live Display Detail module can override
the default drawing order, for example, if one of the major roads needs to
be drawn underneath one of the minor roads.

!*/

rule_group DisplayDrawingOrderRules
{
  /*!
  Default Drawing Order of Display Areas:

  A default drawing order shall be defined for each available display area
  feature type.
  !*/

  rule "display-0tcuzn";

  /*!
  Default Drawing Order of Display Lines:

  A default drawing order shall be defined for each available display line
  feature type.
  !*/

  rule "display-qvp2yb";

  /*!
  Default Drawing Order of Display Points:

  A default drawing order shall be defined for each available display point
  feature type.
  !*/

  rule "display-dvdmix";

  /*!
  Distinct Drawing Order Values:

  Each display feature type shall be assigned a different default drawing order.
  !*/

  rule "display-bcywqs";
};

/** Mapping of default drawing order values to display feature types. */
struct DrawingOrderMapping
{
  /** Number of available display point types. */
  varsize numDisplayPointTypes;

  /** Number of available display line types. */
  varsize numDisplayLineTypes;

  /** Number of available display area types. */
  varsize numDisplayAreaTypes;

  /** Specific type of display point. */
  DisplayPointType displayPointType[numDisplayPointTypes];

  /** Default drawing order of that display point type. */
  DefaultDrawingOrder displayPointDrawingOrder[numDisplayPointTypes];

  /** Specific type of display line. */
  DisplayLineType displayLineType[numDisplayLineTypes];

  /** Default drawing order of that display line type. */
  DefaultDrawingOrder displayLineDrawingOrder[numDisplayLineTypes];

  /** Specific type of display area. */
  DisplayAreaType displayAreaType[numDisplayAreaTypes];

  /** Default drawing order of that display area type. */
  DefaultDrawingOrder displayAreaDrawingOrder[numDisplayAreaTypes];
};

/*!

## Hierarchy of Display Features

Parent-child relations can be defined between display areas, between display
lines, and between display points. The resulting hierarchy can be used to map
explicit types to more generic types, for example, to find a matching rendering
style.

!*/

rule_group DisplayFeatureHierarchyRelationRules
{
  /*!
  Only One Parent in Hierarchy Relation of Display Features:

  In the hierarchy relation of display areas, display lines, and display points,
  each child feature type shall only be mapped to at most one parent feature type.
  !*/

  rule "display-r5mcxs";
};

/** Parent-child relations between display area types. */
struct DisplayAreaTypeHierarchyRelation
{
  /** Type of display area that acts as parent. */
  DisplayAreaType parent;

  /** Children of the parent display area type. */
  DisplayAreaType children[];
};

/** Parent-child relations between display line types. */
struct DisplayLineTypeHierarchyRelation
{
  /** Type of display line that acts as parent. */
  DisplayLineType parent;

  /** Children of the parent display line type. */
  DisplayLineType children[];
};

/** Parent-child relations between display point types. */
struct DisplayPointTypeHierarchyRelation
{
  /** Type of display point that acts as parent. */
  DisplayPointType parent;

  /** Children of the parent display point type. */
  DisplayPointType children[];
};

/*!

## Metadata of the Icon Layer

!*/

/** Metadata for the icon layer. */
struct IconLayerMetadata
{
  /** Content of the icon layer. */
  IconLayerContent content;

  /** Contained icon formats.*/
  IconFormat containedIconFormats[];

  /**
    * ISO code for country and country subdivision of the icon layer that is
    * used to determine icons for a specific country.
    */
  optional Iso3166Codes isoCountryCode;

  /** Mapping of tile levels to scale ranges. */
  DisplayScaleTileLevelMapping displayScaleTileLevelMapping;

  /**
    * ISO revision of the country codes used in the icon layer.
    * Leave empty if `isoCountryCode` is not set.
    */
  IsoRevision isoRevision;
};

/** Icon layer content. */
bitmask varuint32 IconLayerContent
{
  /** Layer contains icon sets for generic mappings to features and attributes. */
  GENERIC_ICON_SETS,

  /** Layer contains referenced icon sets. */
  REFERENCED_ICON_SETS,

  /** Layer contains icon template sets. */
  TEMPLATE_ICON_SETS,
};

/** Metadata used to serve orthoimages via the `SmartRasterTileService`. */
struct OrthoImageServiceMetadata
{
  /** Supported orthoimage configurations. */
  OrthoImageConfig supportedConfigurations[];

  /** Vertical resolution of all orthoimages in pixels . */
  varuint32 verticalPixResolution;

  /** Coordinate projection used for the image. */
  MapProjectionMethod coordinateProjection;

  /**
    * Maximum latitude value in NDS coordinate units. Is only required for Web
    * Mercator projections.
    */
  int32 maximumLatitude if coordinateProjection == MapProjectionMethod.WEB_MERCATOR_EPSG_3857;
};
