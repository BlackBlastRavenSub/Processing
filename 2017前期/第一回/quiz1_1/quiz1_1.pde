/*使用色は中心から
  bbbbfb,bfbffb,c5c5fb,d0d0fc,e2e2fd
  幅は50*10本
 */
void setup(){
  size(500,500);
  noStroke();
  drawing();
}
void drawing(){
  //外から中心へ//
  crect(#e2e2fd,0,0,500,500);
  crect(#d0d0fc,50,50,400,400);
  crect(#c5c5fb,100,100,300,300);
  crect(#bfbffb,150,150,200,200);
  crect(#bbbbfb,200,200,100,100);
  }
void crect(int a,int b,int c,int d,int e){
  // crect(色番号,左上のx座標, 左上のy座標, 幅, 高さ)
  fill(a);
  rect(b,c,d,e);
}