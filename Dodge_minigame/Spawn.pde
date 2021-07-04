class Spawn extends Aliens
{
  Spawn[] aliens;
  private int armAngle = 0;
  private int armChange = 2;  
  private int legAngle = 0;
  private int legChange = 1;
  private final int armLimit = 140;
  private final int legLimit = 180;
  
  public Spawn(float xpos, float ypos, float size, float distance, float spd)
  {
    super(xpos, ypos, size, distance, spd);
  }
  
  void orbit()
  {
    angle = angle + spd;
    if (aliens != null)
    {
      for (int i = 0; i < aliens.length; i++)
      {
        aliens[i].orbit();
      }
    }
  }
  
  void spawnAliens(int total)
  {
    aliens = new Spawn[total];
    for (int i = 0; i < aliens.length; i++)
    {
      float s = 1;
      float d = 1030;
      float o = random(0.001, 0.03);
      aliens[i] = new Spawn(0, 0, s/0.23, d, o);
    }
  }
  
  void show()
  {
    pushMatrix();
    if (mode < 6)
    {
      fill(87,169,64);
      stroke(87,169,64);
      rotate(angle);
    }
    
    else if (mode > 6 && mode < 10)
    {
      fill(255,255,0);
      stroke(255,255,0);
      rotate(-angle);
    }
        
    
    else if (mode >= 10)
    {
      fill(255,0,0);
      stroke(255,0,0);
      rotate(-angle);
    }
    translate(distance,0);
    scale(size);
    showSpawn();
    if (aliens != null)
    {
      for (int i = 0; i < aliens.length; i++)
      {
        aliens[i].show();
      }
    }
    popMatrix();
  }
  
  
  public void showSpawn()
  {
    smooth();
    //body
    noStroke();
    rect(0 ,0 ,5 ,5);
    rect(35, 0, 5, 5);
    rect(5, 5, 5, 5);
    rect(30, 5, 5, 5);
    rect(0, 10, 40, 15);
    rect(0, 24, 40, 6);
    rect(-5, 15, 5, 10);
    rect(40, 15, 5, 10);
    rect(0, 30, 5, 5);
    rect(35, 30, 5, 5);
    
    //arms
    leftArm();
    rightArm();
    armAngle += armChange;
    if (armAngle > armLimit || armAngle < 0)
    {
      armChange = -armChange;
      armAngle += armChange;
    }
    
    //legs
    leftLeg();
    rightLeg();
    legAngle += legChange;
    if (legAngle > legLimit || legAngle < 0)
    {
      legChange = -legChange;
      legAngle += legChange;
    }
    
    //eyes
    fill(0);
    rect(5, 15, 5, 5);
    rect(30, 15, 5, 5);
  }
  
  void leftArm()
  {
    pushMatrix();
    translate(-5, 20);
    rotate(radians(armAngle));
    rect(0, 0, -5, 15);  
    popMatrix();
  }
  
  void rightArm()
  {
    pushMatrix();
    translate(45, 20);
    rotate(radians(-armAngle));
    rect(0, 0, 5, 15);  
    popMatrix();
  }
  
  void rightLeg()
  {
    pushMatrix();
    translate(35, 35);
    rotate(radians(-legAngle));
    rect(0, 0, -10, 5);  
    popMatrix();
  }
  
  void leftLeg()
  {
    pushMatrix();
    translate(5, 35);
    rotate(radians(legAngle));
    rect(0, 0, 10, 5);
    popMatrix();
  } 
}
