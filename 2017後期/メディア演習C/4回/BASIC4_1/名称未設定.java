PShape Test;
int N=8;//三角の個数
int Radius=50;//半径
int Pos=0;//現在の三角の数

void setup()
{
  size(1440, 900, P3D);
  //noStroke();
  Test=createShape();
  Test.beginShape(TRIANGLE_STRIP);
  for (int i=1; i<80; i++) {
    for (int j=0; j<100; j++) {
      Test.vertex(-800+j*10, 0, -500+(i-1)*20);
      Test.vertex(-800+j*10, 0, -500+i*20); 
    }
  }
  Test.endShape();
}

void draw()
{
  background(127, 127, 127);
  camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);

  //pointLight(255, 255, 255, 0, -40, 0);
  shape(Test);
}