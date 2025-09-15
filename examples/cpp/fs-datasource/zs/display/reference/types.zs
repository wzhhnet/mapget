/*!

# Display Reference Types

This package defines identifiers and references for the Display module. Display
references allow to assign attributes from attribute modules to display features
in the Display module.

**Dependencies**

!*/

package display.reference.types;

import core.types.*;
import core.geometry.*;

/*!

## References to Display Features

All display features can be referenced using their IDs. In addition,
references to display lines can be directed or undirected.

!*/

/** Reference to a display line. */
struct DisplayLineReference
{
  /** Set to `true` if the reference is directed. */
  bool isDirected;

  /** Reference to a display line including the direction. */
  DirectedDisplayLineReference directedLineReference if isDirected;

  /** Reference to a display line without direction. Both directions are affected. */
  DisplayLineId lineReference if !isDirected;
};

/** Directed reference to a display line. */
subtype Var4ByteDirectedReference DirectedDisplayLineReference;

/** Identifier of a display line. */
subtype Var4ByteId DisplayLineId;

/** Identifier of a display area. */
subtype Var4ByteId DisplayAreaId;

/** Identifier of a display point. */
subtype Var4ByteId DisplayPointId;

/** Reference to a complete texture or a texture section. */
struct TextureReference
{
  /** ID of the referenced texture. */
  TextureId textureId;

  /**
    * Set to `true` if a specific section of the texture is referenced.
    * False means that the entire texture is referenced.*/
  bool isSection;

  /** References a specific texture section. */
  TextureSectionIndex textureSectionIndex if isSection == true;
};

/** Identifier of a texture. */
subtype varuint32 TextureId;

/** Index of a texture section in the texture section array. */
subtype TextureSectionNumber TextureSectionIndex;

/** Type used to specify the number of a texture section. */
subtype varuint16 TextureSectionNumber;

/** Identifier of a polygon mesh for 3D display. */
subtype Var4ByteId DisplayMesh3dId;

/*!

## Display Line Validity

Validities on display lines describe for which part of the line
an attribute is valid, that is, a specific position or a range on the line.
For example, the validity on a display line describes where the name of
a road is placed or where to display a traffic event along the line.

!*/

rule_group DisplayLineValidityRules
{
  /*!
  Range of `PercentageIndication`:

  Values for `PercentageIndication` shall be between 0.0 and 100.0.
  !*/

  rule "display.reference-ep973k";
};

/** Range validity on a display line. */
struct DisplayLineRangeValidity(CoordShift shift)
{
  /** Type of validity used for the display line. */
  DisplayLineValidityType type;

  /** Number of ranges on the display line that are affected. */
  varsize numRanges
    if type != DisplayLineValidityType.COMPLETE
    : numRanges > 0;

  /** Validity ranges on the display line. */
  DisplayLineRangeChoice(type, shift) ranges[numRanges]
    if type != DisplayLineValidityType.COMPLETE;
};

choice DisplayLineRangeChoice(DisplayLineValidityType type, CoordShift shift) on type
{
  case COMPLETE:
    ;
  case POSITION:
    DisplayLineValidityRange(shift) validityRange;
  case GEOMETRY:
    DisplayLineGeometryRange geometryRange;
  case GEOMETRY_OFFSET:
    DisplayLineGeometryOffsetRange(shift) geometryOffsetRange;
  case PERCENTAGE:
    DisplayLinePercentageRange percentageRange;
  case CURVED_LABEL_POSITIONING_HINT:
    CurvedLabelPositioningHint(shift) curvedLabelPositioningHint;
};

/**
  * Validity range on a display line using positions that
  * are matched onto the display line.
  */
struct DisplayLineValidityRange(CoordShift shift)
{
  /** Start of the validity on the display line. */
  DisplayLineValidityPosition(shift) start;

  /** End of the validity on the display line. */
  DisplayLineValidityPosition(shift) end;
};

/** Range on the geometry of a display line. */
subtype LineRangeUnchecked DisplayLineGeometryRange;

/** Range on the geometry of a display line with an offset from the underlying geometry. */
subtype LineRangeOffset2D DisplayLineGeometryOffsetRange;

/** Percentage range on a display line. */
subtype PercentageRange DisplayLinePercentageRange;

/** Position validity on a display line. */
struct DisplayLinePositionValidity(CoordShift shift)
{
  /** Type of validity used for the display line. */
  DisplayLineValidityType type : type != DisplayLineValidityType.COMPLETE;

  /** Number of validity positions on the display line. */
  varsize numPositions
    if type != DisplayLineValidityType.COMPLETE
    : numPositions > 0;

  /** Validity positions on the display line. */
  DisplayLinePositionChoice(type, shift) positions[numPositions]
    if type != DisplayLineValidityType.COMPLETE;
};

choice DisplayLinePositionChoice(DisplayLineValidityType type, CoordShift shift) on type
{
  case COMPLETE:
    ;
  case POSITION:
    DisplayLineValidityPosition(shift) validityPosition;
  case GEOMETRY:
    DisplayLineGeometryPosition geometryPosition;
  case GEOMETRY_OFFSET:
    DisplayLineGeometryOffsetPosition(shift) geometryOffsetPosition;
  case PERCENTAGE:
    DisplayLinePercentagePosition percentagePosition;
  case CURVED_LABEL_POSITIONING_HINT:
    CurvedLabelPositioningHint(shift) curvedLabelPositioningHint;
};


/**
  * Validity position that is matched onto a display line. The validity position
  * does not have to be part of the geometry of the display line.
  */
struct DisplayLineValidityPosition(CoordShift shift)
{
  /** Position on the display line. */
  Position2D(shift) position;

  /**
    * Hint to indicate where the position is located on the display line.
    * Helps to correctly identify the position on the target feature
    * in rare cases like zigzag curves.
    */
  optional PercentageIndication positionIndication;
};

/**
  * Percentage indication for a position on a display feature based on the feature length.
  * Allowed value range is between 0.0 and 100.0.
  */
subtype float16 PercentageIndication;

/** Position on a display line. */
subtype LinePosition DisplayLineGeometryPosition;

/** Position on the geometry of a display line with an offset to the underlying geometry. */
subtype LinePositionOffset2D DisplayLineGeometryOffsetPosition;

/** Percentage position on a display line. */
subtype PercentagePosition DisplayLinePercentagePosition;


/** Type of validity on a display line. */
enum uint8 DisplayLineValidityType
{
  /** The complete display line is affected. */
  COMPLETE,

  /**
    * Validity is described by independent positions that are
    * matched onto the geometry of the display line.
    */
  POSITION,

  /** Validity is described using the shape of the display line. */
  GEOMETRY,

  /** Validity is described using the shape of the display line including offsets. */
  GEOMETRY_OFFSET,

  /**
    * Validity is described using a start position and an end position percentage
    * value based on the geometry of the display line.
    */
  PERCENTAGE,

  /**
    * Validity is described using positioning hints for curved labels that are
    * placed on or beside the actual geometry of the display line.
    */
  CURVED_LABEL_POSITIONING_HINT,
};


/*!

## Display Area Validity

Validities on display areas describe for which part of the area
an attribute is valid, that is, the complete area or a specific position in the
area. Multiple labels can be placed on a display area by defining separate label
areas.
For example, the validity on a display area describes where the name of
the area is placed.

!*/

rule_group DisplayAreaValidityRules
{
  /*!
  Label Positioning Hints Validity:

  Validities of type `LABEL_POSITIONING_HINT` shall only be used in combination
  with attributes provided by the `DisplayNameLayer` of the Name module.
  The validities shall not be used in combination with attributes provided by the
  `DisplayAttributeLayer` of the Display Details module.
  !*/

  rule "display.reference-3ntasj";
};


/** Validity on a display area. */
struct DisplayAreaValidity(CoordShift shift)
{
  /** Type of validity used for the display area. */
  DisplayAreaValidityType type;

  /** Number of label areas on a display area. */
  varsize numLabelAreas
    if type != DisplayAreaValidityType.COMPLETE
    : numLabelAreas > 0;

  /** Validity ranges on the display area. */
  DisplayAreaChoice(type, shift) labelAreas[numLabelAreas]
    if type != DisplayAreaValidityType.COMPLETE;
};

choice DisplayAreaChoice(DisplayAreaValidityType type, CoordShift shift) on type
{
  case COMPLETE:
        ;
  case LABEL_POSITIONING_HINT:
        LabelPositioningHint(shift) hint;
};

/** Type of validity on a display area. */
enum uint8 DisplayAreaValidityType
{
  /** The complete display area is affected. */
  COMPLETE,

  /**
    * Validity is described using positioning hints for labels that are
    * placed on the display area.
    */
  LABEL_POSITIONING_HINT,
};

/*!

## Label Positioning Hints

A display feature can be labeled using names. Typically, such labels are dynamically
positioned on the display, depending on factors such as available space, zoom
levels, and the current viewport. The label positioning hint describes the validity of
a label on a feature and provides information on when, how, and where to place
the label.


Labels can be displayed as follows:

- Straight lines of text that are displayed horizontally or vertically on a display area.
- Curved lines of text that follow the geometry of the corresponding display feature.

Label positioning hints for display areas also provide information about the relative
importance of the corresponding label, which can be used by an application to
prioritize which labels are displayed.

!*/


/** Label positioning hint for a display area. */
struct LabelPositioningHint(CoordShift shift)
{
  /** Relative importance of the label. */
  uint8  importance;

  /**
    * Set to `true` if labeling lines for curved or tangential labels are
    * available for the display feature.
    */
  bool  hasCurvedLabel;

  /**
    * Set to `true` if labeling positions for straight horizontal or vertical
    * labels are available for the display feature.
    */
  bool  hasStraightLabel;

  /** Hint for curved or tangential labels. */
  CurvedLabelPositioningHint(shift) curvedLabelHint if hasCurvedLabel;

  /** Hint for straight horizontal or vertical labels. */
  StraightLabelPositioningHint(shift) straightLabelHint if hasStraightLabel;
};

/*!

### Straight Label Positioning Hints

Straight label positioning hints contain a number of labeling positions on a display
area feature that allow the application to dynamically select the best position
for displaying a label.

Each labeling position consists of a center position and a radius.
The corresponding label can be placed horizontally or vertically across the
center position within the resulting circle.
Depending on the size of each circle and the current view settings, different
labeling positions can fit the same label.

The following figure shows the available labeling positions on a lake with the
name Bodensee. When fully zoomed out, an application chooses the large circle
because the label would not fit into the smaller ones. When zoomed in, only
selected labeling positions are visible and the label fits into one of the
visible smaller circles.

![Display area feature with labeling positions](assets/display_area_labeling_positions.png)

!*/

rule_group StraightLabelPositioningHintRules
{
  /*!
  Labeling Positions in Straight Label Positioning Hints:

  The list of labeling positions in a straight label positioning hint shall be ordered
  by the length of the radius around the center positions in descending order.
  !*/

  rule "display.reference-n6vcvq";
};

/**
  * List of labeling positions used to place straight horizontal or vertical
  * labels on a display area.
  */
struct StraightLabelPositioningHint(CoordShift shift)
{
  /** Number of labeling positions. */
  varsize  numPositions;

  /**
    * Coordinate width of the offset positions used to represent the radius of
    * the labeling area.
    */
  CoordWidth coordWidth;

  /**
    * List of labeling positions ordered by the length of the radius around the
    * center positions in descending order.
    */
  StraightLabelingPosition(shift, coordWidth)  positions[numPositions];
};

/**
  * Straight labeling position that defines a position with a surrounding circle
  * to determine where a label can be placed.
  */
struct StraightLabelingPosition(CoordShift shift, CoordWidth width)
{
  /** Center position of the label. The label is placed across this center position. */
  Position2D(shift) centerPosition;

  /**
    * Offset position to the center position.
    * The distance between the `centerPosition` and the `radiusPosition`
    * defines the radius of the circle in which the label can be placed.
    */
  PositionOffset2D(width, shift) radiusPosition;
};


/*!

### Curved Label Positioning Hints

Curved labels can be placed on or beside the actual geometry of a display
area or display line. Curved label positioning hints provide 2-dimensional
labeling lines along which the label text is placed.

!*/

/**
  * List of labeling lines used to position a curved label that follows the
  * geometry of the corresponding display feature. The vertices of the labeling
  * line can be used to generate a spline for smooth display.
  */
struct CurvedLabelPositioningHint(CoordShift shift)
{
  /** Number of labeling lines. */
  varsize numLines;

  /** List of 2-dimensional labeling lines. */
  Line2D(shift) hintLines[numLines];
 };

/*!

### No Label Placement

A special type can be used to reference areas where no labels are to be placed.
For example, no labels for road names should be placed on intersections.

!*/


/** Indicates that the placement of a label should be avoided. */
subtype StraightLabelPositioningHint NoLabelPlacement;
