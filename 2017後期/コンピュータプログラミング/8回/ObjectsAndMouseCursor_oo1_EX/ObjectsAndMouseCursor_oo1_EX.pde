// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas=1;

//final float y0=25;//y座標初期位置
//final float vy0=4;//初速度
// 変数

int fps=60;
int d=40;//直径
float G=0.1;//引力

float Hue=0;
boolean Touch=false;
Bouncy bouncy=new Bouncy();


void setup() {
  size(1280, 1024);
  noStroke();
  fill(0, 0, 0);
  frameRate(fps);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 255);
  bouncy.Task();
}

class Bouncy {
  float X=random(0, 300);// <-- ボールのy座標;                     //ボールのx軸
  float Vx=random(0, 5);// <-- ボールのy座標;                        // <-- ボールの速度のx成分
  float Y=random(0, 300);// <-- ボールのy座標;                         
  float Vy=random(0, 5);// <-- ボールのy座標;                        

  float calcHue(float vy) {
    Hue = sqrt(bouncy.Vx * bouncy.Vx + vy * vy);
    return Hue;
  }

  void Task() {
    check();
    if (Touch == true) {
      fill(0, 100, 100);
      ellipse(bouncy.X, bouncy.Y, d, d);
      return;
    } else {
      fill(180, 100, 100);
    }  
    print(Touch);
    if (bouncy.X>width-d/2) {                       //地面接触
      bouncy.X=width-d/2;
      bound_x();
    }
    if (bouncy.X<0+d/2) {                       //地面接触
      bouncy.X=0+d/2;
      bound_x();
    }
    if (bouncy.Y>height-d/2) {                       //地面接触
      bouncy.Y=height-d/2;
      bound_y();
    }
    if (bouncy.Y<0+d/2) {                             //天井接触
      bouncy.Y=0+d/2;
      bound_y();
    }

    /*vy += gravity;    // <-- 速度に重力加速度を加算する
     */

    bouncy.X +=bouncy.Vx;           // <-- ボールがxの速度ぶん移動する
    bouncy.Y +=bouncy.Vy;//= min(y+vy,height-d/2);          // <-- ボールｙの速度ぶん移動する
    if (bouncy.X>mouseX&&bouncy.Y<mouseY) {
      bouncy.Vx=bouncy.Vx-G;
      bouncy.Vy=bouncy.Vy+G;
    } else if (bouncy.X>mouseX&&bouncy.Y>mouseY) {
      bouncy.Vx=bouncy.Vx-G;
      bouncy.Vy=bouncy.Vy-G;
    } else if (bouncy.X<mouseX&&bouncy.Y>mouseY) {
      bouncy.Vx=bouncy.Vx+G;
      bouncy.Vy=bouncy.Vy-G;
    } else if (bouncy.X<mouseX&&bouncy.Y<mouseY) {
      bouncy.Vx=bouncy.Vx+G;
      bouncy.Vy=bouncy.Vy+G;
    }

    //fill(calcHue(vy)*10, 100, 100);
    print((int)bouncy.Y+".");
    ellipse(bouncy.X, bouncy.Y, d, d);
  }

  void check() {
    if ((mouseX-bouncy.X)*(mouseX-bouncy.X)+(mouseY-bouncy.Y)*(mouseY-bouncy.Y)<(d/2)*(d/2)&&mousePressed) {
      Touch=true;
    } else {
      Touch=false;
    }
  }

  void bound_y() {
    bouncy.Vy=-bouncy.Vy*elas;
  }

  void bound_x() {
    bouncy.Vx=-bouncy.Vx*elas;
  }
}