class Star
{
  float x = random(width);
  float y = random(-200,-100);
  float yspeed = random(1,5);
  float len = random(1, 3);
  
  void drawObj()
  {
    y = y + yspeed;  
    if (y > height)
    {
      y = random (-200, -100);
      yspeed = random(1,5);
    }
  }
  
  void show()
  {
    stroke(255);
    line(x,y,x,y+len);
  }
}
