void setup(){
  size(480,120);
  noStroke(); 
  background(204,226,225);
  drowin();
}
void drowin(){
  //赤、緑、青//
  cellipse(255,0,0,120,80);
  cellipse(0,255,0,210,0);
  cellipse(0,0,255,240,120);
}
void cellipse(int a,int b,int c, int x,int y){
    //a,b,c=カラー x,y=座標
    fill(a,b,c,150);
    ellipse(x,y,190,190);
}