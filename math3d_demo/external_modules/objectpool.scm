AGSScriptModule        �	  
void ObjectPool::AddObjects(int from, int to) {
    if (this._capacity <= to) {
        int new_capacity = to + 1;
        this._usingObj = Array_ExpandIf(this._usingObj, this._capacity, new_capacity);
        this._isFree = Array_ExpandIf(this._isFree, this._capacity, new_capacity);
        this._freeObj = Array_ExpandIf(this._freeObj, this._capacity, new_capacity);
        this._capacity = new_capacity;
    }
    for (int i = from; i <= to; i++) {
        if (!this._usingObj[i]) {
            this._freeObj[this._numFreeObj] = i;
            this._numFreeObj++;
            this._usingObj[i] = true;
            this._isFree[i] = true;
        }
    }
}

void ObjectPool::RemoveAll() {
    this._numFreeObj = 0;
    for (int i = 0; i < MAX_ROOM_OBJECTS; i++) {
        this._usingObj[i] = false;
        this._isFree[i] = false;
    }
    this._usingObj = null;
    this._isFree = null;
    this._freeObj = null;
    this._capacity = 0;
}

void ObjectPool::RemoveObjects(int from, int to) {
    for (int i = from; i <= to; i++) {
        if (this._usingObj[i]) {
            for (int j = 0; j < this._numFreeObj; j++) {
                if (this._freeObj[j] == i) {
                    for (; j < this._numFreeObj - 1; j++) {
                        this._freeObj[j] = this._freeObj[j + 1];
                    }
                    this._numFreeObj--;
                }
            }
            this._isFree[i] = false;
            this._usingObj[i] = false;
        }
    }
}

int ObjectPool::Acquire() {
    if (this._numFreeObj == 0) { return -1; }
    this._numFreeObj--;
    int id = this._freeObj[this._numFreeObj];
    this._isFree[id] = false;
    return id;
}

void ObjectPool::Release(int id) {
    if (!this._usingObj[id] || this._isFree[id]) { return; }
    this._freeObj[this._numFreeObj] = id;
    this._numFreeObj++;
    this._isFree[id] = true;
}

void ObjectPool::ReleaseAll() {
    this._numFreeObj = 0;
    for (int i = 0; i < MAX_ROOM_OBJECTS; i++) {
        if (this._usingObj[i]) {
            this._freeObj[this._numFreeObj] = i;
            this._numFreeObj++;
            this._isFree[i] = true;
        }
    }
}

int ObjectPool::GetAcquiredNum() {
    return this._capacity - this._numFreeObj;
}

int ObjectPool::GetFreeNum() {
    return this._numFreeObj;
}

int ObjectPool::GetPoolSize() {
    return this._capacity;
}
    
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
 XO�|        ej��