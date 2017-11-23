final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 10;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float D = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
Ball Ball0;
StackedBall StackedBall0;

void setup() {
  frameRate(fps);
  size(1280, 640);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  Ball0=new Ball();
  Ball0.setX(random(Ball0.d / 2, width - Ball0.d / 2));     // ボールの中心のx座標
  Ball0.setY(random(Ball0.d / 2, height / 5));     // ボールの中心のy座標
  Ball0.setVX(random(vx0min, vx0max));           // ボールの速度のx成分
  Ball0.setVY(random(vy0min, vy0max));          // ボールの速度のy成分
  Ball0.setd(200);  //ボールの大きさ

  StackedBall0=new StackedBall();
  StackedBall0.setX(random(Ball0.d / 2, width - Ball0.d / 2));     // ボールの中心のx座標
  StackedBall0.setY(random(Ball0.d / 2, height / 5));     // ボールの中心のy座標
  StackedBall0.setVX(0);           // ボールの速度のx成分
  StackedBall0.setVY(0);          // ボールの速度のy成分
  StackedBall0.setd(D);  //ボールの大きさ
}

void draw() {
  background(0, 0, 100);
  Ball0.move();
  fill(0, 0, 0);
  ellipse(Ball0.X, Ball0.Y, Ball0.d, Ball0.d);
  fill(180, 100, 100);
  StackedBall0.move();
  ellipse(StackedBall0.X, StackedBall0.Y, StackedBall0.d, StackedBall0.d);
}

class Ball {
  float X  =0;
  float Y  =0;
  float VX =0;
  float VY =0;
  float d ;
  void setX(float X) {
    this.X = X;
  }
  void setY(float Y) {
    this.Y = Y;
  }
  void setVX(float VX) {
    this.VX = VX;
  }
  void setVY(float VY) {
    this.VY = VY;
  }
  void setd(float D) {
    this.d = D;
  }
  void move() {
    X  += VX;          // ボールが速度ぶん移動する
    VY += gravity;           // 速度のy成分に重力加速度を加算する
    Y  += VY;          // ボールが速度ぶん移動する
    if (X < d / 2) {
      VX = - VX * elas;
      X = d / 2;
    } else if (X > width - d / 2) {
      VX = - VX  * elas;
      X = width - d / 2;
    }
    if (Y > height - d / 2) {
      VY = - VY * elas;
      Y = height - d / 2;
    } else if (Y < d / 2) {
      VY = - VY * elas;
      Y = d / 2;
    }
    System.out.println("X座標は"+X+"."+"Y座標は"+Y+"."+"Xの加速度は"+VX+"."+"Yの加速度は"+VY+"."+"ボールの直径は"+d);
  }
  void draw(float vx, float vy) {
    fill(((sqrt(vx * vx + vy * vy) * 16) % hueMax), 100, 100);
  }
}

class StackedBall {
  float X  =0;
  float Y  =0;
  float VX =0;
  float VY =0;
  float d ;
  void setX(float X) {
    this.X = X;
  }
  void setY(float Y) {
    this.Y = Y;
  }
  void setVX(float VX) {
    this.VX = VX;
  }
  void setVY(float VY) {
    this.VY = VY;
  }
  void setd(float D) {
    this.d = D;
  }
  void move() {
    X += VX;          // ボールが速度ぶん移動する
    Y += VY;          // ボールが速度ぶん移動する
    if (X < d / 2) {
      VX = - VX * elas;
      X = d / 2;
    } else if (X > width - d / 2) {
      VX = - VX  * elas;
      X = width - d / 2;
    }
    if (Y > height - d / 2) {
      VY = - VY * elas;
      Y = height - d / 2;
    } else if (Y < d / 2) {
      VY = - VY * elas;
      Y = d / 2;
    }
    if (Ball0.X-StackedBall0.X>0) {
      VX+=(Ball0.X-StackedBall0.X)*0.001;
    } else if (Ball0.X-StackedBall0.X<=0) {
      VX-=(StackedBall0.X-Ball0.X)*0.001;
    }
    if (Ball0.Y-StackedBall0.Y>0) {
      VY+=(Ball0.Y-StackedBall0.Y)*0.001;
    } else if (Ball0.Y-StackedBall0.Y<=0) {
      VY-=(StackedBall0.Y-Ball0.Y)*0.001;
    }
  }
}