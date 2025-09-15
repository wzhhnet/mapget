/*!

# Road Instantiations

This helper package instantiates templates that are used in the Road module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package road.instantiations;

import core.geometry.*;
import road.reference.types.*;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     road.reference.types.RoadId,
  /* GEOMETRY_TYPE */   core.geometry.GeometryType> RoadShapesLayer;
