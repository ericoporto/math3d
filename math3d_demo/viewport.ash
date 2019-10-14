// new module header
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

  Transform* CamToWorld;
  Transform* WorldToCam;
  Transform* ProjectMtx;

  import void Init();

  import void SetPosition( int x, int y, int  width, int height);

  import void SetCameraTransform( Vec3* cam_pos, Vec3* cam_scale, Vec3* cam_rot);

  import void SetOrthoProjection(float width, float height, float near, float far);

  import void SetPerspectiveProjection(float fov, float near, float far);

  import void SetSurfaceSize(float width, float height);

  import ScreenPoint* WorldToScreen(float x, float y, float z);

  //ScreenToWorld(x, y, z, result);
};
