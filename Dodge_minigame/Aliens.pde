class Aliens extends Object
{
  public float angle, distance, spd;
  private int tenAngle = 0, tenChange = 1;
  private final int tenLimit = 90;
  
  public Aliens(float xpos, float ypos, float size, float distance, float spd)
  {
    super(xpos, ypos, size);
    this.distance = distance;
    this.spd = spd;
  }
 
  void show()
  {
    if(mode < 6)
    {
      fill(87,169,64);
      stroke(87,169,64);
    }
    else if (mode > 6 && mode < 10)
    {
      fill(255,255,0);
      stroke(255,255,0);
    }
    else if(mode >= 10)
    {
      fill(255,0,0);
      stroke(255,0,0);
    }
    rotate(angle);
    translate(distance,0);
    scale(size);
    drawObj();
  }
  
   void drawObj()
  {
    smooth();
    //body
    rect(0, 0, 10, 5);
    rect(-5, 5, 20, 5);
    rect(-10, 10, 30, 5);
    rect(-15, 15, 40, 10);
    
    //legs
    rect(-5, 25, 5, 5);
    rect(10, 25, 5, 5);
    upperLeg();
    lowerLeg();
    
    //eyes
    noStroke();
    fill(0);
    rect(-5, 15, 5, 5);
    rect(10, 15, 5, 5);
  }
  
  void upperLeg()
  {
    rect(-10, 30, 5, 5);
    rect(0, 30, 10, 5);
    rect(15, 30, 5, 5);
  }
  
  void lowerLeg()
  {
    //rect(-15, 35, 5, 5);
    leftTen();
    rect(-5, 35, 5, 5);
    rect(10, 35, 5, 5);
    rightTen();
    //rect(20, 35, 5, 5);
    tenAngle += tenChange*mode;
    if (tenAngle > tenLimit || tenAngle < 0)
    {
      tenChange = -tenChange;
      tenAngle += tenChange;
    }
  }

  void leftTen()
  {
    pushMatrix();
    translate(-10, 35);
    rotate(radians(tenAngle));
    rect(0, 0, -5, 5);  
    popMatrix();
  }
  
  void rightTen()
  {
    pushMatrix();
    translate(20, 35);
    rotate(radians(-tenAngle));
    rect(0, 0, 5, 5);
    popMatrix();
  }  
}
