int x;
int y;
int speed_x;
int speed_y;
void setup() {
  size(480, 120);
  noStroke();
  fill(0, 0, 0);
  x = 20;
  y=20;
  speed_x = 1;
  speed_y = 2;
}

void draw() {
  if (x <= 20){
    speed_x = 1;     // <-- ウィンドウの左端に着いたら、方向を右にする
  }
  if (x >= width-20){
    speed_x = -1;    // <-- ウィンドウの右端に着いたら、方向を左にする
  }
  if (y <= 20){
    speed_y = 1;     // <-- ウィンドウの上端に着いたら、方向を下にする
  }
  if (y >= height-20){
    speed_y = -1;    // <-- ウィンドウの下端に着いたら、方向を上にする
  }
  x += speed_x;
  y += speed_y;
  background(255, 255, 255);
  ellipse(x, y, 40, 40);
}