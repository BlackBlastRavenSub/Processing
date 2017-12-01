final int x0 = 50;                          // 人の中心の x座標の初期値
final int y = 300;                          // 人の足元の y座標
final int dx = 50;                          // 人の中心線間の距離
final int humanBodyWidth = 20;              // 体の幅
final int faceDiameter = 30;                // 顔の直径
final int[] humanBodyHeight = new int[] {   // 胴体の長さ; 人数は7名
  145, 186, 176, 168, 186, 156, 172
};
void setup() {
  size(400, 400);             // ウィンドウのサイズ
  background(255, 255, 255);  // 背景色(白)
  noStroke();                 // 輪郭線を無効に

  // 最も背が高い人の位置を求める
  int index = searchMaximum(humanBodyHeight, 0);
  // その人と先頭の人の胴体の長さを入れ替える
  int temp = humanBodyHeight[0];
  humanBodyHeight[0] = humanBodyHeight[index];
  humanBodyHeight[index] = temp;

  // 人の列を描く
  fill(0, 0, 0);                                                         // 塗る色 (黒)
  int x = x0;
  for (int i = 0; i < humanBodyHeight.length; i++) {
    ellipse(x, y - humanBodyHeight[i], faceDiameter, faceDiameter);      // 頭
    rect(x - humanBodyWidth / 2, y - humanBodyHeight[i], 
      humanBodyWidth, humanBodyHeight[i]);                            // 胴体
    x = x + dx;
  }
}

/**
 * 配列のn番目以降の要素の最大値の位置を返す
 * @param a 配列
 * @param n 探索開始位置
 * @return 配列の要素の最大値の位置
 */
int searchMaximum(int[] a, int n) {
  int max = a[n];                             // 最も高い値
  int index = n;                              // 最も高い値の位置
  for (int i = n + 1; i < a.length; i++) {
    if (a[i] > max) {
      max = a[i];
      index = i;
    }
  }
  return index;
}