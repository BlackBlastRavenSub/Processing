String stage;//今ゲームが何段階目まで進行しているか
PFont TimesNewRoman;
PFont Migu;
PFont Migubold;
Title title;
Howto howto;
Game game;
void setup() {
  Door[] door;

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
  TimesNewRoman = loadFont("TimesNewRomanPS-BoldMT-48.vlw");
  Migu=loadFont("migu-1m-regular-48.vlw");
  Migubold=loadFont("migu-1m-bold-48.vlw"); 
  textFont(TimesNewRoman);
  background(255, 255, 255);
  title=new Title();
  howto=new Howto();
  game=new Game();

  stage="title";//タイトル画面
}
class Setup {
}
void draw() {
  background(255, 255, 255);
  if (stage.equals("title")) {
    title.title();//タイトル画面
  }
  if (stage.equals("play")) {
    game.stageStart();//ゲームスタート!
  }
  if (stage.equals("howto")) {
    howto.howto();//ゲームスタート!
  }
  System.out.println(stage);
}
//なんかTitleクラス内に入れると反応しないからここに置いた(本当はTitleクラス内で管理したい)

class Title {
  Button startbutton;

  Title() {
    startbutton=new Button(1,1,1,1,1,button_glare_10);
  }
  void title() {
  }
  void play() {
  }
  void howto() {
  }
}
class Howto {
  int stage;//現在の段階
  Howto() {  
    howto();
  }
  void howto() {
    textFont(Migu);
    textSize(35);
    String reference="皆さんは「モンティ・ホール問題」と呼ばれるものを聞いたことがありますか？"
      +"\n例えば・・・皆さんの前に3つの箱があり、そのうち1つにはお宝が入っています。"
      +"\nまず、みなさんはその中から1つを選びます。すると、あなたが選んでいないハズレの箱が一つ開きます。"
      +"/nそして、あなたはもう一度箱を選び直すことができます"
      +"/nその場合、箱を選び直した場合と選び直さなかった場合ではどちらのほうが当たる確率が高いか？と言うものです";
    text(reference, 0, 40);
  }
}
class Game {
  int level;//現在のステージ
  int stage;//現在の段階
  Game() {
    level=1;
  }
  void stageStart() {
    switch (stage) {
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
class Button {
  int button_id;
  int button_x;
  int button_y;
  int x_size;
  int y_size;
  PImage texture;
  boolean click=false;

  Button(int button_id,int button_x, int button_y, int x_size, int y_size, String texture) {
    this.button_id=button_id;
    this.button_x=button_x;
    this.button_y=button_y;
    this.x_size=x_size;
    this.y_size=y_size;
    this.texture = loadImage(texture);
  }
  void view() {
    image(texture, 0, 0);
    if (click) {
      push();
    }
  }
  void push() {
    click=false;
  }
  void mouseClicked(){
  click=true;
  System.out.println("Button"+button_id+"Clicked!");
  }
}