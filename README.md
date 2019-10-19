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

## Script API

### Quat

#### static Quat * Quat.Create(float x=0, float y=0, float z=0, float w=0)
 Creates a Quaternion.

#### String Quat.get_AsString()
 Returns a string "(x, y, z, w)" for printing purposes.

#### Quat * Quat.Set(float x=0, float y=0, float  z=0, float  w=0)
 Sets manually the values of the quaternion.

#### Quat * Quat.Clone()
 Creates a new quaternion that is a copy of the cloned one.

#### Quat * Quat.Add(Quat* q)
 Returns a new quaternion which is the sum of this quaternion with quaternion q.

#### Quat * Quat.Sub(Quat* q)
 Returns a new quaternion which is the subtraction of this quaternion with quaternion q.

#### Quat * Quat.Mul(Quat* q)
 Returns a new quaternion which is the multiplication of this quaternion with quaternion q.

#### Quat * Quat.Scale(float s)
 Returns a new quaternion which is the multiplication of this quaternion by a scalar s.

#### Quat.get_Length()
 Returns the Euclidean length of the quaternion.

#### Quat * Quat.get_Normalize()
 Returns a normalized copy of this quaternion. Normalize quaternion has length 1 but the same rotation.

#### Quat.Distance(Quat* q)
 Returns the distance between this quaternion with quaternion q.

#### Quat.Dot(Quat* q)
 Returns the dot multiplication of this quaternion with quaternion q.

#### Quat.Angle(Quat* q)
 Returns the angle between this quaternion and quaternion q in radians.

#### Quat * Quat.Lerp(Quat* q,  float t)
 Linear interpolation by t percent of this quaternion and quaternion q.

#### Quat * Quat.setAngleAxis(float angle)
 Returns a new quaternion with specified angle, maintaining axis.

#### Quat * Quat.getAngleAxis()
 Returns a new quaternion that is a copy of the current, normalized with x set to angle.

### Matrix

#### Matrix * Matrix.Set(int row, int column, float value)
 Sets the value of a specific row and column (y,x). This function modifyies the matrix you apply it directly.

#### Matrix.Get(int row, int column)
 Returns the value of a specific row and column (similar to y,x position of a cell).

#### static Matrix * Matrix.Create(int rows,  int columns,  MatrixType type=0,  float value=0)
 Returns a new matrix with defined rows and columns. You can set a value for all elements or make this matrix identity.

#### static Matrix * Matrix.CreateM44()
 Returns a new 4x4 identity matrix. Functions preceeded with M44 require a matrix created with this method.

#### String Matrix.get_AsString()
 Reads a matrix as a string for printing purposes.

#### static Matrix * Matrix.CreateFromString(String s)
 Creates a matrix from a string like "{{0,4},{5,2}}".

#### Matrix * Matrix.Clone()
 Returns a new matrix that is a copy of this one.

#### Matrix.isEqual(Matrix* m)
 Returns true if all elements of the matrix m are equal to this one.

#### Matrix * Matrix.Add(Matrix* m)
 Returns a new matrix that is the sum of this matrix with a matrix m.

#### Matrix * Matrix.Sub(Matrix* m)
 Returns a new matrix that is the subtraction of this matrix with a matrix m.

#### Matrix * Matrix.Mul(Matrix* m)
 Returns a new matrix that is the multiplication of this matrix with a matrix m.

#### Matrix * Matrix.MulNum(float f)
 Returns a new matrix that is the multiplication of this matrix with a scalar f.

#### Matrix * Matrix.DivNum(float f)
 Returns a new matrix that is the division of this matrix with a scalar f.

#### Matrix * Matrix.Pow(int n)
 Returns a new matrix that is this matrix multiplied by itself n times. Matrix must be square.

#### Matrix.Determinant()
 Returns a the determinant of this matrix.

#### Matrix.MaxCell()
 Returns the value of the biggest element of the matrix.

#### Matrix.MinCell()
 Returns the value of the smallest element of the matrix.

#### Quat * Matrix.M44_DoTransform(float px, float py, float pz, float pw)
 Returns a point in homogeneous coordinates transformed. Has to be a 4x4 matrix.

#### Quat * Matrix.M44_DoTransformQuat(Quat* q)
 Returns a point in homogeneous coordinates transformed. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_Invert()
 Returns the inverse of this matrix, as a new matrix. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_SetIdentity()
 Returns a identity matrix, as a new matrix. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_SetTranslate(float x, float y, float z)
 Returns copy of current matrix with translate set to passed position. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_SetScale(float x, float y, float z)
 Returns copy current matrix with set scaling. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_SetRotateEuler(float x, float y, float z)
 Returns copy current matrix with rotate set as passed. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_SetFullTransform(float x, float y, float z, float sx, float sy, float sz, float rx, float ry, float rz)
 Returns copy current matrix with translate, rotate and scale set as passed. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_SetOrthographicProjection(float left, float right, float bottom, float top, float near, float far)
 Returns orthographic projection matrix with passed parameters. Has to be a 4x4 matrix.

#### Matrix * Matrix.M44_SetPerspectiveProjection(float fovx, float fovy, float near, float far)
 Returns perspective projection matrix with passed parameters. Has to be a 4x4 matrix.

### Vec3


#### static Vec3 * Vec3.Create(float x=0, float y=0, float z=0)
 Creates a triplet (x,y,z) vector.

#### String Vec3.get_AsString()
 Returns a string "(x, y, z)" for printing purposes.

#### Vec3 * Vec3.Set(float x=0, float y=0, float  z=0)
 Set the values of the triplet.

#### Vec3 * Vec3.Clone()
 Creates a new vector triplet that is a copy of the cloned one.

#### Vec3 * Vec3.Add(Vec3* v)
 Returns a new vector triplet which is the sum of this vector with a vector v.

#### Vec3 * Vec3.AddQuat(Quat* q)
 Returns a new vector triplet which is the sum of this vector with a quaternion q.

#### Vec3 * Vec3.Sub(Vec3* v)
 Returns a new vector triplet which is the subtraction of this vector with a vector v.

#### Vec3 * Vec3.SubQuat(Quat* q)
 Returns a new vector triplet which is the subtraction of this vector with a quaternion q.

#### Vec3 * Vec3.Mul(Vec3* v)
 Returns a new vector triplet which is the multiplication of this vector with a vector v.

#### Vec3 * Vec3.MulQuat(Quat* q)
 Returns a new vector triplet which is the multiplication of this vector with a quaternion q.

#### Vec3 * Vec3.Div(Vec3* v)
 Returns a new vector triplet which is the division of this vector with a vector v.

#### Vec3 * Vec3.DivQuat(Quat* q)
 Returns a new vector triplet which is the division of this vector with a quaternion q.

#### Vec3 * Vec3.Scale(float s)
 Returns a new quaternion which is the multiplication of this quaternion by a scalar s.

#### Vec3.get_Length()
 Returns the length (distance to origin) of this vector.  

#### Vec3 * Vec3.get_Normalize()
 Returns a copy of this vector, normalized.

#### Vec3.Distance(Vec3* v)
 Returns the distance between this vector and a vector v.

#### Vec3.DistanceQuat(Quat* q)
 Returns the distance between this vector and a quaternion q.

#### Vec3.Dot(Vec3* v)
 Returns the dot multiplication of this vector and a vector v.

#### Vec3.DotQuat(Quat* v)
 Returns the dot multiplication of this vector and a quaternion q.

#### Vec3.Angle(Vec3* v)
 Returns the angle between this vector and a vector v.

#### Vec3.AngleQuat(Quat* q)
 Returns the angle between this vector and a quaternion q.

#### Vec3 * Vec3.Cross(Vec3* v)
 Returns a vector which is the cross multiplication of this vector with a vector v.

#### Vec3 * Vec3.CrossQuat(Quat* q)
 Returns a vector which is the cross multiplication of this vector with a quaternion q.

#### Vec3 * Vec3.Lerp(Vec3* v,  float t)
 Returns a new vector which is the interpolation of percent t between this vector and a vector v.

#### Vec3 * Vec3.Project(Vec3* v)
 Returns a new vector that is equivalent of the projection of this vector on a vector v.

#### Vec3 * Vec3.Rotate(Quat* q)
 Returns a new vector which is the rotate vector of this by a quaternion q.

### Transform3D

#### Transform3D.Init()
 Initialize a Transform3D object with default values. Call this after istanciating.

#### Transform3D.SetPosition( int x, int y, int  width, int height)
 Sets the position of the viewport on screen.

#### Transform3D.SetCameraTransform( Vec3* cam_pos, Vec3* cam_scale, Vec3* cam_rot)
 Configures the camera transform, positioning the camera, scaling and rotating it.

#### Transform3D.SetOrthoProjection(float width, float height, float near, float far)
 Sets the projection matrix for orthogonal projection.

#### Transform3D.SetPerspectiveProjection(float fov, float near, float far)
 Sets the projection matrix for perspective projection. Field of View is in angle and specifies the frustum.

#### Transform3D.SetSurfaceSize(float width, float height)
 Sets the surface size for the view used. This should match the viewport to avoid stretching the resulting image.

#### ScreenPoint * Transform3D.WorldToScreen(float x, float y, float z)
 Returns a world point converted to screen coordinates.
