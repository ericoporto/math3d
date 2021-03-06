AGSScriptModule        �  
WorldCache WCache;
export WCache;

void WorldGen::Init(int segw, int segh, int cache_segs, int obj_per_seg) {
    this._segWidth = segw;
    this._segHeight = segh;
    this._cachedSegs = cache_segs;
    this._genObjPerSeg = obj_per_seg;
    this._x = 0;
    this._curSeg = 0;
}

void WriteObjs(this WorldGen*, int seg) {
    File *f = File.Open(String.Format("$SAVEGAMEDIR$/wg_%d.dat", seg), eFileWrite);
    if (f == null) { return; }
    // TODO: optimize somehow, dont scan all objects over each time
    WObject* objs[] = WCache.GetObjects();
    f.WriteInt(WOBJECT_FORMAT);
    for (int i = 0; i < WCache.GetCacheSize(); i++) {
        WObject* o = objs[i];
        if (o == null || o.seg != seg) { continue; }
        f.WriteInt(0); // TODO: id?
        f.WriteInt(o.x);
        f.WriteInt(o.y);
        f.WriteInt(o.sprite);
    }
    f.Close();
}

bool ReadObjs(this WorldGen*, int seg) {
    File *f = File.Open(String.Format("$SAVEGAMEDIR$/wg_%d.dat", seg), eFileRead);
    if (f == null) { return false; }
    int format = f.ReadInt();
    if (format != WOBJECT_FORMAT) { f.Close(); return false; }
    for (;;) {
        if (f.EOF) { break; }
        int id = f.ReadInt();
        int x = f.ReadInt();
        int y = f.ReadInt();
        int sprite = f.ReadInt();
        WObject *o = WCache.CreateObject();
        o.x = x;
        o.y = y;
        o.sprite = sprite;
        o.seg = seg;
        o.eobj = -1;
    }
    f.Close();
    return true;
}

void GenerateObjs(this WorldGen*, int seg1, int seg2) {
    int total_new = this._genObjPerSeg * (seg2 - seg1 + 1);
    //Display("seg1 = %d, seg2 = %d, total new = %d", seg1,seg2,total_new);
    WCache.ReserveSpace(total_new);
    
    for (int seg = seg1; seg <= seg2; seg++) {
        if (this.ReadObjs(seg)) { continue; }
        int x1 = seg * this._segWidth;
        int y1 = 0;
        for (int i = 0; i < this._genObjPerSeg; i++) {
            // ... generate
            WObject *o = WCache.CreateObject();
            o.x = Random(this._segWidth) + x1;
            o.y = Random(this._segHeight) + y1;
            o.sprite = 0; // TODO
            o.seg = seg;
            o.eobj = -1;
        }
    }
}

void ReleaseObjs(this WorldGen*, int seg1, int seg2) {
    for (int seg = seg1; seg <= seg2; seg++) {
        this.WriteObjs(seg);
    }
    WCache.DestroyObjs(seg1, seg2);
}

void WorldGen::FirstGen() {
    this.GenerateObjs(this._curSeg - this._cachedSegs, this._curSeg + this._cachedSegs);
}

void WorldGen::SetAt(int x) {
    if (x == this._x) { return; }
    this._x = x;
    int seg;
    if (x >= 0) { seg = x / this._segWidth; }
    else { seg = (x / this._segWidth) - 1; }
    if (seg == this._curSeg) { return; }
    // Release objects
    if (seg < this._curSeg) {
        this.ReleaseObjs(seg + this._cachedSegs + 1, this._curSeg + this._cachedSegs);
        this.GenerateObjs(seg - this._cachedSegs, this._curSeg - this._cachedSegs - 1);
    } else {
        this.ReleaseObjs(this._curSeg - this._cachedSegs, seg - this._cachedSegs - 1);
        this.GenerateObjs(this._curSeg + this._cachedSegs + 1, seg + this._cachedSegs);
    }
    //WCache.PackObjs(); // TODO: call periodically
    this._curSeg = seg;
}

int WorldGen::GetSeg() {
    return this._curSeg;
}

int WorldGen::GetCacheLeft() {
    return (this._curSeg - this._cachedSegs) * this._segWidth;
}

int WorldGen::GetCacheRight() {
    return (this._curSeg + this._cachedSegs + 1) * this._segWidth;
}
 �  
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
 ��y        ej��