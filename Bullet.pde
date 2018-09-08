class Bullet
{

    private int posX, posY; //instance variables
    private boolean hasHit;
    private boolean onScreen;
    private boolean first;    
    
    public Bullet() {           //CONSTRUCTOR
      this.hasHit = false;
      this.onScreen = false;
      this.posX = 0;
      this.posY = 0;
      this.first = true;
    }
    
    public int getPosX(){          //STD GETTER METHODS, self explanatory
      return this.posX;
    }
    public int getPosY(){
      return this.posY;
    }
    public boolean getHasHit(){
      return this.hasHit;
    } 
    public boolean getOnScreen(){
      return this.onScreen;
    }
    
    public void hitSomething(){ //for collision detection
      this.hasHit = true;
    }
     //<>//
    public void updateBullet(){  //movement of the bullet
       this.posY-=5; //edits the objects position, will be drawn at the 
       //print(this.posY+ " " +  this + "\n"); //for debugging purposes
       
       if(this.posY == 0) {
         // "delete" the bullet, (move offscreen)
         this.posX = 1000;
         this.hasHit = true;
         this.onScreen = false;
       }
       return;
    }
    
  
    public void drawBullet(Ship player){ //draws the bullet img
      this.onScreen = true;
      this.hasHit = false;
      
      //displays the bullet as if the ship were shooting it
      this.posX = player.getPosX() + 13; 
      
      if(this.first){ 
      //only places it infront of the ship if 
      //its the first instance of it being draw, will edit placement over this initial placement
        posY = player.getPosY() - 100;
        this.first = false;
      }
      fill(255);
      ellipse(this.posX,this.posY, 3,3);
      //bullet.resize(0,30); 
      //image(bullet, this.posX, this.posY); //couldnt get the bullet image to work consistently
    }

}