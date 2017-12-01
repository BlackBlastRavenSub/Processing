// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas=1;

final float y0=25;//y座標初期位置
final float vy0=4;//初速度
// 変数
float x=100;                     //ボールのx軸
float vx=4;                        // <-- ボールの速度のx成分
float y;                         // <-- ボールのy座標
float vy;                        // <-- ボールの速度のy成分

int fps=60;
int d=40;//直径

float Hue=0;
boolean Touch=false;


void setup() {
  size(480, 480);
  noStroke();
  fill(0, 0, 0);

  frameRate(fps);
  y=y0;
  vy=vy0;
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 255);
  if (x>width-d/2) {                       //地面接触
    x=height-d/2;
    bound_x();
  }
  if (x<0+d/2) {                       //地面接触
    x=0+d/2;
    bound_x();
  }
  if (y>height-d/2) {                       //地面接触
    y=height-d/2;
    bound_y();
  }
  if (y<0+d/2) {                             //天井接触
    y=0+d/2;
    bound_y();
  }
  vy += gravity;    // <-- 速度に重力加速度を加算する
  x +=vx;           // <-- ボールがxの速度ぶん移動する
  y +=vy;//= min(y+vy,height-d/2);          // <-- ボールｙの速度ぶん移動する
  //fill(calcHue(vy)*10, 100, 100);
  print((int)y+".");
  ellipse(x, y, d, d);
  check();
  if (Touch == true) {
    fill(0, 100, 100);
  } else {
    fill(180, 100, 100);
  }  
  print(Touch);
}

void bound_y() {
  vy=-vy*elas;
}

void bound_x() {
  vx=-vx*elas;
}

float calcHue(float vy) {
  Hue = sqrt(vx * vx + vy * vy);
  return Hue;
}

void check() {
  if ((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y)<(d/2)*(d/2)) {
    Touch=true;
  } else {
    Touch=false;
  }
}