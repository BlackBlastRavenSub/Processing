int Inputspeed;
int bar1parameter [] ={1,0,10,400,#000000,0};//Inputspeed,Bar_X,Bar_wide,Bar_high,Bar_Color,Goup
  void setup() {
    size(400, 400);
    noStroke();
    fill(#000000);  
  }
//}
Bars bar1=new Bars();
void draw() {
  background(#ffffff);
  bar1.drawing();
}
class Bars {
  int Moveway=-bar1parameter[0];//バーの移動スピード
  int Bar_X=bar1parameter[1];//バーのX座標
  int Bar_wide=bar1parameter[2];//バーの幅
  int Bar_high=bar1parameter[3];//バーの現在の高さ
  int Bar_Color=bar1parameter[4];//バーの色
  int Goup=bar1parameter[5];//0=true,1=false
  Bars() {
    bar1parameter[0]=-bar1parameter[0];
  }
  void drawing() {
    fill(bar1parameter[4]);
    rect(bar1parameter[1], height, bar1parameter[2], bar1parameter[3]);
    if (bar1parameter[5]==0 && bar1parameter[3]>0) {//バーが上昇中
      bar1parameter[0]=bar1parameter[0];
      bar1parameter[5]=0;
      System.out.println("上昇中");
    } else if (bar1parameter[5]==0 && bar1parameter[3]==0) {//バーが天井に接触
      bar1parameter[0]=-bar1parameter[0];
      bar1parameter[5]=1;
      System.out.println("天井");
    } else if (bar1parameter[5]==1 && bar1parameter[3]<height) {//バーが下降中
      bar1parameter[0]=bar1parameter[0];
      bar1parameter[5]=1;
      System.out.println("下降中");
    } else if (bar1parameter[5]==1 && bar1parameter[3]==height) {//バーが地面に接触
      bar1parameter[0]=-bar1parameter[0];
      bar1parameter[5]=0;
      System.out.println("地面");
    } else {//エラー
    System.out.println("エラー");
    }
    bar1parameter[3]=bar1parameter[3]+bar1parameter[0];
  } //<>//
}