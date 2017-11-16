size (500, 500);
colorMode(HSB, 360, 256, 256);
background(0);
smooth();
translate(100, 400);

for (int i = 0; i < 36; i++) {
  scale(1.1);
  rotate(PI/18);
  stroke(10 * i, 255, 255, 102);
  line(0, 0, 20, 0);
}