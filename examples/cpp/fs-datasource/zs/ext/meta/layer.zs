/*!

# Metadata

This package defines level metadata info.

**Dependencies**

!*/

package ext.meta.layer;

import system.types.*;
import core.types.*;
import core.geometry.*;
import display.types.*;

/** Metadata info. */
struct LevelMetadataLayer
{
  /** Number of  scale levels in the list. */
  varsize numEntries : numEntries > 0;

  /** Scale ranges. */
  packed LevelMetadataDetail levelMetadataDetail[numEntries];

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
  
};

/** List of map scale ranges. */
struct LevelMetadataDetail
{
  /* Defintion of the tile level number.  */
  uint8 LevelNumber;
  
  /** Coordinate shift. */
  CoordShift  shift; 
  
  /** Scale sublevel flag. Set to true if the layer has more than one scale sublevel. */
  bool  hasScaleSublevels;
  
  /** Minimum scale denominator for all features of the layer. */
  ScaleDenominator  minScaleDenominator;
  
  /** Maximum scale denominator for all features of the layer. */
  ScaleDenominator  maxScaleDenominator;
  
  /** Number of scale sublevels. */
  uint8  numSublevels if hasScaleSublevels;
  
  /** Scale denominators for sublevels. From less-detail to more-detail. */
  SublevelScaleDenominator  subscales[numSublevels] if hasScaleSublevels; 
};

