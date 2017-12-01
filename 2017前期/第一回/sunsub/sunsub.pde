//上からカンバス横、縦、丸の幅、高さ、色、書く回数、次の丸との間隔
int Sx=950;
int Sy=950;
int Wide=700;
int Height=700;
int R=255;
int G=0;
int B=0;
int loopcount=30;
int between=25;
int deg=0;
void setup(){
  size(950,950);
  background(#ffffff);
  drowingcenterellipse();
  stroke(255,0,0);
  strokeWeight(6);
}
//ここからクラス
//中心部の円
void drowingcenterellipse(){
  noStroke();
  smooth();
    for(int i=0;i<loopcount;i++){
      if(Wide-between*i>=0){
        ellipse(Sx/2,Sy/2,Wide-between*(i-1),Height-between*(i-1));
        G=G+10;
        B=B+10;
        fill(R,G,B);
      }
      else{
        //処理無し
      }
  }
}
//放射状の線
void draw(){
  background(#ffffff);
  translate(Sx/2,Sy/2);
  rotate(deg+PI/360);
  deg++;
  for(int i = 0; i < 36; i++){
    bezier(0,-(Sy/2),-6,-Height/2-((Sy-Height)/6),6,-Height/2-((Sy-Height)/3),0,-(Height/2));
    rotate(PI/18);
  }
}