final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 1;             // vyの初期値の下限
final float vy0max = 2;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
final int N =5;
Ball[] ball;

void setup() {
  
  ball= new Ball[N];
  for (int i=0; i<N; i++)
  {
    ball[i] = new Ball();
  }

  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  for (int i=0; i<N; i++) {
    ball[i].X  = random(d / 2, width - d / 2);     // ボールの中心のx座標
    ball[i].Y  = random(d / 2, height / 5);        // ボールの中心のy座標
    ball[i].VX = random(vx0min, vx0max);           // ボールの速度のx成分
    ball[i].VY = random(vy0min, vy0max);           // ボールの速度のy成分
  }
}

void draw() {
  background(0, 0, 100);
  for (int i=0; i<N; i++) {
    ball[i].Hue++;
    ball[i].Hue=ball[i].Hue%360;
    fill(ball[i].Hue, 100, 100);
    boundBall();
    ellipse(ball[i].X, ball[i].Y, d, d);
  }
}

float calcHue(float vx, float vy) {
  return (sqrt(vx * vx + vy * vy) * 16) % hueMax;
}

void boundBall() {
  for (int i=0; i<N; i++) {
    ball[i].X  += ball[i].VX;          // ボールが速度ぶん移動する
    ball[i].VY += gravity;           // 速度のy成分に重力加速度を加算する
    ball[i].Y  += ball[i].VY;          // ボールが速度ぶん移動する
    if (ball[i].X < d / 2) {
      ball[i].VX = - ball[i].VX * elas;
      ball[i].X = d / 2;
    } else if (ball[i].X > width - d / 2) {
      ball[i].VX = - ball[i].VX  * elas;
      ball[i].X = width - d / 2;
    }
    if (ball[i].Y > height - d / 2) {
      ball[i].VY = -ball[i].VY * elas;
      ball[i].Y = height - d / 2;
    } else if (ball[i].Y < d / 2) {
      ball[i].VY = - ball[i].VY * elas;
      ball[i].Y = d / 2;
    }
  }
}

class Ball {
  float X  =0;
  float Y  =0;
  float VX =0;
  float VY =0;
  int Hue=(int)random(0, 360);
}

boolean isNeighbor(float x1, float y1, float x2, float y2, float distance) {
  float dx = x1 - x2;
  float dy = y1 - y2;
  return dx * dx + dy * dy < distance * distance;
}