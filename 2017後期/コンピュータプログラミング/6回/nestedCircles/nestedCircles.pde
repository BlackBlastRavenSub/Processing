int Radius=200; //<>//
int Hue;
int Circle_X=0;
void setup() {

  size(480, 480);
  noStroke();
  colorMode(HSB,5,100,100);

  
}


void draw() {
  background(#ffffff);
  DrawCirclesFront(width/2,Radius,0);
  noLoop();
}

void DrawCirclesFront(int x,int Radius,int Layer) {
  fill(Layer, 100, 100);
  ellipse(x, height/2, Radius*2, Radius*2);
 if(3 < Layer) { 
    return; 
  } 
  DrawCirclesFront(x-Radius/2,Radius/2,Layer+1);
  DrawCirclesFront(x+Radius/2,Radius/2,Layer+1);
}