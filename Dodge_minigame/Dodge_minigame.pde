Star[] a = new Star[300];
int qty=10, stage=1, start, now = 0, spawnNum = 3;
int btn1X, btn1Y, btn2X, btn2Y, btnSize = 40;
color btnColor, btnHighlight, btn2Color, btn2Highlight;
boolean btnOver = false, btn2Over = false, godMode = false;
float[]bx;
float[]by;
float[]vx;
float[]vy;
float r=10;
float margin=150, spd=3, mode=3, rockX, rockY, angle, hp = 100;
PImage rock, bg;
Astronaut as;
Aliens al;
Spawn sp;

void setup()
{
  size(1024, 478);
  bg=loadImage("1.png");
  imageMode(CENTER);
  for (int i = 0; i < a.length; i++)
  {
    a[i] = new Star();
  }
  as = new Astronaut(0, 0, 0.9);
  al = new Aliens(0, 0, 0.6, 0, 1);
  sp = new Spawn(0, 0, 0.03, 0, 0);
  sp.spawnAliens(spawnNum);
  rock=loadImage("asteroids.png");

  btnColor = color(255,215,0);
  btn2Color = color(205,92,92);
  btnHighlight = color(218,165,32);
  btn2Highlight = color(178,34,34);
  btn1X = width-btnSize-10;
  btn1Y = height-btnSize-10;
  btn2X = width-btnSize-10;
  btn2Y = height-btnSize*2-30;

  bx=new float[qty];
  by=new float[qty];
  vx=new float[qty];
  vy=new float[qty];

  for (int i=0; i<qty; i++)
  {
    int dir=int(random(2));
    if (dir==0)
    {
      bx[i]=random(width+r, width+margin);
      by[i]=random(0, height);
    }
    else if (dir==1)
    {
      bx[i]=random(0, width);
      by[i]=random(height+r, height+margin);
    }
    else if (dir==2)
    {
      bx[i]=random(-margin, -r);
      by[i]=random(0, height);
    }
    else
    {
      bx[i]=random(0, width);
      by[i]=random(-margin, -r);
    }
    float angle=atan2(mouseY-by[i], mouseX-bx[i]);
    vx[i]=cos(angle)*spd;
    vy[i]=sin(angle)*spd;
  }
  start=millis();
}



void draw()
{
  String[] instructions = loadStrings("Instructions.txt");
  if (stage==1)
  {
    background(0);
    update(mouseX,mouseY);
    image(bg, width/2, height/2);
    fill(200);
    textSize(50);
    textAlign(CENTER, CENTER);
    text(60-(millis()-start)/1000, width/2, height/2);    
    int x = frameCount % rock.width;
    for (int i = -x ; i < width ; i += rock.width)
    {
      copy(rock, 0, 80, rock.width, height, i, 0, rock.width, height);
    }
  
    for (int i = 0; i < a.length; i++)
    {
      a[i].drawObj();
      a[i].show();
    }
    spdBar();
    hpBar();
    if (btnOver)
      fill(btnHighlight);
    else
      fill(btnColor);
    stroke(0);
    rect(btn1X, btn1Y, btnSize, btnSize);
    fill((int)random(256),(int)random(256),(int)random(256));
    pushMatrix();
    translate(width-btnSize+10, height-btnSize+10);
    rotate(frameCount / 100.0);
    star(0,0,btnSize/4,btnSize/2,5);
    popMatrix();
    if (btn2Over)
      fill(btn2Highlight);
    else
      fill(btn2Color);
    rect(btn2X, btn2Y, btnSize, btnSize);
    
    
    if (60-(millis()-start)/1000<=0)
    {
      stage=3;
    }
    
    if (frameCount%60==0)
    {
      for (int i=0; i<qty; i++) {
        vx[i]*=1.01;
        vy[i]*=1.01;
      }
    }

    for (int i=0; i<qty; i++)
    {
      bx[i]+=vx[i];
      by[i]+=vy[i];
      pushMatrix();
      translate(bx[i], by[i]);
      sp.show();
      sp.orbit();
      al.show();
      popMatrix();
      if (dist(bx[i], by[i], mouseX, mouseY)<40) {
        if (godMode == false)
        {
          hp --;
          if (hp < 0)
            stage = 2;
        }
        
        else
        {}
      }
    }

    for (int i=0; i<qty; i++)
    {
      if (bx[i]>width+margin*2 || bx[i]<-margin*2 ||
        by[i]>height+margin*2 || by[i]<-margin*2) {
        int dir=int(random(4));
        if (dir==0)
        {
          bx[i]=random(width+r, width+margin);
          by[i]=random(0, height);
        }
        else if (dir==1)
        {
          bx[i]=random(0, width);
          by[i]=random(height+r, height+margin);
        }
        else if (dir==2)
        {
          bx[i]=random(-margin, -r);
          by[i]=random(0, height);
        }
        else
        {
          bx[i]=random(0, width);
          by[i]=random(-margin, -r);
        }

        float angle=atan2(mouseY-by[i], mouseX-bx[i]);
        vx[i]=cos(angle)*spd;
        vy[i]=sin(angle)*spd;
      }
    }
    pushMatrix();
    translate(mouseX, mouseY);
    as.show();
    popMatrix();
  }
  
  else if
  (stage==2)
  {
    background(255);
    textSize(60);
    fill(0);
    text("GAME OVER!", width/2, height/2);
    textSize(15);
    text("Tip: Try playing with a lower speed setting", width/2, height/2+70);
  }
  else
  {
    background(255);
    textSize(60);
    fill(0);
    text("YOU WIN!", width/2, height/2);
    textSize(15);
    text("Congratulation", width/2, height/2+70);
  }

  if (now == 0)
  {
    background(255);
    textSize(60);
    fill(0);
    text("START!", width/2, height/2);
    for (int j = 0; j < instructions.length; j++)
    {
      textSize(15);
      text(instructions[j], width/2 , height/2+70+(j*18));  
    }
  }
}

void mousePressed()
{  
  now  = 1;
  if (stage==2 || stage==3)
  {
    stage=1;
    spd=3;
    mode=3;
    hp=100;
    godMode = false;
    for (int i=0; i<qty; i++)
    {
      int dir=int(random(2));
      if (dir==0) {
        bx[i]=random(width+r, width+margin);
        by[i]=random(0, height);
      }
      
      else if (dir==1)
      {
        bx[i]=random(0, width);
        by[i]=random(height+r, height+margin);
      }
      
      else if (dir==2)
      {
        bx[i]=random(-margin, -r);
        by[i]=random(0, height);
      }
      else
      {
        bx[i]=random(0, width);
        by[i]=random(-margin, -r);
      }
      float angle=atan2(mouseY-by[i], mouseX-bx[i]);
      vx[i]=cos(angle)*spd;
      vy[i]=sin(angle)*spd;
    }
    start=millis();
  }
  
  if (btnOver)
    godMode = true;
  else if (btn2Over)
    godMode = false;
  
}

void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  spd += -e * 0.1;
  mode += -e *0.1;
  if (spd < 1)
    spd = 1;
  else if (mode < 1)
    mode = 1;
  else if (spd > 10)
    spd = 10;
  else if (mode > 10)
    mode = 10;
}

void spdBar()
{
  textSize(20);
  fill(200);
  noStroke();
  text("Current Speed Setting", 120, 30);
  if(spd > 1 && spd < 6)
    fill(200);
  else if (spd <= 1)
    fill(0,255,0);
  else if (spd > 6 && spd < 10)
    fill(255,255,0);
  else if (spd >= 10)
    {
      fill(255,0,0);
    }
  rect(36, 50, spd*20, 20);
  text(str(int(spd)),22, 58);
}

void hpBar()
{
  textSize(20);
  fill(200);
  noStroke();
  text("HP", width-20, 30);
  if(godMode == true)
  {
     int R = (int)random(256);
     int G = (int)random(256);
     int B = (int)random(256);
     fill(R, G, B);
     stroke(R, G, B);
  }
  else
    fill(255,0,0);
  rect(width-40, 50, (-hp)*2, 20);
  fill(255,0,0);
  text(str(int(hp)),width-20,58);
}

void update(int x, int y)
{
  if(overBtn (btn1X, btn1Y, btnSize, btnSize))
  {
    btnOver = true;
    btn2Over = false;
  }
  else if(overBtn2(btn2X, btn2Y, btnSize, btnSize))
  {
    btn2Over = true;
    btnOver = false;
  }
  
  else
  btnOver = btn2Over = false;
}

boolean overBtn (int x, int y, int width, int height)
{
 if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height)
 {
    return true;
  }
  else
  {
    return false;
  }
}

boolean overBtn2 (int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height)
 {
    return true;
  }
  else
  {
    return false;
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
