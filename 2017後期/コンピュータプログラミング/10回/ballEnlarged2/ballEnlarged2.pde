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

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  Ball0=new Ball();
  Ball0.setX(random(D / 2, width - D / 2));     // ボールの中心のx座標
  Ball0.setY(random(D / 2, height / 5));     // ボールの中心のy座標
  Ball0.setVX(random(vx0min, vx0max));           // ボールの速度のx成分
  Ball0.setVY(random(vy0min, vy0max));          // ボールの速度のy成分
}

void draw() {
  background(0, 0, 100);
  Ball0.move();
  //Ball0.draw(Ball0.VX, Ball0.VY);
  ellipse(Ball0.X, Ball0.Y, Ball0.d, Ball0.d);
}

class Ball {
  float X  =0;
  float Y  =0;
  float VX =0;
  float VY =0;
  float d=0;
  boolean Expand=true;
  boolean Switch=false;
  final float MAXEXPAND=150;
  final float MINEXPAND=30;
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
    expand();
    X  += VX;          // ボールが速度ぶん移動する
    VY += gravity;           // 速度のy成分に重力加速度を加算する
    Y  += VY;          // ボールが速度ぶん移動する
    if (X < d / 2) {
      VX = - VX * elas;
      X = d / 2;
      if (Expand==true) {
        Expand=false;
      } else if (Expand==false) {
        Expand=true;
      }
    } else if (X > width - d / 2) {
      VX = - VX  * elas;
      X = width - d / 2;
      if (Expand==true) {
        Expand=false;
      } else if (Expand==false) {
        Expand=true;
      }
    }
    if (Y > height - d / 2) {
      VY = - VY * elas;
      Y = height - d / 2;
      if (Expand==true) {
        Expand=false;
      } else if (Expand==false) {
        Expand=true;
      }
    } else if (Y < d / 2) {
      VY = - VY * elas;
      Y = d / 2;
      if (Expand==true) {
        Expand=false;
      } else if (Expand==false) {
        Expand=true;
      }
    }
  }
  void draw(float vx, float vy) {
    fill(((sqrt(vx * vx + vy * vy) * 16) % hueMax), 100, 100);
  }
  void expand() {
    if (d<=MAXEXPAND&&Expand==true) {
      Expand=true;
    }
    if (d>MAXEXPAND&&Expand==true) {
      Expand=false;
    }
    if (d>=MINEXPAND&&Expand==false) {
      Expand=false;
    }
    if (d<MINEXPAND&&Expand==false) {
      Expand=true;
    }

    if (Expand==true) {
      fill(0, 100, 100);
      d+=0.3;
    }
    if (Expand==false) {
      fill(180, 100, 100);
      d-=0.3;
    }
  }
}