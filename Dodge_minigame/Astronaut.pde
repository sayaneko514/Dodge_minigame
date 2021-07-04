class Astronaut extends Object
{
  private float armAngle = 0;
  private float armChange = 0.2;  
  private float legAngle = 0;
  private float legChange = 0.1;
  private final float armLimit = 30;
  private final int legLimit = 10;
  
  public Astronaut(float xpos, float ypos, float size)
  {
   super(xpos, ypos, size);
  }

 void show()
 {
   scale(size);
   drawObj();
 }
 
 void drawObj()
 {
   //head+body
   if(godMode == true)
   {
     int R = (int)random(256);
     int G = (int)random(256);
     int B = (int)random(256);
     fill(R, G, B);
     stroke(R, G, B);
   }
   else
   {
     fill(250);
     stroke(250);
   }
   rect(3, 12, 6, 3);
   rect(12, 12, 3, 3);
   rect(0, 15, 6 ,3);
   rect(0, 18, 3, 3);
   rect(30, 18, 3, 3);
   rect(-12, 21, 3, 3);
   rect(30, 21, 3, 3);
   rect(-12, 24, 3, 3);
   rect(30, 24, 3, 3);
   rect(-12, 27, 3, 3);
   rect(27, 27, 6, 3);
   rect(-12, 30, 6, 3);
   rect(27, 30, 3, 3);
   rect(3, 41, 15, 3);
   rect(3, 44, 15, 3);
   rect(9, 47, 3, 3);
   rect(0, 50, 21, 3);
   rect(0, 53, 12, 3);
   rect(15, 53, 6, 3);
   rect(0, 56, 21, 3);
   rect(-6, 33, 33, 30);
   
   //arms
   leftArm();
   rightArm();
   armAngle += armChange*mode;
   if (armAngle > armLimit || armAngle < 0)
   {
     armChange = -armChange;
     armAngle += armChange;
   }
   
   //legs
   leftLeg();
   rightLeg();
   legAngle += legChange*mode;
   if (legAngle > legLimit || legAngle < -5)
   {
     legChange = -legChange;
     legAngle += legChange;
   }
   
   //cont. head+body
   fill(89);
   stroke(89);
   rect(0, 0, 21, 3);
   rect(-3, 3, 27, 3);
   rect(-6, 6, 33, 3);
   rect(-9, 9, 9, 3);
   rect(21, 9, 9, 3);
   rect(-9, 12, 6, 3);
   rect(24, 12, 6, 3);
   rect(-9, 15, 6, 3);
   rect(24, 15, 6, 3);
   rect(-9, 18, 6, 3);
   rect(24, 18, 6, 3);
   rect(-9, 21, 6, 3);
   rect(24, 21, 6, 3);
   rect(-9, 24, 6, 3);
   rect(24, 24, 6, 3);
   rect(-9, 27, 6, 3);
   rect(24, 27, 3, 3);
   rect(-6, 30, 6, 3);
   rect(21, 30, 6, 3);
   rect(0, 33, 21, 3);
   rect(0, 36, 3, 3);
   rect(18, 36, 3, 3);
   rect(0, 39, 6, 3);
   rect(15, 39, 6, 3);
   rect(0, 41, 3, 3);
   rect(18, 41, 3, 3);
   rect(0, 59, 21, 3);
   rect(0, 61, 21, 3);
   
   
   fill(133, 163, 41);
   stroke(133, 163, 41);
   rect(0, 9, 21, 3);
   rect(-3, 12, 6, 3);
   rect(9, 12, 3, 3);
   rect(15, 12, 6, 3);
   rect(-3, 15, 3, 3);
   rect(6, 15, 12, 3);
   rect(-3, 18, 3, 3);
   rect(3, 18, 6, 3);
   rect(-3, 21, 12, 3);
   rect(-3, 24, 9, 3);
   rect(-3, 27, 6, 3);
   
   fill(38);
   stroke(38);
   rect(21, 12, 3, 3);
   rect(18,15, 6, 3);
   rect(9, 18, 15, 3); 
   rect(9, 21, 15, 3);
   rect(6, 24, 18, 3);
   rect(3, 27, 21, 3);
   rect(0, 30, 21, 3);
   rect(3, 36, 15, 3);
   rect(6, 39, 9, 3);
   rect(0, 44, 3, 3);
   rect(18, 44, 3, 3);
   rect(0, 47, 6, 3);
   rect(15, 47, 6, 3);
   rect(12, 53, 3, 3);
   
   fill(0);
   stroke(0);
   rect(6, 47, 3, 3);
   rect(12, 47, 3, 3);
 
 }
  
  void leftArm()
  {
    pushMatrix();
    translate(0, 33);
    rotate(radians(armAngle));
    
    if(godMode == true)
    {
     int R = (int)random(256);
     int G = (int)random(256);
     int B = (int)random(256);
     fill(R, G, B);
     stroke(R, G, B);
    }
    else
    {
      fill(250);
      stroke(250);
    }
    rect(-3, 0, -6, 3);
    rect(-6, 3, -3, 3);
    rect(-3, 6, -6, 3);
    rect(-6, 9, -3, 3);
    rect(-6, 12, -3, 3);
    rect(-6, 15, -3, 3);
    rect(-6, 18, -3, 3);
    rect(0, 27, -3, 3);
    rect(-6, 27, -3, 3);
    rect(0, 30, -9, 3);   
    
    fill(89);
    stroke(89);
    rect(0, 0, -3, 3);
    rect(0, 3, -3, 3);
    rect(0, 6, -3, 3);
    rect(0, 9, -3, 3);
    rect(-3, 12, -3, 3);
    rect(0, 15, -6, 3);
    rect(0, 18, -9, 3);
    rect(0, 21, -9, 3);
    rect(0, 24, -9, 3);
    rect(-3, 27, -3, 3);
    
    fill(38);
    stroke(38);
    rect(-3, 3, -3, 3);
    
    fill(0);
    stroke(0);
    rect(-3, 9, -3, 3);
    rect(0, 12, -3, 3);
    popMatrix();
  }
  
  void rightArm()
  {
    pushMatrix();
    translate(21, 33);
    rotate(radians(-armAngle));
    
    if(godMode == true)
    {
     int R = (int)random(256);
     int G = (int)random(256);
     int B = (int)random(256);
     fill(R, G, B);
     stroke(R, G, B);
    }
    else
    {
      fill(250);
      stroke(250);
    }
    rect(3, 0, 6, 3);
    rect(6, 3, 3, 3);
    rect(3, 6, 6, 3);
    rect(6, 9, 3, 3);
    rect(6, 12, 3, 3);
    rect(6, 15, 3, 3);
    rect(0, 27, 3, 3);
    rect(6, 27, 3, 3);
    rect(0, 30, 9, 3);
    
    fill(89);
    stroke(89);
    rect(0, 0, 3, 3);
    rect(0, 3, 3, 3);
    rect(0, 6, 3, 3);
    rect(0, 9, 3, 3);
    rect(3, 12, 3, 3);
    rect(0, 15, 6, 3);
    rect(0, 18, 9, 3);
    rect(0, 21, 9, 3);
    rect(0, 24, 9, 3);
    rect(3, 27, 3, 3);
    
    fill(38);
    stroke(38);
    rect(3, 3, 3, 3);

    fill(0);
    stroke(0);
    rect(3, 9, 3, 3);
    rect(0, 12, 3, 3);
    popMatrix();
  }
  
  void leftLeg()
  {
    pushMatrix();
    translate(9, 64);
    rotate(radians(-legAngle));
    fill(89);
    stroke(89);
    rect(0, 0, -3, 3);
    rect(-3, 3, -9, 3);
    rect(0, 6, -12, 3);
    
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(-3, 0, -6, 3);
    rect(0, 3, -3, 3);
    
    fill(38);
    stroke(38);
    rect(0, 9, -12, 3);
    rect(0, 12, -12, 3);
    popMatrix();
  }
  
  void rightLeg()
  {
    pushMatrix();
    translate(15, 64);
    rotate(radians(legAngle));
    fill(89);
    stroke(89);
    rect(0, 0, 3, 3);
    rect(3, 3, 9, 3);
    rect(0, 6, 12, 3);
    
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(3, 0, 6, 3);
    rect(0, 3, 3, 3);
    
    fill(38);
    stroke(38);
    rect(0, 9, 12, 3);
    rect(0, 12, 12, 3);
    popMatrix();
  }
}
