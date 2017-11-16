int i=0; //<>//
int x=0;
int y=0;
int number_x=20;
int number_y=20;
int rect_width;
int rect_height;
boolean MAX=true;
Integer Color[][] =new Integer[number_x][3];

void setup() {
  size(900, 900);
  noStroke();
  rect_width=width/number_x;
  rect_height=height/number_y;
  background(#ffffff);

  for (; i<number_x; i++) {
    Color[i][0]=(int)(random(256));
    Color[i][1]=(int)(random(256));
    Color[i][2]=(int)(random(256));
  }
  i=0;
}
void draw() {
  if (i>number_x-1) {
    i=0;
    ;
  } else {
  }
vertica:
  while (y<height) {
  sideline:
    while (x<width) {
      fill(Color[i][0], Color[i][1], Color[i][2]);
      i++;
      rect(x, y, rect_width, rect_height);
      x=x+rect_width;
      delay(100);
      return;
    }
    x=0;
    y=y+rect_height;
    i++;
    return;
  }
  //background(#ffffff);
  delay(5000);
  x=0;
  y=0;
}