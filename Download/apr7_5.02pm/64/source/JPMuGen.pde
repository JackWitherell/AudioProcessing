//Jack's Processing MUsic GENerator
public class Parameter{
  int x;
  int y;
  int len;
  int value;
  Parameter(int xpos,int ypos,int lengthy,int val){
    x=xpos;
    y=ypos;
    len=lengthy;
    value=val;
  }
}

Parameter volume;
Parameter tone;

void setup(){
  size(960, 640);
  if (frame != null) {
    frame.setResizable(true);
  }
  volume = new Parameter(20,12,250,42);
  tone = new Parameter(20,40,250,100);
}


//when called, draw a prambar
int parameterBar(Parameter pram){
  fill(0);
  rect(pram.x,pram.y+10,pram.len,3);
  fill(255);
  rect(pram.value+pram.x,pram.y,8,22);
  return pram.value;
}

void mouseDragged(){
  
}

void draw(){
  parameterBar(volume);
  parameterBar(tone);
}
