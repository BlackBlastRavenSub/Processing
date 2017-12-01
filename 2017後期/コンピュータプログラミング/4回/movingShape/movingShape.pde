final float radius = 150.0;      // 円の半径
final float dTheta = 3;           // 回転角の増分
final float m = 10.0;           // 正方形の一辺の長さ
float theta;
float Color;
int Count;

void setup() {
  size(400, 400);
  noStroke();
  background(255, 255, 255);
  colorMode(HSB, 360, 100, 100);  // 色の指定をHSBに
  // (色相 0-360, 彩度 0-100, 明度 0-100)

  for (float theta = 0; theta < 360; theta += dTheta) {
    // 中心座標、辺の長さ、色相
  }
}

/**
 *  正方形を描く
 *  @param x 中心のx座標
 *  @param y 中心のy座標
 *  @param m 1辺の長さ
 *  @param h 色相
 */

void draw() {
  if(Count%2==0){
  background(#000000);
  }
  
  theta += dTheta;

  float rad = radians(theta);   // 回転角
  float x = radius * cos(rad);
  float y = -radius * sin(rad);
  drawSquare(x + 200, y + 200, m, theta);
  Count++;
}

void drawSquare(float x, float y, float m, float h) {
  Color=h%360;
  fill(Color, 100, 100);
  for (int i=0; i<15; i++) {
    rect(x -15*i- m / 2, y-15*i - m / 2, m, m);
    
  }
}