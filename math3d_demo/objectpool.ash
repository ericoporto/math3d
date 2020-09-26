
struct ObjectPool {
    import void AddObjects(int from, int to);
    import void RemoveAll();
    import void RemoveObjects(int from, int to);

    import int  Acquire();
    import void Release(int id);
    import void ReleaseAll();
    
    import int  GetAcquiredNum();
    import int  GetFreeNum();
    import int  GetPoolSize();

    protected int _capacity;
    protected bool _usingObj[];
    protected bool _isFree[];
    protected int _freeObj[];
    protected int _numFreeObj;
};
