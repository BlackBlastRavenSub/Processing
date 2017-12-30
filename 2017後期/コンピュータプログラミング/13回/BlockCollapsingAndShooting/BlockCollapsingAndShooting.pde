/*授業で使用したコードに機能を付け足しました!・・・時間とスキルの関係で物凄く未完成です・・・*/

// ブロック崩し本体
BlockBreak blockBreak;

// セットアップ
void setup() {
  size(1024, 768);         // ウインドウ設定
  fill(0, 0, 0);          // 塗りつぶし初期値
  blockBreak = new BlockBreak();
}

// 1フレームごとの描画処理
void draw() {
  background(255, 255, 255);      // 背景の初期化(フラッシュ)
  blockBreak.draw();
}

/**
 * ブロック崩し
 */
class BlockBreak {
  //ブロック数設定
  final int blockNumX = 41;                           // x軸方向のブロック数(適当に変えてもOK)
  final int blockNumY = 10;                            // y軸方向のブロック数(適当に変えてもOK)
  final int blockNumAll = blockNumX * blockNumY;      // 総ブロック数
  //ブロック関連の初期値や固定値の設定
  final int blockX_init = 0;                          // ブロック位置x軸初期値
  int blockX = 0;                                     // ブロック位置x軸
  int blockY = 35;                                    // ブロック位置y軸
  // 各オブジェクト定義
  Ball ball;                                          // ボール定義
  Bar bar;                                            // バー定義
  Cannon cannon;                                      //砲定義
  Block[][] block;                                    // ブロック配列定義

  // コンストラクタ
  BlockBreak() {
    // ボールの生成
    ball = new Ball(width / 4, height / 3, 4, 5, 10);//// ボールのX座標,ボールのY座標,ボールのX軸速度,ボールのY軸速度,ボールの直径
    // バーの生成
    bar = new Bar(width / 5, height / 100);
    //砲の生成
    //cannon = new Cannon(width / 15, height / 70);
    // ブロック配列を生成
    block = new Block[blockNumY][blockNumX];
    // ブロックのサイズを決定
    int blockSizeX = width / (blockNumX-1);
    int blockSizeY = height / 30;
    // ブロック群を生成 [回答欄]
    for (int i=0; i<blockNumY; i++) {
      for (int j=0; j<blockNumX; j++) {
        block[i][j]= new Block(j*blockSizeX, i*blockSizeY, blockSizeX, blockSizeY);
      }
    }
  }

  /** 1フレームごとの描画処理 */
  void draw() {
    int breakBlockNum = 0;          // 壊れているブロックの数を初期化

    // 全てのブロックの破壊判定と描画
    // クリアしているかの判定のため、壊れているブロックの数をカウントもしておく
    // ヒント: ブロックが消滅している場合、ブロックの衝突判定も描画も行わない
    for (int i=0; i<blockNumY; i++) {
      for (int j=0; j<blockNumX; j++) {
        if (!block[i][j].isdestroyed()) {
          block[i][j].show();
          block[i][j].collision(ball);
        }
      }
    }


    // ブロックが残っているならばボール移動
    if (breakBlockNum < blockNumAll) {
      ball.move();                            // ボールの移動処理
      if (ball.collision() == false) {         // 壁との衝突判定
        fill(0, 0, 0);
        textSize(35);
        textAlign(CENTER, CENTER);
        text("Game Over!!", width / 2, height / 2);
      } else {
        bar.collision(ball);                    // バーとの衝突判定
        //cannon.collision(ball);                 //キャノンとの衝突判定
      }
    } else {  // ブロックがすべて壊れているならば
      textSize(35);
      textAlign(CENTER, CENTER);                // テキストの配置を整える
      text("Clear!!", width / 2, height / 2);   // クリア表示
    }

    fill(0, 0, 0);
    textSize(12);
    textAlign(CENTER, CENTER);
    text("Block:" + (blockNumAll - breakBlockNum), width - 40, height - 25);   // 残りブロック数表示

    bar.show();            // ボールを打ち返すためのボードを表示
    //cannon.blast();        //撃て!!
    //cannon.show();
    ball.show();           // ボールの描画
  }
}

/**
 *    ボール（主にボールの移動）
 */
class Ball {
  int x;                          // ボールのX座標
  int y;                          // ボールのY座標
  int vx;                         // ボールのX軸速度
  int vy;                         // ボールのY軸速度
  int d;                          // ボールの直径
  boolean penetrability;          // ボールのブロック貫通性

  // コンストラクタ
  Ball(int x, int y, int vx, int vy, int d) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.d = d;
    penetrability = false;
  }

  // ボールの移動
  void move() {
    x += vx;
    y += vy;
  }

  // 壁との衝突判定
  boolean collision() {
    if (x <= d / 2) {  // 左壁
      x = d / 2;
      vx = -vx;
    }
    if (y <= d / 2) {  // 天井
      y = d / 2;
      vy = -vy;
    }    
    if (x >= (width - d / 2)) {  // 右壁
      x = width - d / 2;
      vx = -vx;
    }
    if (y >= (height - d / 2)) {  // 底面(ゲームオーバー)
      vx = 0;
      vy = 0;
      return false;
    }
    return true;
  }

  // ボールの描画
  void show() {
    if (penetrability) {
      fill(255, 0, 0);        //　貫通弾の時は赤
    } else {
      fill(0, 0, 0);          //　通常時は黒
    }
    ellipse(x, y, d, d);      // ボールの描画
  }

  // これ以降、SetterとGetter
  int getX() {
    return x;
  }
  void setY(int y) {
    this.y = y;
  }
  int getY() {
    return y;
  }
  void setVx(int vx) {
    this.vx = vx;
  }
  int getVx() {
    return vx;
  }
  void setVy(int vy) {
    this.vy = vy;
  }
  int getVy() {
    return vy;
  }
  int getD() {
    return d;
  }
  void setPenetrability(boolean penetrability) {
    this.penetrability = penetrability;
  }
  boolean getPenetrability() {
    return penetrability;
  }
}

/**
 *    バー
 */
class Bar {
  final int y = height - 60;    // バーの左上のy座標 (底から60で固定)
  int sizeX;                    // バー全体の幅(なるべく5の倍数が良い)
  int sizeY;                    // バーの高さ
  int boxSizeX;                 // 分割した時の箱一つ分の幅(全体の1/5)
  int[] boxX;   // バーの各区切りのx座標(左から0)

  Bar(int sizeX, int sizeY) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    boxSizeX = sizeX / 5;
    boxX = new int[6];
  }

  void collision(Ball ball) {
    if ((ball.getY() >= (y - ball.getD() / 2)) &&
      (ball.getY() <= (y + sizeY - ball.getD() / 2))) {  // ボールのy座標がバーと重なる時
      if ((ball.getX() >= boxX[0]) && (ball.getX() <= boxX[1])) {  // 左黒Boxに衝突
        ball.setVx(-2);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      } else if ((ball.getX() > boxX[1]) && (ball.getX() <= boxX[2])) {   // 左白Boxに衝突
        ball.setVx(-1);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      } else if ((ball.getX() > boxX[2]) && (ball.getX() <= boxX[3])) {   // 中心赤Boxに衝突
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(true);     // ボールのブロック貫通性あり
      } else if ((ball.getX() > boxX[3]) && (ball.getX() <= boxX[4])) {   // 右白Boxに衝突
        ball.setVx(1);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      } else if ((ball.getX() > boxX[4]) && (ball.getX() <= boxX[5])) {   // 右黒Boxに衝突
        ball.setVx(2); 
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
    }
  }

  // バー表示メソッド
  void show() {
    boxX[0] = mouseX - this.sizeX / 2;            // 左黒Boxの左上頂点のx座標
    boxX[1] = mouseX - 3 * (boxSizeX / 2);     // 左白Boxの左上頂点のx座標
    boxX[2] = mouseX - boxSizeX / 2;           // 中央赤Boxの左上頂点のx座標
    boxX[3] = mouseX + boxSizeX / 2;           // 右白Boxの左上頂点のx座標
    boxX[4] = mouseX + 3 * (boxSizeX /2);      // 右黒Boxの左上頂点のx座標
    boxX[5] = mouseX + this.sizeX / 2;            // 右黒Boxの"右上"頂点のx座標

    // バーの描画
    fill(0, 0, 0);
    rect(boxX[0], y, boxSizeX, sizeY);        // 左黒Box
    fill(255, 255, 255);
    rect(boxX[1], y, boxSizeX, sizeY);        // 左白Box
    fill(255, 0, 0);
    rect(boxX[2], y, boxSizeX, sizeY);        // 中央赤Box
    fill(255, 255, 255);
    rect(boxX[3], y, boxSizeX, sizeY);        // 右黒Box
    fill(0, 0, 0);
    rect(boxX[4], y, boxSizeX, sizeY);        // 右白Box
  }

  int getX(int i) {
    return boxX[i];
  }
  int getY() {
    return y;
  }
  int getSizeX() {
    return sizeX;
  }
  int getSizeY() {
    return sizeY;
  }
}

class Cannon {
  final int y = height - 70;    // キャノンの左上のy座標 (底から60で固定)
  int sizeX;                    // キャノン全体の幅(なるべく5の倍数が良い)
  int sizeY;                    // キャノンの高さ
  int boxSizeX;                 // 分割した時の箱一つ分の幅(全体の1/5)
  int[] boxX;   // キャノンの各区切りのx座標(左から0)
  int maxProjectileNumber=50;//画面に表示できる最大の弾丸
  int currentProjectileNumber;//現在有効な(画面上にある)弾丸
  int i;
  Projectile[] projectile;


  Cannon(int sizeX, int sizeY) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    boxSizeX = sizeX / 5;
    boxX = new int[4];
    projectile=new Projectile[maxProjectileNumber];
  }

  void collision(Ball ball) {
    if ((ball.getY() >= (y - ball.getD() / 2)) &&
      (ball.getY() <= (y + sizeY - ball.getD() / 2))) {  // ボールのy座標がキャノンと重なる時
      if ((ball.getX() >= boxX[0]) && (ball.getX() <= boxX[1])) {  // 左Boxに衝突
        ball.setVx(-1);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        //ball.setPenetrability(false);    // ボールのブロック貫通性なし
      } else if ((ball.getX() > boxX[1]) && (ball.getX() <= boxX[2])) {   // 中心Box(弾丸発射部分)に衝突
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        // ball.setPenetrability(true);     // ボールのブロック貫通性あり
      } else if ((ball.getX() > boxX[2]) && (ball.getX() <= boxX[3])) {   // 中心赤Boxに衝突
        ball.setVx(1);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        //ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
    }
  }

  //弾丸系メソッド
  void blast() {
    if (keyPressed&&maxProjectileNumber>currentProjectileNumber) {
      currentProjectileNumber++;
      projectile[currentProjectileNumber-1]=new Projectile();
    }else if(maxProjectileNumber>currentProjectileNumber){
      
    
    }
    {
    }
    for (i=1; currentProjectileNumber>=i; i++) {
      projectile[currentProjectileNumber-i].move();
      projectile[currentProjectileNumber-i].view();
    }
    i=1;
  }

  // キャノン表示メソッド
  void show() {
    boxX[0] = mouseX - 3 * (boxSizeX / 2);     // 左Boxの左上頂点のx座標
    boxX[1] = mouseX - boxSizeX / 2;           // 中央Boxの左上頂点のx座標
    boxX[2] = mouseX + boxSizeX / 2;           // 右Boxの左上頂点のx座標
    boxX[3] = mouseX +boxSizeX+(boxSizeX / 2); // 右Boxの"右上"頂点のx座標

    // キャノンの描画
    fill(255, 255, 255);
    rect(boxX[0], y, boxSizeX, sizeY);        // 左Box
    fill(255, 255, 255);
    rect(boxX[1], y, boxSizeX, sizeY);        // 中央Box
    fill(255, 255, 255);
    rect(boxX[2], y, boxSizeX, sizeY);        // 右Box
  }

  int getX(int i) {
    return boxX[i];
  }
  int getY() {
    return y;
  }
  int getSizeX() {
    return sizeX;
  }
  int getSizeY() {
    return sizeY;
  }

 //弾丸に関するクラス
  class Projectile {
    int bullet_x;//弾丸のx座標
    int bullet_y;//弾丸のy座標
    int bullet_vx;//x速度
    int bullet_vy;//y速度
    int bullet_d=10;//弾丸のサイズ
    boolean hit=false;//何かに当たった？
    boolean inscreen;//画面の中にある？
   
    Projectile() {
      bullet_x=boxX[1]+boxSizeX/2;
      bullet_vx=(mouseX-pmouseX);
      bullet_y=height - 70;
    }
    void move() {
      if (this.bullet_x < this.bullet_d / 2) {
        this.bullet_vx=-this.bullet_vx;
        this.bullet_x = this.bullet_d / 2;
      } else if (this.bullet_x > width - this.bullet_d / 2) {
        this.bullet_vx=-this.bullet_vx;
        this.bullet_x = width - this.bullet_d / 2;
      }
      if(bullet_y<0){
        hit=false;
      }
      bullet_x=bullet_vx;
      bullet_y-=5;
    }
    void view() {
      fill(50, 100, 100);
      ellipse(this.bullet_x, this.bullet_y, this.bullet_d, this.bullet_d);
    }
  }
}

/**
 *    ブロック（ボールとブロックの衝突判定など）
 */
class Block {
  int x;                       // 左上頂点のx座標
  int y;                       // 左上頂点のy座標
  int sizeX;                   // ブロックの幅
  int sizeY;                   // ブロックの高さ
  boolean broken;              // ブロックが破壊されているか否か
  boolean destroyed;           //ブロックが完膚なきまでに粉砕されているか否か
  int damage=0;                  //ブロックが攻撃を何回喰らったか

  // コンストラクタ
  Block(int x, int y, int sizeX, int sizeY) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    broken = false;
    destroyed = false;
  }

  // ブロックの描画メソッド
  void show() {
    if (!broken) {
      switch(damage) {
      case 0:
        fill(0, 0, 255);       // ブロックの色は青(ノーダメージ)
        break;
      case 1:
        fill(150, 0, 200);       // ブロックの色は紫(小破)
        break;
      case 2:
        fill(240, 0, 255);       // ブロックの色はピンク(中破)
        break;
      }
    } else {
      fallen();
    }
    rect(x, y, sizeX, sizeY);
  }

  // ボールとブロックとの衝突と破壊判定
  // 今回,ボールの衝突判定はボールの中心座標のみで行っている
  void collision(Ball ball) {
    // ボールが貫通弾でないなら、衝突した際にボールの進行方向を変える(速度を変える)
    if (!ball.getPenetrability()) {
      // ブロック左側に当たった場合
      if ((ball.getX() >= x) && (ball.getX() <= (x + 5)) && (ball.getY() >= y) && (ball.getY() <= (y + sizeY))) {
        ball.setVx(-1 * ball.getVx());
      }
      // ブロック右側に当たった場合
      if ((ball.getX() >= (x + sizeX - 5)) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y+sizeY))) {
        ball.setVx(-1 * ball.getVx());
      }
      // ブロック上側に当たった場合
      if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y + 5))) {
        ball.setVy(-1 * ball.getVy());
      }
      // ブロック下側に当たった場合
      if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= (y + sizeY - 5)) && (ball.getY() <= (y + sizeY))) {
        ball.setVy(-1 * ball.getVy());
      }
    }

    // 衝突による破壊判定
    if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y + sizeY))) {
      if (this.damage>=2||ball.penetrability) {
        broken = true;
      }
      damage++;
    }
  }
  boolean isBroken() {
    return broken;
  }
  boolean isdestroyed() {
    return destroyed;
  }

  void fallen() {
    y++;
  }
}