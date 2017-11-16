#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_LIGHT_SHADER

uniform float fraction;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;



void main() {  
  float intensity;
  float i;
  intensity = max(0.0, dot(vertLightDir, vertNormal));
  
  float g = 0.29 * vertColor.r + 0.58 * vertColor.g + 0.11 * vertColor.b;
  vec3 Next_vertColor;
  Next_vertColor=vec3(1.07,0.74,0.43)*g;
  
  i=intensity;
  if(0<intensity&&intensity<=0.25){
  i=0.25;
  }
  else if(0.25<intensity&&intensity<=0.50){
  i=0.50;
  }
  else if(0.50<intensity&&intensity<=0.75){
  i=0.75;
  }
  else if(0.75<intensity&&intensity<=1.00){
  i=1.00;
  }
  gl_FragColor = vec4(Next_vertColor * i, 1.0);
}