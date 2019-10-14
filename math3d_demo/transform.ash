// new module header


managed struct Transform {
  float v[MAX_CELL_COUNT];

  int row_count;
  int column_count;
  int cell_count;

  import Transform* Set(int row, int column, float value);
  import float Get(int row, int column);
  import static Transform* Create();

  import readonly attribute String AsString;
  import String get_AsString(); // $AUTOCOMPLETEIGNORE$

  import static Transform* CreateFromString(String s);

  import Transform* Clone();

  import bool isEqual(Transform* m);

  import Transform* Add(Transform* m);
  import Transform* Sub(Transform* m);
  import Transform* Mul(Transform* m);
  import Transform* MulNum(float f);
  import Transform* DivNum(float f);
  import Transform* Pow(int n);
  import float Determinant();
  import float MaxCell();
  import float MinCell();

  import Quat* DoTransform(float px, float py, float pz, float pw);
  import Quat* DoTransformQuat(Quat* q);
  import Transform* Invert44();
  import Transform* SetIdentity();
  import Transform* SetTranslate(float x, float y, float z);
  import Transform* SetScale(float x, float y, float z);
  import Transform* SetRotateEuler(float x, float y, float z);
  import Transform* SetFullTransform(float x, float y, float z, float sx, float sy, float sz, float rx, float ry, float rz);
  import Transform* SetOrthographicProjection(float left, float right, float bottom, float top, float near, float far);
  import Transform* SetPerspectiveProjection(float fovx, float fovy, float near, float far);
};
