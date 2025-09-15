/*!

# Instructions Layers

This package defines the attribute layers for the Instructions module, which
allow to assign guidance instructions to roads, transitions, or lanes.

Instruction images that are used by the attributes in the instruction attribute
layers are provided using a separate image layer.

**Dependencies**

!*/

package instructions.layer;

import system.types.*;
import core.geometry.*;
import instructions.instantiations.*;
import instructions.metadata.*;
import instructions.types.*;


/**
  * Instructions attribute layer for roads containing road and transition attributes
  * for guidance instructions.
  */
struct RoadInstructionsLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  RoadInstructionsLayerContent content;

  /** Coordinate shift. */
  CoordShift shift;

  /** Attribute maps for transition attributes. */
  InstructionsTransitionAttributeMapList(shift) transitionAttributeMaps
        if isset(content, RoadInstructionsLayerContent.TRANSITION_MAPS);

  /** Attribute sets for transition attributes. */
  InstructionsTransitionAttributeSetList(shift) transitionAttributeSets
        if isset(content, RoadInstructionsLayerContent.TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};


/**
  * Instructions attribute layer for lanes containing lane and transition attributes
  * for guidance instructions.
  */
struct LaneInstructionsLayer
{
  /** Content bitmask indicating which attribute maps or sets are available. */
  LaneInstructionsLayerContent content;

  /** Attribute maps for lane transition attributes. */
  InstructionsLaneTransitionAttributeMapList(0) laneTransitionAttributeMaps
        if isset(content, LaneInstructionsLayerContent.LANE_TRANSITION_MAPS);

  /** Attribute sets for lane transition attributes. */
  InstructionsLaneTransitionAttributeSetList(0) laneTransitionAttributeSets
        if isset(content, LaneInstructionsLayerContent.LANE_TRANSITION_SETS);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};

/** Instructions image layer providing signpost images and/or junction view images. */
struct InstructionsImageLayer
{
  InstructionsImageLayerContent content;

  /** Signpost images provided by the layer. */
  SignpostImageList signpostImageList
        if isset(content, InstructionsImageLayerContent.SIGNPOSTS);

  /** Junction view images provided by the layer. */
  JunctionViewImageList junctionViewImageList
        if isset(content, InstructionsImageLayerContent.JUNCTION_VIEW);

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.GEOMETRY;
  }
};
