//Jack's Processing MUsic GENerator
public class Parameter{
  String id;
  int x;
  int y;
  int len;
  int value;
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


int drag=1;

void setup(){
  size(960, 640);
  if (frame != null) {
    frame.setResizable(true);
  }
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
  if (drag==0){
    for (int f=0;f>params.length;f++){
      
    }
    
    
    int selected=0;
    if (selected==1){
      drag=1;
    }
  }
}

void mouseReleased(){drag=0;}

void draw(){
  parameterBar(params[0]);
  parameterBar(params[1]);
}
