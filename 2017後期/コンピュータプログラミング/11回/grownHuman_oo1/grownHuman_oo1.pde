final float fps = 60;            // フレームレート

Human someone;

void setup() {
  size(400, 400);                  // ウィンドウのサイズ
  frameRate(fps);
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに
  someone = new Human(40, 20, 25, 240, 140, 50);// 初期の胴体の長さ,初期の胴体の幅,初期の頭の直径,最終の胴体の長さ,最終の胴体の幅,最終の頭の直径
}

/**
 *  人の成長を描く
 */
void draw() {
  background(0, 0, 100);      // 背景色(白)
  someone.grown();            // 人を成長させる
  someone.drawFigure(someone);         // 人を描く
}

class Human {

  final int x = 200;               // 人の中心の x座標
  final int y = 320;               // 人の足元の y座標
  final float growthRate = 0.004;  // 成長率
  float h;// 初期の胴体の長さ
  float w;// 初期の胴体の幅
  float d;// 初期の頭の直径
  float he;//最終の胴体の長さ
  float we;//最終の胴体の幅
  float de;//最終の頭の直径

  Human(float h, float w, float d, float he, float we, float de) {
    this.h=h;
    this.w=w;
    this.d=d;
    this.he=he;
    this.we=we;
    this.de=de;
  }
  void grown() {
    if ( h < he )
      h = h * (1.0 + growthRate);
    if ( w < we )
      w = w * (1.0 + growthRate * 0.8);
    if ( d < de )
      d = d * (1.0 + growthRate * 0.5);
  }
  void drawFigure(Human a) {
    fill(35, 60, 100);
    ellipse(x, y - a.h, a.d, a.d);           // 顔
    fill(220, 87, 100);
    ellipse(x, y - a.h / 2 + a.d / 2, a.w, a.h); // 胴体
  }
}