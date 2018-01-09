import controlP5.*; //<>//
ControlP5 cp5;
String stage;//今ゲームが何段階目まで進行しているか
PFont TimesNewRoman;
PFont Migu;
PFont Migubold;
Howto howto;
Game game;
Door[] door;
void setup() {
  frameRate(2);
  cp5=new ControlP5(this);
  size(1280, 640);

  size(1280, 640);
  fill(#000000);
  TimesNewRoman = loadFont("TimesNewRomanPS-BoldMT-48.vlw");
  Migu=loadFont("migu-1m-regular-48.vlw");
  Migubold=loadFont("migu-1m-bold-48.vlw"); 
  textFont(TimesNewRoman);
  background(255, 255, 255);
  howto=new Howto();
  game=new Game();

  stage="title";//タイトル画面
}
void draw() {
  background(255, 255, 255);
  game.game();//ゲーム処理!
  System.out.println(game.stage);
}
//なんかTitleクラス内に入れると反応しないからここに置いた(本当はTitleクラス内で管理したい)
class Howto {
  int stage;//現在の段階
  Howto() {  
    howto();
  }
  void howto() {
    //ゲームの概要
    textFont(Migu);
    textSize(35);
    String reference="皆さんは「モンティ・ホール問題」と呼ばれるものを聞いたことがありますか？"
      +"\n例えば・・・皆さんの前に3つの箱があり、そのうち1つにはお宝が入っています。"
      +"\nまず、みなさんはその中から1つを選びます。すると、あなたが選んでいないハズレの箱が一つ開きます。"
      +"/nそして、あなたはもう一度箱を選び直すことができます"
      +"/nその場合、箱を選び直した場合と選び直さなかった場合ではどちらのほうが当たる確率が高いか？と言うものです"
      +"/nそんなわけで、今回はそれをモチーフにしたゲームを作成しました";
    text(reference, 0, 40);
  }
}
class Game {
  int id;
  int correct;
  int level;//現在のステージ
  String stage;//現在の段階
  int select;//選ばれたドア


  Game() {
    door=new Door[100];//ドアの作成
    for (int i=0; i<100; i++) {
      id=i+1;
      door[i]=new Door(id);//ドアのID設定
    }
    for (int i=0; i<10; i++) {
      int j;
      for (j=0; j<10; j++) {
        cp5.addButton("door_"+(i*10+j+1))
          .setLabel("door_"+(i*10+j+1))
          .setPosition(10+i*50, 10+j*60)
          .setSize(40, 50);
      }
      j=0;
    }
    level=1;
    stage="start";
  }
  void game() {
    if (stage.equals("start")) {
      startgame();
    }
    if (stage.equals("nodooropen")) {
      nodooropen();
    }
    if (stage.equals("onedooropen")) {
      onedooropen();
    }
    if (stage.equals("result")) {
    }

    text("", 10, 35);
  }
  void startgame() {
    for (int i=0; i>100; i++) {
      door[i].correct=false;
      door[i].push=false;
      door[i].open=false;
    }
    correct=(int)random(100);
    door[correct].correct=true;//正解のドアを決定する
    stage="nodooropen";
  }
  void nodooropen() {
    //ここなら反応する
    if (door[0].push=true) {
        stage="onedooropen";
      }
    for (int i=0; i>100; i++) {
      //ここだと反応しない
      if (door[i].push=true) {
        stage="onedooropen";
      }
    }
  }
  void onedooropen() {
    text("あなたが選んだドアは"+select+"だ", 10, 35);
    System.out.println("あなたが選んだドアは"+select+"だ");
  }
  void gameover() {
  }
}
class Door {
  final int ID;//ドアの固有ID
  boolean correct=false;//正解のドアか？
  boolean push=false;//押されたか？
  boolean open=false;//開かれているか？
  Door(int id) {
    //ID設定
    this.ID=id;
  }
  void pushed() {
    push=true;
    open=true;
    game.select=ID;
    System.out.println("Door"+ID+"PUSH!");
  }
}

void door_1() {
  door[0].pushed();
}
void door_2() {
  door[1].pushed();
}
void door_3() {
  door[2].pushed();
}