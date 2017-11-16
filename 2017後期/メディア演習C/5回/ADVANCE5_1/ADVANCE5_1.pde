import ddf.minim.*;
import ddf.minim.ugens.*;

AudioPlayer loopSound;
AudioPlayer ClashSound;
AudioOutput out;
AudioOutput Clashout;
Minim minim;
Minim Clash;

MQOModel Mycar;
MQOModel Enemycar;
PImage Tex;
PImage Gameover_Screen;
float i;
float Coordinate_X;
float Coordinate_Y;
float camera_X=-100;
float camera_Y=-100;
float camera_Z=-100;
int Time=0;
float Player_X;
float Player_Y;
float Enemy_X;
float Enemy_Y;
int Flag=0;
Boolean Enemy_Touch_Wall=false;
Boolean Gameover=false;
Boolean Onetime=false;


void setup()
{
  frameRate(60);
  size(1280, 720, P3D);
  stroke(255, 0, 0);
  Tex = loadImage("road.png");
  Gameover_Screen = loadImage("Gameover.png");
  Mycar = new MQOModel("car.mqo");
  Enemycar = new MQOModel("car.mqo");

  minim = new Minim( this );
  loopSound = minim.loadFile("Sound/RunningCar.mp3");
  out = minim.getLineOut();
  loopSound.loop();
}

void draw() {
  camera(width/2.0, -height*1.2, height / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  background(#ffffff);
  
  if (Gameover==true&& Onetime==false) {
    Gameover();
    Onetime=true;
    resetMatrix();
  } else if (Gameover==false) {
    Game();
  }
  if (Gameover==true) {
    beginShape(QUADS);
    texture(Gameover_Screen);
    vertex(0, 0, 0, 0, 0);
    vertex(width, 0, 0, 640, 0);
    vertex(width, 0, height, 640, 480);
    vertex(0, 0, height, 0, 480);
    endShape();
  }
}

void Mycar() {
  pushMatrix();
  translate(width/2+Coordinate_X, 0, height/2+Coordinate_Y);
  Player_X=width/2+Coordinate_X;
  Player_Y=height/2+Coordinate_Y;
  rotateY( radians( -180.0f));
  Mycar.draw();
  popMatrix();
}

void Game() {
  Time++;
  beginShape(QUADS);
  texture(Tex);
  vertex(-300, 0, -2500, 0, 20+i);
  vertex(1580, 0, -2500, 200, 20+i);
  vertex(1580, 0, 1500, 200, 200+i);
  vertex(-300, 0, 1500, 0, 200+i);
  endShape();
  Mycar();
  if (Enemy_Touch_Wall==false) {
    ObstacleCar();
  } else {
    Enemy_X=(int)random(0, 1400);
    Enemy_Touch_Wall=false;
  }
  if (sqrt((Player_X-Enemy_X)*(Player_X-Enemy_X)+(Player_Y-(Enemy_Y+height/2))*(Player_Y-(Enemy_Y+height/2)))<50) {
    Gameover=true;
  }  
  Text();
  println("Player"+Player_X+"."+Player_Y);
  println("Enemy"+Enemy_X+"."+(Enemy_Y+height/2));
  //車両移動
  if (keyPressed == true&&Coordinate_X>=-800&&Coordinate_X<=800&&Coordinate_Y<=600&&Coordinate_Y>=-1500) { 
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
  if (Coordinate_X<-800) {
    Coordinate_X=-800;
  }
  if (Coordinate_X>800) {
    Coordinate_X=800;
  }
  if (Coordinate_Y>600) {
    Coordinate_Y=600;
  }
  if (Coordinate_Y<-1500) {
    Coordinate_Y=-1500;
  }


  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);

  i--;
  Flag++;
  i=i%20;
  Flag=Flag%31;
}

void Text() {
  fill(#000000);
  textSize(80);
  text("Score"+Time, -500, -450); // 表示するテキスト, x座標, y座標
}

void ObstacleCar() {
  pushMatrix();
  translate(Enemy_X, 0, height/2+Enemy_Y);
  rotateY( radians( -180.0f));
  if (Enemy_Y>600+500) {
    Enemy_Y=-(1500+500);
    Enemy_Touch_Wall=true;
  } else {
    Enemy_Y=Enemy_Y+10;
  }

  Mycar.draw();
  popMatrix();
}
void Gameover() {
  minim.stop();
  Clash = new Minim( this );
  ClashSound = minim.loadFile("Sound/Clash.mp3");
  Clashout = minim.getLineOut();
  ClashSound.loop();
}