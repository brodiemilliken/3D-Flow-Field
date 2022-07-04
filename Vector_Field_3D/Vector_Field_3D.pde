
float xRot = 0;
float yRot = 0;
float zRot = 0;
float zoom = 600;
boolean xUp, xDown, yUp, yDown, zUp, zDown;

float t = 0;

Field field;
Ball[] balls;

OpenSimplexNoise noise;

int fieldWidth = 500;
int fieldHeight = 500;
int fieldDepth = 500;

void setup(){
  fullScreen(P3D);
  noise = new OpenSimplexNoise();
  field = new Field(fieldWidth,fieldHeight,fieldDepth,25);
  colorMode(HSB);
  balls = new Ball[1000];
  for (int i = 0; i < balls.length; i++){
    balls[i] = new Ball(random(0,fieldWidth), random(0,fieldHeight), random(0,fieldDepth));
  }
}

void draw(){
  background(0);
  push();
  translate(width/2 - fieldWidth/2,height/2 - fieldHeight/2,zoom - fieldDepth/2);
  rotateX(-xRot);
  rotateY(-yRot);
  rotateZ(-zRot);
  field.updateField();
  field.show();
  
  for (Ball b : balls){
    b.findVector(field.field);
    b.move();
    b.flipSides();
    b.show();
  }
  
  
  t+=0.01;
  

  pop();
  rotateX(xRot);
  rotateY(yRot);
  rotateZ(zRot);
  rot();
}

void rot(){
  if (xUp) xRot += PI/30;
  if (xDown) xRot -= PI/30;
  if (zUp) zRot += PI/30;
  if (zDown) zRot -= PI/30;
  if (yUp) yRot += PI/30;
  if (yDown) yRot -= PI/30;
}

void keyPressed(){
  if(keyCode == RIGHT) yUp = true;
  if(keyCode == LEFT) yDown = true;
  if(keyCode == UP) xUp = true;
  if(keyCode == DOWN) xDown = true;
  if(key == 'p') zUp = true;
  if(key == 'o') zDown = true;
}

void keyReleased(){
  if(keyCode == RIGHT) yUp = false;
  if(keyCode == LEFT) yDown = false;
  if(keyCode == UP) xUp = false;
  if(keyCode == DOWN) xDown = false;
  if(key == 'p') zUp = false;
  if(key == 'o') zDown = false;  
}

void mouseWheel(MouseEvent event){
  zoom -= event.getCount() * 10;
}
