/*!

# Display Feature Layers

This package defines the content of the feature layers in the
Display module. The feature data is supplied through the corresponding smart
layer interfaces.

**Dependencies**

!*/

package display.layer;

import system.types.*;
import core.geometry.*;
import core.grid.*;
import core.types.*;
import core.icons.*;
import display.metadata.*;
import display.instantiations.*;
import display.types.*;

/*!

## 2D Display Feature Layer

The 2D display feature layer provides geometries for basic map display, that is,
geometries for display points, display lines, and display areas.
The scale denominator settings determine when features are suppressed when
gradually zooming out of the map.

!*/

/** 2D display feature layer. */
struct Display2DLayer
{
  /** Header of the 2D display feature layer. */
  Display2DLayerHeader header;

  /** Geometries of the 2D display feature layer if no subscale levels are used. */
  Display2DGeometryLayerList(header.content) geometryLayers if !header.hasScaleSublevels;

  /**
    * Geometries for scale sublevels.
    * All entries in this list are always valid from `header.subscales[i]` to
    * the next (`header.subscales[i+1]`) or to `header.maxScaleDenominator`.
    */
  Display2DGeometryLayerList(header.content) scaleSublevelLayers[header.numSublevels] if header.hasScaleSublevels;

  /** List of edges that have been introduced during clipping of display areas. */
  ClippingEdgeList clippingEdgeList if header.hasClippingEdgeList;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};

/** Header of 2D display feature layer. */
struct Display2DLayerHeader
{
  /** Content of the 2D display feature layer. */
  Display2DContent content;

  /** Set to `true` if the layer contains a list of clipping edges. */
  bool hasClippingEdgeList;

  /** Scale sublevel flag. Set to `true` if the layer has more than one scale sublevel. */
  bool hasScaleSublevels;

  /** Minimum scale denominator for all features of the layer. */
  ScaleDenominator minScaleDenominator;

  /** Maximum scale denominator for all features of the layer. */
  ScaleDenominator maxScaleDenominator;

  /** Number of scale sublevels. */
  uint8 numSublevels if hasScaleSublevels;

  /** Scale denominators for sublevels. */
  SublevelScaleDenominator subscales[numSublevels] if hasScaleSublevels;
};

/** List of geometry layers in the 2D display feature layer. */
struct Display2DGeometryLayerList(Display2DContent content)
{
  /** Geometry layer for 2D display of area features using triangulated polygons. */
  AreaDisplayGeometryLayer(GeometryLayerType.POLYGON_2D, true, true) areaDisplayGeometryLayer
    if isset(content, Display2DContent.AREAS);

  /** Geometry layer for 2D display of line features. */
  LineDisplayGeometryLayer(GeometryLayerType.LINE_2D, true, true) lineDisplayGeometryLayer
    if isset(content, Display2DContent.LINES);

  /** Geometry layer for 2D display of point features. */
  PointDisplayGeometryLayer(GeometryLayerType.POSITION_2D, true, true) pointDisplayGeometryLayer
    if isset(content, Display2DContent.POINTS);

  /**
    * Geometry layer for 2D display of area features using non-triangulated
    * polygons, so-called simple polygons.
    */
  AreaDisplayGeometryLayer(GeometryLayerType.SIMPLE_POLYGON_2D, true, true) simpleAreaDisplayGeometryLayer
    if isset(content, Display2DContent.SIMPLE_AREAS);

  /**
    * Geometry layer for 2D display of area features using sets of non-triangulated
    * polygons, so-called simple polygon sets.
    */
  AreaDisplayGeometryLayer(GeometryLayerType.SIMPLE_POLYGON_SET_2D, true, true) simpleAreaSetDisplayGeometryLayer
    if isset(content, Display2DContent.SIMPLE_AREA_SETS);
};

/*!

## Icon Layer

The icon layer contains icons that can be used for display.

There are two main usages of the layer:

- As a global icon collection for generic types, that is, used as global smart layer objects.
- As a local layer for icons that are referenced from other layers within the same
  smart layer via icon references.

!*/

/** Icon layer. */
struct IconLayer
{
  /** Content of the icon layer. */
  IconLayerContent content;

  /** Icon images available in the layer. */
  packed IconImage icons[];

  /** List of icon sets available for generic icon mappings. */
  packed IconSet genericIconSets[]
      if isset(content, IconLayerContent.GENERIC_ICON_SETS);

  /** List of generic mappings of icon sets to features and position attributes. */
  GenericIconSetMap genericIconSetMap[]
      if isset(content, IconLayerContent.GENERIC_ICON_SETS);

  /** List of icon sets available for direct references from other layers. */
  packed IconSet referencedIconSets[]
      if isset(content, IconLayerContent.REFERENCED_ICON_SETS);

  /** List of icon template sets available for use with generic or referenced icons. */
  packed IconTemplateSet iconTemplateSets[]
      if isset(content, IconLayerContent.TEMPLATE_ICON_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};

/*!

## Layers for 3D Display

The 3D display feature layer provides 3-dimensional mesh geometries for 3D objects.
The geometries come with a type and additional information, for example,
references to the used colors or texture coordinates.
The scale denominator settings of the 3D display feature layer determine when
features are suppressed when gradually zooming out of the map.

The 3D display style layer defines textures and color pallettes
that are used to visualize the 3D objects. The textures and colors can be
referenced in the 3D display feature layer. This flexible approach allows
to use the same geometries with different styles in different contexts.

!*/

/** 3D display feature layer. Provides geometries for 3D map display. */
struct Display3DLayer
{
  /** Header of the 3D display feature layer. */
  Display3DLayerHeader header;

  /** Geometries of the 3D display feature layer. */
  Display3DGeometryLayerList(header.content) geometryLayers;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};

/** Header of the 3D display feature layer. */
struct Display3DLayerHeader
{
  /** Content of the 3D display feature layer. */
  Display3DContent content;

  /** Minimum scale denominator for all features of the layer. */
  ScaleDenominator minScaleDenominator;

  /** Maximum scale denominator for all features of the layer. */
  ScaleDenominator maxScaleDenominator;
};

/** List of geometry layers in the 3D display feature layer. */
struct Display3DGeometryLayerList(Display3DContent content)
{
  /** Polygon mesh render layer. */
  Mesh3DRenderLayerData mesh3DRenderLayer
    if isset(content, Display3DContent.MESH_3D);
};

/**
  * Data that is required to render polygon mesh geometry layers.
  *
  * All index buffers (normals, textures and colors) within Mesh3DRenderLayerData
  * cover multiple sequences of indices that define individual meshes - the length of these
  * sequences is defined by the mesh elements contained in the Mesh3DDisplayGeometryLayer instance.
  * The start indices for each mesh within each index buffer is defined in the Mesh3DRenderData
  * instances.
  */
struct Mesh3DRenderLayerData
{
  /** Provides size information about colors, normals, and texture coordinates. */
  Mesh3DRenderLayerHeader header;

  /** Geometry layer for 3D display of area features. */
  Mesh3dDisplayGeometryLayer(GeometryLayerType.MESH_3D, true, true) mesh3dDisplayGeometryLayer;

  /** Vertex normals used by this layer. */
  packed NormalSphere normals[header.numOfNormals()] if (header.hasNormals);

  /** Texture coordinates used by this layer. */
  TextureCoords textureCoordinates[header.numOfTextureCoords()] if (header.hasTextureCoords);

  /** Additional texture coordinates used by this layer. */
  TextureCoords textureCoordsAdditional[header.numOfTextureCoordsAdditional()]
  if (header.hasTextureCoordsAdditional);

  /** Color IDs used by this layer. */
  packed ColorId colorIds[header.numOfColorIds()] if (header.hasColorPerVertex());

  /** Buffer with entries that reference elements of the normals. */
  IndexBuffer(lengthof(normals)) normalIndices if (header.hasNormals);

  /** Buffer with entries that reference elements of the textureCoordinates. */
  IndexBuffer(lengthof(textureCoordinates)) textureCoordsIndices if (header.hasTextureCoords);

  /** Buffer with entries that reference elements of the textureCoordinates. */
  IndexBuffer(lengthof(textureCoordsAdditional)) textureCoordsAdditionalIndices
  if (header.hasTextureCoordsAdditional);

  /** Buffer with entries that reference elements of the textureCoordinates. */
  IndexBuffer(lengthof(colorIds)) colorIdIndices if (header.hasColorPerVertex());

  /** Per mesh render data (normals, texture coordinates, etc). */
  Mesh3DRenderData(mesh3dDisplayGeometryLayer.buffers.meshes3D.polymeshes[@index],
                         header) mesh3DRenderData[mesh3dDisplayGeometryLayer.numElements];
};

/**
  * 3D display style layer. Provides textures and color pallettes to visualize
  * 3D content.
  */
struct Display3DStyleLayer
{
  /** Content of the 3D display style layer. */
  Display3DStyleLayerContent content;

  /** Textures provided by the style layer. */
  Texture textures[] if content.hasTextures : lengthof(textures) > 0;

  /** Colors provided by the style layer. */
  Style3DColor colors[] if content.hasColors : lengthof(colors) > 0;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};

/*!

## glTF Layers for 3D Display

glTF (derivative short form of Graphics Language Transmission Format or GL Transmission Format)
is a standard file format for 3-dimensional scenes and models. A glTF file uses
one of two possible file extensions: .gltf (JSON/ASCII) or .glb (binary).
The Display module only supports glTF files with the .glb extension. These files
may reference external binary and texture resources or may be self-contained by
directly embedding binary data buffers as raw byte arrays.

!*/

rule_group GltfLayerRules
{
  /*!
  Binary glTF (*.glb) Only:

  glTF data stored in glTF display layers shall only use the binary
  glTF format (*.glb). For more information on glTF 2.0, see
  https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#glb-file-format-specification.
  !*/

  rule "display-qay6vn";

  /*!
  Official Khronos Extensions Only:

  glTF layers shall only use official Khronos extensions. See:
  https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Khronos
  !*/

  rule "display-ytjhtk";
};

/**
  * 3D display layer for glTF data.
  * See also: https://www.khronos.org/gltf/.
  */
struct GltfLayer
{
  /** glTF header with metadata. */
  GltfLayerHeader header;

  /** glTF data. */
  extern gltfData;
};

/** Header of the display feature layer for glTF data. */
struct GltfLayerHeader
{
  /**  Used glTF version. */
  GltfVersion gltfVersion;

  /** Minimum scale denominator for all features of the layer. */
  ScaleDenominator minScaleDenominator;

  /** Maximum scale denominator for all features of the layer. */
  ScaleDenominator maxScaleDenominator;
};

/*!
### Layers for Terrain Information

Terrain information can be supplied using the heightmap layer or the BDAM layer.

!*/

rule_group TerrainLayerRules
{
  /*!
  Heightmap Grid for Complete Tile:

  If a heightmap covers a complete tile, only one heightmap grid shall be
  defined in `heightmaps`.
  !*/

  rule "display-9hs9vc";
};

/** Heightmap layer. Describes terrain using a heightmap grid. */
struct HeightmapLayer
{
  /**
    * Set to `true` if the heightmaps in the layer have IDs.
    * Heightmap IDs can be used to relate heightmap grids to other
    * map features.
    */
  bool hasIds;

  /**
    * Set to `true` if a heightmap covers a complete tile. Some
    * heightmaps also use a buffer at the tile border, which is defined in the
    * layer metadata.
    */
  bool completeTile;

  /** Heightmap grids with elevation values. */
  HeightMapGridLayer(hasIds, false) heightmaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};

/** BDAM layer. Describes terrain using Batched Dynamic Adaptive Meshes. */
struct BdamLayer
{
  /** Content of the terrain surface. */
  BdamLayerHeader header;

  /** Array of BDAM grids, which use the same cell size. */
  BdamSurfaceGrid(header) surfaceGrids[];

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.FEATURE;
  }
};