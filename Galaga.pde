import processing.sound.*;
SoundFile pew;
SoundFile click;
SoundFile enter;
SoundFile hurt;
SoundFile song;

color bg = color(0);
float [] enemyPos = new float[80];  //(x,y)
//Made it twice the ammount of enemies so that each enemy has 2 values here.
//The first 40 values are the Y axis, the other half is the X.


PImage enemy_1, enemy_2, enemy_3, enemy_4;
PImage[] explosion = new PImage[71];
PImage ship, bullet;
PFont font;
boolean game, info, start, loseScreen;
boolean songg = true;
int score, choice;

enemy[] e = new enemy[40];
stars[] s = new stars[100];
Ship player = new Ship();
Bullet[] bullets;

boolean keyPressed = false, upKey = false, right = false, left = false;

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



void keyPressed() { 
  player.setMove(keyCode, true);
  
  if((keyCode == UP || key == 'w' || key == ' ') && game == true ) { //sets which keys control which movement
    pew.play();
    upKey = true;
  }
  
  if(keyCode == UP && start == true) {
    stroke(bg);
    triangle(140, (height/2)-13, 120, (height/2)-22, 120, (height/2)-4);
    
    fill(bg);
    stroke(bg);
    triangle(140, (height/1.74)-13, 120, (height/1.74)-22, 120, (height/1.74)-4);
    choice = 1;
    click.play();
     }
     
  if(keyCode == DOWN && start == true) {
   stroke(bg);
    triangle(140, (height/1.74)-13, 120, (height/1.74)-22, 120, (height/1.74)-4);
    fill(bg);
    stroke(bg);
    triangle(140, (height/2)-13, 120, (height/2)-22, 120, (height/2)-4);
    choice = 2;
    click.play();
  }
  
  if(keyCode == ENTER && choice == 1 && start == true) {
    println("wow");
    game = true;
    info = false;
    start = false;
    enter.play();
  }
  
  
  if(keyCode == ENTER && choice == 2 && start == true) {
    println("ayy");
    drawInfo();
    info = true;
    game = false;
    start = false;
    enter.play();
  }
  if(keyCode == ' ' && choice == 2 && start == false && info == true) {
    background(bg);
    stroke(bg);
    triangle(140, (height/1.74)-13, 120, (height/1.74)-22, 120, (height/1.74)-4);
    info = false;
    game = false;
    start = true;
    enter.play();
  }
  if(keyCode == ENTER && loseScreen == true) { 
  //if the player hits enter after they lost (directions say hit enter to return to menu screen)
    info = false;
    game = false;
    start = true;
    loseScreen = false;
    background(bg);
    stroke(bg);
    triangle(140, (height/1.74)-13, 120, (height/1.74)-22, 120, (height/1.74)-4);
    enter.play();
    initMenu();
  }
}

void keyReleased() {
  player.setMove(keyCode, false);
}


void setup()
{
 
  pew = new SoundFile(this, "pew.mp3");

  click = new SoundFile(this, "click.wav");
  enter = new SoundFile(this, "enter.wav");
  song = new SoundFile(this, "song.mp3");
  
  game = false;
  info = false;
  start = true;
  
  choice = 1;
  level = 1;
  
  textAlign(CENTER);
  background(bg);
  size(560, 800);
  font = loadFont("Arcade-Classic-48.vlw");
 
 initMenu();
 stroke(bg);
 triangle(140, (height/2)-13, 120, (height/2)-22, 120, (height/2)-4);
  
  
  bullets = new Bullet[100000]; //as many bullets as possible so u dont run out
  for(int i = 0; i < bullets.length; i++){
    bullets[i] = new Bullet();
  }


  ship = loadImage("spaceship1.png"); //loads the ship + bullet images
  bullet = loadImage("bullet.png");
  
  
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

void draw()
{
  drawScoreboard();
  updateLives();
  if(start == true) {
    initMenu();
  }
  else if(info == true) {
    drawInfo();
  }
  else if(game == true) {
    initGame();
    
    if(songg == true)
    song.play();
    
    songg = false;
  }
 } //<>//
/*
* Initializes game state, is continuously called
*/

void initGame() {
  background(bg);
  
  player.move(); //continuously calls/ allows the player move function to be continously updated
  player.drawPlayer();//continously updates
  
   //IF THE PLAYER HITS THE "UP" key (indicating they want to shoot a bullet)
   if(upKey) {
    
    Bullet bullet = bullets[x];
      if( !bullet.getOnScreen() ) { //if not being used / offscreen
      bullet.first = true;
        do{
          bullet.drawBullet(player);    //update + draw the bullet
          bullet.updateBullet(); 
          //bullet.drawBullet(player);    //update + draw the bullet
        }while(!collisionDetection1(bullet) && bullet.posY > 0);  //is hasnt hit something and its still on screen 
      if(x<bullets.length-1)
        x++;
      else
       x = 0;  
    }
    //}
     //<>//
    
    upKey = false;

  } //end of if up
  
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
  
  if(dist(enemyPos[40+attEnemy], enemyPos[attEnemy], player.posX+20, player.posY+25) < 40)
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

/*
* Initial menu screen
* game info, called when game initially starts 
* & after lose screen to be able to start a new game
*/
void initMenu() {
  score = 0;
  if(!info) {
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
  }
}
/*
* updateLives will continuously be called in the draw function and  
* will call loseScreen() WHEN LIVES == 0
* (loseScreen will RESET GAME STATE to be able to start a new game)
*/
void updateLives() {
  if(player.lives == 0) {
    loseScreen();
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
  
  level = 1;
  
  song.stop();
  songg = true;
  
  defaultPos = false;
  crossPos = false;
  diamondPos = false;
  circlePos = false;
  heartPos = false;
    
    
  game = false;
  start = false;
  info = false;
  background(bg);
  textSize(15);
  player.lives = 3;
  text("Sorry, you lost!", width/2, height/2);
  text("Press Enter to Return to Menu.", width/2, 420);
}


/*
* Draws stats at the top of the screen during gameplay
* inluding LEVEL , HIGH SCORE of current game, and the remaining LIVES of the spaceship 
*/
void drawScoreboard() {
  textSize(20);
  fill(255,0,0); //red
  text("LEVEL", width/7, height/20);
  text(level, width/7, (height/20)+40);
  text("HI-SCORE", width/2, height/20);
  text(score, width/2, (height/20)+40);
  text("LIVES", width/1.16, height/20);
  text(player.lives, 480, (height/20)+40);
  fill(255); //white
}


/*
* How to play menu option screen
* displays information about how to play (controls, objective, etc.)
*/
void drawInfo() {
  background(bg);
  text("How to play:", width/2, 100);
  
  textSize(14);
  text("Use the arrow keys or WASD to move...", width/2, 200);
  text("And the up/W key to fire!", width/2, 220);
  
  image(ship, 239, 350, 80, 80);
  image(bullet, 263, 250, 30, 40);
  
  textSize(15);
  text("Try to dodge the enemy bullets!", width/2, 450);
  text("If you run out of lives, you lose!", width/2, 470);
  fill(255, 0, 0); //red
  text("lives", 332.5, 470);
  fill(255);//white
  text("Destroy all the enemies to advance!", width/2, 550);
  text("Good luck!", width/2, 570);
  
  textSize(17);
  text("Press Space to return to menu", width/2, 700);


}
