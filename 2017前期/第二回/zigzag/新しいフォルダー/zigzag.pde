int Tx1=10;//頂点情報
int Ty1=10;//頂点情報
int Tx2=30;//頂点情報
int Ty2=5;//頂点情報
int Tx3=Tx2;//頂点情報
int Ty3=15;//頂点情報
int trihigh=Ty3-Ty2;//三角形高さ
int i=0;//
int j=8;//繰り返し
int length;
PGraphics basic;
void setup() {
  size(1100, 480);
  noStroke();
  background(#cccccc);
  fill(#000080);
  basic = createGraphics(((Tx2-Tx1)*2)*j+(Tx2-Tx1), (Ty3-Ty2)*4+(Ty3-Ty2)/2);
  Bigline big=new Bigline();
  basic.beginDraw();
  basic.background(#cccccc);//cccccc
  basic.noStroke();
  basic.endDraw();
  big.AsingleLine();
  letsdraw();
}
void letsdraw() {
  translate((((Tx2-Tx1)*2)*j+(Tx2-Tx1))/2, ((Ty3-Ty2)*4+(Ty3-Ty2)/2)/2);
  image(basic, (20-((Tx2-Tx1)*2)*j-(Tx2-Tx1))/2, 10-((Ty3-Ty2)*4-(Ty3-Ty2)/2)/2);
  scale(-1, 1);
  image(basic, 0, 50/*-basic.width,basic.height*/);
  image(basic, 0, 10);
  image(basic, 0, 10);
  resetMatrix();
}
class Bigline {
  /*太い模様一列分の処理
   Tx1~Ty3 最初の三角形の情報
   */
  void onepack() {
    /*
   三角形を横に４つ
     三角20*50
     ウィンドウ1100*480
     */
    basic.fill(#ffffff);
    basic.triangle(Tx1, Ty1, Tx2, Ty2, Tx3, Ty3);
    basic.fill(#ffff00);
    basic.triangle(Tx1+(Tx2-Tx1)*2, Ty1, Tx2, Ty2, Tx3, Ty3);
    basic.fill(#000000);
    basic.triangle(Tx3, Ty3, Tx1+(Tx2-Tx1)*2, Ty1, Tx1+(Tx2-Tx1)*2, Ty3+((Ty3-Ty2)/2));
    basic.fill(#0000ff);
    basic.triangle(Tx3+(Tx2-Tx1)*2, Ty3, Tx1+(Tx2-Tx1)*2, Ty1, Tx1+(Tx2-Tx1)*2, Ty3+((Ty3-Ty2)/2));
    /*
    basic.fill(#ffffff);
     triangle(tripart[0], tripart[1], tripart[2], tripart[3], tripart[4], tripart[5]);
     fill(#ffff00);
     triangle(tripart[0]+(tripart[2]-tripart[1])*2,tripart[1],tripart[2],tripart[3],tripart[4],tripart[5]);
     fill(#000000);
     triangle(tripart[4],tripart[5],tripart[0]+(tripart[2]-tripart[0])*2,tripart[1],tripart[0]+(tripart[2]-tripart[0])*2,tripart[5]+((tripart[5]-tripart[3])/2));
     fill(#0000ff);
     triangle(tripart[4]+(tripart[2]-tripart[0])*2,tripart[5],tripart[0]+(tripart[2]-tripart[0])*2,tripart[1],tripart[0]+(tripart[2]-tripart[0])*2,tripart[5]+((tripart[5]-tripart[3])/2));*/
  }
  void fourbyfour() {
    //onepackを縦に４つ
    for (int I=0; I<4; I++) {
      Ty1=Ty1+trihigh;
      Ty2=Ty2+trihigh;
      Ty3=Ty3+trihigh;
      onepack();
    }
    Ty1=Ty1-trihigh*4;
    Ty2=Ty2-trihigh*4;
    Ty3=Ty3-trihigh*4;
  }
  void AsingleLine() {
    //横一列を画像に書き込み
    basic.beginDraw();
    basic.translate(-Tx1, -Ty1*1.5);
    for (i=j; i>0; i--) {
      fourbyfour();
      basic.translate((Tx2-Tx1)*2, 0);
    }
    basic.resetMatrix();
    basic.endDraw();
  }
}