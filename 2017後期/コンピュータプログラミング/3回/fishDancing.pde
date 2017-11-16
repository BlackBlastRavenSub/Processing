// 魚の中心の y座標
fish fish1 = new fish(50);
fish fish2 = new fish(100);
fish fish3 = new fish(150);
fish fish4 = new fish(200);
fish fish5 = new fish(250);
fish fish6 = new fish(300);
fish fish7 = new fish(350);
fish fish8 = new fish(400);
fish fish9 = new fish(450);
fish fish10 = new fish(500);

void setup() {
  size(1200, 600);             // ウィンドウのサイズ
  noStroke();                 // 輪郭線を無効に
  // 背景色
  fill(63, 31, 31);           // 塗る色
  
}

void draw() {
  background(63, 63, 255);
  fish1.start();
  fish2.start();
  fish3.start();
  fish4.start();
  fish5.start();
  fish6.start();
  fish7.start();
  fish8.start();
  fish9.start();
  fish10.start();
}

class fish {
   fish(int Yzahyou){
    y = Yzahyou;
  }
  private int y;
  // 定数
  final int[] fish = new int[] {     // 魚の形状 (体の中心=原点)
    0, 0, 70, 30, // 胴体の相対位置(x,y)・横幅・縦幅
    -38, 0, 15, 25                   // 尾びれの相対位置(x,y)・横幅・縦幅
  };
  final int bodyX = 0;
  final int bodyY = 1;
  final int bodyLength = 2;
  final int bodyWidth = 3;
  final int finX = 4;
  final int finY = 5;
  final int finLength = 6;
  final int finWidth = 7;
  float Time;//何秒間動いた？
  boolean move = false;
  // 変数
  float x;                             // 魚の中心の x座標
  void start() {
    if (mouseX>x && x<width-30) {
      Time=Time+0.1;
    } else if (mouseX<x && x>30) {
      Time=Time-0.1;
    }
    // 魚の姿の描画
    x = Time * 50 + 100;
    println("(" + x + "," + y + ")");
    ellipse(x + fish[bodyX], y + fish[bodyY], fish[bodyLength], fish[bodyWidth]);   // 胴体
    if (mouseX>x) {
      ellipse(x + fish[ finX], y + fish[ finY], fish[ finLength], fish[ finWidth]);   // 尾びれ
    }
    if (mouseX<x) {
      ellipse(x - fish[ finX], y + fish[ finY], fish[ finLength], fish[ finWidth]);   // 尾びれ
    }
  }

  void mousePressed() {
    if (move==false) { //クリックする前がオフの時
      move=true;     //クリックしたらオンの状態に変更する
    } else {           //クリックする前がオンの時
      move=false;    //クリックしたらオフの状態に変更する
    }
  }
}