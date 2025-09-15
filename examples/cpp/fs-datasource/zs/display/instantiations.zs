/*!

# Display Instantiations

This helper package instantiates templates that are used in the Display module.
The helper package ensures that template instantiations in the
generated code are put in the correct module and do not generate implicit
dependencies.

**Dependencies**

!*/

package display.instantiations;

import core.grid.*;
import core.geometry.*;
import display.types.*;
import display.reference.types.*;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     display.reference.types.DisplayAreaId,
  /* GEOMETRY_TYPE */   display.types.DisplayAreaType> AreaDisplayGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     display.reference.types.DisplayLineId,
  /* GEOMETRY_TYPE */   display.types.DisplayLineType> LineDisplayGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     display.reference.types.DisplayPointId,
  /* GEOMETRY_TYPE */   display.types.DisplayPointType> PointDisplayGeometryLayer;

instantiate GeometryLayer<
  /* GEOMETRY_ID */     display.reference.types.DisplayMesh3dId,
  /* GEOMETRY_TYPE */   display.types.DisplayMesh3dType> Mesh3dDisplayGeometryLayer;

instantiate GridLayer<
  /*GRID_ID*/         display.types.HeightmapGridId,
  /*GRID_TYPE*/       core.grid.GridType,
  /*CELL_VALUE_TYPE*/ core.geometry.Elevation> HeightMapGridLayer;