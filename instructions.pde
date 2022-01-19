
void initScreen() {

  textAlign(CENTER);
  float size = (width/25);

  //rectangle variables
  float x1 = (width/2);
  float y1 = (height-(height/10));
  float w1 = (size*13);
  float h1 = (size*2);

  //text placement variables so window can change

  float textLength1 = (size*11);
  float textLength2 = (size*20);
  float textLength3 = (size*14);
  float textLength4 = (size*20);
  float textLength5 = (size*17);

  //background color and text color and width
  background(200, 0, 0);
  stroke(0);

  //instructions
  textSize(size);
  fill(255);
  text("Welcome to Gas Station Gallop!\nUse the arrows to move the man across the road. \n If you get hit by a car, you lose.\n"+
       "If you get 50 points, you win!\nYou get a point for each space you move forward\n Goal is to make it to other side of the road", width/2, size*2);

  //button background is white
  fill(255);

  //if the mouse is in the rectangle and is pressed
  if (mousePressed&&page==4) {
    if (mouseX>=x1-(w1/2) && mouseX<=x1+(w1/2) && mouseY>=y1-(h1/2) && mouseY<=y1+(h1/2)) {
      page++;
    }
  }

  //button will turn black and game will begin
  rectMode(CENTER);
  rect(x1, y1, w1, h1);
  fill(155);
  textAlign(LEFT);
  text("Additional Instructions Page", x1-(w1/2.2), y1+(h1/2.6));

  fill(255);
}

void additinstrc() {

  //declare all the variables for the button position//
  float x1 = width/2;
  float y1 = height/4;
  float w1 = width/5;
  float h1 = height/10;
  strokeWeight(5); //change the stroke weight//

  //initialize all of the photos that show how to play the game//
  Gamephoto1=loadImage("GamePhoto1.png");
  Gamephoto2=loadImage("GamePhoto2.png");
  Gamephoto3=loadImage("GamePhoto3.png");

  //adjust the background color//
  background(#8E1711);

  //choose the text alignment, fill, and size//
  textAlign(CENTER);
  textSize(width/20);
  fill(0);
  //add the text//
  text("ADDITIONAL INSTRUCTIONS", width/2, height*.5/3);

  //draw the box//
  fill(255);
  rect(x1, y1, w1, h1);
  //add button pressing capabilities to change the page//
  if (mousePressed) {
    if (mouseX>=x1-(w1/2) && mouseX<=x1+(w1/2) && mouseY>=y1-(h1/2) && mouseY<=y1+(h1/2)) {
      page++;
    }
  }

  //display all of the images that show how to play//
  imageMode(CENTER);
  image(Gamephoto1, width/5, height/2, width/4, height/4);
  image(Gamephoto2, width/2, height/2, width/4, height/4);
  image(Gamephoto3, width*4/5, height/2, width/4, height/4);


  //add the detailed instruction text//
  textSize(width/50);
  fill(0);
  text(" TO MOVE UP: PRESS UP ARROW.     TO MOVE LEFT: PRESS LEFT ARROW \n          TO MOVE RIGHT: PRESS RIGHT ARROW \n      YOU CAN ONLY MOVE FORWARD", width/2, height*2.25/3);

  //add the go to next page text//
  fill(0);
  text("Go to the next page", width/2, height/4);
}
