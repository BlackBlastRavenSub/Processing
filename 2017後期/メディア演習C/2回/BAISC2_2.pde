PShape s;
PShape Square;
int N=10;//三角の個数
int Radius=30;//半径

void setup()
{
  size(640, 480, P3D);

  int Degrees=360/N;
  s = createShape();
  //上の三角形
  for (int i=0; i<=N; i++) {
    s.beginShape();
    s.vertex(0, -50, 0); 
    s.vertex(Radius*cos(radians(Degrees*i)), -50, Radius*sin(radians(Degrees*i)));
    s.vertex(Radius*cos(radians(Degrees*(i+1))), -50, Radius*sin(radians(Degrees*(i+1))));
    s.endShape(CLOSE);
  }//ここまで
  //横の四角
  Square = createShape();
   Square.beginShape(QUADS);
  for (int i=0; i<N; i++) {
   
    Square.vertex(Radius*cos(radians(Degrees*i)), 50, Radius*sin(radians(Degrees*i)));
    Square.vertex(Radius*cos(radians(Degrees*i)), -50, Radius*sin(radians(Degrees*i)));
    Square.vertex(Radius*cos(radians(Degrees*(i+1))), -50, Radius*sin(radians(Degrees*(i+1))));
    Square.vertex(Radius*cos(radians(Degrees*(i+1))), 50, Radius*sin(radians(Degrees*(i+1))));
   
  }//ここまで
   Square.endShape();
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
  shape(Square);
}