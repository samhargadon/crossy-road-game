//import the library//
import processing.core.*;

//create a java class for the game logo page//
class GameLogoPage {
  protected PApplet p;
  protected PImage Logo;
  protected PFont Gl;
  protected PFont NamesFont;

  // the constructor takes one argument (PApplet)//
  public GameLogoPage(PApplet p) {
    this.p=p;
  }

  //make a function to display the logo of the game//
  public void display() {
    p.background(142, 23, 17);

    //create a loop to draw the background lines on the page//
    for (int i=0; i<p.width; i=i+20) {
      p.strokeWeight(1);
      p.fill(0, 45);
      p.line(i, 0, i, p.height);
    }

    //add the game logo image to the page//
    p.imageMode(p.CENTER);
    Logo=p.loadImage("logo.png");
    p.image(Logo, p.width/2, p.height/2);
    p.textAlign(p.CENTER);
    
    //create the fonts that are used//
    Gl=p.createFont("Comic Sans MS", p.width/30);
    NamesFont=p.loadFont("Noteworthy-Bold-48.vlw");
    p.textFont(Gl);
    p.fill(0xffA159F5);

    //put the assignment name, game name, and press to start text on the screen//
    p.textSize(35);
    p.text("CS-104 \n FINAL PROJECT FALL 2021 \n", p.width/2, (float)(p.height*4.25/5));
    p.text("Gas Station Gallop", p.width/2, (float)(p.height*2/3));
    p.fill(255);
    p.text("Press Any Key to Start!", p.width/2, (float)(p.height*.75/5));
    //put the names of the group members on the screen//
    p.textFont(NamesFont);
    p.textSize(25);
    p.fill(0, p.random(255), p.random(255), 200);
    p.text("Brady Valle , Emma Raupp , Claire Weitzmann , Sam Haragadon , Julia Daly", p.width/2, (float)(p.height*1/5));
  }
}
