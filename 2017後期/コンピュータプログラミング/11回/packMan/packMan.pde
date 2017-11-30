final int fps = 60;
Packman ownMachine;
Packman enmityMachine;
void setup() {
  size(400, 400);
  frameRate(fps);
  int d = 20;
  float x= d/2; 
  float y = 200; 
  float vx = 1; 
  ownMachine = new Packman(d, x, y, vx);
  enmityMachine = new Packman(40, 350);
}
void draw() {
  background(255);
  ownMachine.move();
  ownMachine.drawPackman();
  enmityMachine.move(); 
  enmityMachine.drawPackman();
}

class Packman { 
  int d;
  float x;
  float y;
  float vx;
  Packman(int d, float x, float y, float vx) {
    this.d = d; 
    this.x = x; 
    this.y = y; 
    this.vx = vx;
  }
  Packman(int d, float y) { 
    this(d, d / 20, y, 3);
  }

  void drawPackman() {
    noStroke();
    fill(0, 0, 0);
    arc(x, y, d, d, PI / 6 * 1, PI / 6 * 11);
  }
  void move() {
    x += vx;
  }
}