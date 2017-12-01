int Inputspeed; //<>//
Bars bar1=new Bars(true, 4, 50,  50, 0, #000fff);//バーの上下判定,バーの移動スピード,バーのX座標,バーの幅,バーの現在の高さ,バーの色
Bars bar2=new Bars(true, 5, 130, 50, 0, #000fff);
Bars bar3=new Bars(true, 6, 210, 50, 0, #000fff);
Comparison con=new Comparison();
void setup() {
  size(400, 600);
  noStroke();
  fill(#000000);
}
void draw() {
  background(#ffffff);
  con.comparison();
  bar1.drawing();
  bar2.drawing();
  bar3.drawing();
  
}
public class Bars {
  boolean Goup;
  int Moveway;//バーの移動スピード
  int Bar_X;//バーのX座標
  int Bar_wide;//バーの幅
  int Bar_high;//バーの現在の高さ
  int Bar_Color;//バーの色
  Bars(boolean Goup, int Moveway, int Bar_X, int Bar_wide, int Bar_high, int Bar_Color) {
    this.Goup=Goup;
    this.Moveway =Moveway;      //バーの移動スピード
    this.Bar_X=Bar_X;            //バーのX座標
    this.Bar_wide=Bar_wide;      //バーの幅
    this.Bar_high=Bar_high;      //バーの現在の高さ
    this.Bar_Color=Bar_Color;    //バーの色
  }
  void drawing() {
    fill(Bar_Color);
    rect(Bar_X, height, Bar_wide, Bar_high);
    if (Goup==true && Bar_high+height>=0) {//バーが上昇中
      Moveway=Moveway;
      Goup=true;
      System.out.println("上昇中");
    } else if (Goup==true && Bar_high+height<0) {//バーが天井に接触
      Moveway=-Moveway;
      Goup=false;
      System.out.println("天井");
    } else if (Goup==false && Bar_high+height<=height) {//バーが下降中
      Moveway=Moveway;
      Goup=false;
      System.out.println("下降中");
    } else if (Goup==false && Bar_high+height>height) {//バーが地面に接触
      Moveway=-Moveway;
      Goup=true;
      System.out.println("地面");
    } else {//エラー
      System.out.println("エラー");
    }
    Bar_high=Bar_high-Moveway;
  }
}

int maxheight;
public class Comparison {
  void comparison(){
    maxheight=bar2.Bar_high;
    if (maxheight>bar2.Bar_high){maxheight=bar2.Bar_high;}
    if (maxheight>bar3.Bar_high){maxheight=bar3.Bar_high;}
    if (maxheight>bar1.Bar_high){maxheight=bar1.Bar_high;}
    drowing();
  }
  void drowing(){
    fill(#cccccc);
    rect(0,height,width,maxheight);
    }
}