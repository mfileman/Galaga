class Ship {
  
  private int lives;           //instance variables
  boolean isLeft, isRight;
  int posX;
  final int posY;
  
  
  public Ship(){ //CONSTRUCTOR
    lives = 3;
    posX = 225;
    posY = 730; //should never change! were limiting our players movement to 1D
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
