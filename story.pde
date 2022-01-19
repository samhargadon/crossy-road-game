public void story() {
  //VARIABLES
  background(#CDF1F2); 
  frameRate(20);
  textSize(30);
  String story = "The poor Lafayette student wants to go to the Gas Station, but they have to cross so many roads to get there!"+
    " This is a very unsafe road for students, hopefully they don't get hit by those cars that keep getting faster.";

  //DESIGN
  fill(0);
  rect(0, 500, width, height);
  
  story_car.resize(320, 88);
  imageMode(CENTER);
  image(story_car, storycarX, 456); 
  
  strokeWeight(5);
  ellipse(180, 400, 40, 40);
  line(180, 420, 180, 460);
  line(180, 460, 160, 500);
  line(180, 460, 200, 500);

  //TYPEWRITER
  fill(255);
  if (story_counter < story.length()) {
    fill(255);
    text(story.substring(0, story_counter), 20, 550, width-55, height);
    story_counter++;
    if (story_counter < story.length()) {
      if (frameCount%4==0)
        story_counter++;
    }
  } else {
    text(story, 20, 550, width-55, height);
    if (storycarX>300) {
      storycarX-=10;
    } else {
      storycarX=300;
    }
  }
}
