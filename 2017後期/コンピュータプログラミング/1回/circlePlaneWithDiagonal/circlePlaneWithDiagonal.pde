int Circle_X=10;//円の中心のX座標
int Circle_Y;//円の中心のY座標
int Circle_Wide=5;//円の幅(直径)
int Circle_Height=5;//円の高さ(直径)
int WidePlus=2;//円の幅の一回あたりの増加値
int HeightPlus=2;//円の高さの一回あたりの増加値
int R=0;//円の色
int G=0;//円の色
int B=255;//円の色
int n_X=12;//円の横の描画回数
int n_Y=12;//円の縦の描画回数
int ColorChange=0;
void setup(){
  size(450,450);
  background(#ffffff);
  noStroke();
  smooth();
  int XX=(Circle_Height+WidePlus*(n_X-1))/2;
  Circle_Y=10+(Circle_Height+WidePlus*(n_X-1))/2;
  
  //描画処理
  for(int j=0;j<n_Y;j++){
     drow_X();
    //変数変更
      //Yについて
       Circle_Y=Circle_Y+10+XX*2;
  }
}
void drow_X(){
for(int i=0;i<n_X;i++){
     //円の描画
     fill(R,G,B);
     if(ColorChange==i){
       fill(255,0,0);  
       }else{
       fill(R,G,B);
       }
     ellipse(Circle_X,Circle_Y,Circle_Wide,Circle_Height);
   
     //変数変更
       //色について(circlePlaneでは使用しない)
       
       //X座標について
       Circle_X=Circle_X+Circle_Wide/2;
       Circle_Wide=Circle_Wide+WidePlus;
       Circle_Height=Circle_Height+HeightPlus;
       Circle_X=Circle_X+Circle_Wide/2+10;
    }
    //初期化
       Circle_X=10;
       Circle_Wide=5;
       Circle_Height=5;
       ColorChange=ColorChange+1;
      
  }