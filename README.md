# math3d

## Introduction

For a point in three dimensional space (x, y, z) we represent it with a four dimensional vector

[x' y' z' w] = [x y z 1][T]

Where T is a transformation matrix.

The 4x4 transformation matrix can be partitioned in four separate sections

[ 3x3 ][ 3x1 ]
[ 1x3 ][ 1x1 ]

The upper left 3x3 submatrix produces a linear transformation in the form of scaling, shearing, reflection and rotation.
The lower left 1x3 submatrix produces translation.
The upper right 3x1 submatrix produces a perspective transformation.
The final lower right hand 1x1 submatrix produces overall scaling.

## NOTES The

- create a matrix stack
- add functions for vec3*m44 and Quat*m44.
- get vec3 as 1by4 matrix, do the same for Quat

## Concepts

### Homogeneous Coordinates

In homogeneous coordinates, an n-dimensional space is represented by n+1 dimensions. So the triplet (x,y,z), is represented by four coordinates (x', y', z', w), where w is the homogeneous coordinate, and an arbitrary number. For every w, x=x'/w, y=y'/w, and z=z'/w.

Thus for our uses w is almost always 1.0.

### Transformation

Transformation are how we project 3D coordinates in a 2D screen.

Rather than modifying the object directly, transformations affects the coordinate system, so you can rotate, move, stretch or shrink.

- Viewing: Specifies the location of the viewer or camera
- Modeling: Moves the object around the scene
- Modelview: Describes the duality of viewing and modeling transformation
- Projection: Clips and sizes the viewing volume
- Viewport: Scales the final output to the window

### Eye coordinates

In the absence of any transformations, the cartesian coordinate system is identical to the eye coordinates. All transformations change the coordinate system in respect to the eye coordinates. You move and rotate objects in the scene by rotating the coordinate system relative to the eye coordinates.

### Identity Matrix

An useful transformation Matrix, which when used applies no transformation at all. It's a matrix that contains all zeroes, with the exception of a diagonal row of ones. When this matrix is multiplied by any vertex matrix, the result is the vertex matrix is unchanged.

### Frustum

The geometric shape called a frustum is a section of a pyramid, viewed from the narrow end to the broad end, with near position (pyramid height) sectioned, and the resulting rectangle with a defined width and height, and a far position (at pyramid base), where the angle at the pyramid top is defined by a fov (field of view). Frustum is useful for perspective projection.

### Transformation Pipeline

For each point in 3D space, which we will call a vertex, we will convert it to a 1-by-4 (single column) matrix, in which the first three values are the x, y and z coordinates. The fourth number is a scaling factor that you can apply, this is the w coordinate and is usually 1.0 by default.

The vertex is then multiplied by the modelview matrix, which yields the transformed eye coordinates.
The eye coordinates are then multiplied by the projection matrix to yield clip coordinates. This will mark data outside of the viewing volume as not visible.
The clip coordinates are then divided by w coordinate to yield normalized device coordinates. The w may have been modifiyed by the modelview matrix, depending on the transformations that occurred.
Finally, the coordinate triplet is mapped to a 2D plane by the viewport transformation.

### Projection Transformation

- Orthographic Projection: the position of all points on screen are drawn with the exact relative dimensions specified, like a schematic layout.
- Perspective Projection: shows objects more similar to real life, making distant objects smaller than nearby objects of the same size. They are good for wide open spaces.

The projection transformation is applied after you have moved, rotated, and stretched or shrinked the coordinates.
