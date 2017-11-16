// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas=0.98;

final float y0=20;//y座標初期位置
final float vy0=4;//初速度
// 変数
float y;                         // <-- ボールのy座標
float vy;                        // <-- ボールの速度のy成分

int fps=60;
int d=40;//直径
int x=100;//ボールのx軸
int Hue=0;


void setup() {
  size(200, 480);
  noStroke();
  fill(0, 0, 0);

  frameRate(fps);
  y=y0;
  vy=vy0;
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 255);
  vy += gravity;    // <-- 速度に重力加速度を加算する
  if (y>height-(d/2)) {
    bound();
  }
  y += vy;          // <-- ボールが速度ぶん移動する
  fill(calcHue(vy)*10, 100, 100);
  print(calcHue(vy));
  ellipse(x, y, d, d);
}

void bound() {
  vy=-vy*elas;
}

float calcHue(float vy) {
  Hue = (int)Math.abs(vy);
  return Hue;
}