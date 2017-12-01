PShape s;
int N=8;//三角の個数
int Radius=50;//半径
int Pos=0;//現在の三角の数

void setup()
{
  size(640, 480, P3D);

  int Degrees=360/N;
  s = createShape();
  for (int i=0; i<=N; i++) {
  s.beginShape();
  s.vertex(0, 0, 0); 
  s.vertex(Radius*cos(radians(Degrees*Pos)), 0, Radius*sin(radians(Degrees*Pos)));
  s.vertex(Radius*cos(radians(Degrees*(Pos+1))), 0, Radius*sin(radians(Degrees*(Pos+1))));
  s.endShape(CLOSE);
  Pos++;
  }
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

  shape(s);
}