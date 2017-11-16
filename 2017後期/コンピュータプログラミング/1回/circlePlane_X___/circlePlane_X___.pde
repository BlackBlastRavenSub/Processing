int Circle_X=10;//円の中心のX座標
int Circle_Y;//円の中心のY座標
int Circle_Wide=5;//円の幅(直径)
int Circle_Height=5;//円の高さ(直径)
int WidePlus=2;//円の幅の一回あたりの増加値
int HeightPlus=2;//円の高さの一回あたりの増加値
int R=255;//円の色
int G=0;//円の色
int B=0;//円の色
int n=20;//円の描画回数
void setup(){
  size(950,950);
  background(#ffffff);
  noStroke();
  smooth();
  Circle_Y=10+(Circle_Height+WidePlus*(n-1))/2;
 for(int i=0;i<n;i++){
   //円の描画
   fill(R,G,B);
   ellipse(Circle_X,Circle_Y,Circle_Wide,Circle_Height);
   
   //変数変更
     //色について(circlePlaneでは使用しない)
     //X座標について
     Circle_X=Circle_X+Circle_Wide/2;
     Circle_Wide=Circle_Wide+WidePlus;
     Circle_Height=Circle_Height+HeightPlus;
     Circle_X=Circle_X+Circle_Wide/2+10;
     //Y座標について
     
     
 } 
}