class Field{
  int w,h,d,scl;
  PVector[][][] field;
  float inc = 20;
  
  public Field(int wid, int hei, int dep, int scale){
    w = wid;
    h = hei;
    d = dep;
    scl = scale;
    field = new PVector[floor(w/scl)+1][floor(h/scl)+1][floor(d/scl)+1];
  }
  
  void show(){
    stroke(255,10);
    for (int x = 0; x < field.length; x++){
      for (int y = 0; y < field[0].length; y++){
        for (int z = 0; z < field[0][0].length; z++){
          line(x*scl,y*scl,z*scl,(x + field[x][y][z].x) * scl,(y + field[x][y][z].y) * scl,(z + field[x][y][z].z) * scl);
        }
      }
    }
  }
  
  void updateField(){
    for (int x = 0; x < field.length; x++){
      for (int y = 0; y < field[0].length; y++){
        for (int z = 0; z < field[0][0].length; z++){
          field[x][y][z] = new PVector((float)noise.eval(x/inc,t),(float)noise.eval(y/inc,t),(float)noise.eval(z/inc,t));
        }
      }
    }
  }
}
