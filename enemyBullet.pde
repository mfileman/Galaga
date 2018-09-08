class enemyBullet
{
  float x;
  float y;
  float basey;
  float yspeed = 0.1;
  float size = 2;
  int j;
  
  void display()
  {
    noStroke();
    fill(255);
    ellipse(x,y,size,size);
  }
  
  void fall()
  {
    y = y + yspeed;
    if(y > height + 100)
    {
       y = basey;
       aMob[j] = (int)random(39);
    }
    
    if(dist(this.x, this.y , player.posX+20, player.posY+25) < 40)
    {
      player.lives--;
      y = basey;
      aMob[j] = (int)random(39);
      
      for(int j = 0; j < explosion.length; j++)
        image(explosion[j], player.posX-10, player.posY-10);
        
      println(player.lives);
    }
  }
}
