int i=0;
float pi=0;
PShape Test;
int N=8;//三角の個数
int Radius=50;//半径
int Pos=0;//現在の三角の数

void setup()
{
  size(1440, 900, P3D);
  noStroke();
  Test=createShape();
  Test.beginShape(QUADS);
  for (int i=1; i<80; i++) {
    for (int j=1; j<100; j++) {
      Test.vertex(-800+j*10, 0, -500+i*20); 
      Test.vertex(-800+j*10, 0, -500+(i-1)*20); 
      Test.vertex(-800+(j-1)*10, 0, -500+(i-1)*20); 
      Test.vertex(-800+(j-1)*10, 0, -500+i*20);
    }
  }
  Test.endShape(CLOSE);
}

void draw()
{
  background(127, 127, 127);
  pi=i%360;
  camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
  i++;

  shininess(5.0);    //オブジェクトの光沢を設定
  //光の色、ライトの位置、ライトの方向、コーンの角度、指数
  spotLight(255, 0, 0, 50*sin(radians(pi)), -500, 50*cos(radians(pi)), 0, 90, 0, 0.3, 100);
  spotLight(0, 255, 0, 50*sin(radians(pi+120)), -500, 50*cos(radians(pi+120)), 0, 90, 0, 0.3, 100);
  spotLight(0, 0, 255, 50*sin(radians(pi-120)), -500, 50*cos(radians(pi-120)), 0, 90, 0, 0.3, 100);
  //pointLight(255, 255, 255, 0, -40, 0);
  directionalLight(255, 255, 255, 0, -40, 0);
  shape(Test);
}