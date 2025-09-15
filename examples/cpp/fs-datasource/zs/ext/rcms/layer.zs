/*!

# Characteristics Layer

This package defines the characteristics attribute layers.

!*/

package ext.rcms.layer;

import system.types.*;
import ext.rcms.instantiations.*;

/** Layer containing RCMS attributes for roads. */
struct RoadRcmsLayer
{
  /** Attribute map containing RCMS attributes for road ranges. */
  RcmsRoadLocationRangeAttributeMapList(0) rcmsRoadRangeMaps;

  /** Returns the layer type descriptor. */
  function LayerType getLayerType()
  {
    return LayerType.ATTRIBUTE;
  }
};
