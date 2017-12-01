int i=0;
float pi=0;
int Pos=-50;
int degree = 0;


void setup()
{
  size(1280, 720, P3D);
  noStroke();
}

void draw() {
  colorMode(HSB);
  pi=i%360;
  degree = (degree + 1) % 360;
  background(200, 100, 100);
  camera(150, -70, 150, 0, 0, 0, 0, 1, 0);
  pointLight(200, 100, 300, 50, 0, 0);
  shininess(50);

  //光の色、ライトの位置、ライトの方向、コーンの角度、指数
  pushMatrix();
  translate(100, -300, 100);
  spotLight(i*3%360, 300, 300, 0, 0, 0, 50*sin(radians(pi)), 90, 50*cos(radians(pi)), 0.5, 100);
  spotLight(i*0.5%360, 300, 300,0, 0, 0, 50*sin(radians(pi+120)), 70, 50*cos(radians(pi+120)), 0.5, 100);
  spotLight(i*1%360, 300, 300, 0, 0, 0, 50*sin(radians(pi-120)), 110, 50*cos(radians(pi-120)), 0.5, 100);
  
  spotLight(i*1%360, 300, 300, 0, 0, 0, 50*-sin(radians(pi)), 90, 50*cos(radians(pi)), 0.5, 100);
  spotLight(i*3%360, 300, 300,0, 0, 0, 50*-sin(radians(pi+120)), 70, 50*cos(radians(pi+120)), 0.5, 100);
  spotLight(i*0.5%360, 300, 300, 0, 0, 0, 50*-sin(radians(pi-120)), 110, 50*cos(radians(pi-120)), 0.5, 100);
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
  i++;
}