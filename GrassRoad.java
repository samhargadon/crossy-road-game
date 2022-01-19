import processing.core.*;
//draws the grass and the roads
class GrassRoad {
  protected int x=0;
  protected int y;
  protected PApplet p;
  protected int grid;

  //the constructor takes the PApplet, the y value, and the length 
  public GrassRoad(PApplet p, int y, int grid) {
    this.p=p;
    this.y=y;
    this.grid=grid;
  }
  //function for displaying the grass
  public void display() {
    p.fill(11, 217, 59);
    p.stroke(255);
    p.rectMode(p.CORNER);
    p.rect(x, y, p.width, grid);
  }
  //function for displaying the roads
  public void rdisplay() {
    p.strokeWeight(2);
    p.fill(99, 99, 99);
    p.stroke(255);
    p.rectMode(p.CORNER);
    p.rect(x, y, p.width, grid);
    //draws the dashed lines on the road
    for (int i=0; i<p.width; i+=20) {
      p.stroke(255);
      p.line(i, y+p.height/16, i+5, y+p.height/16);
    }
  }
}
