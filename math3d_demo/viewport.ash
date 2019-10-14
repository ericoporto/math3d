// new module header
struct Transform3D {
  
  int x;
  int y;
  int width;
  int height;
  
  import void SetPosition( int x, int y, int  width, int height);

  import void SetCameraTransform( Vec3* cam_pos, Vec3* cam_scale, Vec3* cam_rot);

  import void SetOrthoProjection(float width, float height, float near, float far);

  import void SetPerspectiveProjection(float fov, float near, float far);

  import void SetSurfaceSize(float width, float height);

  import Vec3* WorldToScreen(float x, float y, float z);

  //ScreenToWorld(x, y, z, result);
};