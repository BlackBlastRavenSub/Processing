int a=0;
int b=0;
int c=0;
int d=0;
int size=500;
void setup() {
  size(500, 500);
  noStroke();
  c=c+size/5;
  d=d+size/5;
  background(#FFFFFF);
  fill(#000080);
  drawing();
}
void drawing() {
  for (int loop=0; loop<5; loop++) {
    rect(a, b, c, d);
    a=a+size/5;
    b=b+size/5;
  }
}