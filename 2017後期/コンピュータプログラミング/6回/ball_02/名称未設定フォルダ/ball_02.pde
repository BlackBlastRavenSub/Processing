float[] ball0 = new float[4];      //x座標、y座標、速度のx成分、速度のy成分
// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas=0.98;

final float y0=25;//y座標初期位置
final float vy0=4;//初速度

int fps=60;
int d=40;//直径

float Hue=0;


void setup() {

  // 変数
  ball0[0]=100;                     //ボールのx軸 x
  ball0[1]=1;                        // <-- ボールの速度のx成分 vx
  ball0[2]=0;                         // <-- ボールのy座標 y
  ball0[3]=0;                        // <-- ボールの速度のy成分 vy
  size(480, 480);
  noStroke();
  fill(0, 0, 0);

  frameRate(fps);
  ball0[2]=y0;
  ball0[3]=vy0;
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 255);
  boundBall(ball0);
  fill(calcHue(ball0)*10, 100, 100);
  print((int)ball0[2]+".");
  ellipse(ball0[0], ball0[2], d, d);
}

void bound_y() {
  ball0[3]=-ball0[3]*elas;
}

void bound_x() {
  ball0[1]=-ball0[1]*elas;
}

float calcHue(float ball0[]) {
  Hue = sqrt(ball0[1] * ball0[1] + vy * vy);
  return Hue;
} 

void boundBall(float ball0[]) {
  if (ball0[0]>width-d/2) {                       //右端接触
    ball0[0]=height-d/2;
    bound_x();
  }
  if (ball0[0]<0+d/2) {                       //左端接触
    ball0[0]=0+d/2;
    bound_x();
  }
  if (ball0[2]>height-d/2) {                       //地面接触
    ball0[2]=height-d/2;
    bound_y();
  }
  if (ball0[2]<0+d/2) {                             //天井接触
    ball0[2]=0+d/2;
    bound_y();
  }
  ball0[3] += gravity;    // <-- 速度に重力加速度を加算する
  ball0[0] +=ball0[1];           // <-- ボールがxの速度ぶん移動する
  ball0[2] +=ball0[3];//= min(y+vy,height-d/2);          // <-- ボールｙの速度ぶん移動する
}