final float turtleD  = 100;        // 亀の大きさ(甲羅の直径)
Turtle turtle;

void setup() {
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  turtle = new Turtle(turtleD, width / 2, height - turtleD);
}

void draw() {
  background(0, 0, 100);
  turtle.drawFigure();
  turtle.move();
}

class Turtle {
  final float vx0 = 0;
  final float vy0 = -0.3;
  float x;
  float y;
  float vx;
  float vy;
  float d;
  Shell shell;
  Head head;
  Foot[] foot;
  Turtle(float d, float x, float y) {  // 甲羅の直径と中心の初期位置
    this.d = d;
    this.x = x;
    this.y = y;
    vx = vx0;
    vy = vy0;
    head = new Head(d / 3, 0, - d / 2, x, y);
    shell = new Shell(d, 0, 0, x, y);
    foot=new Foot[4];
    /*for (int i=0; i<4; i++) {
     foot[i]=new Foot(d / 3, 0, - d / 2, x, y);
     }*/
    foot[0]=new Foot(d / 3, 45, - d / 4, x, y);
    foot[1]=new Foot(d / 3, -45, - d / 4, x, y);
    foot[2]=new Foot(d / 3, 35, d / 3, x, y);
    foot[3]=new Foot(d / 3, -35, d / 3, x, y);
  }
  void drawFigure() {
    head.drawFigure();                    // 頭を描画する
    for (int i=0; i<4; i++) {
      foot[i].drawFigure();                   // 足を描画する
    }
    shell.drawFigure();                   // 甲羅を描画する
  }
  void move() {
    // 上端判定
    if (head.getTopY() < 0) {
      vy = 0;
    }
    // 移動
    x += vx;
    y += vy;
    head.move(x, y);                    // 頭を移動する
    shell.move(x, y);                   // 甲羅を移動する
    for (int i=0; i<4; i++) {
      foot[i].move(x, y);                     //足を移動する
    }
  }
}

/** 甲羅 */
class Shell {
  float d;                 // 甲羅の直径
  float x;                 // 甲羅の中心のx座標
  float y;                 // 甲羅の中心のy座標
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  Shell(float d, float offsetX, float offsetY, float baseX, float baseY) { //
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    x = baseX + offsetX;
    y = baseY + offsetY;
  }
  void drawFigure() {
    fill(150, 50, 50);
    ellipse(x, y, d, d);
  }
  void move(float baseX, float baseY) {
    x = baseX + offsetX;
    y = baseY + offsetY;
  }
}

/** 頭 */
class Head {
  float d;                 // 頭の直径
  float x;                 // 頭の中心のx座標
  float y;                 // 頭の中心のy座標
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  Head(float d, float offsetX, float offsetY, float baseX, float baseY) {
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    x = baseX + offsetX;
    y = baseY + offsetY;
  }
  /** 頭頂のy座標を返す */
  float getTopY() {
    return y - d / 2;
  }
  void drawFigure() {
    fill(50, 50, 70);
    ellipse(x, y, d, d);
  }
  void move(float baseX, float baseY) {
    x = baseX + offsetX;
    y = baseY + offsetY;
  }
}

//足
class Foot {
  float d;                 // 足の直径
  float x;                 // 足の中心のx座標
  float y;                 // 足の中心のy座標
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  Foot(float d, float offsetX, float offsetY, float baseX, float baseY) {
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    x = baseX + offsetX;
    y = baseY + offsetY;
  }
  void drawFigure() {
    fill(50, 50, 70);
    ellipse(x, y, d, d);
  }
  void move(float baseX, float baseY) {
    x = baseX + offsetX;
    y = baseY + offsetY;
  }
}