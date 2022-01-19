//import the library// //<>//
import processing.core.*;

//create the man class//
class man {

  //The constructor for the man class//
  public man() {
    manX=width/2; //start the man at center screen//
    manY=height*15/16;  ///start the man at the bottom of the window//
  }

  // a function to display the man
  public void display() {
    strokeWeight(1); //set the stroke weight
    fill(255); //choose the color of the man icon//
    circle(manX, manY, 50); //display the man icon//
  }

  //create a function to send the man back to the bottom to go through the screen again//
  public void loopy() {
    if (manY<0) {
      manY=height*15/16; 
      //regenerate the grass and roads in random spots//
      for (int i=0; i<8; i++) {
        setRoadGrass();
      }
    }
  }
  //a function to allow the man to move forwards and side to side//
  public void move() {
    //move up and increases the score//
    if (keyCode==UP) {
      manY-=height/8;
      scor=true;
    }
    if (keyCode==LEFT&& manX>0) {
      manX-=width/8;
    }
    if (keyCode==RIGHT&&manX<width) {
      manX+=width/8;
    }
  }
}
