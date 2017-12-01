int Racket_X;//ラケットのX座標
int Racket_width=30;//ラケットの長さ
int Racket_height=10;//ラケットの厚さ
void setup() {
  frameRate(180);
  size(800, 800);
  Racket_X=width/2;
  noStroke();
  fill(#000000);
}
void draw() {
  background(#ffffff);
  text(frameRate, 10, 10); 
  if (keyPressed) {
    if (keyCode == LEFT&&Racket_X>0) {
      Racket_X=Racket_X-1;
    }
    if (keyCode == RIGHT&&Racket_X+Racket_width<width) {
      Racket_X=Racket_X+1;
    }
  }
  rect(Racket_X, height-Racket_height, Racket_width, Racket_height);
}