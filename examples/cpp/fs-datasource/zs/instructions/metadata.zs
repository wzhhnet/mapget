/*!

# Instructions Metadata

This package defines the metadata of the instructions attribute layers. The
metadata provides information about the content of the attribute layers.

**Dependencies**

!*/

package instructions.metadata;

import core.types.*;
import core.language.*;
import core.vehicle.*;
import instructions.instantiations.*;
import instructions.types.*;


rule_group RoadInstructionsLayerMetadataRules
{
  /*!
  Metadata of Instructions Attribute Layer for Roads using Direct References:

  `RoadInstructionsLayerMetadata` shall be used for `RoadInstructionsLayer`.
  !*/

  rule "instructions-chdkwn";

  /*!
  Global Images of Road Instructions Layer:

  If `RoadInstructionsLayerMetadata.globalImageReferences` is set to `true`,
  then at least one referenced image in the road instructions layer shall be a
  global image, that is, its ID is greater than 536870911.
  !*/

  rule "instructions-klj3mc";
};


/** Metadata of the instructions attribute layer for roads using direct references. */
struct RoadInstructionsLayerMetadata
{
  /** Content of the road instructions layer. */
  RoadInstructionsLayerContent content;

  /** Metadata for transition attributes. */
  InstructionsTransitionAttributeMetadata transitionMetadata
        if isset(content, RoadInstructionsLayerContent.TRANSITION_MAPS)
        || isset(content, RoadInstructionsLayerContent.TRANSITION_SETS);

  /** Road types for which instructions attributes are provided. */
  RoadType coveredRoadTypes[];

  /**
    * Set to `true` if at least one referenced signpost image or junction view
    * image in the layer is a global instruction image. That is, image is
    * stored in a different smart layer container and the smart layer object
    * service is of class `GLOBAL_INSTRUCTION_IMAGES`.
    *
    * A value of `true` does not mean that global instruction images are used
    * exclusively. An application still needs to check for local instruction
    * image layers as well.
    */
  bool globalImageReferences;

  /** Languages used in the road instructions layer. */
  AvailableLanguages availableLanguages;

  /** Vehicle specifications for which instructions attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevision;
};

/** Content bitmask of the instructions attribute layer for roads. */
bitmask varuint32 RoadInstructionsLayerContent
{
  /** Layer contains attribute maps for transition attributes. */
  TRANSITION_MAPS,

  /** Layer contains attribute sets for transition attributes. */
  TRANSITION_SETS,
};

rule_group LaneInstructionsLayerMetadataRules
{
  /*!
  Metadata of Instructions Attribute Layer for Lanes:

  `LaneInstructionsLayerMetadata` shall be used for `LaneInstructionsLayer`.
  !*/

  rule "instructions-ep3m2c";

  /*!
  Global Images of Lane Instructions Layer:

  If `LaneInstructionsLayerMetadata.globalImageReferences` is set to `true`,
  then at least one referenced image in the lane instructions layer shall be a
  global image, that is, its ID is greater than 536870911.
  !*/

  rule "instructions-zu7zhs";
};


/** Metadata of the instructions attribute layer for lanes. */
struct LaneInstructionsLayerMetadata
{
  /** Content of the lane instructions layer. */
  LaneInstructionsLayerContent content;

  /** Metadata for lane transition attributes. */
  InstructionsLaneTransitionAttributeMetadata laneTransitionAttributeMetadata
        if isset(content, LaneInstructionsLayerContent.LANE_TRANSITION_MAPS)
        || isset(content, LaneInstructionsLayerContent.LANE_TRANSITION_SETS);

  /** Lane types for which additional instructions attributes are provided. */
  LaneType coveredLaneTypes[];

  /**
    * Set to `true` if at least one referenced signpost image or junction view
    * image in the layer is a global instruction image. That is, the image is
    * stored in a different smart layer container and the smart layer object
    * service is of class `GLOBAL_INSTRUCTION_IMAGES`.
    *
    * A value of `true` does not mean that global instruction images are used
    * exclusively. An application still needs to check for local instruction
    * image layers as well.
    */
  bool globalImageReferences;

  /** Available languages used in the lane instructions layer. */
  AvailableLanguages availableLanguages;

  /** Vehicle specifications for which instructions attributes are provided. */
  VehicleSpecification coveredVehicleSpecifications[];

  /** ISO revision of the language codes used in the layer. */
  IsoRevision isoRevision;
};


/** Content bitmask of the instructions attribute layer for lanes. */
bitmask varuint32 LaneInstructionsLayerContent
{
  /** Layer contains attribute maps for lane transition attributes. */
  LANE_TRANSITION_MAPS,

  /** Layer contains attribute sets for lane transition attributes. */
  LANE_TRANSITION_SETS,
};

/** Content bitmask of the instructions image layer. */
bitmask varuint32 InstructionsImageLayerContent
{
  /** Layer contains signpost images. */
  SIGNPOSTS,

  /** Layer contains junction view images. */
  JUNCTION_VIEW,
};


rule_group InstructionsImageLayerMetadataRules
{
  /*!
  Metadata of Instructions Image Layer:

  `InstructionsImageLayerMetadata` shall be used for `InstructionsImageLayer`.
  !*/

  rule "instructions-ep3m3c";
};

/** Metadata of the instructions image layer. */
struct InstructionsImageLayerMetadata
{
  /** Content of the instructions image layer. */
  InstructionsImageLayerContent content;

  /** Junction view abstraction level for junction view images used in the layer. */
  JunctionViewAbstractionLevel junctionViewAbstractionLevel
        if isset(content, InstructionsImageLayerContent.JUNCTION_VIEW);
};
