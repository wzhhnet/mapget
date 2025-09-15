/*!

# Instruction Types

This package defines the types that are used in other packages of the
Instructions module.

There are different instruction types that can be used for guidance purposes:

- [Signpost Instructions](#signpost-instructions)
- [Signpost Images](#signpost-images)
- [Lane Instructions](#lane-instructions)
- [Junction Views](#junction-views)

**Dependencies**

!*/

package instructions.types;

import core.types.*;
import core.speech.*;
import core.icons.*;
import core.color.*;

/*!

## Signpost Instructions

A signpost instruction provides the relevant information to generate a guidance
instruction based on a signpost.

The application can create simplified graphical representations of signpost
instructions. In contrast to signpost images, simplified graphical
representations are no exact copy of the real-world signpost, but only contain
the information that is relevant for the individual transition path of the
vehicle.

The signpost instruction provides information about the basic appearance of the
signpost and contains a list of elements that have different types, for
example, a towards name or an exit number. Depending on the type of signpost
element, information about the textual content, an icon, and a text color can be
provided. A signpost instruction can contain multiple elements of the same type,
for example, if multiple exit names are to be listed on the signpost. In this
case, the exit name elements are sorted in descending priority.

**Example**

The following figure shows how to define information on a signpost that is used
to generate the guidance instruction "Take exit number 185 towards Grand River
Ave, Schaefer Highway".

![Signpost instruction](assets/signpost_instruction.png)

If a vehicle approaches the signpost, the application checks if the
`SignpostInstruction` structure contains an exit name or an exit number. Because
the signpost instruction provides towards information, the application uses the
preposition "towards" in combination with the road name instead of the
preposition "in direction of".

The following figure shows two alternative simplified graphical representations
of a signpost instruction. The layout is not defined by a fixed grid and the
application decides about the position and the alignment of the elements.
Two of the textual elements use the default text color and one element has an
individual color assigned.

![Graphical signpost instruction](assets/signpost_simple_graphic.png)

!*/

/** Signpost instruction using a simplified graphical representation. */
struct SignpostInstruction
{
  /** Type of intersection. */
  SignpostIntersectionType intersectionType;

  /**
    * Position of the signpost instruction on the transition in percent.
    * The complete length of the transition shall be taken into account.
    * Example: If a transition goes over 3 roads, the sum of all 3 road lengths
    * is 100 %.
    */
  PercentagePosition position;

  /**
    * Elements of the signpost instruction.
    * Elements of the same type are sorted in descending priority.
    */
  SignpostInstructionElement elements[];

  /** Background color of the signpost. */
  optional SignpostGraphicsBackgroundColor backgroundColor;

  /** Background icon of the signpost. */
  optional SignpostGraphicsBackgroundIcon backgroundIcon;

  /** Default text color of text elements in the signpost instruction. */
  optional SignpostGraphicsTextColor defaultTextColor;
};

/** An element of a signpost instruction describes a part of the signpost. */
struct SignpostInstructionElement
{
  /** Type of the signpost element. */
  SignpostInstructionElementType type;

  /** Content of the signpost element. */
  SignpostInstructionElementContent content;

  /** Value of the signpost element. */
  string value;

  /** Phonetic transcriptions of the signpost element. */
  PhoneticTranscriptionList phoneticTranscriptions
                  if isset(content, SignpostInstructionElementContent.PHONETIC_TRANSCRIPTION);

  /** Icon of the signpost element. */
  SignpostGraphicsElementIcon icon
                  if isset(content, SignpostInstructionElementContent.ICON);

  /** Text color of the signpost element. Overrides the default color. */
  SignpostGraphicsTextColor textColor
                  if isset(content, SignpostInstructionElementContent.TEXT_COLOR);

  /** Priority road class of the signpost element. */
  PriorityRoadClass priorityRoadClass
                  if (type == SignpostInstructionElementType.TOWARDS_NUMBER
                  ||  type == SignpostInstructionElementType.DIRECTION_NUMBER)
                  && isset(content, SignpostInstructionElementContent.PRIORITY_ROAD_CLASS);

  /** Road number prefix of the signpost element. */
  string roadNumberPrefix
                  if (type == SignpostInstructionElementType.TOWARDS_NUMBER
                  ||  type == SignpostInstructionElementType.DIRECTION_NUMBER)
                  && isset(content, SignpostInstructionElementContent.ROAD_NUMBER_PREFIX);

  /** Road number suffix of the signpost element. */
  string roadNumberSuffix
                  if (type == SignpostInstructionElementType.TOWARDS_NUMBER
                  || type == SignpostInstructionElementType.DIRECTION_NUMBER)
                  && isset(content, SignpostInstructionElementContent.ROAD_NUMBER_SUFFIX);
};

/** Defines the type of intersection that the signpost belongs to. */
enum uint8 SignpostIntersectionType
{
  /**
    * Standard intersection, such as a t-junction or a normal crossing of two
    * streets.
    */
  STANDARD,

  /** Interchange between two similar streets, such as a motorway interchange. */
  INTERCHANGE,

  /** Exit of a controlled-access road. */
  EXIT,

  /** Combination of interchange and exit. */
  INTERCHANGE_AND_EXIT,
};

/** Type of a signpost instruction element. */
enum varuint16 SignpostInstructionElementType
{
  /** Exit name. */
  EXIT_NAME,

  /** Exit number.*/
  EXIT_NUMBER,

  /** Towards name, such as the name of a city or neighborhood. */
  TOWARDS_NAME,

  /** Towards road number, such as a highway number. */
  TOWARDS_NUMBER,

  /** Direction name. */
  DIRECTION_NAME,

  /** Direction road number. */
  DIRECTION_NUMBER,

  /** Distance to the exit. */
  DISTANCE_TO_EXIT,
};

/** Content of a signpost element to be used for guidance instructions. */
bitmask varuint16 SignpostInstructionElementContent
{
  /** Signpost element has a phonetic transcription. */
  PHONETIC_TRANSCRIPTION,

  /** Signpost element has an icon. */
  ICON,

  /** Signpost element has a text color. */
  TEXT_COLOR,

  /** Signpost element has a priority road class. */
  PRIORITY_ROAD_CLASS,

  /** Signpost element has a road number prefix. */
  ROAD_NUMBER_PREFIX,

  /** Signpost element has a road number suffix. */
  ROAD_NUMBER_SUFFIX,

  /** Signpost element is ambiguous and should not be used for guidance. */
  AMBIGUOUS,
};

/**
  * Background color for the simplified graphical representation of a
  * signpost instruction.
  */
subtype ColorRgba SignpostGraphicsBackgroundColor;

/**
  * Background icon for the simplified graphical representation of a
  * signpost instruction.
  */
subtype IconSetReference SignpostGraphicsBackgroundIcon;

/**
  * Signpost element icon for the simplified graphical representation of a
  * signpost instruction.
  */
subtype IconSetReference SignpostGraphicsElementIcon;

/**
  * Text color for the simplified graphical representation of a signpost
  * instruction.
  */
subtype ColorRgb SignpostGraphicsTextColor;


/*!

## Signpost Images

A list of signpost images can be provided for display purposes. Each
image is a representation of an individual real-world signpost.

!*/

/** List of signpost images that contain signposts as in reality. */
struct SignpostImageList
{
align(8):
  /** Number of signposts stored in the layer. */
  varsize numSignposts;

  /** Identifiers of the signpost image. */
  packed SignpostImageId ids[numSignposts];

  /** Images of the signpost. */
  IconImage signpost[numSignposts];
};

/** Signpost image. */
struct SignpostImage
{
  /** Reference to the signpost image. */
  SignPostImageReference id;

  /**
    * Position of the signpost on the transition in percent.
    * The complete length of the transition is taken into account.
    * Example: If a transition goes over 3 roads, the sum of all 3 road lengths
    * equals 100 %.
    */
  PercentagePosition position;
};

/**
  * Reference to a signpost image.
  * Values 0 to 536870911 (included) refer to images in the same smart layer container,
  * for example, the same tile.
  * Values greater than 536870911 refer to images in a global smart layer object.
  */
subtype SignpostImageId SignPostImageReference;

/** Identifier of a signpost image. */
subtype varuint SignpostImageId;



/*!

## Lane Instructions

For lane guidance, lane instructions can be assigned to transitions. A set of
activation points along the transition provides instruction scenes with information
for displaying or announcing guidance instructions for lanes.

An instruction scene consists of the following elements:

- Lane layout at each activation point of the transition.
- Instruction mask that indicates which lanes to take to follow the guidance instructions.
- Optional lane marking on the road, for example, an arrow to the left.

!*/

/** Guidance instruction for lanes composed of one or more instruction scenes. */
struct LaneInstruction
{
  /** Number of instruction scenes used in the guidance instruction. */
  varsize numScenes;

  /** List of instruction scenes. */
  LaneInstructionScene scenes[numScenes];

  /**
    * Position on the transition where an instruction scene is activated.
    * For transition paths, the total length of all parts equals 100 %.
    */
  PercentagePosition positions[numScenes];
};

/** Definition of a lane instruction scene. */
struct LaneInstructionScene
{
  /** Number of lanes available at the position of the instruction scene. */
  uint8 numLanes;

  /**
    * Indicates for each lane whether the guidance instruction applies.
    * Set to `true` for each lane that can be followed as part of the guidance instruction.
    */
  bool activeLanes[numLanes];

  /** Lane markings for each lane that is part of the lane instruction scene. */
  optional InstructionLaneMarking markings[numLanes];
};

/** Bitmask for lane markings. Can be used to generate arrows on lanes. */
bitmask varuint64 InstructionLaneMarking
{
  /** No arrow. */
  NONE = 0,

  /** Straight arrow in travel direction. */
  ARROW_STRAIGHT,

  /** Arrow that points to the left in travel direction. */
  ARROW_LEFT,

  /** Arrow that points to the right in travel direction. */
  ARROW_RIGHT,

  /**
    * Arrow that points upwards while slightly bending to the left in travel
    * direction.
    *
    * Example: Arrow indicating a merge.
    */
  ARROW_SLIGHT_LEFT,

  /**
   * Arrow that points upwards while slightly bending to the right in travel
   * direction.
   *
   * Example: Arrow indicating a merge.
   */
  ARROW_SLIGHT_RIGHT,

  /**
    * Arrow that points sharp to the right, slightly bending back in travel
    * direction.
    */
  ARROW_SHARP_RIGHT,

  /**
    * Arrow that points sharp to the left, slightly bending back in travel
    * direction.
    */
  ARROW_SHARP_LEFT,

  /**
    * Arrow that starts in travel direction, then turns left and points
    * back into the opposite direction.
    */
  ARROW_U_TURN_LEFT,

  /**
    * Arrow that starts in travel direction, then turns right and points
    * back into the opposite direction.
    */
  ARROW_U_TURN_RIGHT,
};

/*!

## Junction Views

Junction views provide realistic visual information about an intersection and the
guidance instructions that are required to perform a specific maneuver.

A set of activation points along a transition provides specific junction view
scenes that  reference junction view image sets to be shown at
the positions of the activation points.

![Junction view for a transition path](assets/junction_view_transition_path.png)

A junction view scene can have multiple layers, depending on which type of
information is available. Only the corresponding intersection view
images are mandatory. Images for backgrounds, signboards, arrows, or signboard
arrows are optional.

![Components of a junction view scene](assets/junction_view_components.png)

!*/

/** Junction view composed of one or more junction view scenes. */
struct JunctionView
{
  /** Number of scenes used in the junction view. */
  varsize numScenes;

  /** List of junction view scenes. */
  JunctionViewScene scenes[numScenes];

  /**
    * Position on the transition where a junction view scene is activated.
    * For transition paths, the total length of all parts equals 100 %.
    */
  packed PercentagePosition positions[numScenes];
};

/** Definition of a junction view scene. */
struct JunctionViewScene
{
  /** Defines which content layers are available in the junction view scene. */
  JunctionViewContent content;

  /** References to the mandatory intersection image sets. */
  packed JunctionViewImageSetReference intersectionId[];

  /** References to the relevant background images. */
  packed JunctionViewImageSetReference backgroundId[]
          if isset(content, JunctionViewContent.BACKGROUND);

  /** References to the relevant signboard images. */
  packed JunctionViewImageSetReference signboardId[]
          if isset(content, JunctionViewContent.SIGNBOARD);

  /** References to the relevant arrow images. */
  packed JunctionViewImageSetReference arrowId[]
          if isset(content, JunctionViewContent.ARROW);

  /** References to the relevant signboard arrow images. */
  packed JunctionViewImageSetReference signboardArrowId[]
          if isset(content, JunctionViewContent.SIGNBOARD_ARROW);
};

/** Reference to a junction view image set.
  * Values 0 to 536870911 (included) refer to image sets in the same smart layer
  * container, for example, the same tile.
  * Values greater than 536870911 refer to image sets in a global smart layer object.
  */
subtype JunctionViewImageSetId JunctionViewImageSetReference;

/** Identifier of a junction view image set. */
subtype varuint JunctionViewImageSetId;

/** Bitmask indicating the content of a junction view scene. */
bitmask varuint16 JunctionViewContent
{
  /** Junction view scene has a background layer. */
  BACKGROUND,

  /** Junction view scene has a signboard layer. */
  SIGNBOARD,

  /** Junction view scene has an arrows layer. */
  ARROW,

  /** Junction view scene has a signboard arrows layer. */
  SIGNBOARD_ARROW,
};

/** List of junction view images. */
struct JunctionViewImageList
{
  /** File format of junction view images. */
  JunctionViewImageFormat imageFormat;

  /** Number of junction view images in the list. */
  varsize numImages;

  /** List of junction view image sets. */
  packed JunctionViewImageSetId setId[numImages];

  /** Usage types of the junction view images. */
  packed JunctionViewImageUsageType usageType[numImages];

  /** Aspect ratios of the junction view images. */
  packed JunctionViewImageRatio ratio[numImages];

  /** Image data. */
  extern imageData[numImages];
};

/** File format of a junction view image. */
enum uint8 JunctionViewImageFormat
{
  /** PNG file format. */
  PNG,

  /** SVG file format. */
  SVG,
};

/** Usage type of a junction view image. */
bitmask varuint32 JunctionViewImageUsageType
{
  /** Junction view image to be used at day. */
  DAY,

  /** Junction view image to be used at night. */
  NIGHT,

  /** Junction view image to be used if the sun shines. */
  SUNSHINE,

  /** Junction view image to be used if it rains. */
  RAIN,

  /** Junction view image to be used if it snows. */
  SNOW,
};

/** Aspect ratio of a junction view image. */
struct JunctionViewImageRatio
{
  /** Width of the image in pixels. */
  NumPixels width;

  /** Height of the image in pixels. */
  NumPixels height;
};

/** Abstraction level of junction views. */
enum uint8 JunctionViewAbstractionLevel
{
  /** Junction views have mixed abstraction levels. */
  MIXED,

  /** Junction views contain photo-realistic images. */
  LOW,

  /**
    * Junction views contain medium abstract representations of the roads and
    * generalized roadside furniture items.
    */
  MEDIUM,

  /**
    * Junction views contain highly abstract representations of the roads,
    * mostly without roadside furniture.
    */
  HIGH,
};