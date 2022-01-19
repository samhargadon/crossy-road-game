import processing.core.*; 
import processing.sound.*; 

class DrawTeamLogo{
  protected PApplet p;
  protected int xpos=0;
  protected int movespeed=10;
  protected SoundFile teamsound;
  public DrawTeamLogo (PApplet p, SoundFile ts) {
    this.p=p;
    this.teamsound=ts;
  }

  void AddLogo() {
    p.beginShape();
    p.fill(0);
    p.vertex(xpos-30, p.height/6);
    p.vertex(xpos-30, p.height/8);
    p.vertex(xpos-20, p.height/8);    
    p.vertex(xpos-20, p.height/15);
    p.vertex(xpos+20, p.height/15);
    p.vertex(xpos+20, p.height/8);
    p.vertex(xpos+30, p.height/8);
    p.vertex(xpos+30, p.height/6);
    p.endShape();


    p.fill(255);
    p.circle(xpos, (float)(p.height/4.5), p.width*1/11);
    p.circle(xpos, p.height/3, p.width*1/9);
    p.circle(xpos, (float)(p.height/2.12), p.width*1/7);

    //draw the eyes//
    p.fill(0);
    p.circle(xpos-10, (float)(p.height/4.75), p.width/100);
    p.circle(xpos+10, (float)(p.height/4.75), p.width/100);

    //draw the buttons//
    p.fill(0);
    p.circle(xpos, (float)(p.height/2.8), p.width/100);
    p.circle(xpos, p.height/3, p.width/100);
    p.circle(xpos, (float)(p.height/3.2), p.width/100);

    // draw right arm//
    p.fill(80, 36, 10);
    p.strokeWeight(5);
    p.line(xpos+p.width/18, p.height/3, xpos+p.width/10, (float)(p.height/4.2));
    p.line((float)(xpos+p.width/12.5), (float)(p.height/3.5), xpos+p.width/10, (float)(p.height/3.75));
    p.line((float)(xpos+p.width/12.5), (float)(p.height/3.5), xpos+p.width/16, (float)(p.height/4.1));

    //draw the left arm//
    p.line(xpos-p.width/18, p.height/3, xpos-p.width/10, (float)(p.height/4.2));
    p.line((float)(xpos-p.width/12.5), (float)(p.height/3.5), xpos-p.width/10, (float)(p.height/3.75));
    p.line((float)(xpos-p.width/12.5), (float)(p.height/3.5), xpos-p.width/16, (float)(p.height/4.1));


    //draw the nose//
    p.strokeWeight(1);
    p.fill(250, 174, 8);
    p.beginShape();
    p.vertex(xpos-5, (float)(p.height/4.5));
    p.vertex(xpos+15, p.height/4);
    p.vertex(xpos-5, (float)(p.height/4.25));
    p.endShape();
  }


  void Shiftlogo() {
    xpos=p.constrain(xpos, 0, p.width/2);
    xpos=xpos+movespeed;

    if (xpos==p.width/2) {
      teamsound.play();
    }
  }
  void addteamname() {
    PFont teamnamefont;
    teamnamefont=p.createFont("Book Antiqua", p.width/4);
    p.textFont(teamnamefont);
    p.textAlign(p.CENTER);
    p.textSize(p.width/20);
    p.text("Java Jeniuses", p.width/2, (float)(p.height*2.25/3));
  }
}
