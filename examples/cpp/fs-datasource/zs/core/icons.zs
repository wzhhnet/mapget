/*!

# Core Icons

This package defines icons. Icons are graphical representations of points in a
map, for example, POIs, or allow to depict an item classification in a list, for
example, the POI category selection list.

**Dependencies**

!*/

package core.icons;

import core.types.*;
import core.color.*;

/*!

## Icon Image

An icon image contains the actual image data of an icon. The structure also
contains information for displaying the icon image as well as the text that is
rendered on an icon. Icon images have a unique ID for referencing.

!*/

rule_group IconImageRules
{
  /*!
  Invalid Number of Icon Pixels:

  If no valid value is available for an attribute of type `NumPixels`, the value
  `INVALID_NUM_PIXEL` shall be used.
  !*/

  rule "core-n3v66g";

  /*!
  Invalid Text Bounding Rectangle:

  If there is no valid text bounding rectangle, its position coordinates and
  dimension shall be set to ´INVALID_NUM_PIXEL´. The text shall be rendered in
  the center of the  icon image defined by icon pixel width and icon pixel
  height.
  !*/

  rule "core-t96rd8";

  /*!
  Invalid Image Bounding Rectangle:

  If there is no valid image bounding rectangle, the icon size shall
  be defined by the icon pixel width and the icon pixel height.
  !*/

  rule "core-qnmnx6";
};

/** Contains the actual image data of an icon and further information that is
  * used for displaying the icon.
  */
struct IconImage
{
  /** Unique ID of the icon. */
  IconId iconId;

  /**
    * Minimum display resolution of the icon.
    * Set to 0 to define that no minimum resolution exists.
    */
  DisplayResolution minResolution;

  /**
    * Maximum display resolution of the icon.
    * Set to highest possible value to define that no maximum resolution exists.
    */
  DisplayResolution maxResolution;

  /** Text bounding rectangle defining the text position inside the icon image. */
  ImageRect textBoundingRect;

  /** Color of the text that is displayed on the icon. */
  ColorRgba textColor;

  /** Icon pixel width. */
  NumPixels pixWidth;

  /** Icon pixel height. */
  NumPixels pixHeight;

  /** File format of the icon image. */
  IconFormat iconFormat;

  /**
    * Image anchor position where the icon is rendered.
    * If the image anchor position is not valid, use the center point of
    * the icon defined by icon width and icon height as anchor position.
    */
  ImageAnchorPos imageAnchorPos;

  /**
    * Heading of the icon, relative to the canvas of the image.
    * Example: A right arrow has a heading of 90.
    */
  IconHeading iconHeading;

  /**
    * Image bounding rectangle used to define the icon size inside the icon
    * image excluding, for example, shadows.
    */
  ImageRect imageBoundingRect;

  /** Icon image data. */
  extern image;
};

/** ID of an icon. */
subtype varuint32 IconId;

/** Display resolution in ppi (pixel per inch). */
subtype varuint16 DisplayResolution;

/**
  * Orientation of an icon stored as an angle in steps of ~1.4 degrees.
  * Value 0 indicates north; values increase clockwise.
  * Indicates that the icon has a direction, for example,
  * an arrow.
  */
subtype uint8 IconHeading;

/**
  * An image rectangle is used to define a part or selection of an icon inside
  * of the icon image.
  */
struct ImageRect
{
    /** x-position of the top-left corner of the rectangle. */
    NumPixels xTopLeftPos;

    /** y-position of the top-left corner of the rectangle. */
    NumPixels yTopLeftPos;

    /** Width of the rectangle. */
    NumPixels pixWidth;

    /** Height of the rectangle. */
    NumPixels pixHeight;
};

/** Image anchor position where the icon is rendered. */
struct ImageAnchorPos
{
    /** x-position of the image anchor inside the icon image. */
    NumPixels xPosImageAnchor;

    /** y-position of the image anchor inside the icon image. */
    NumPixels yPosImageAnchor;
};

/** Replacement value if no valid value is available. */
const NumPixels INVALID_NUM_PIXEL = -1;

/** Number of pixels. */
subtype varint32 NumPixels;

/** File format of an icon image. */
enum uint8 IconFormat
{
  /** The icon uses the PNG format.*/
  PNG,

  /** The icon uses the NinePatch format.*/
  PNG_9_PATCH,

  /** The icon uses the SVG format.*/
  SVG,

  /** The icon uses the glTF 2.0 format.*/
  GLTF_V20,
};

/*!

## Icon Set

Similar icons are grouped into icon sets. For example, multiple icons of a POI
category may be available for different scales and usage types. These icons are
grouped into one icon set. The application can display customized icons instead.

A local icon set is stored in the same smart layer container as the feature that
references the icon set, for example, in the same tile. A global icon set is
stored in a different smart layer container than the feature that references the
icon set. Both local and global icon sets use the same structures for storing
icons, only the referencing mechanisms differ.

!*/

/** Set of icons. */
struct IconSet
{
  /** ID of the icon set. */
  IconSetId iconSetId;

  /**
    * Reference to the scale range at which this icon set is displayed
    * by default.
    */
  ScaleRangeId scaleRangeId;

  /** Number of icons in set. Used as common iterator in the following lists. */
  varsize numIcons;

  /** Usage possibilities of the icon. */
  IconUsageType iconUsage[numIcons];

  /** Icon ID reference to an icon image. */
  IconId iconId[numIcons];

  /** Arrangement of icons in case of overlapping in the map display. */
  IconDisplayArrangements iconDisplayArrangement[numIcons];

  /**
    * Priority to draw an icon in case of overlapping in the map display.
    * Higher numbers correspond to higher priorities.
    */
  IconDrawingPriority iconDrawingPriority = 0;

  /** Icon template set to be used for this icon set. */
  optional IconTemplateSetId iconTemplateSetId;
};

/**
  * ID of an icon set.
  *
  * Values from 0 to 65535 are reserved for local icon sets. Values greater than
  * 65535 are reserved for global icon sets.
  */
subtype varuint IconSetId;

/** Defines the usage possibilities of an icon. */
bitmask varuint64 IconUsageType
{
  /**
    * Set to `true` if the icon is a 2-dimensional icon, typically an
    * ideographic depiction of a category, brand, or other classification.
    */
  TWO_D,

  /**
    * Set to `true` if the icon is a realistic 2-dimensional icon or a
    * 3-dimensional model. Such icons are typically used for certain POIs,
    * which may also be available as 3-dimensional landmark, for example, the
    * Cologne Cathedral.
    */
  THREE_D,

  /**
    * Set to `true` if the icon is suitable for night mode or low light.
    * Such icons usually use darker colors and higher contrasts.
    */
  NIGHT,

  /** Set to `true` if the icon is suitable for day mode or normal light. */
  DAY,

  /**
    * Set to `true` if the icon is suitable for highlighting a selected object
    * for better visualization.
    */
  HIGHLIGHTED,

  /** Set to `true` if the icon is suitable for map display. */
  MAP,

  /** Set to `true` if the icon is suitable for being displayed in lists. */
  LIST,

  /**
    * Set to `true` if the icon can be used in the map to display a special
    * stacked icon in case of icon stacks.
    */
  STACKED,

  /** Set to `true` if the icon is located on the guided route. */
  ON_ROUTE,

  /** Set to `true` if the icon is not located on the guided route. */
  OFF_ROUTE,

  /** Set to `true` if the icon can be used by the guidance viewer. */
  GUIDANCE,

  /** Set to `true` if the icon can be used in the instrument-cluster device. */
  ICD,

  /** Set to `true` if the icon can be used in the head-up display. */
  HUD,

  /** Set to `true` if the icon is not highlighted. */
  NOT_HIGHLIGHTED,

  /** Set to `true` if the icon is not stacked. */
  NOT_STACKED,

  /** Set to `true` if the icon can be used on a button. */
  BUTTON,

  /** Set to `true` if the icon can be used on a central information display. */
  CID,

  /**
    * Set to `true` if the icon can be used by the map viewer to display an icon that
    * is located close to the user's view point or the current position of
    * the vehicle on the map.
    */
  IN_FOCUS,

  /**
    * Set to `true` if the icon can be used by the map viewer to display an icon that
    * is located further away from the user's view point or the current
    * position of the vehicle on the map.
    */
  OUT_OF_FOCUS,
};

/** Defines icon arrangements in the map in case icons overlap on the screen. */
enum uint8 IconDisplayArrangements
{
  /** No arrangement defined. */
  NO_ARRANGEMENT,

  /** Overlapping icons are represented as a special stacked icon. */
  STACKABLE,

  /** The icon with the highest drawing priority replaces all other icons. */
  DISPLACE,

  /**
    * The icons overlap in the icon drawing stack depending on their drawing
    * priority.
    */
  OVERLAP,
};

/** Defines drawing priority of overlapping icons. Higher value means higher priority. */
subtype varuint16 IconDrawingPriority;

/** Reference to an icon set. */
subtype IconSetId IconSetReference;

/**
  * Reference to an icon set with a heading that needs to be applied.
  * For example, icon set references with heading can be used for one-way signs
  * in micro city maps. Can also be used to show special icons depicting certain
  * destination input named objects like countries, regions, or cities.
  */
struct IconSetReferenceWithHeading
{
  /** Reference to the icon set that is to be rendered with a heading. */
  IconSetReference iconSetReference;

  /**
    * Heading that applies to the icon set.
    * Icon images in the set are rotated by the given angle in clockwise
    * direction including their canvas.
    */
  IconHeading iconHeading;
};

/*!

## Icon Template Set

Icon templates define reuse of icons and combinations of icons.
For example, icon templates can be used to define background icons,
overlays, and icon stacks.

An icon template set contains all templates that can be combined to render
variants of the same icon for different usage scenarios. For each usage scenario,
an application can now combine the relevant template icons based on their
usage types.

The drawing layer values determine the order in which the template images
are drawn on top of each other. Icons with a lower value are drawn beneath icons
with a higher value. The base icon from the icon set has the drawing layer 0 by
default.

The following figures show a POI icon for a coffee shop that has a default
background icon and a highlighted background item, as well as an overlay to
indicate that multiple POIs of the same type are available in one location:

![Icon template set for coffee shop POI](assets/icon_templates_POI.png)

The following combined icons can be displayed using this template set:

![Displayed POI icons with templates](assets/icon_POI_combined.png)

The template connection point of each template icon determines where a template
icon is rendered on top or below the base icon. The combined icon is rendered
correctly by aligning the image anchor position of the base icon with the
template connection point:

![Template connection points](assets/template_connection_point.png)

!*/

rule_group IconTemplateSetRules
{
  /*!
  Drawing Layer of Templates shall not be 0:

  The `drawingLayer` of an icon within a `IconTemplateSet` shall not be 0
  because this value represents the drawing layer of the base icon.
  !*/

  rule "core-0ee8oj";
};

/** Set of template icons. */
struct IconTemplateSet
{
  /** Icon template set ID. */
  IconTemplateSetId templateSetId;

  /**
    * Number of icon templates in the set. Used as common iterator in the
    * following lists.
    */
  varsize numIcons;

  /** Usage possibilities of the icon template. */
  IconUsageType usageType[numIcons];

  /**
    * Drawing layer of each template in the set. The base icon from the icon set
    * always has drawing layer 0. Templates that are to be rendered on top of the
    * base icon have a higher drawing layer, for example, overlays. Templates
    * that are to be drawn beneath the base icon have a lower drawing layer,
    * for example, backgrounds.
    */
  int8 drawingLayer[numIcons];

  /**
    * Used to position the template and the corresponding icon correctly.
    * The position in the template connection point is matched to the
    * image anchor position in the base icon.
    */
  ImageAnchorPos templateConnectionPoint[numIcons];

  /** Icon identifier of the template icon. */
  IconId iconId[numIcons];
};

/** Identifier of an icon template set. */
subtype varuint16 IconTemplateSetId;
