class Ball{
  PVector pos, vel, acc;
  float topSpeed = 5;
  float w = 10;
  color col = color(random(0,255),255,255);
  public Ball(float x, float y, float z){
    pos = new PVector(x,y,z);
    vel = new PVector();
    acc = new PVector();
  }
  
  void move(){
    vel.add(acc);
    vel.setMag(topSpeed);
    pos.add(vel);
    acc.set(0,0,0);
  }
  
  void show(){
    noStroke();
    fill(col,100);
    push();
    translate(pos.x,pos.y,pos.z);
    sphere(w);
    pop();
  }
  
  void findVector(PVector[][][] vectors){
    acc.add(vectors[floor(pos.x/field.scl)+1][floor(pos.y/field.scl)+1][floor(pos.z/field.scl)+1]);
  }
  
  void flipSides(){
    if (pos.x > field.w){
      pos.x = w;  
    } else if (pos.x < 0){
      pos.x = field.w - w;
    }
    
    if (pos.y > field.h){
      pos.y = w;  
    } else if (pos.y < 0){
      pos.y = field.h - w;
    }
    
    if (pos.z > field.d){
      pos.z = w;  
    } else if (pos.z < 0){
      pos.z = field.d - w;
    }
  }
  
}
