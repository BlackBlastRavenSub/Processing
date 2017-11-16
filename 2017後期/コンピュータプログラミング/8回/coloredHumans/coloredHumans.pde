final int dhumanX = 100;                 // 人の間隔
final int humanY = 300;                  // 人の列のy座標
final int humanBodyWidth = 30;           // 体の幅
final int faceDiameter = 50;             // 顔の直径
int humanX = 150;                        // 人のx座標の初期値

void setup() {
  size(400, 400);                  // ウィンドウのサイズ
  background(255, 255, 255);       // 背景色(白)
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに

  Human man =new Human();
  Human woman =new Human();

  man.bodyHeight = (int)random(150, 190);      // 胴体の長さ
  man.bodyColor = (int)random(120, 240);      // 人の色
  drawHuman(humanX, humanY, man.bodyHeight, man.bodyColor);

  humanX += dhumanX;

  woman.bodyHeight = (int)random(130, 170);      // 胴体の長さ
  woman.bodyColor = (int)random(0, 60);         // 人の色
  drawHuman(humanX, humanY, woman.bodyHeight, woman.bodyColor);
}

class Human {
  int bodyHeight;   // 胴体の長さ
  int bodyColor;    // 人の色
}

/**
 *  人の形を描く(色相はランダム)
 *  @param x 人のx座標(体の中央軸)
 *  @param y 人のy座標(足元)
 *  @param bodyHeight 人の胴体の長さ
 *  @param bodyColor 人の色
 */
void drawHuman(int x, int y, int bodyHeight, int bodyColor) {
  fill(bodyColor, 100, 100);
  ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);                  // 顔
  rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);    // 胴体
}