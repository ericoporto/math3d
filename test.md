

###  float Abs(float f)


###  String[] Split(this String*, String token)


###  int CountToken(this String*, String token)


### Quat


#### float Quat.x 
 x of the quaternion (x,y,z,w).

#### float Quat.y 
 y of the quaternion (x,y,z,w).

#### float Quat.z 
 z of the quaternion (x,y,z,w).

#### float Quat.w 
 w of the quaternion (x,y,z,w).

#### static Quat * Quat.Create(float x=0, float y=0, float z=0, float w=0) 
 Creates a Quaternion.

#### readonly attribute String Quat.AsString 
 Returns a string "(x, y, z, w)" for printing purposes.

#### String Quat.get_AsString() 


#### readonly attribute Vec3 
 Returns a Vec3 representation of the Quaternion.

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

#### readonly attribute float Quat.Length 
 Returns the Euclidean length of the quaternion.

#### Quat.get_Length() 


#### readonly attribute Quat 
 Returns a normalized copy of this quaternion. Normalize quaternion has length 1 but the same rotation.

#### Quat * Quat.get_Normalize() 


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


#### float 
 Don't modify this number directly. Each element of a matrix.

#### int Matrix.row_count 
 Don't modify this number directly. The number of rows of a matrix.

#### int Matrix.column_count 
 Don't modify this number directly. The number of columns of a matrix.

#### int Matrix.cell_count 
 Don't modify this number directly. The number of elements of a matrix.

#### Matrix * Matrix.Set(int row, int column, float value) 
 Sets the value of a specific row and column (y,x). This function modifyies the matrix you apply it directly.

#### Matrix.Get(int row, int column) 
 Returns the value of a specific row and column (similar to y,x position of a cell).

#### static Matrix * Matrix.Create(int rows,  int columns,  MatrixType type=0,  float value=0) 
 Returns a new matrix with defined rows and columns. You can set a value for all elements or make this matrix identity.

#### static Matrix * Matrix.CreateM44() 
 Returns a new 4x4 identity matrix. Functions preceeded with M44 require a matrix created with this method.

#### readonly attribute String Matrix.AsString 
 Reads a matrix as a string for printing purposes.

#### String Matrix.get_AsString() 


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


#### float Vec3.x 
 x of the triplet (x,y,z).

#### float Vec3.y 
 y of the triplet (x,y,z).

#### float Vec3.z 
 z of the triplet (x,y,z).

#### static Vec3 * Vec3.Create(float x=0, float y=0, float z=0) 
 Creates a triplet (x,y,z) vector.

#### readonly attribute String Vec3.AsString 
 Returns a string "(x, y, z)" for printing purposes.

#### String Vec3.get_AsString() 


#### readonly attribute Quat 
 Casts this triplet as a quaternion (w=1).

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

#### readonly attribute float Vec3.Length 
 Returns the length (distance to origin) of this vector.  

#### Vec3.get_Length() 


#### readonly attribute Vec3 
 Returns a copy of this vector, normalized.

#### Vec3 * Vec3.get_Normalize() 


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

###  Vec3* get_AsVec3(this Quat*)
 Casts a quaternion to a Vec3. You almost never wants to do this.

###  Quat* get_AsQuat(this Vec3*)
 Casts a Vec3 to quaternion. You almost never wants to do this.

###  Quat* AddVec3(this Quat*, Vec3* v)
 Sums a Vec3 from this quaternion. You almost never wants to do this.

###  Quat* SubVec3(this Quat*, Vec3* v)
 Subtracts a Vec3 from this quaternion. You almost never wants to do this.

###  Quat* MulVec3(this Quat*, Vec3* v)
 Multiplies this quaternion by a Vec3. You almost never wants to do this.

###  float DistanceVec3(this Quat*, Vec3* v)
 Returns distance from this quaternion to a Vec3. You almost never wants to do this.

###  float DotVec3(this Quat*, Vec3* v)
 Returns distance the dot product between this quaternion and a Vec3. You almost never wants to do this.

###  float AngleVec3(this Quat*, Vec3* v)
 Returns distance the angle between this quaternion and a Vec3. You almost never wants to do this.

###  Quat* LerpVec3(this Quat*, Vec3* v,  float t)
 Returns interpolation between this quaternion and a Vec3. You almost never wants to do this.

### ScreenPoint


#### int ScreenPoint.x 


#### int ScreenPoint.y 


#### float ScreenPoint.z 


#### float ScreenPoint.w 


#### bool ScreenPoint.is_visible 


### Transform3D


#### int Transform3D.X 


#### int Transform3D.Y 


#### int Transform3D.Width 


#### int Transform3D.Height 


#### float Transform3D.frustrum_near 
 The height to section the top of the frustum geometric shape. Default is 1.0.

#### float Transform3D.frustrum_far 
 The height to section the base of the frustum geometric shape. Default is 1000.0.

#### float Transform3D.surfsize_h 
 The surface size height. Usually matches final viewport height.

#### float Transform3D.surfsize_w 
 The surface size width. Usually matches final viewport width.

#### float Transform3D.ndcSize_h 
 The normalized device coordinates height. Default is 2.0.

#### float Transform3D.ndcSize_w 
 The normalized device coordinates width. Default is 2.0.

#### Matrix 
 The camera to world coordinates tranformation matrix.

#### Matrix 
 The world to camera coordinates tranformation matrix.

#### Matrix 
 The projection matrix.

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
