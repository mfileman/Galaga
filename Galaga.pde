color bg = color(0);
float [] enemyPos = new float[80];  //(x,y)
//Made it twice the ammount of enemies so that each enemy has 2 values here.
//The first 40 values are the Y axis, the other half is the X.


PImage enemy_1, enemy_2, enemy_3, enemy_4;
PImage[] explosion = new PImage[71];
PImage ship;//, bullet;
PFont font;
boolean game, info, start, loseScreen;
int score, choice = 0;

enemy[] e = new enemy[40];
stars[] s = new stars[100];
Ship player = new Ship();
//Bullet[] bullets;

boolean keyPressed = false;

boolean defaultPos = false;
boolean crossPos = false;
boolean diamondPos = false;
boolean circlePos = false;
boolean heartPos = false;


boolean attack = false;
boolean death = false;
int attackTimer = 0;
int [] aMob = {10, 20, 30, 35};
int level = 1;
int enemySpeed = 2;




 void checkIfDead(enemy[] e)
  {
    int count = 1;
    
    for(int i = 0; i < e.length; i++)
    {
      if(enemyPos[40+i] < 0)
      count++;
    }
  
    if(count == 41)
      level++;
      
    if(level == 6)
    {
     level = 1;
     defaultPos = false;
     crossPos = false;
     diamondPos = false;
     circlePos = false;
     heartPos = false;
     enemySpeed *= 2;
    }
}


void setup()
{
  
  game = false;
  info = false;
  start = true;
  
  choice = 0;
  level = 1;
  
  textAlign(CENTER);
  background(bg);
  size(560, 800);
  font = loadFont("Arcade-Classic-48.vlw");
 
 initMenu();
 stroke(bg);
 triangle(140, (height/2)-13, 120, (height/2)-22, 120, (height/2)-4);
  
  
  //bullets = new Bullet[100000]; //as many bullets as possible so u dont run out
  //for(int i = 0; i < bullets.length; i++){
  //  bullets[i] = new Bullet();
  //}


  ship = loadImage("spaceship1.png"); //loads the ship + bullet images
  //bullet = loadImage("bullet.png");
  
  
  //For some reason I cant load imges in the enemy file.
  enemy_1 = loadImage("enemy_1.png");  
  enemy_2 = loadImage("enemy_2.png");
  enemy_3 = loadImage("enemy_3.png");
  enemy_4 = loadImage("enemy_4.png");
  
  for(int i = 0; i < explosion.length; i++)
  {
    explosion[i] = loadImage("dead/"+(i+1)+".png");
  }
  
  size(560,800);
  
  //Creates the enemy objects.
  for(int i = 0; i < e.length; i++)
     e[i] = new enemy();
  
  //Creates the background stars
  for(int i = 0; i < s.length; i++)
     s[i] = new stars();
}
int x = 0;


/*
* NAVIGATION CONTROLLER
* configures the pages and direction of navigation 
* when mouse is pressed on different pages
*/
void navController(){
   if(start) {
        initMenu();
        //print("start");
      }
      if(info) {
        initInfo();
        //print("info");
        if(keyCode == ENTER){
          start = false;
          initMenu();
        }
      }
      if(game) {
        initGame();
      }
      if(loseScreen){
      if(keyCode == ENTER){
          //loseScreen = false;
          initMenu();
        }
      }
      
       
}//end of nav controller

void mouseClicked(){
//print("CLICKED!!!!!");
  if(start)
  {
    if(choice == 1)
    {
      //start = false;
      initGame();
    }
    else if(choice == 2)
    {
     // start = false;
      initInfo();
    }
  }
  if(game)
    player.playerShoot();
}

void mouseMoved(){
  if(game)
    player.posX = mouseX;
}

void draw()
{  
  drawScoreboard();
  updateLives();
  navController();
 
 }


/*
* Initializes game state, is continuously called
*/
void initGame() {
  game = true;
  info = false; start = false; loseScreen = false;
  background(bg);
  
  player.drawPlayer();//continously updates
   //<>//
  //Chooses a random enemy to start moving
  int attEnemy = (int)random(39);
  
  //Only runs once at the beginning.
  if(!defaultPos && level == 1)
     defaultPOS();
     
  else if(!heartPos && level == 2)
     heartShape();
     
  else if(!crossPos && level == 3)
     crossShape();
     
  else if(!circlePos && level == 4)
     circleShape();
     
  else if(!diamondPos && level == 5)
     diamondShape();
  
  
  if((int)random(100) == 2 && defaultPos)
    attack = true;
    
    attackTimer+= 0.5;
  
  
  //Makes the enemies move
  if(attack)
  {
  
  if(enemyPos[attEnemy] < player.getPosY())
     enemyPos[attEnemy]+=enemySpeed;
  else
     enemyPos[attEnemy]-=enemySpeed;
 
  if(dist(enemyPos[40+attEnemy], enemyPos[attEnemy], mouseX+20, 755) < 40)
    {
      
      player.lives--;
      enemyPos[attEnemy] = 100;
      //pew.play();
      
      for(int j = 0; j < explosion.length; j++)
        image(explosion[j], player.posX-10, player.posY-10);
        
        
    }
    
     
     if((int)random(50) == 10)
     {
       float tempy = random(height);
       float tempx = random(width);
       
       for(int i = 0; i < 10; i++)
       {
       if(enemyPos[attEnemy] < tempy)
         (enemyPos[attEnemy])+=2;
       else
         (enemyPos[attEnemy])-=2;
         
       if(enemyPos[40+attEnemy] < tempx)
         (enemyPos[40+attEnemy])+=2;
       else
         (enemyPos[40+attEnemy])-=2;
       }
     }
  }
  
     
  
  //MAIN PART. Enemies are displayed.
  for(int i = 0; i < (e.length); i++)
  {
   e[i].animate(enemyPos[40+i], enemyPos[i], i);
   
   for(int j = 0; j < aMob.length; j++)
   {
     if(enemyPos[39+aMob[j]] > 0)
        e[aMob[j]].attack(enemyPos[39+aMob[j]], enemyPos[aMob[j]], j);
   }
  }
  
    checkIfDead(e);
  
  for(int i = 0; i < s.length; i++)
  {
     s[i].display();
     s[i].fall();
  }
  drawScoreboard();
}












/*
* INITAL MENU SCREEN
* game info, called when game initially starts 
* & after lose screen to be able to start a new game
*/
void initMenu() {
   game = false; info = false; start = true; loseScreen = false;
  score = 0;
  if(!info){   
      background(bg);
      textFont(font, 50);
      text("Galaga", width/2, 250);
      textFont(font, 32);
      text("1 PLAYER", width/2, height/2);
      text("INSTRUCTIONS", width/2+60, height/1.74);
      textFont(font, 18);
      text("TM 2018 Madison LTD.", width/2, height/1.33); 
      text("MADISON LTD. IS LICENSED", width/2, height/1.143);
      text("BY A LADY OF AMERICA INC.", width/2, height/1.09);
      textFont(font, 25);
      
      
      //stroke(bg);
      
       if(start && mouseY > height/2 -30 && mouseY < height/2 +5 && mouseX < 3*width/4 && mouseX > width/4 ) { //condition for 1 player
        stroke(bg);
        triangle(140, (height/2)-13, 120, (height/2)-22, 120, (height/2)-4);
        
        fill(bg);
        stroke(bg);
        triangle(140, (height/1.74)-13, 120, (height/1.74)-22, 120, (height/1.74)-4);
        choice = 1;
      }
       
      else if( start && mouseY > height/2 +30  && mouseY < height/2 + 60  && mouseX > width/4 ) { //condition for information
       stroke(bg);
        triangle(140, (height/1.74)-13, 120, (height/1.74)-22, 120, (height/1.74)-4);
        fill(bg);
        stroke(bg);
        triangle(140, (height/2)-13, 120, (height/2)-22, 120, (height/2)-4);
        choice = 2;
      }
    }
}

/*
* INFORMATION / HOW TO PLAY SCREEN
* How to play menu option screen
* displays information about how to play (controls, objective, etc.)
*/
void initInfo() {
  game = false; info = true; start = false; loseScreen = false;
  choice = 0;
  if(!start){
    background(bg);
    text("How to play:", width/2, 90);
    
    textSize(14);
    text("Move with your mouse...", width/2, 200);
    text("and click to fire!", width/2, 220);
    
    image(ship, 239, 350, 80, 80);
    //image(bullet, 263, 250, 30, 40);
    
    textSize(15);
    text("Try to dodge the enemy bullets!", width/2, 450);
    text("If you run out of lives, you lose!", width/2, 470);
    fill(255, 0, 0); //red
    text("lives", 332.5, 470);
    fill(255);//white
    text("Destroy all the enemies to advance!", width/2, 550);
    text("Good luck!", width/2, 570);
    
    textSize(17);
    text("Press enter to", width/2, 700);
    text("return to menu", width/2, 730);
  }
}


/*
* YOU LOSE SCREEN
* Screen displays when player lives reach 0
* & resets game state 
* sets loseScreen bool to TRUE (signal that the player is ON the lose screen)
*/
void loseScreen() {
  loseScreen = true;
  game = false; info = false; start = false;
  
  level = 1;
 
  
  defaultPos = false;
  crossPos = false;
  diamondPos = false;
  circlePos = false;
  heartPos = false;
    
  background(bg);
  textSize(15);
  player.lives = 3;
  text("Sorry, you lost!", width/2, height/2);
  text("Press Enter to Return to Menu.", width/2, 420);
}











/*
* Draws stats at the top of the screen DURING GAMEPLAY
* inluding LEVEL , HIGH SCORE of current game, and the remaining LIVES of the spaceship 
*/
void drawScoreboard() {
  textSize(20);
  fill(255,0,0); //red
  text("LEVEL", width/7, height/20);
  text(level, width/7, (height/20)+40);
  text("SCORE", width/2, height/20);
  text(score, width/2, (height/20)+40);
  text("LIVES", width/1.16, height/20);
  text(player.lives, 480, (height/20)+40);
  fill(255); //white
}


/*
* updateLives will continuously be called in the draw function and  
* will call loseScreen() WHEN LIVES == 0
* (loseScreen will RESET GAME STATE to be able to start a new game)
*/
void updateLives() {
  if(player.lives == 0) {
    loseScreen = true;
    game = false; info = false; start = false;
    loseScreen();
  }
}
