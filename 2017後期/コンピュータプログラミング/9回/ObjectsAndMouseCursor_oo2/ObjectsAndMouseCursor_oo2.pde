final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float hueMax = 360.0;         // 色相の最大値

PFont font;
Ball Ball0;

void setup() {
  frameRate(fps);
  size(1280, 640);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  
  font = createFont("Osaka",48,true); //フォントを指定
  textFont(font); 
  
  Ball0=new Ball();
}

void draw() {
  if (mousePressed == true){
    background(0, 0, 100);
  }else{
   background(0, 0, 0);
  }
  fill(0, 0, 100);
  Ball0.move();
  fill(0,0,0);
  textSize(100);
  text("夜だ、視界が悪い！",width/2-550,height/2-150);
  text("サーチライトを使え！！",width/2-550,height/2);
  text("by:17FI084,野田翔太郎",width/2-550,height/2+150);
}

class Ball {
  final float d = 150;                 // ボールの直径
  float X  =mouseX;
  float Y  =mouseY;
  float slow =0.05;
  void move() {
    X+=(mouseX-X)*slow;
    Y+=(mouseY-Y)*slow;
    ellipse(this.X, this.Y, d, d);
  }
}