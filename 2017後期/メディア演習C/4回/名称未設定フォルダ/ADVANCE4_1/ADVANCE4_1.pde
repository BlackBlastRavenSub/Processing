int Pos=-50;
int degree = 0;
float rad=0;

void setup()
{
  size(1280, 720, P3D);
  noStroke();
  frameRate(12);
}

void draw() {
  degree = (degree + 1) % 360;
  background(127, 127, 127);
  camera(150, -70, 150, 0, 0, 0, 0, 1, 0);
  pointLight(255, 255, 255, 50, 0, 0);

  pushMatrix();
  rotateY(radians(rad));
  spotLight(255, 0, 0,
              0, -20, 0,
             -1, 0, 0,
             PI/8, 2);
  popMatrix();

  //底面
  beginShape(QUADS);
  for (int h=0; h<50; h++) {
    for (int i=0; i<50; i++) {
      vertex(Pos+i*10, -Pos, Pos+h*10);
      vertex(Pos+i*10, -Pos, Pos+(h+1)*10);
      vertex(Pos+(i+1)*10, -Pos, Pos+(h+1)*10);
      vertex(Pos+(i+1)*10, -Pos, Pos+h*10);
    }
    rad++;
  }

  //右面
  for (int h=0; h<15; h++) {
    for (int i=0; i<50; i++) {
      vertex(Pos+i*10, -(Pos+h*10), Pos);
      vertex(Pos+(i+1)*10, -(Pos+h*10), Pos);
      vertex(Pos+(i+1)*10, -(Pos+(h+1)*10), Pos);
      vertex(Pos+i*10, -(Pos+(h+1)*10), Pos);
    }
  }

  //左面
  for (int h=0; h<15; h++) {
    for (int i=0; i<50; i++) {
      vertex(Pos, -(Pos+h*10), Pos+i*10);
      vertex(Pos, -(Pos+h*10), Pos+(i+1)*10);
      vertex(Pos, -(Pos+(h+1)*10), Pos+(i+1)*10);
      vertex(Pos, -(Pos+(h+1)*10), Pos+i*10);
    }
  }

  //天井
  for (int h=0; h<20; h++) {
    for (int i=0; i<50; i++) {
      int High=15;
      vertex(Pos+i*10, -(Pos+High*10), Pos+h*10);
      vertex(Pos+i*10, -(Pos+High*10), Pos+(h+1)*10);
      vertex(Pos+(i+1)*10, -(Pos+High*10), Pos+(h+1)*10);
      vertex(Pos+(i+1)*10, -(Pos+High*10), Pos+h*10);
    }
  }
  endShape();
}