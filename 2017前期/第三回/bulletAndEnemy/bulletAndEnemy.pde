//enemy
int r=0;//円の半径
float x=0; 
float y=0;//x,y座標
int Angle=90;//角度(360度)
float radian=0;//角度(ラジアン)
int Rh=70; //(四角形高さ)
int Rw=Rh; //(四角形幅)
//bullet
int X=mouseX;
//int Y=mouseY;
int BH=8;//弾丸高さ
int BW=6;//弾丸横
int Bx;//弾丸横座標
int By;//弾丸縦座標
int Px;//自機座標
int Py;//自機座標
boolean alive=false;//弾丸の発射状態

Player P1=new Player();
Enemy E1=new Enemy();
void setup() {
  size(800, 800);
  Bx=mouseX;
  By=height-BH;
  noStroke();
  fill(#000000);
  r=(width-Rw)/2;
}
void draw() {
  background(#ffffff);
  P1.draw();
  E1.Enemy();
  if (alive == true) {
    //弾丸描画
    By=By-5;
    rect(Bx, By, BW, BH);
  } else {
    //弾丸描画中止
    Bx=mouseX;
    By=height-BH;
  }
  if (By<0) {
    //弾丸は画面外
    alive=false;
  } else {
    //処理無し
  }
}
class Player {
  void draw() { 
    rect(Px, Py, BW, BH);
    Px=mouseX;
    Py=height-BH;
    if (mousePressed == true) {
      alive=true;
    } else {
      //発射していないため処理無し
    }
  }
}
class Enemy {
  void Enemy() {
    rect(x+((width-Rw)/2), y, Rw, Rh);
    Angle++;
    radian = radians(Angle);
    x=r*cos(radian);
  }
}