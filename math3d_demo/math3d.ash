// new module header
#define MAX_CELL_COUNT 16

enum MatrixType {
  eMT_None=0,
  eMT_Identity=1,
};

import float Abs(float f);
import String[] Split(this String*, String token);
import int CountToken(this String*, String token);

managed struct Vec3;

managed struct Quat {
  float x;
  float y;
  float z;
  float w;

  import static Quat* Create(float x=0, float y=0, float z=0, float w=0);

  import readonly attribute String AsString;
  import String get_AsString(); // $AUTOCOMPLETEIGNORE$

  import readonly attribute Vec3* AsVec3;

  import Quat* Set(float x=0, float y=0, float  z=0, float  w=0);

  import Quat* Clone();

  import Quat* Add(Quat* v);

  import Quat* Sub(Quat* v);

  import Quat* Mul(Quat* v);

  import Quat* Scale(float s);

  import readonly attribute float Length;
  import float get_Length(); // $AUTOCOMPLETEIGNORE$

  import readonly attribute Quat* Normalize;
  import Quat* get_Normalize(); // $AUTOCOMPLETEIGNORE$

  import float Distance(Quat* v);

  import float Dot(Quat* v);

  import float Angle(Quat* v);

  import Quat* Lerp(Quat* v,  float t);

  import Quat* setAngleAxis(float angle);

  import Quat* getAngleAxis();
};

managed struct Matrix {
  float v[MAX_CELL_COUNT];

  int row_count;
  int column_count;
  int cell_count;

  import Matrix* Set(int row, int column, float value);
  import float Get(int row, int column);
  import static Matrix* Create(int rows,  int columns,  MatrixType type=0,  float value=0);
  import static Matrix* CreateM44();

  import readonly attribute String AsString;
  import String get_AsString(); // $AUTOCOMPLETEIGNORE$

  import static Matrix* CreateFromString(String s);

  import Matrix* Clone();

  import bool isEqual(Matrix* m);

  import Matrix* Add(Matrix* m);
  import Matrix* Sub(Matrix* m);
  import Matrix* Mul(Matrix* m);
  import Matrix* MulNum(float f);
  import Matrix* DivNum(float f);
  import Matrix* Pow(int n);
  import float Determinant();
  import float MaxCell();
  import float MinCell();

  import Quat* M44_DoTransform(float px, float py, float pz, float pw);
  import Quat* M44_DoTransformQuat(Quat* q);
  import Matrix* M44_Invert();
  import Matrix* M44_SetIdentity();
  import Matrix* M44_SetTranslate(float x, float y, float z);
  import Matrix* M44_SetScale(float x, float y, float z);
  import Matrix* M44_SetRotateEuler(float x, float y, float z);
  import Matrix* M44_SetFullTransform(float x, float y, float z, float sx, float sy, float sz, float rx, float ry, float rz);
  import Matrix* M44_SetOrthographicProjection(float left, float right, float bottom, float top, float near, float far);
  import Matrix* M44_SetPerspectiveProjection(float fovx, float fovy, float near, float far);
};


managed struct Vec3 {
  float x;
  float y;
  float z;

  import static Vec3* Create(float x=0, float y=0, float z=0);

  import readonly attribute String AsString;
  import String get_AsString(); // $AUTOCOMPLETEIGNORE$

  import readonly attribute Quat* AsQuat;

  import Vec3* Set(float x=0, float y=0, float  z=0);

  import Vec3* Clone();

  import Vec3* Add(Vec3* v);
  import Vec3* AddQuat(Quat* v);

  import Vec3* Sub(Vec3* v);
  import Vec3* SubQuat(Quat* v);

  import Vec3* Mul(Vec3* v);
  import Vec3* MulQuat(Quat* v);

  import Vec3* Div(Vec3* v);
  import Vec3* DivQuat(Quat* v);

  import Vec3* Scale(float s);

  import readonly attribute float Length;
  import float get_Length(); // $AUTOCOMPLETEIGNORE$

  import readonly attribute Vec3* Normalize;
  import Vec3* get_Normalize(); // $AUTOCOMPLETEIGNORE$

  import float Distance(Vec3* v);
  import float DistanceQuat(Quat* v);

  import float Dot(Vec3* v);
  import float DotQuat(Quat* v);

  import float Angle(Vec3* v);
  import float AngleQuat(Quat* v);

  import Vec3* Cross(Vec3* v);
  import Vec3* CrossQuat(Quat* v);

  import Vec3* Lerp(Vec3* v,  float t);

  import Vec3* Project(Vec3* v);

  import Vec3* Rotate(Quat* q);
};

import Vec3* get_AsVec3(this Quat*);
import Quat* get_AsQuat(this Vec3*);
import Quat* AddVec3(this Quat*, Vec3* v);
import Quat* SubVec3(this Quat*, Vec3* v);
import Quat* MulVec3(this Quat*, Vec3* v);
import float DistanceVec3(this Quat*, Vec3* v);
import float DotVec3(this Quat*, Vec3* v);
import float AngleVec3(this Quat*, Vec3* v);
import Quat* LerpVec3(this Quat*, Vec3* v,  float t);

managed struct ScreenPoint{
  int x;
  int y;
  float z;
  float w;
  bool is_visible;
};


struct Transform3D {

  int X;
  int Y;
  int Width;
  int Height;

  float frustrum_near;
  float frustrum_far;

  float surfsize_h;
  float surfsize_w;

  float ndcSize_h;
  float ndcSize_w;

  Matrix* CamToWorld;
  Matrix* WorldToCam;
  Matrix* ProjectMtx;

  import void Init();

  import void SetPosition( int x, int y, int  width, int height);

  import void SetCameraTransform( Vec3* cam_pos, Vec3* cam_scale, Vec3* cam_rot);

  import void SetOrthoProjection(float width, float height, float near, float far);

  import void SetPerspectiveProjection(float fov, float near, float far);

  import void SetSurfaceSize(float width, float height);

  import ScreenPoint* WorldToScreen(float x, float y, float z);

  //ScreenToWorld(x, y, z, result);
};

