final float vx0min = -7;            // vxの初期値の下限 //<>//
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
//final float D = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
final int MAXBALLNUMBER=200;
int currentBallNumber=1;
int i=1;

Ball[] ball;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  ball=new Ball[MAXBALLNUMBER];
  // ボールの中心のx座標
  // ボールの中心のy座標
  // ボールの速度のx成分
  // ボールの速度のy成分をコンストラクタで決定(コンストラクタがなければランダム)
  ball[0]=new Ball(100, 100, 5, 5);//
  multiplier =new Multiplier();
}

void draw() {
  background(0, 0, 100);
  for (i=1; currentBallNumber>=i; i++) {
    ball[currentBallNumber-i].start();
  }
  i=1;
}

class Ball {
  float X  =0;
  float Y  =0;
  float VX =0;
  float VY =0;
  float d=50 ;
  float bounds;
  int totalBounds;
  float Hue;
  boolean oneshot;

  Ball() {
    this.X = random(this.d/ 2, width - this.d / 2);
    this.Y = random(this.d / 2, height / 5);
    this.VX = random(vx0min, vx0max);
    this.VY = random(vy0min, vy0max);
  }
  Ball(float X, float Y, float VX, float VY) {
    this.X = X;
    this.Y = Y;
    this.VX = VX;
    this.VY = VY;
  }
  Ball(float X, float Y, float VX, float VY,float Hue) {
    this.X = X;
    this.Y = Y;
    this.VX = VX;
    this.VY = VY;
    this.Hue=Hue;
  }


  void start() {
    move();
    ellipse(this.X, this.Y, this.d, this.d);
  }
  void move() {
    this.X  += this.VX;          // ボールが速度ぶん移動する
    this.VY += gravity;           // 速度のy成分に重力加速度を加算する
    this.Y  += this.VY;          // ボールが速度ぶん移動する
    if (this.X < this.d / 2) {
      this.VX = - this.VX * elas;
      this.X = this.d / 2;
      bounds++;
      totalBounds++;
    } else if (this.X > width - this.d / 2) {
      this.VX = - this.VX  * elas;
      this.X = width - this.d / 2;
      bounds++;
      totalBounds++;
    }
    if (this.Y > height - this.d / 2) {
      this.VY = - this.VY * elas;
      this.Y = height - this.d / 2;
      bounds++;
      totalBounds++;
    } else if (this.Y < this.d / 2) {
      this.VY = - this.VY * elas;
      this.Y = this.d / 2;
      bounds++;
      totalBounds++;
    }
    bounds%=3;
    if (bounds==0&&oneshot) {
      Hue+=60;
      Hue%=360;
      oneshot=false;
      if (MAXBALLNUMBER>currentBallNumber) {
        currentBallNumber++;
        ball[currentBallNumber-1]=new Ball(this.X, this.Y, -this.VX, this.VY,this.Hue);//100, 100, 5, 5,this.Hue
      }
    }
    if (bounds==1) {
      oneshot=true;
    }
    fill(Hue, 100, 100);
    System.out.println("X座標は"+this.X+"."+"Y座標は"+this.Y+"."+"Xの加速度は"+this.VX+"."+"Yの加速度は"+this.VY+"."+"ボールの直径は"+this.d+"."+"ボールの色は"+this.Hue+",100,100"+"."+"ボールの合計bound回数は"+this.totalBounds);
  }
}