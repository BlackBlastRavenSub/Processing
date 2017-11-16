size(600, 600);

stop:
for (int y = 50; y <= 450; y = y + 50) {
  line(50, y, 450, y);
  if (y<=400) {
    //処理無し
  } else {
    break stop;
  } 
  for (int x = 50; x <= 450; x = x + 50) {
    line(x, y, x, y+50);
    if (x<=400) {
    } else {
      break;
    } 
    fill(255, 255, 255);
    ellipse(x+25, y+25, 40, 40);
  }
}