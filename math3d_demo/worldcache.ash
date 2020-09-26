
#define WOBJECT_FORMAT 1

managed struct WObject {
    int x;
    int y;
    int seg;
    int sprite;
    int eobj;
};

import WObject*[] ArrInfObj_ExpandIf(WObject *arr[], int valid_count, int need_capacity, int elem_sz = 1);

struct WorldCache {
    import void Init();
    import void ReserveSpace(int num_extra);
    import WObject* CreateObject();
    import void DestroyObjs(int seg1, int seg2);
    
    import WObject*[] GetObjects();
    import int  GetCacheSize();
    import int  GetCachedNum();
    import WObject*[] GetDestroyed();
    import int  GetDestroyedNum();
    
    protected WObject* _objs[];
    protected int _topObj;
    protected int _numReal;
    protected int _freeObjs[];
    protected int _numFree;
    protected int _capObjs;
    protected WObject* _spawned[];
    protected int _numSpawned;
    protected int _capSpawned;
    protected WObject* _destroyed[];
    protected int _numDestroyed;
    protected int _capDestroyed;
};
