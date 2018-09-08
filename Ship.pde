class Ship {
  
  private int lives;           //instance variables
  boolean isLeft, isRight, isUp, isDown;
  int posX, posY;
  
  
  public Ship(){ //CONSTRUCTOR
    lives = 3;
    posX = 225;
    posY = 730;
  }
  
  public int getPosX(){ //STD getter methods, self explanatory
    return this.posX;
  }
  public int getPosY(){
    return this.posY;
  }
  
   public void loseLife(){ //edits # of lives when the player is hit w a bullet
    this.lives--;
  }
  
                              //MOVEMENT OF SHIP RIGHT / LEFT, self explanatory
  public void moveRight(){
    if( player.getPosX() < 445 ){
      player.posX += 10;
    }
  }
  
  public void moveLeft(){
    if( player.getPosX() > 10 ){
      player.posX -= 10;
    }
  }
  
  public void drawPlayer() { //draws the players ship at the ship objects location
    ship.resize(0,50);
    image(ship,this.posX,this.posY);
  }
  
  
  public void shoot(Bullet bulletObj){ //will constantly call these
      bulletObj.drawBullet(player);
      bulletObj.updateBullet();
  }
  
  //SMOOTING MOTION, so the movement of the players ship isnt so choppy
  int speed = 3;
  void move() {
    int r = 3>>1;
    posX = constrain(posX + speed*(int(isRight) - int(isLeft)), r, width - r);
  }
  
  boolean setMove(int k, boolean b) {
    switch(k) {
      case 'A': //moves left
      case LEFT:
      return isLeft = b;
      
      case 'D': //moves right
      case RIGHT:
      return isRight = b;
      
      default: 
      return b;
    }
  }
  
 
  
}