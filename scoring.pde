void scoring() {
  for (int i=0; i<mycar.length; i++) {
    if (manX>mycar[i].xpos && manX<mycar[i].xpos+100 && manY>mycar[i].ypos && manY<mycar[i].ypos+60) { //<>//
      gameOver();
      lose.play();
      manY=height*15/16;
      manX=width/2;
    } else if (scor) {
      score++;
      if (score==50){
        page=9;
      }
      scor=false;
    }
    fill(255);
    text("Points: "+score, 60, 50);
  }
}
