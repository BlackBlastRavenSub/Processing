void setup() {
  size(500, 500);
  background(#ffffff);
  //上側のみ
  upside();
  //下側のみ
  downside();
}
void upside() {
  int x1=50;
  int y1=0;
  int x2=0;
  int y2=500;
  for (int i=0; i<10; i++) {
    line(x1, y1, x2, y2);
    x1=x1+50;
    y2=y2-50;
  }
}
void downside() {
  int x1=500;
  int y1=0;
  int x2=450;
  int y2=500;
  for (int i=0; i<10; i++) {
    line(x1, y1, x2, y2);
    x2=x2-50;
    y1=y1+50;
  }
}