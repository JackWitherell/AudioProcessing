import ddf.minim.*;
import java.util.Collection;
Minim minim;
AudioPlayer coconutgun;
PGraphics spectrum;
PGraphics LRLevels;
void setup(){
  frameRate(120);
  size(512, 200);
  minim= new Minim(this);
  coconutgun=minim.loadFile("\\data\\coconutgun.mp3",512);
  coconutgun.play();
  spectrum=createGraphics(width,height);
  LRLevels=createGraphics(width,height);
  surface.setResizable(true);
  spectrum.beginDraw();
  spectrum.background(0);
  spectrum.endDraw();
}

void draw(){
  spectrum.beginDraw();
  float low=0;
  float high=0;
  spectrum.copy(1,0,width-1,height,0,0,width-1,height);
  LRLevels.beginDraw();
  LRLevels.clear();
  LRLevels.stroke(255);
  float[] samples=coconutgun.mix.toArray();
  for(int i = 0; i < coconutgun.bufferSize() - 1; i++){
    float local=samples[i];
    if(local<low){
      low=local;
    }
    if(local>high){
      high=local;
    }
    LRLevels.line(i, 50 + coconutgun.left.get(i)*50, i+1, 50 + coconutgun.left.get(i+1)*50);
    LRLevels.line(i, 150 + coconutgun.right.get(i)*50, i+1, 150 + coconutgun.right.get(i+1)*50);
  }
  LRLevels.endDraw();
  spectrum.stroke(0);
  spectrum.line(width-1,height,width-1,0);
  spectrum.stroke(
    (sin(float(frameCount)/100/PI)+1)*128,
    128,
    (cos(float(frameCount)/100/PI)+1)*128);
  spectrum.line(width-1,100+low*100,width-1,100+high*100);
  spectrum.endDraw();
  image(spectrum,0,0);
  
  rect(0,height-(coconutgun.mix.level()*100),width,height);
  image(LRLevels,0,0);
  
}
