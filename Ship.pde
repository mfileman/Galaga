class Ship {
  
  private int lives;           //instance variables
  boolean isLeft, isRight;
  int posX;
  final int posY;
  
  
  public Ship(){ //CONSTRUCTOR
    lives = 3;
    posX = width/2;
    posY = 730; //should never change! were limiting our players movement to 1D
  }
  
  public int getPosX(){ //STD getter methods, self explanatory
    return mouseX;
  }
  public int getPosY(){
    return this.posY;
  }
  
   public void loseLife(){ //edits # of lives when the player is hit w a bullet
    this.lives--;
  }
 
  
  /*
  * is called on a ship object & 
  * draws the players ship at the ship objects location
  */
  
  public void drawPlayer() { 
    ship.resize(0,50);
    image(ship,this.posX,this.posY); //hardcoded because were limiting the players ability to move in 2D (y pos should never change)
  }
  
  
  public void shoot(Bullet bulletObj){ //will constantly call these
      bulletObj.drawBullet(player);
      bulletObj.updateBullet();
  }
  
  
  
  
public boolean collisionDetection1(Bullet obj)
{
  
  for(int i = 0; i < (enemyPos.length)/2; i++)
  {
    if(enemyPos[40+i]-20 < obj.posX && obj.posX < enemyPos[40+i]+20)
    {
      if(enemyPos[i]-20 < obj.posY && obj.posY < enemyPos[i]+20)
      {
        imageMode(CENTER);
        for(int j = 0; j < explosion.length; j++)
        {
          image(explosion[j], enemyPos[40+i], enemyPos[i]);
        }
        
         enemyPos[40+i] = -100;
         obj.hasHit = true;
        
         score += 100;
         return true;
      }
    }
  }
  obj.hasHit = false;
  return false;
}



  
  void playerShoot() { 
    //pew.play();//play soud effect
        Bullet bullet = new Bullet();        
        bullet.first = true;
        
        do{
          shoot(bullet);
        }
        while(!collisionDetection1(bullet) && bullet.posY > 0);  //is hasnt hit something and its still on screen
        
      //if(x<bullets.length-1)
      //  x++;
      //else
      // x = 0;  
    }
  }
  
  
  
  
                               //MOVEMENT OF SHIP RIGHT / LEFT, self explanatory
  //public void moveRight(){
  //  if( player.getPosX() < 445 ){
  //    player.posX += 10;
  //  }
  //}
  
  //public void moveLeft(){
  //  if( player.getPosX() > 10 ){
  //    player.posX -= 10;
  //  }
  //}
  
  
  
  
  //SMOOTING MOTION, so the movement of the players ship isnt so choppy
  //int speed = 3;
  //void move() {
  //  int r = 3>>1;
  //  posX = constrain(posX + speed*(int(isRight) - int(isLeft)), r, width - r);
  //}
  
  //boolean setMove(int k, boolean b) {
  //  switch(k) {
  //    case 'A': //moves left
  //    case LEFT:
  //    return isLeft = b;
      
  //    case 'D': //moves right
  //    case RIGHT:
  //    return isRight = b;
      
  //    default: 
  //    return b;
  //  }
  //}
  
 
  
