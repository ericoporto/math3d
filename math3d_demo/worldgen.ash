
struct WorldGen {
    import void Init(int segw, int segh, int cache_segs, int obj_per_seg);
    import void FirstGen();
    import void SetAt(int x);
    
    import int  GetSeg();
    import int  GetCacheLeft();
    import int  GetCacheRight();
    
    protected int _segWidth;
    protected int _segHeight;
    protected int _cachedSegs;
    protected int _genObjPerSeg;
    protected int _x;
    protected int _curSeg;
};

import WorldCache WCache;
