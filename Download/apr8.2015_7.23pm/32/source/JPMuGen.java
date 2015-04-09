import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class JPMuGen extends PApplet {

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

public void setup(){
  size(960, 640);
  if (frame != null) {
    frame.setResizable(true);
  }
}


//when called, draw a prambar
public int parameterBar(Parameter pram){
  fill(0);
  rect(pram.x,pram.y+10,pram.len,3);
  fill(255);
  rect(pram.value+pram.x,pram.y,8,22);
  return pram.value;
}

public void mouseDragged(){
  if (drag==0){
    for (int f=0;f>params.length;f++){
      
    }
    
    
    int selected=0;
    if (selected==1){
      drag=1;
    }
  }
}

public void mouseReleased(){drag=0;}

public void draw(){
  parameterBar(params[0]);
  parameterBar(params[1]);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "JPMuGen" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
