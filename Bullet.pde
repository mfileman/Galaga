class Bullet
{
  
/*This class defines the bullet object that 
will be created upon the command for a ship shooting*/
  
  /* PRIVATE INSTANCE VARIABLES */
    private int posX, posY;
    private boolean hasHit;
    private boolean onScreen;
    private boolean first;    
    
    
    /*CONSTRUCTOR */
    public Bullet() {           //CONSTRUCTOR
      this.hasHit = false;
      this.onScreen = false;
      this.posX = 0;
      this.posY = 0;
      this.first = true;
    }
    
    /* GETTER METHODS */
    
    public int getPosX(){
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
    
    
    public void hitSomething(){
      this.hasHit = true;
    }
    
    /* UPDATE BULLET METHOD
    this method edits the position of the bullet
    when the bullet position reaches a certain threshhold it will
    delete it / move it offscreen*/
     //<>//
    public void updateBullet(){  
       this.posY-=5;;
       
       if(this.posY == 0) {
         this.posX = 1000;
         this.hasHit = true;
         this.onScreen = false;
       }
       return;
    }
    
  
    public void drawBullet(Ship player) {
      this.onScreen = true;
      this.hasHit = false;
       
     this.posX = player.getPosX(); 
      
      if(this.first){ 
        posY = player.posY-40;
        this.first = false;
      }
      fill(255);
      ellipse(this.posX,this.posY, 3,3);
    }

}
