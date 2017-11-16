int i=0;
float pi=0;
float camera_X=-100;
float camera_Y=-100;
float camera_Z=-100;
void setup () {
  size(640, 480, P3D);
}

void draw() {
  background(#ffffff);
  pi=i%360;
  camera(100*sin(radians(pi)), camera_Y, 100*cos(radians(pi)), 0, 0, 0, 0, 1, 0);
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
  i++;
}
void mouseDragged() {
  if (mousePressed && mouseButton == RIGHT){
    camera_Y=camera_Y+(mouseY-pmouseY);   
  }
}