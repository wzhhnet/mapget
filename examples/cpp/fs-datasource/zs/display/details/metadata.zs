/*!

# Display Details Metadata

This package defines metadata of the display attribute layers. The metadata
provides information about the content of the layers.

**Dependencies**

!*/

package display.details.metadata;

import display.details.instantiations.*;
import display.details.types.*;


rule_group DisplayAttributeLayerMetadataRules
{
/*!
  Metadata of Display Attribute Layer:

  `DisplayAttributeLayerMetadata` shall be used for `DisplayAttributeLayer`.
!*/

  rule "display.details-nrkcoq";
};

/** Metadata of the display attribute layer. */
struct DisplayAttributeLayerMetadata
{
  /** Content of the display attribute layer. */
  DisplayAttributeLayerContent content;

  /** Metadata for display area attributes. */
  DisplayAreaAttributeMetadata displayAreaAttributeMetadata
        if isset(content, DisplayAttributeLayerContent.DISPLAY_AREA_MAPS)
        || isset(content, DisplayAttributeLayerContent.DISPLAY_AREA_SETS);

  /** Metadata for display line attributes. */
  DisplayLineAttributeMetadata displayLineAttributeMetadata
        if isset(content, DisplayAttributeLayerContent.DISPLAY_LINE_MAPS)
        || isset(content, DisplayAttributeLayerContent.DISPLAY_LINE_SETS);

  /** Metadata for display point attributes. */
  DisplayPointAttributeMetadata displayPointAttributeMetadata
        if isset(content, DisplayAttributeLayerContent.DISPLAY_POINT_MAPS)
        || isset(content, DisplayAttributeLayerContent.DISPLAY_POINT_SETS);
};

/** Content bitmask for the display attribute layer. */
bitmask varuint32 DisplayAttributeLayerContent
{
  /** Layer contains attribute maps for display areas. */
  DISPLAY_AREA_MAPS,

  /** Layer contains attribute sets for display areas. */
  DISPLAY_AREA_SETS,

  /** Layer contains attribute maps for display lines. */
  DISPLAY_LINE_MAPS,

  /** Layer contains attribute sets for display lines. */
  DISPLAY_LINE_SETS,

  /** Layer contains attribute maps for display points. */
  DISPLAY_POINT_MAPS,

  /** Layer contains attribute sets for display points. */
  DISPLAY_POINT_SETS,
};


rule_group Display3dAttributeLayerMetadataRules
{
/*!
  Metadata of 3D Display Attribute Layer:

  `Display3dAttributeLayerMetadata` shall be used for `Display3dAttributeLayer`.
!*/

  rule "display.details-uqjxqk";
};

/** Metadata of the 3D display attribute layer. */
struct Display3dAttributeLayerMetadata
{
  /** Content of the display attribute layer. */
  Display3dAttributeLayerContent content;

  /** Metadata for display area attributes. */
  Display3dMeshAttributeMetadata display3dMeshAttributeMetadata
        if isset(content, Display3dAttributeLayerContent.DISPLAY_MESH_MAPS)
        || isset(content, Display3dAttributeLayerContent.DISPLAY_MESH_SETS);
};

/** Content bitmask for the 3D display attribute layer. */
bitmask varuint32 Display3dAttributeLayerContent
{
  /** Layer contains attribute maps for 3D polygon meshes. */
  DISPLAY_MESH_MAPS,

  /** Layer contains attribute sets for 3D polygon meshes. */
  DISPLAY_MESH_SETS,
};
