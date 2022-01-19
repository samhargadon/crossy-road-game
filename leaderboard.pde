void leaderboard() { //<>// //<>//
  background(255);
  rectMode(CORNER);
  fill(#8E1711);
  stroke(0);
  for (int x=0; x<width; x=x+(width/20)) {
    for (int y=0; y<height; y=y+(height/20)) {
      rect(x, y, x+wid, y+hei);
    }
  }
  imageMode(CENTER);
  image(logo, width/2, height-500);
  fill(#FF5757);
  rectMode(CENTER);
  noStroke();
  rect(width/2, (height/2)+160, width-100, 140);
  textFont(f);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Please input your username(NO SPACES). Hit enter to save.", width/2, (height/2)+125);
  text("username: "+ typing, width/2, (height/2)+200);
  saved=typing;
  if (saved==" ") {
    saved="null";
  }
}

void gameOver() {
  s=append(s, saved+" "+score);
  saveStrings("data/leaderboard.txt", s);
  page++;
  displayboard();
}

void displayboard() {
  background(#8E1711);
  //variables
  int rx=width/2;
  int ry=height*4/5;
  int rw=width/3;
  int rh=height/6;
  IntDict inventory=new IntDict(); //will story words with respective numbers, like a hashmap
  rectMode(CENTER);
  textSize(40);
  stroke(0);

  //leaderboard
  fill(255);
  strokeWeight(5);
  rect(rx, height*2/5, width/2, height/3);

  textAlign(LEFT, CENTER);
  fill(0);
  for (int i = 0; i < 5; i++) { 
    text("#"+(i+1), width/4+20, height/4+(i*50)+10);
  }

  textAlign(RIGHT, CENTER);
  s=loadStrings("leaderboard.txt");
  String tog= join(s, " ");
  String[] spl= split(tog, " ");

  num= new int[0];
  names= new String[0];

  for (int j = 0; j < spl.length; j++) { 
    if (int(spl[j])>0) {
      num=append(num, int(spl[j]));
    } else {
      names=append(names, spl[j]);
    }
  }

  for (int i=0; i<num.length; i++) {
    inventory.set(names[i], num[i]);
  }
  inventory.sortValuesReverse();

  String[] keys=new String[5];
  keys=inventory.keyArray();
  for (int i = 0; i < 5; i++) { 
    String word = keys[i]; 
    int count = inventory.get(word);
    text(word+": "+count, (width*3/4)-10, height/4+(i*50)+10);
  }

  //restart game
  fill(255);
  strokeWeight(10);
  textAlign(CENTER, CENTER);
  rect(rx, ry, rw, rh);
  fill(0);
  text("Restart", rx, ry);
  text("Leaderboard", rx, height/8); 

  if (mousePressed && mouseX<rx+(rw/2) && mouseX>rx-(rw/2) && mouseY<ry+(rh/2) && mouseY>ry-(rh/2)) {
    page=4; //instructions
    carspeed=5;
    score=1;
    for (int j = 0; j<mycar.length; j++){
      mycar[j].xpos=random(width*3/4, width);
    }
  }
}
