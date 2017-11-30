final float fps = 60;            // フレームレート

Human[] someone;

void setup() {
  size(400, 400);                  // ウィンドウのサイズ
  frameRate(fps);
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに
  someone = new Human[5];
  someone[0] = new Human(50,40, 20, 25);// 初期の胴体の長さ,初期の胴体の幅,初期の頭の直径,最終の胴体の長さ,最終の胴体の幅,最終の頭の直径
  someone[1] = new Human(120,40, 20, 25);
  someone[2] = new Human(190,40, 20, 25);
  someone[3] = new Human(260,40, 20, 25);
  someone[4] = new Human(330,40, 20, 25);
}

/**
 *  人の成長を描く
 */
void draw() {
  background(0, 0, 100);      // 背景色(白)
  someone[0].start();
  someone[1].start();
  someone[2].start();
  someone[3].start();
  someone[4].start();
}

class Human {

  int x;               // 人の中心の x座標
  int y = 320;               // 人の足元の y座標
  final float growthRate = 0.004;  // 成長率
  float h;// 初期の胴体の長さ
  float w;// 初期の胴体の幅
  float d;// 初期の頭の直径
  float he;//最終の胴体の長さ
  float we;//最終の胴体の幅
  float de;//最終の頭の直径
  final int H=int(random(0, 361));
  final int S=int(random(0, 101));
  final int B=int(random(0, 101));

  Human(int x,int y,float h, float w, float d, float he, float we, float de) {
    this.y=y;
    this.x=x;
    this.h=h;
    this.w=w;
    this.d=d;
    this.he=he;
    this.we=we;
    this.de=de;
  }

  Human(int x,float h, float w, float d) {
    this.x=x;
    this.h=h;
    this.w=w;
    this.d=d;
    this.he=random(200, 301);
    this.we=random(130, 160);
    this.de=random(40, 51);
  }
  void start(){
  grown();
  drawFigure();
  }
  void grown() {
    if ( h < he )
      h = h * (1.0 + growthRate);
    if ( w < we )
      w = w * (1.0 + growthRate * 0.8);
    if ( d < de )
      d = d * (1.0 + growthRate * 0.5);
  }
  void drawFigure() {
    fill(35, 60, 100);
    ellipse(x, y - this.h, this.d, this.d);           // 顔
    fill(H, S, B);
    ellipse(x, y - this.h / 2 + this.d / 2, this.w, this.h); // 胴体
  }
}