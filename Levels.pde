void defaultPOS()
{
  //First half of the 80 array. Same Y axis, different X axis
  int count = 1;
  for(int i = 0; i < ((enemyPos.length)/2); i++)
  {
    enemyPos[i] = 40*(count);
    
    if(i != 0 && ((i+1) % 10 == 0))
       count++;
  }
  
  //Second half of the 80 array. Same X axis, different Y axis
  count = 1;
  for(int i = ((enemyPos.length)/2); i < ((enemyPos.length)); i++)
  {
    enemyPos[i] = 40*(count+1);
    count++;
    
    if(i != 0 && ((i+1) % 10 == 0))
      count = 1;
  }
  
  defaultPos = true;
}

void heartShape()
{
  enemyPos[0] = 40;  enemyPos[40] = 160;
  enemyPos[1] = 40;  enemyPos[41] = 360;
  
  for(int i = 2; i <= 7; i++)
  {
    enemyPos[i] = 80;
    enemyPos[i+40] = 40*(i+1);
    if(i > 4)
    enemyPos[i+40] = 40*(i+3);
  }
  
  for(int i = 8; i <= 15; i++)
  {
    enemyPos[i] = 120;
    enemyPos[i+40] = 40*(i-5);
  }
  
  for(int i = 16; i <= 23; i++)
  {
    enemyPos[i] = 160;
    enemyPos[i+40] = 40*(i-13);
  }
  
  for(int i = 24; i <= 29; i++)
  {
    enemyPos[i] = 200;
    enemyPos[i+40] = 40*(i-20);
  }
  
  for(int i = 30; i <= 33; i++)
  {
    enemyPos[i] = 240;
    enemyPos[i+40] = 40*(i-25);
  }
  
  enemyPos[34] = 360;  enemyPos[74] = 260;
  enemyPos[35] = 280;  enemyPos[75] = 240;
  enemyPos[36] = 280;  enemyPos[76] = 280;
  enemyPos[37] = 320;  enemyPos[77] = 260;
  enemyPos[38] = 280;  enemyPos[78] = 80;
  enemyPos[39] = 280;  enemyPos[79] = 440;
  
  heartPos = true;
}

void crossShape()
{
  enemyPos[0] = 40;  enemyPos[40] = 240;
  enemyPos[1] = 40;  enemyPos[41] = 280;
  enemyPos[2] = 40;  enemyPos[42] = 320;
  
  enemyPos[3] = 80;  enemyPos[43] = 240;
  enemyPos[4] = 80;  enemyPos[44] = 320;
  
  enemyPos[5] = 120;  enemyPos[45] = 240;
  enemyPos[6] = 120;  enemyPos[46] = 320;
  
  enemyPos[7]  = 160;  enemyPos[47] = 120;
  enemyPos[8]  = 160;  enemyPos[48] = 160;
  enemyPos[9]  = 160;  enemyPos[49] = 200;
  enemyPos[10] = 160;  enemyPos[50] = 240;
  enemyPos[11] = 160;  enemyPos[51] = 320;
  enemyPos[12] = 160;  enemyPos[52] = 360;
  enemyPos[13] = 160;  enemyPos[53] = 400;
  enemyPos[14] = 160;  enemyPos[54] = 440;
  
  enemyPos[15] = 200;  enemyPos[55] = 120;
  enemyPos[16] = 200;  enemyPos[56] = 440;
  
  enemyPos[17] = 240;  enemyPos[57] = 120;
  enemyPos[18] = 240;  enemyPos[58] = 160;
  enemyPos[19] = 240;  enemyPos[59] = 200;
  enemyPos[20] = 240;  enemyPos[60] = 240;
  enemyPos[21] = 240;  enemyPos[61] = 320;
  enemyPos[22] = 240;  enemyPos[62] = 360;
  enemyPos[23] = 240;  enemyPos[63] = 400;
  enemyPos[24] = 240;  enemyPos[64] = 440;
  
  enemyPos[25] = 280;  enemyPos[65] = 80;
  enemyPos[26] = 280;  enemyPos[66] = 240;
  enemyPos[27] = 280;  enemyPos[67] = 320;
  enemyPos[28] = 280;  enemyPos[68] = 480;
  
  enemyPos[29] = 320;  enemyPos[69] = 120;
  enemyPos[30] = 320;  enemyPos[70] = 240;
  enemyPos[31] = 320;  enemyPos[71] = 320;
  enemyPos[32] = 320;  enemyPos[72] = 440;
  
  enemyPos[33] = 360;  enemyPos[73] = 120;
  enemyPos[34] = 360;  enemyPos[74] = 160;
  enemyPos[35] = 360;  enemyPos[75] = 240;
  enemyPos[36] = 360;  enemyPos[76] = 280;
  enemyPos[37] = 360;  enemyPos[77] = 320;
  enemyPos[38] = 360;  enemyPos[78] = 400;
  enemyPos[39] = 360;  enemyPos[79] = 440;
  
  
  crossPos = true;
}

void circleShape()
{
  int count = 2;
  for(int i = 0; i < 25; i++)
  {
    enemyPos[i] = 40*(count);
    
    if(i != 0 && ((i+1) % 5 == 0))
       count++;
  }
  
  //Second half of the 80 array. Same X axis, different Y axis
  count = 2;
  for(int i = 0; i < 25; i++)
  {
    enemyPos[40+i] = 40*(count+2);
    count++;
    
    if(i != 0 && ((i+1) % 5 == 0))
      count = 2;
  }
  
  enemyPos[25] = 40; enemyPos[65] = 200;
  enemyPos[26] = 40; enemyPos[66] = 240;
  enemyPos[27] = 40; enemyPos[67] = 280;
  
  enemyPos[28] = 120; enemyPos[68] = 120;
  enemyPos[29] = 160; enemyPos[69] = 120;
  enemyPos[30] = 200; enemyPos[70] = 120;
  
  enemyPos[31] = 120; enemyPos[71] = 360;
  enemyPos[32] = 160; enemyPos[72] = 360;
  enemyPos[33] = 200; enemyPos[73] = 360;
  
  enemyPos[34] = 280; enemyPos[74] = 200;
  enemyPos[35] = 280; enemyPos[75] = 240;
  enemyPos[36] = 280; enemyPos[76] = 280;
  
  enemyPos[37] = 280; enemyPos[77] = 80;
  enemyPos[38] = 280; enemyPos[78] = 400;
  enemyPos[39] = 320; enemyPos[79] = 240;

  circlePos = true;
}

void diamondShape()
{
  int count = 4;
  for(int i = 0; i < 20; i++)
  {
    enemyPos[i] = 40*(count);
    
    if(i != 0 && ((i+1) % 10 == 0))
       count++;
  }
  
  //Second half of the 80 array. Same X axis, different Y axis
  count = 2;
  for(int i = 0; i < 20; i++)
  {
    enemyPos[40+i] = 40*(count);
    count++;
    
    if(i != 0 && ((i+1) % 10 == 0))
      count = 2;
  }
  
  enemyPos[20] = 0; enemyPos[60] = 240;
  enemyPos[21] = 0; enemyPos[61] = 280;
  
  enemyPos[22] = 40; enemyPos[62] = 200;
  enemyPos[23] = 40; enemyPos[63] = 320;
  
  enemyPos[24] = 80; enemyPos[64] = 240;
  enemyPos[25] = 80; enemyPos[65] = 280;
  enemyPos[26] = 80; enemyPos[66] = 160;
  enemyPos[27] = 80; enemyPos[67] = 360;
  
  enemyPos[28] = 120; enemyPos[68] = 120;
  enemyPos[29] = 120; enemyPos[69] = 400;
  
  enemyPos[30] = 360; enemyPos[70] = 240;
  enemyPos[31] = 360; enemyPos[71] = 280;
  
  enemyPos[32] = 320; enemyPos[72] = 200;
  enemyPos[33] = 320; enemyPos[73] = 320;
  
  enemyPos[34] = 280; enemyPos[74] = 240;
  enemyPos[35] = 280; enemyPos[75] = 280;
  enemyPos[36] = 280; enemyPos[76] = 160;
  enemyPos[37] = 280; enemyPos[77] = 360;
  
  enemyPos[38] = 240; enemyPos[78] = 120;
  enemyPos[39] = 240; enemyPos[79] = 400;
  

  diamondPos = true;
}