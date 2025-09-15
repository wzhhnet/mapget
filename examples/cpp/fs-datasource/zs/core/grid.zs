/*!

# Core Grids

This package provides generic data structures to define grids, which can be used
for different purposes, for example, occupancy grids for localization.

**Dependencies**

!*/

package core.grid;

import core.geometry.*;
import core.types.*;

/*!

A grid is a set of square cells of a fixed size that are distributed over
a specific number of rows and columns. Each cell of a grid has a value of
a customizable type.

The following figure shows how the cells in a grid are ordered.
The cells are ordered row by row from south-west to north-east:

1. Index 0 corresponds to the cell in the south-west corner of the grid.
2. Index 1 corresponds to the cell to the right of the first in the same row, and so on.
3. Once the first row is complete, the next index corresponds to the cell
   north of the cell at index 0, and so on.

![Ordering of cells in a grid](assets/grid_ordering.png)

A grid layer stores grids and maps them to grid IDs. Grid IDs
are used by feature layers to reference the corresponding grids.
Grid IDs are defined in the module that uses these grids.

A grid layer only stores grids with one specific cell size.

!*/

rule_group GridLayerRules
{
  /*!
  No Overlapping Grids with Same Type:

  Within a grid layer, grids that have the same `GRID_TYPE` shall not overlap.
  !*/

  rule "core-o9cc2u";
};


/** Stores grids and maps them to grid IDs. */
struct GridLayer<GRID_ID, GRID_TYPE, CELL_VALUE_TYPE>(bool hasIds, bool hasTypes)
{
  /** Coordinate shift used for all grid anchor points. */
  CoordShift coordShiftXY;

  /**
   * Cell size of all grids stored in the layer,
   * always denoted with full NDS coordinate precision.
   * Because grid cells are square, the length of one cell side is sufficient
   * to determine the cell size.
  */
  GridCellSize cellSize;

align(8):
  /**
    * Number of grids stored in the layer. Also acts as implicit index for
    * mapping grid IDs to the elements stored in the buffers.
    */
  varsize numElements;

  /** Optional list of grid IDs inside the layer. */
  packed GRID_ID identifier[numElements] if hasIds;

align(8):
  /** Optional list of grid types mapped to the grids. */
  packed GRID_TYPE types[numElements] if hasTypes;

align(8):
  /** All the grids stored in this layer. */
  packed Grid<CELL_VALUE_TYPE>(cellSize, coordShiftXY) grids[numElements];

};

/** Empty prototype declaration for grid types. */
subtype Empty GridType;

/** Empty prototype declaration for grid IDs. */
subtype Empty GridId;

/** Number of cells in one dimension of a grid. */
subtype varsize NumGridCells;

/**
 * Length of one side of the cells in a grid, denoted with full
 * NDS coordinate precision.
 */
subtype varsize GridCellSize;

/**
 * A grid is defined by its number of rows and columns, the cell size, and the
 * anchor position of the grid. Each grid cell has a customizable value type.
 */
struct Grid<VALUE_TYPE>(GridCellSize size, CoordShift shift)
{
    /** South-west anchor position of the grid. */
    Position2D(shift) southWestCorner;

    /** Number of rows in the grid. */
    NumGridCells numRows;

    /** Number of columns in the grid. */
    NumGridCells numColumns;

    /**
      * Values stored in the grid. Ordered row by row from south-west to
      * north-east.
      */
    packed VALUE_TYPE grid[numRows * numColumns];

    /** Length of one side of the squared grid cells in NDS coordinate units. */
    function GridCellSize cellSize() { return size; }

    /** Width of the grid in NDS coordinate units. */
    function varuint64 width() { return numColumns * size; }

    /** Height of the grid in NDS coordinate units. */
    function varuint64 height() { return numRows * size; }
};
