/*!

# Examples of ADAS Attributes

This package contains examples that demonstrate how to assign ADAS attributes
to ADAS geometries.

!*/

package adas.examples;

/*!

## Modeling Curvature Profiles Across Intersections

The curvature of a turn in an intersection can be modeled using the
`TURN_GEOMETRY_CURVATURE` attribute.

__Note:__
If a curvature value of 0 is stored for the curvature point of the intersection
and turn geometry is not available, then the application can assume that the
transition is straight.

### Example 1

The following figure shows an intersection with four roads, A, B, C, and D,
including ADAS geometry. Curvature values are available for all ADAS geometry
points.
Turn geometry curvature values are available for all turning transitions,
for example, from A to B. For the straight transitions, no turn geometry data is
available, for example, from A to C.

![Intersection with curvature profile for all roads](assets/adas_curvature_intersections_ex1.png)

The following table shows the curvature values for road A.

ADAS geometry point | Value (1/m)
--------------------|---------------------
0                   | 0
1                   | 0
2                   | 0.01
3                   | 0
4                   | 0
5                   | 0

ADAS geometry point 5 on road A is not used for the transition from A to B
because it indicates a straight transition. `TURN_GEOMETRY_CURVATURE` for the
transition from A to B is set to 0.02. This turn geometry value is used for the
transition.

The following figure shows the resulting curvature profile.

![Curvature profile along the path A > B](assets/adas_curvature_profile_AB_ex1.png)

### Example 2

The following figure shows an intersection with four roads, A, B, C, and D,
including ADAS geometry with curvature values for roads A and C. Roads B and D
have no curvature profile.

![Intersection with curvature profile for two roads](assets/adas_curvature_intersections_ex2.png)

No turn geometry curvature values are required because there are no turning
transitions with curvature profiles.

### Example 3

The following figure shows an intersection with three roads, A, B, and C,
including ADAS geometry for all roads.

Roads A and C have valid curvature data, including the end points. Road B has
valid curvature values for ADAS geometry points B0 and B1 and the value `UNKNOWN` for
end point B2, which is in the same location as A5.

![Intersection with curvature profile for three roads](assets/adas_curvature_intersections_ex3.png)

No turn geometry curvature values are required. The curvature profile for the
transition from A to B gets the value `UNKNOWN` for the transition point,
indicating that the curvature value for this turn is unknown.

!*/
