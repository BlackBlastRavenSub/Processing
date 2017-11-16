int i=0;
float pi=0;
void setup () {
  size(640, 480, P3D);
}

void draw() {
  background(#ffffff);
  pi=i%360;
  camera(100*sin(radians(pi)), -100,100*cos(radians(pi)) , 0, 0, 0, 0, 1, 0);//X,Y,Z
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
  i++;
}