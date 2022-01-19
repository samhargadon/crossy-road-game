//import the library and sound library
import processing.sound.*;
import processing.core.*;

//VARIABLES

//main
int page = 1;
int score = 1;
boolean scor=false;
SoundFile lose;
//intro pages
public PFont f;
public PImage logo;
public SoundFile teamsound;
//story
int story_counter = 0;
int storycarX;
PImage story_car;
//additional instructions 
PImage Gamephoto1;
PImage Gamephoto2;
PImage Gamephoto3;
//leaderboard
String typing = "";
String saved = "";
String s[];
String names[];
int num[];
int wid;
int hei;
//man
int manX;
int manY;
SoundFile jump;
SoundFile jump2;
//car
public float carspeed=5;
//road
int groad[]= new int[8];
public int grid=100;

//CLASSES
GrassRoad[] grassroad;
man mans;
GameLogoPage glp;
DrawTeamLogo dtl;
Car[] mycar = new Car[8];
PImage[] cars = new PImage[4];

void setup() { 
  //INITIALIZING
  size(1000, 800);
  //story
  story_car=loadImage("sedan.png");
  storycarX=width+160;
  //man
  manY=height*15/16;
  manX=width/2;
  mans=new man();  
  //intro
  f=createFont("Comic Sans MS", 40);
  logo=loadImage("logo.png");
  logo.resize(300, 300);
  teamsound= new SoundFile(this, "IntroScreen.mp3");
  glp= new GameLogoPage(this);
  dtl= new DrawTeamLogo(this, teamsound);
  //sounds
  teamsound= new SoundFile(this, "IntroScreen.mp3");
  lose= new SoundFile(this, "lose.mp3");
  jump =new SoundFile(this, "jump.mp3");
  jump2 =new SoundFile(this, "jump2.mp3");
  //create the car images and assign them to the cars array
  for (int i = 1; i<cars.length; i++) {
    cars[i] = loadImage("car"+i+".png");
    imageMode(CORNER);
    cars[i].resize(100, 100);
  }
  //randomizes the grass and roads for initial game screen
  setRoadGrass();
  //leaderboard
  wid=width/20;
  hei=height/20;
  s=loadStrings("leaderboard.txt");
}
void draw() {
  //page switching for the different screens
  switch(page) {
  case 1:
    background(#FF5757);
    dtl.AddLogo();
    dtl.addteamname();
    dtl.Shiftlogo();
    break;
  case 2:
    glp.display();
    break;
  case 3:
    story();
    break;
  case 4:
    initScreen();
    break;
  case 5:
    additinstrc();
    break;
  case 6:
    leaderboard();
    break;
  case 7: //GAME CASE
    //displays the grass and roads
    for (int i = 0; i<8; i++) {
      if (groad[i]==1) {
        grassroad[i].display(); //grass
      } else if (groad[i]==2) {
        grassroad[i].rdisplay(); //road
        mycar[i].display();
        mycar[i].move(grassroad[i].y);
      }
    }
    //for man to appear and loop when he hits the top
    mans.display();
    mans.loopy();
    //scoreboard
    scoring();
    break;
  case 8:
    background(#8E1711);
    displayboard();
    break;
  case 9:
    background(255);
    fill(0, 0, 255);
    text("you win! \n CONGRATS! \n Click to go to the leaderboard!", width/2, height/2);
    break;
  }
}
/*
  move pages by clicking the mouse until page 4, after which you have to click buttons
 to move or press the enter key
 */
void mousePressed() {
  if (page<4&&page!=2) { 
    page++;
  }
  if (page==9) {
    page=8;
  }
}
void keyPressed() {
  //when enter is pressed, saves the user text and moves to next page
  if (page==6) {
    if (key==ENTER) {
      saved=typing; //typed words are saved
      typing="";
      page++;
    } else {
      typing=typing+key; //adds characters as they get typed
    }
  }
  if (page==2) {
    page++;
  }
  if (page==7) {
    if (keyCode==UP) {
      jump.play();
    }
    if (keyCode==RIGHT || keyCode==LEFT) {
      jump2.play();
    }
    mans.move();//moving forward and side to side when keys are pressed
  }
}
public void setRoadGrass() {
  //creates cars set to random images
  for (int i=0; i<mycar.length; i++) {
    int index = (int)(random(1, 4));
    mycar[i] = new Car(cars[index], random(width*1/3, width), (i*grid), carspeed, this);
  }

  grassroad=new GrassRoad[grid];
  for (int i=0; i<8; i++) {
    grassroad[i]=new GrassRoad(this, i*grid, grid);
    //probablity generator: 30% chance of grass and 70% chance of a road
    float u=random(0, 1); 
    if (u<0.3) {
      groad[i]=1; //grass
    } else {
      groad[i]=2; //road
    }
    groad[7]=1; //the bottom block will always be grass
  }
  carspeed++; //increases the speed of the car and MAKES GAME MORE DIFFICULT
}
