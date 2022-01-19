import processing.core.*;
public class Car {
  private PApplet p;
  protected float xpos = 0;
  protected float ypos;
  protected float xspeed;
  private PImage img;

  public Car(PImage tempImg, float xpos, float ypos, float t_xspeed, PApplet p) {
    this.p=p;
    this.xpos=xpos;
    this.ypos=ypos;
    this.xspeed=t_xspeed;
    img = tempImg;
  }

  public void display() {
    p.imageMode(p.CORNER);
    p.image(img, xpos, ypos);
  }

  public void move(int roady) {
    xpos+=xspeed;
    if (xpos>p.width) {
      xpos=0;
      ypos = roady;
      p.imageMode(p.CORNER);
    }
  }
}
