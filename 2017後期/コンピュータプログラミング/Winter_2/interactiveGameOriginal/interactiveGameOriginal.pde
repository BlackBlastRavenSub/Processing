/*皆さんは「モンティ・ホール問題」と呼ばれるものを聞いたことがありますか？ //<>// //<>//
 例えば・・・皆さんの前に3つの箱があり、そのうち1つにはお宝が入っています。
 まず、みなさんはその中から1つを選びます。すると、あなたが選んでいないハズレの箱が一つ開きます。
 そして、あなたはもう一度箱を選び直すことができます
 その場合、箱を選び直した場合と選び直さなかった場合ではどちらのほうが当たる確率が高いか？と言うものです
 そんなわけで、今回はそれをモチーフにしたゲームを作成しました
 今回、あなたの前には100枚のドアがあります。正解のドアは一つだけです。
 まずあなたがドアを1枚選ぶと、もう一枚のドアが示されます。そして正解のドアは2つの内のどちらかです
 ・・・あなたは何回連続で正解のドアを開けられますか!?*/
import controlP5.*;
import java.io.File;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.IOException;
ControlP5 cp5;
String stage;//今ゲームが何段階目まで進行しているか
PFont TimesNewRoman;
PFont Migu;
PFont Migubold;
int highscore;
Howto howto;
Game game;
Door[] door;
void setup() {
  File file = new File("highscore.txt");
   try{
      if (file.createNewFile()){
        System.out.println("ファイルの作成に成功しました");
      }else{
        System.out.println("ファイルの作成に失敗しました");
      }
    }catch(IOException e){
      System.out.println(e);
    }
  try {
    FileReader filereader = new FileReader(file);
    int load = filereader.read();
    highscore=load;
    System.out.println((char)load);
    filereader.close();
  }
  catch(FileNotFoundException e) {
    System.out.println(e);
  }
  catch(IOException e) {
    System.out.println(e);
  }

  //frameRate(2);
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
} //<>//
void draw() {
  background(255, 255, 255);
  game.game();//ゲーム処理!
  System.out.println(game.stage);
  text("Score"+game.score, 600, 300);
  text("highscore"+highscore, 600, 350);
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
  int correct;//正解のドアID
  int level;//現在のステージ
  String stage;//現在の段階
  int select;//選ばれたドア
  int dummy;//
  int score=0;


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
    if (stage.equals("finalselect")) {
      finalselect();
    }
    if (stage.equals("gameclear")) {
      gameclear();
    }
    if (stage.equals("gameover")) {
      gameover();
    }
  }
  void startgame() {
    stage="startgame";
    System.out.println("startgame!");
    door[0].push=false;
    for (int i=0; i<100; i++) {
      door[i].correct=false;
      door[i].push=false;
      door[i].open=false;
    }
    correct=(int)random(100)+1;
    door[correct].correct=true;//正解のドアを決定する
    stage="nodooropen";
  }
  void nodooropen() {

    for (int i=0; i<100; i++) {
      if (door[i].push==true) {
        stage="onedooropen";
      }
    }
  }
  void onedooropen() {
    text("あなたが選んだドアは"+select+"だ", 600, 100);
    System.out.println("あなたが選んだドアは"+select+"だ");
    if (select==correct) {
      while (dummy==correct) {
        dummy=(int)random(100)+1;
      }
      text("そして正解のドアは・・・"+select+"か"+dummy+"だ", 600, 140);
      for (int i=0; i<100; i++) {
        door[i].push=false;
        stage="finalselect";
      }
    }
    if (select!=correct) {
      text("そして正解のドアは・・・"+select+"か"+correct+"だ", 600, 180);
      for (int i=0; i<100; i++) {
        door[i].push=false;
        stage="finalselect";
      }
    }
  }
  void finalselect() {
    text("あなたが選んだドアは"+select+"だ", 600, 100);
    if (select==correct) {
      text("そして正解のドアは・・・"+select+"か"+dummy+"だ", 600, 140);
    }
    if (select!=correct) {
      text("そして正解のドアは・・・"+select+"か"+correct+"だ", 600, 180);
    }

    for (int i=0; i<100; i++) {
      if (door[i].push==true) {
        if (door[i].ID==correct) {
          score++;
          stage="gameclear";
        }
        if (door[i].ID!=correct) {
          stage="gameover";
        }
      }
    }
  }
  void gameclear() {
    text("正解!"+select+"のドアが当たりだ!", 600, 180);
    text("スペースキーで続行、", 600, 250);
    if ((keyPressed == true) && (key == ' ')) {
      startgame();
    }
  }
  void gameover() {
    text("残念・・正解のドアは"+correct+"だった", 600, 180);
    reset();
    startgame();
  }
  void reset() {
    for (int i=0; i<100; i++) {
      door[i].correct=false;
      door[i].push=false;
      door[i].open=false;
      score=0;
    }
  }
}
class Door {
  final int ID;//ドアの固有ID
  boolean correct;//正解のドアか？
  boolean push;//押されたか？
  boolean open;//開かれているか？
  Door(int id) {
    //ID設定
    this.ID=id;
    correct=false;//正解のドアか？
    push=false;//押されたか？
    open=false;//開かれているか？
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
void door_4() {
  door[3].pushed();
}
void door_5() {
  door[4].pushed();
}
void door_6() {
  door[5].pushed();
}
void door_7() {
  door[6].pushed();
}
void door_8() {
  door[7].pushed();
}
void door_9() {
  door[8].pushed();
}
void door_10() {
  door[9].pushed();
}
void door_11() {
  door[10].pushed();
}
void door_12() {
  door[11].pushed();
}
void door_13() {
  door[12].pushed();
}
void door_14() {
  door[13].pushed();
}
void door_15() {
  door[14].pushed();
}
void door_16() {
  door[15].pushed();
}
void door_17() {
  door[16].pushed();
}
void door_18() {
  door[17].pushed();
}
void door_19() {
  door[18].pushed();
}
void door_20() {
  door[19].pushed();
}
void door_21() {
  door[20].pushed();
}
void door_22() {
  door[21].pushed();
}
void door_23() {
  door[22].pushed();
}
void door_24() {
  door[23].pushed();
}
void door_25() {
  door[24].pushed();
}
void door_26() {
  door[25].pushed();
}
void door_27() {
  door[26].pushed();
}
void door_28() {
  door[27].pushed();
}
void door_29() {
  door[28].pushed();
}
void door_30() {
  door[29].pushed();
}
void door_31() {
  door[30].pushed();
}
void door_32() {
  door[31].pushed();
}
void door_33() {
  door[32].pushed();
}
void door_34() {
  door[33].pushed();
}
void door_35() {
  door[34].pushed();
}
void door_36() {
  door[35].pushed();
}
void door_37() {
  door[36].pushed();
}
void door_38() {
  door[37].pushed();
}
void door_39() {
  door[38].pushed();
}
void door_40() {
  door[39].pushed();
}
void door_41() {
  door[40].pushed();
}
void door_42() {
  door[41].pushed();
}
void door_43() {
  door[42].pushed();
}
void door_44() {
  door[43].pushed();
}
void door_45() {
  door[44].pushed();
}
void door_46() {
  door[45].pushed();
}
void door_47() {
  door[46].pushed();
}
void door_48() {
  door[47].pushed();
}
void door_49() {
  door[48].pushed();
}
void door_50() {
  door[49].pushed();
}
void door_51() {
  door[50].pushed();
}
void door_52() {
  door[51].pushed();
}
void door_53() {
  door[52].pushed();
}
void door_54() {
  door[53].pushed();
}
void door_55() {
  door[54].pushed();
}
void door_56() {
  door[55].pushed();
}
void door_57() {
  door[56].pushed();
}
void door_58() {
  door[57].pushed();
}
void door_59() {
  door[58].pushed();
}
void door_60() {
  door[59].pushed();
}
void door_61() {
  door[60].pushed();
}
void door_62() {
  door[61].pushed();
}
void door_63() {
  door[62].pushed();
}
void door_64() {
  door[63].pushed();
}
void door_65() {
  door[64].pushed();
}
void door_66() {
  door[65].pushed();
}
void door_67() {
  door[66].pushed();
}
void door_68() {
  door[67].pushed();
}
void door_69() {
  door[68].pushed();
}
void door_70() {
  door[69].pushed();
}
void door_71() {
  door[70].pushed();
}
void door_72() {
  door[71].pushed();
}
void door_73() {
  door[72].pushed();
}
void door_74() {
  door[73].pushed();
}
void door_75() {
  door[74].pushed();
}
void door_76() {
  door[75].pushed();
}
void door_77() {
  door[76].pushed();
}
void door_78() {
  door[77].pushed();
}
void door_79() {
  door[78].pushed();
}
void door_80() {
  door[79].pushed();
}
void door_81() {
  door[80].pushed();
}
void door_82() {
  door[81].pushed();
}
void door_83() {
  door[82].pushed();
}
void door_84() {
  door[83].pushed();
}
void door_85() {
  door[84].pushed();
}
void door_86() {
  door[85].pushed();
}
void door_87() {
  door[86].pushed();
}
void door_88() {
  door[87].pushed();
}
void door_89() {
  door[88].pushed();
}
void door_90() {
  door[89].pushed();
}
void door_91() {
  door[90].pushed();
}
void door_92() {
  door[91].pushed();
}
void door_93() {
  door[92].pushed();
}
void door_94() {
  door[93].pushed();
}
void door_95() {
  door[94].pushed();
}
void door_96() {
  door[95].pushed();
}
void door_97() {
  door[96].pushed();
}
void door_98() {
  door[97].pushed();
}
void door_99() {
  door[98].pushed();
}
void door_100() {
  door[99].pushed();
}