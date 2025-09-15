/*!

# RCMS Metadata

This package defines metadata for RCMS layers.

**Dependencies**

!*/

package ext.rcms.metadata;

import core.types.*;
import ext.rcms.instantiations.*;

/*!

The metadata of the RCMS attribute layers stores information about
the content of the road RCMS layer.

!*/


/** Metadata of the RCMS layer for roads. */
struct RoadRcmsLayerMetadata
{
  /** Metadata for road range attributes. */
  RcmsRoadLocationRangeAttributeMapListMetadata rcmsRoadRangeAttributeMetadata;
};
