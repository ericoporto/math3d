// new module header
managed struct Transform {
  int ID;
  
  import attribute Matrix* m;
  
  import static Transform* CreateM44();
  import Transform* DoTransform(float px, float py, float pz, float pw);
  import Transform* SetIdentity();
  import Transform* SetTranslate(float x, float y, float z);
  import Transform* SetScale(float x, float y, float z);
  import Transform* SetRotateEuler(float x, float y, float z);
  import Transform* SetFullTransform(float x, float y, float z, float sx, float sy, float sz, float rx, float ry, float rz);
  import Transform* SetOrthographicProjection(float left, float right, float bottom, float top, float near, float far);
  import Transform* SetPerspectiveProjection(float fovx, float fovy, float near, float far);
};