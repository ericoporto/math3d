// new module header
#define MAX_CELL_COUNT 32

enum MatrixType {
  eMT_None=0,   
  eMT_Identity=1, 
};

import String[] Split(this String*, String token);
import int CountToken(this String*, String token);

managed struct Matrix {
  float v[MAX_CELL_COUNT];
  
  int row_count;
  int column_count;
  int cell_count;
  
  import Matrix* Set(int row, int column, float value);
  import float Get(int row, int column);
  import static Matrix* Create(int rows,  int columns,  MatrixType type=0,  float value=0);
  
  import static Matrix* CreateFromString(String s);
  
  import Matrix* Clone();
  
  import Matrix* Add(Matrix* m);
  import Matrix* Sub(Matrix* m);
  import Matrix* Mul(Matrix* m);
  import Matrix* MulNum(float f);
  import Matrix* DivNum(float f);
  import Matrix* Pow(int n);
  import float Determinant();
  import float MaxCell();
  import float MinCell();
};

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