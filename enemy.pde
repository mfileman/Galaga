class enemy
{
  float time;
  enemyBullet b = new enemyBullet();

  //Displays enemies.
  void display(float x, float y, int i)
  {
    //4 different types of enemies are displayed in each row.

    if (i < 10)
      image(enemy_1, x, y);
    else if (i < 20)
      image(enemy_2, x, y);
    else if (i < 30)
      image(enemy_3, x, y);
    else
      image(enemy_4, x, y);
  }

  //It makes the enemies move in a circular motion.
  void animate(float x, float y, int i)
  {
    {
      if (time < 40)
        y-=10;
      if (time < 30)
        x-=10;
      if (time < 20)
        y+=10;
      if (time < 10)
        x+=10;
    }

    display(x, y, i);

    if (time < 40)
      time += 0.25;
    else
      time = 1;
  }

  //Not implemented yet. Shoots enemy bullet
  void attack(float x, float y, int j)
  {
    b.basey = y;
    b.j = j;
    if(b.x == 0)
    {
      b.x = x + 15;
      b.y = y + 15;
    }
    
    b.fall();
    b.display();
  }
}
