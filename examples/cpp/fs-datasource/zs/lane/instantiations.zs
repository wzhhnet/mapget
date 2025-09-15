/*!

# Lane Instantiations

This helper package instantiates templates that are used in the Lane module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package lane.instantiations;

import core.geometry.*;
import lane.lanes.*;
import lane.boundaries.*;
import lane.types.*;
import lane.roadsurface.*;
import lane.reference.types.*;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     lane.lanes.LaneCenterLineGeometryId,
  /* GEOMETRY_TYPE */   core.geometry.GeometryType> CenterLineGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     lane.boundaries.BoundaryGeometryId,
  /* GEOMETRY_TYPE */   core.geometry.GeometryType> BoundaryGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     lane.reference.types.RoadSurfaceId,
  /* GEOMETRY_TYPE */   lane.roadsurface.RoadSurfacePolygonType> RoadSurfacePolygonGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     lane.reference.types.RoadSurfaceId,
  /* GEOMETRY_TYPE */   lane.roadsurface.RoadSurfaceLineType> RoadSurfaceLineGeometryLayer;
