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

public void setup(){
  size(960, 640);
  if (frame != null) {
    frame.setResizable(true);
  }
  volume = new Parameter(20,12,250,42);
  tone = new Parameter(20,40,250,100);
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
  
}

public void draw(){
  parameterBar(volume);
  parameterBar(tone);
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
