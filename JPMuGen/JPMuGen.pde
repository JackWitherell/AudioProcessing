import processing.sound.*;

//Jack's Processing MUsic GENerator
public class Parameter{
  String id;
  int x;
  int y;
  int len;
  int value;
  int selected;
  Parameter(String idno,int xpos,int ypos,int lengthy,int val){
    id=idno;
    x=xpos;
    y=ypos;
    len=lengthy;
    value=val;
  }
}

Parameter[] params= new Parameter[]{
new Parameter("volume",20,12,250,42),
new Parameter("tone",20,40,250,100)
};

SinOsc sine;
int drag=1;
int selected=0;
int relative=0;

void setup(){
  size(960, 640);
  if (frame != null) {
    frame.setResizable(true);
  }
  sine=new SinOsc(this);
  sine.play();
}


//when called, draw a prambar
int parameterBar(Parameter pram){
  fill(0);
  stroke(0);
  rect(pram.x,pram.y+10,pram.len,3);
  fill(255);
  if (pram.selected==1){
    fill (120);
  }
  if (pram.selected==2){
    fill (200);
  }
  rect(pram.value+pram.x,pram.y,8,22);
  return pram.value;
}

void mousePressed(){
  for (int p=0;p<params.length;p++){
    if ((params[p].x+params[p].value<=mouseX)&&(params[p].x+params[p].value+8>=mouseX)){
      if ((params[p].y<=mouseY)&&(params[p].y+22>=mouseY)){
        relative=mouseX-params[p].x-params[p].value;
        selected=p;
        params[p].selected=1;
        rect(444,444,20,20);
      }
    }
  }
}


void mouseDragged(){
  if (selected!=999){
    params[selected].value=mouseX-params[selected].x-relative;
  }
    
  
}

void mouseReleased(){
  drag=0;
  print(params[0].value/100);
  if (selected<999){
    for(int p=0;p<params.length;p++){
      params[p].selected=0;
      if (p==selected){
        params[p].selected=2;
      }
    }
  }
}

void draw(){
  stroke(210);
  fill(210);
  rect(0,0,7000,9999);
  parameterBar(params[0]);
  parameterBar(params[1]);
  sine.freq(params[1].value);
  //sine.amp(float(params[0].value/100));
}
