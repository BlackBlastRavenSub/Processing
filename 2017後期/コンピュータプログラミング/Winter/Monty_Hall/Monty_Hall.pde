import controlP5.*;
String stage;//今ゲームが何段階目まで進行しているか
ControlP5 cp5;
Title title;
Game game;

void setup() {
  Door[] door;
  cp5=new ControlP5(this);

  int id;
  int correct;
  door=new Door[100];
  for (int i=0; i<100; i++) {
    id=i+1;
    door[i]=new Door(id);
  }
  correct=(int)random(100);
  door[correct].correct=true;


  size(1280, 640);
  fill(#000000);
  PFont myFont = loadFont("TimesNewRomanPS-BoldMT-48.vlw");
  textFont(myFont);
  background(255, 255, 255);
  title=new Title(); 
  game=new Game();

  stage="title";//タイトル画面
}
void draw() {
  background(255, 255, 255);
  if (stage.equals("title")) {
    title.title();//タイトル画面
  }
  if (stage.equals("play")) {
    game.stageStart();//ゲームスタート!
  }
  System.out.println(stage);
}
//なんかTitleクラス内に入れると反応しないからここに置いた(本当はTitleクラス内で管理したい)
void play() {
  stage="main";//ゲーム本編
  System.out.println("play");
  stage="play";
  cp5.remove("play");
  cp5.remove("howto");
}
void howto() {
}

class Title {

  Title() {
    cp5.addButton("play")
      .setLabel("START")
      .setPosition(50, 50)
      .setSize(300, 200);
    //void start(){}
    cp5.addButton("howto")
      .setLabel("Howtoplay")
      .setPosition(350, 50)
      .setSize(300, 200);
    //void howto(){}
  }
  void title() {
  }
}
class Game {
  int level;//現在のステージ
  int stage;//現在の段階
  Game() {
    level=1;
  }
  void stageStart() {
    switch (stage){
    case 1:
    textSize(60);
    text("STAGE"+level, 30, 400);
    System.out.println("Hello?");
    stage=2;
    break;
    case 2:
    
    }
  }
  void stageend() {
  }
  void gameover() {
  }
}

class Door {
  final int ID;//ドアの固有ID
  boolean correct;//正解のドアか？
  Door(int id) {
    this.ID=id;
  }
}