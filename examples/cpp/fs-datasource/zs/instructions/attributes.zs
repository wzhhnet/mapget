/*!

# Guidance Instructions Attributes

This package defines attributes that are available in the Instructions module.

**Dependencies**

!*/

package instructions.attributes;

import instructions.types.*;

/** Instruction attributes for road transitions. */
enum varuint16 InstructionsTransitionAttributeType
{
  /** Assigns a signpost image to a position in a transition. */
  SIGNPOST_IMAGE,

  /**
    * Signpost instruction. Provides a signpost image and information such as
    * exit number or towards information.
    */
  SIGNPOST_INSTRUCTION,

  /**
    * Lane instruction. Provides information for displaying or announcing
    * guidance instructions for lanes.
    */
  LANE_INSTRUCTION,

  /**
    * Junction view. Provides realistic visual information about an intersection
    * and the guidance instructions that are required to perform a specific
    * maneuver.
    */
  JUNCTION_VIEW,
};

choice InstructionsTransitionAttributeValue(InstructionsTransitionAttributeType type) on type
{
  case SIGNPOST_IMAGE:
        SignpostImage signpostImage;
  case SIGNPOST_INSTRUCTION:
        SignpostInstruction signpostInstruction;
  case LANE_INSTRUCTION:
        LaneInstruction laneInstruction;
  case JUNCTION_VIEW:
        JunctionView junctionView;
};

/** Instruction attributes for lane transitions. */
enum varuint16 InstructionsLaneTransitionAttributeType
{
  /** Assigns a signpost image to a position in a transition. */
  SIGNPOST_IMAGE,

  /**
    * Signpost instruction. Provides a signpost image and information such as
    * exit number or towards information.
    */
  SIGNPOST_INSTRUCTION,

  /**
    * Lane instruction. Provides information for displaying or announcing
    * guidance instructions for lanes.
    */
  LANE_INSTRUCTION,

  /**
    * Junction view. Provides realistic visual information about an intersection
    * and the guidance instructions that are required to perform a specific
    * maneuver.
    */
  JUNCTION_VIEW,
};

choice InstructionsLaneTransitionAttributeValue(InstructionsLaneTransitionAttributeType type) on type
{
  case SIGNPOST_IMAGE:
        SignpostImage signpostImage;
  case SIGNPOST_INSTRUCTION:
        SignpostInstruction signpostInstruction;
  case LANE_INSTRUCTION:
        LaneInstruction laneInstruction;
  case JUNCTION_VIEW:
        JunctionView junctionView;
};