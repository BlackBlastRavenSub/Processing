int Human_x = 10;                 // 人の左端の x座標の初期値
int Human_y = 300;                // 人の足元の y座標
int Space = 50;                // 人の中心線間の距離(人A,Bの間の距離)
int[] Human_height;                    // 身長
int Body_wide = 20;                 // 体の幅
int Face_wide = 30;                 // 顔の直径
int Sum;  //合計
int Ave;   //平均
void setup() {
  size(440, 400);             // ウィンドウのサイズ
  background(255, 255, 255);  // 背景色(白)
  noStroke();// 輪郭線を無効に

  Human_height = new int[] { 145, 186, 176, 168, 186, 156, 172 };  // 身長; 人数は7名

  //平均身長を求める
  for (int i = 0; i<Human_height.length; i++) {
    Sum+=Human_height[i];//身長合計
    Ave=Sum/Human_height.length;
  }



  // 人の列を描きながら平均の身長を上回った人の色を変える
  for (int i = 0; i<Human_height.length; i++) {
    if (Ave<Human_height[i]) {
      fill(#113366);//平均以上の人の色
    } else {
      fill(#000000);//平均以下の人の色
    }
    ellipse(Human_x+Body_wide/2, Human_y-Human_height[i]-Face_wide/2, Face_wide, Face_wide);//体描画
    rect(Human_x, Human_y-Human_height[i], Body_wide, Human_height[i]);//頭描画
    Human_x+=Space;//間隔確保
  }
}