int Fps = 24;          // フレーム数/秒  (1フレームごとにサイコロを振る前提)
int Vertical_space = 60;// 行の間隔
int Ellipse_height = 20;           // 度数1当りの棒グラフの長さ
int Ellipse_wide= 40;            // 円の幅(1カウント当りの円の長さ)
int Dicesides = 6;     // サイコロの面の数
int Margintop = 30;    // 上の余白
int Marginleft = 25;   // 左の余白 (文字を除く)
int Marginchar = 15;   // 文字の左余白
int[] Count;            // サイコロの目ごとの回数を格納

void setup () {
  size(640, 400);
  frameRate(Fps);
  noStroke();
  background(255, 255, 255);
  colorMode(HSB, 360, 100, 100);
  Count = new int[Dicesides];//配列の大きさをサイコロの目の数で指定
  for (int i = 0; i < Count.length; i++) {
    Count[i] = 0;
  }
}
void draw() {
  int Dicevalue = (int)random(0, Dicesides);  // サイコロを降って出た目の値 [0 以上 (diceSides - 1) 以下の整数] 
  Count[Dicevalue]++;                          // 出たサイコロの目の数を配列に1追加する
  for (int i = 0; i < Count.length; i++) {      // 行(サイコロの目)ごとの繰り返し
    int y = Margintop + i * Vertical_space;       // 棒の中心のy座標

    // 行ラベル
    fill(0, 0, 0);                    // 文字の色は黒
    textSize(16);
    text(i + 1, Marginchar, y + Ellipse_wide / 2);       // 棒の左に i + 1 を表示

    // 円の描画
    int Eclipse_Totalwide = Count[i] * Ellipse_wide;             // 円の個数×円1つあたりの大きさ=円全体のx方向に対する長さ
    if (Marginleft + Eclipse_Totalwide + Ellipse_wide > width) {    // 次が書けないほど右に来ているか? (width はウィンドウの幅)
      fill(0, 0, 0);                  // 色を黒に変更
      noLoop();                       // draw() を呼び出す繰り返しは今回で終わり＝アニメーション終了
    } else {
      fill(360 * i / Dicesides, 100, 100);    // 棒ごとに色相を変更
    }
    if (Count[i]>0) {
      ellipse(Marginleft+Eclipse_Totalwide, y, Ellipse_wide, Ellipse_wide);// 円の中心の座標、横幅、縦幅
    } else {
      ;
    }
  }
}