AGSScriptModule        0  
WObject*[] ArrInfObj_ExpandIf(WObject* arr[], int valid_count, int need_capacity, int elem_sz)
{
    if (valid_count >= need_capacity) { return arr; }
    int want_space = need_capacity * elem_sz;
    WObject* new_arr[] = new WObject[want_space];
    int took_space = valid_count * elem_sz;
    for (int i = 0; i < took_space; i++) {
        new_arr[i] = arr[i];
    }
    return new_arr;
}



void WorldCache::Init() {
    this._objs = null;
    this._topObj = -1;
    this._numReal = 0;
    this._freeObjs = null;
    this._numFree = 0;
    this._capObjs = 0;
    this._spawned = null;
    this._numSpawned = 0;
    this._capSpawned = 0;
    this._destroyed = null;
    this._numDestroyed = 0;
    this._capDestroyed = 0;
}

void WorldCache::ReserveSpace(int num_extra) {
    this._numSpawned = 0; // TODO: CHECKME
    if (num_extra <= 0) { return; }
    int cap_after = this._capObjs - this._numFree + num_extra;
    if (cap_after > this._capObjs) {
        this._objs = ArrInfObj_ExpandIf(this._objs, this._capObjs, cap_after);
        // TODO: move previous free indexes up stack for optimal fill order
        this._freeObjs = Array_ExpandIf(this._freeObjs, this._capObjs, cap_after);
        for (int i = cap_after - 1; i >= this._capObjs; i--) {
            this._freeObjs[this._numFree] = i;
            this._numFree++;
        }
        this._capObjs = cap_after;
    }
}

WObject* WorldCache::CreateObject()
{
    if (this._numFree == 0) { this.ReserveSpace(100); } // TODO: CHECKME
    int at = this._topObj;
    if (this._numFree > 0) {
        at = this._freeObjs[this._numFree - 1];
        this._numFree--;
    }
    if (at > this._topObj) { this._topObj = at; }
    
    WObject *o = new WObject;
    this._objs[at] = o;
    this._numReal++;
    
    if (this._capSpawned == this._numSpawned) {
        int new_cap = 100 + this._numSpawned + this._numSpawned / 4;
        this._spawned = ArrInfObj_ExpandIf(this._spawned, this._numSpawned, new_cap);
        this._capSpawned = new_cap;
    }
    this._spawned[this._numSpawned] = o;
    this._numSpawned++;
    return o;
}

void WorldCache::DestroyObjs(int seg1, int seg2) {
    this._numDestroyed = 0; // TODO: CHECKME
    // TODO: optimize by keeping record of objects per segment
    int topmost = this._topObj;
    for (int i = this._topObj; i >= 0; i--) {
        WObject *o = this._objs[i];
        if (o == null) { continue; }
        if (o.seg >= seg1 && o.seg <= seg2) {
            if (this._capDestroyed == this._numDestroyed) {
                int new_cap = 100 + this._numDestroyed + this._numDestroyed / 4;
                this._destroyed = ArrInfObj_ExpandIf(this._destroyed, this._numDestroyed, new_cap);
                this._capDestroyed = new_cap;
            }
            this._destroyed[this._numDestroyed] = o;
            this._numDestroyed++;
            this._objs[i] = null;
            this._numReal--;
            this._freeObjs[this._numFree] = i;
            this._numFree++;
            if (i == topmost) { topmost = -1; }
        } else if (topmost == -1) {
            topmost = i;
        }
    }
    this._topObj = topmost;
}

void PackObjs(this WorldCache*) {
    // TODO
}

WObject*[] WorldCache::GetObjects() {
    return this._objs;
}

int WorldCache::GetCachedNum() {
    return this._numReal;
}

int WorldCache::GetCacheSize() {
    return this._topObj + 1;
}

WObject*[] WorldCache::GetDestroyed() {
    return this._destroyed;
}

int WorldCache::GetDestroyedNum() {
    return this._numDestroyed;
}
 �  
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
 ##�        ej��