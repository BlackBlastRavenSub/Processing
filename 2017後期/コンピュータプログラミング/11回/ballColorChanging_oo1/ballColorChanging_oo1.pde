final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float D = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
Ball Ball0;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  // ボールの中心のx座標
  // ボールの中心のy座標
  // ボールの速度のx成分
  // ボールの速度のy成分をコンストラクタで決定(コンストラクタがなければランダム)
  Ball0=new Ball(100, 100, 5, 5);//
  Ball0.setd(D);  //ボールの大きさ
}

void draw() {
  background(0, 0, 100);
  Ball0.move();
  Ball0.draw();
  ellipse(Ball0.X, Ball0.Y, Ball0.d, Ball0.d);
}

class Ball {
  float X  =0;
  float Y  =0;
  float VX =0;
  float VY =0;
  float d ;
  float bounds;
  float Hue;
  boolean oneshot;
  void setd(float D) {
    this.d = D;
  }

  Ball(float X, float Y, float VX, float VY) {
    this.X = X;
    this.Y = Y;
    this.VX = VX;
    this.VY = VY;
  }
  Ball() {
    this.X = random(this.d/ 2, width - this.d / 2);
    this.Y = random(this.d / 2, height / 5);
    this.VX = random(vx0min, vx0max);
    this.VY = random(vy0min, vy0max);
  }

  void move() {
    X  += VX;          // ボールが速度ぶん移動する
    VY += gravity;           // 速度のy成分に重力加速度を加算する
    Y  += VY;          // ボールが速度ぶん移動する
    if (X < d / 2) {
      VX = - VX * elas;
      X = d / 2;
      bounds++;
    } else if (X > width - d / 2) {
      VX = - VX  * elas;
      X = width - d / 2;
      bounds++;
    }
    if (Y > height - d / 2) {
      VY = - VY * elas;
      Y = height - d / 2;
      bounds++;
    } else if (Y < d / 2) {
      VY = - VY * elas;
      Y = d / 2;
      bounds++;
    }
    bounds%=3;
    if (bounds==0&&oneshot) {
      Hue+=60;
      Hue%=360;
      oneshot=false;
    }
    if (bounds==1) {
      oneshot=true;
    }
    System.out.println("X座標は"+X+"."+"Y座標は"+Y+"."+"Xの加速度は"+VX+"."+"Yの加速度は"+VY+"."+"ボールの直径は"+d+"."+bounds+"."+Hue);
  }
  void draw() {
    fill(Hue, 100, 100);
  }
}