size (400, 400);
background(255, 255, 255);
smooth();
noStroke();
fill(0, 0, 0);

int xMin=30;
int yMin = 30;
int rMin=3;
int dx =30;
int dy=30;
int dr = 2;
int n =12;

int y = yMin;
for (int i = 0; i<n; i++) {
  int x=xMin;
  int r=rMin;
  for (int j=0; j<n; j++) {
    ellipse(x, y, r, r);
    x+=dx;
    r+=dr;
  }
  y+=dy;
}