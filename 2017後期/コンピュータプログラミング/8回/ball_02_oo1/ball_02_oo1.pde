final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
Ball Ball0 = new Ball();

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  Ball0.X  = random(d / 2, width - d / 2);     // ボールの中心のx座標
  Ball0.Y  = random(d / 2, height / 5);        // ボールの中心のy座標
  Ball0.VX = random(vx0min, vx0max);           // ボールの速度のx成分
  Ball0.VY = random(vy0min, vy0max);           // ボールの速度のy成分
}

void draw() {
  background(0, 0, 100);
  boundBall();
  fill(calcHue(Ball0.VX, Ball0.VY), 100, 100);
  ellipse(Ball0.X, Ball0.Y, d, d);
}

float calcHue(float vx, float vy) {
  return (sqrt(vx * vx + vy * vy) * 16) % hueMax;
}

void boundBall() {
  Ball0.X  += Ball0.VX;          // ボールが速度ぶん移動する
  Ball0.VY += gravity;           // 速度のy成分に重力加速度を加算する
  Ball0.Y  += Ball0.VY;          // ボールが速度ぶん移動する
  if (Ball0.X < d / 2) {
    Ball0.VX = - Ball0.VX * elas;
    Ball0.X = d / 2;
  } else if (Ball0.X > width - d / 2) {
    Ball0.VX = - Ball0.VX  * elas;
    Ball0.X = width - d / 2;
  }
  if (Ball0.Y > height - d / 2) {
    Ball0.VY = - Ball0.VY * elas;
    Ball0.Y = height - d / 2;
  } else if (Ball0.Y < d / 2) {
    Ball0.VY = - Ball0.VY * elas;
    Ball0.Y = d / 2;
  }
}

class Ball {
  float X  =0;
  float Y  =0;
  float VX =0;
  float VY =0;
}