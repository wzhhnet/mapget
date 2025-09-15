/*!
# Lane Examples

This package provides extended examples that show how to use the data structures
provided by the Lane module to model specific use cases.

**Dependencies**

!*/

package lane.examples;

/*!

## Boundary Sets – Determine the End Position on a Boundary Geometry

If boundary geometries are available, a boundary set contains the positions on
the geometries of the referenced lane boundaries that correspond to
the start of the boundary set.

To get the ranges on the boundary geometries that are part of a
boundary set, applications need to calculate the positions on those
geometries that correspond to the end of the corresponding boundary set.
To do that, they need to perform the following steps for each lane boundary:

1. Determine the next boundary set by incrementing the index of the
   corresponding boundary set array.
1. In this next boundary set, look for a boundary reference that points to the
   geometry of the lane boundary in question.
1. If at least one reference exists, the required position equals
   the position on that boundary geometry that is referenced in the new boundary set.
1. If a reference to that boundary geometry does not exist or if there is no next
   boundary set, determine the position based on the digitization direction of
   the boundary geometry:
   - If the boundary geometry is digitized in the same direction as the lane,
     the required position is the last position on the boundary geometry.
   - If the boundary geometry is digitized in opposite direction than the lane,
     the required position is 0, that is, equal to the start of the boundary
     geometry.

### Example

This example demonstrates how to follow the logic above in a concrete
example. The following figure shows two parallel lane boundaries.
Because boundary 46 is shorter than boundary 17, the boundary sets are cut at
the start and end of boundary 46. Boundary 17 extends over all boundary
sets.

![Determining the end position of a boundary set](assets/boundary_sets_determine_end_example.png)

The application determines the following ranges for some exemplary lane boundaries
in boundary sets 1 to 9:

**Boundary set 1, lane boundary 17:**
  1. `reference`: 17; `position` = 0
  1. Next boundary set = 2, reference to lane boundary 17 available
  1. End of lane boundary range = position on boundary geometry that is
     referenced in boundary set 2
  1. Resulting range = 0-50

**Boundary set 2, lane boundary 46:**
  1. `reference`= -46; `position`= 38
  1. Next boundary set = 3, no reference to lane boundary 46
  1. Digitization direction of boundary geometry = opposite to lane 101
  1. End of lane boundary range = start of boundary geometry
  1. Resulting range: 38-0

**Boundary set 3, lane boundary 17:**
  1. `reference` = 17; `position` =  100
  1. No next boundary set available
  1. Digitization direction of boundary geometry = same as lane 101
  1. End of lane boundary range = end of boundary geometry
  1. Resulting range: 100-150

**Boundary set 7, lane boundary 17:**
  1. `reference` = -17; `position` = 150
  1. Next boundary set = 8, reference to lane boundary 17 available
  1. End of lane boundary range = position on boundary geometry that is
     referenced in boundary set 8
  1. Resulting range: 150-100

**Boundary set 8, lane boundary 46:**
  1. `reference` = 46; `position` = 0
  1. Next boundary set = 9, no reference to lane boundary 46
  1. Digitization direction of boundary geometry = same as lane 201
  1. End of lane boundary range = end of boundary geometry
  1. Resulting range: 0-38

**Boundary set 9, lane boundary 17:**
  1. `reference` = -17; `position` = 50
  1. No next boundary set available.
  1. Digitization direction of boundary geometry = opposite to lane 201
  1. End of lane boundary range = start of boundary geometry
  1. Resulting range: 50-0

__Note__: Some lane boundaries were left out because they follow the same logic
as other lane boundaries.

!*/
