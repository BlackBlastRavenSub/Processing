PShape Test;
PShader shader;

void setup()
{
  size(640, 480, P3D);
  shader = loadShader("FragmentShader.glsl", "VertexShader.glsl");
  
  Test=createShape();
  Test.beginShape(QUADS);
  Test.vertex(-150, 50, -150); 
  Test.vertex(100, 50, -150); 
  Test.vertex(100, 50, 100); 
  Test.vertex(-150, 50, 100);
  Test.endShape(CLOSE);
}

void draw()
{
  background(127, 127, 127);
  camera(100, -100, 100, 0, 0, 0, 0, 1, 0);

  

  axis(100);
  fill(255, 0, 0);
  noStroke();
  directionalLight(255, 255, 255, -1, 1, 0);
  shader(shader);
  sphere(30);
  shape(Test);
}

void axis(float l)
{
  stroke(255, 0, 0);
  line(0, 0, 0, l, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, l, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, l);
}