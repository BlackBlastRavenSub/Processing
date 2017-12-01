MQOModel Mycar;
PImage Tex;
float i;
float Coordinate_X;
float Coordinate_Y;

float camera_X=-100;
float camera_Y=-100;
float camera_Z=-100;

void setup()
{
  size(1280, 720, P3D);
  stroke(255, 0, 0);
  Tex = loadImage("road.png");
  Mycar = new MQOModel("car.mqo");
}

void draw() {
  camera(width/2.0, -height*1.2, height / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //noStroke();
  background(#ffffff);

  beginShape(QUADS);
  texture(Tex);
  vertex(-300, 0, -2500, 0, 20+i);
  vertex(1580, 0, -2500, 200, 20+i);
  vertex(1580, 0, 1500, 200, 200+i);
  vertex(-300, 0, 1500, 0, 200+i);
  endShape();
  Mycar();
  //車両移動
  if (keyPressed == true) { 
    if (key == CODED) {
      switch (keyCode) {
      case UP:
        Coordinate_Y -= 10;
        break;
      case DOWN:
        Coordinate_Y += 10;
        break;
      case LEFT:
        Coordinate_X -= 10;
        break;
      case RIGHT:
        Coordinate_X += 10;
        break;
      }
    }
  }

  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);

  i--;
  i=i%20;
}

void Mycar() {
  pushMatrix();
  translate(width/2+Coordinate_X, 0, height/2+Coordinate_Y);
  rotateY( radians( -180.0f));
  //rotateX( radians( 90.0f ));
  Mycar.draw();
  popMatrix();
}