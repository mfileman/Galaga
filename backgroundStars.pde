class stars
{
  float x = random(width);
  float y = random(-100, height);
  float yspeed = 2;
  float size = 2;
  
  void display()
  {
    color[] bStars = {#0000FF, //blue
                      #FF0000, //red
                      #FF00FF, //pink
                      #00FF00, //green
                      #FFD700, //gold
                      #00FFFF, //cyan
                      #FFFFFF  //white
                     };
    noStroke();
    fill(bStars[(int)random(5)]);
    rect(x,y,size,size);
  }
  
  void fall()
  {
    y = y + yspeed;
    
    if(y > height+100)
    {
       y = random(-200, -100);
       yspeed = random(0.5,2);
    }
  }
}
