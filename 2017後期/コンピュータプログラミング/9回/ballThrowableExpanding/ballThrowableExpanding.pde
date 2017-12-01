final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
Ball Ball0;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  Ball0=new Ball();
  Ball0.setX(random(d / 2, width - d / 2));     // ボールの中心のx座標の設定
  Ball0.setY(random(d / 2, height / 5));     // ボールの中心のy座標の設定
  Ball0.setVX(random(vx0min, vx0max));           // ボールの速度のx成分の設定
  Ball0.setVY(random(vy0min, vy0max));          // ボールの速度のy成分の設定
  Ball0.setD(d);          // ボールの直径
}

void draw() {
  background(0, 0, 100);
  Ball0.move();
}

class Ball {
  float X  =0;// ボールの中心のx座標
  float Y  =0;// ボールの中心のy座標
  float VX =0;// ボールの速度のx成分
  float VY =0;// ボールの速度のy成分
  float D=0;//ボールの直径
  boolean Expand=true;
  boolean Switch=false;
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
  void setD(float D) {
    this.D = D;
  }
  boolean isNeighbor(float x1, float y1, float x2, float y2, float distance) {
  float dx = x1 - x2;
  float dy = y1 - y2;
  return dx * dx + dy * dy < distance * distance;
}
  void move() {
    if (isNeighbor(Ball0.X, Ball0.Y, mouseX, mouseY, D / 2)) {
    fill(0, 100, 100);
    catchBall();
    if(Expand==true){
      D+=0.2;
      Switch=true;
    }else{
      D-=0.2;
      Switch=true;
    }
    
  } else {
    fill(180, 100, 100);
    boundBall();
    if(Switch==true&&Expand==true){
    Switch=false;
    Expand=false;
    }
    if(Switch==true&&Expand==false){
    Switch=false;
    Expand=true;
    }
  }
    //draw(VX,VY);
    ellipse(Ball0.X, Ball0.Y, D, D);
  }
  void boundBall(){
    X+= VX;          // ボールが速度ぶん移動する
    VY += gravity;           // 速度のy成分に重力加速度を加算する
    Y  += VY;          // ボールが速度ぶん移動する
    if (X < D / 2) {
      VX = - VX * elas;
      X = D / 2;
    } else if (X > width - D / 2) {
      VX = - VX  * elas;
      X = width - D / 2;
    }
    if (Y > height - D / 2) {
      VY = - VY * elas;
      Y = height - D / 2;
    } else if (Y < D / 2) {
      VY = - VY * elas;
      Y = D / 2;
    }
  }
  void catchBall(){
    X+=(mouseX-pmouseX);
    Y+=(mouseY-pmouseY);
    VX=(mouseX-pmouseX);
    VY=(mouseY-pmouseY);
  }
  void draw(float vx, float vy) {
    fill(((sqrt(vx * vx + vy * vy) * 16) % hueMax), 100, 100);
  }
}