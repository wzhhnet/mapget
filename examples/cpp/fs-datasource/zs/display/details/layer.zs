/*!

# Display Attribute Layers

This package defines the layers that are available in the Display Details module.


**Dependencies**

!*/

package display.details.layer;

import system.types.*;
import display.details.metadata.*;
import display.details.instantiations.*;
import display.details.types.*;



/**
  * Display attribute layer. Contains all attributes that are assigned
  * to display features, such as areas, lines, or points.
  */
struct DisplayAttributeLayer
{
  /** Content of the display attribute layer. */
  DisplayAttributeLayerContent content;

  /**
    * Base elevation of the layer in case delta elevation is used.
    * Elevation is defined in cm above or below the WGS 84 reference ellipsoid.
    */
  optional BaseElevation baseElevation;

  /** List of attribute maps for display areas. */
  DisplayAreaAttributeMapList(0) displayAreaAttributeMaps
    if isset(content, DisplayAttributeLayerContent.DISPLAY_AREA_MAPS);

  /** List of attribute sets for display areas. */
  DisplayAreaAttributeSetList(0) displayAreaAttributeSets
    if isset(content, DisplayAttributeLayerContent.DISPLAY_AREA_SETS);

  /** List of attribute maps for display lines. */
  DisplayLineAttributeMapList(0) displayLineAttributeMaps
    if isset(content, DisplayAttributeLayerContent.DISPLAY_LINE_MAPS);

  /** List of attribute sets for display lines. */
  DisplayLineAttributeSetList(0) displayLineAttributeSets
    if isset(content, DisplayAttributeLayerContent.DISPLAY_LINE_SETS);

  /** List of attribute maps for display points. */
  DisplayPointAttributeMapList(0) displayPointAttributeMaps
    if isset(content, DisplayAttributeLayerContent.DISPLAY_POINT_MAPS);

  /** List of attribute sets for display points. */
  DisplayPointAttributeSetList(0) displayPointAttributeSets
    if isset(content, DisplayAttributeLayerContent.DISPLAY_POINT_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/**
  * Attribute layer for 3D display features.
  * Contains all attributes that are assigned to 3D polygon mesh features.
  */
struct Display3dAttributeLayer
{
  /** Content of the 3D display attribute layer. */
  Display3dAttributeLayerContent content;

  /** List of attribute maps for 3D polygon meshes. */
  Display3dMeshAttributeMapList(0) display3dMeshAttributeMaps
    if isset(content, Display3dAttributeLayerContent.DISPLAY_MESH_MAPS);

  Display3dMeshAttributeSetList(0) display3dMeshAttributeSets
    if isset(content, Display3dAttributeLayerContent.DISPLAY_MESH_SETS);


  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};