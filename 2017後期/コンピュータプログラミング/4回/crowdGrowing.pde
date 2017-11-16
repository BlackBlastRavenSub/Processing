final int humanX0 = 50;                  // 人のx座標の初期値
final int dhumanX = 50;                  // 人の間隔
final int humanY0 = 300;                 // 人の列のy座標
final int humanBodyWidth = 20;           // 体の幅
final int faceDiameter = 30;             // 顔の直径
final int n = 1;                         // 人数
float Color;//色相
float humanBodyHeight;
float humanX;
float humanY;

void setup() {
  frameRate(10);
  size(600, 600);                  // ウィンドウのサイズ
  background(255, 255, 255);       // 背景色(白)
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに
  for (int i=0; i<n; i++) {
  }
}

void draw() {
  Color=random(0, 360);
  humanBodyHeight = (int)random(50, 250);// 胴体の長さ
  drawHumanSequence(humanBodyHeight, Color);
}

/**
 *  人の形を描く(色相はランダム)
 *  @param x 人のx座標(体の中央軸)
 *  @param y 人のy座標(足元)
 *  @param bodyHeight 人の胴体の長さ
 */
void drawHumanSequence(float humanBodyHeight, float Color) {
  for (int i = 0; i < n; i++) {
    humanX=(int)random(0, 400);
    humanY=(int)random(0, 400);
    drawHuman(humanX, humanY, humanBodyHeight, Color);     // 人の描画
  }
}

void drawHuman(float x, float y, float bodyHeight, float Color) {
  fill(Color, 100, 100);                    // 色相引数
  ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);                  // 顔
  rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);    // 胴体
}