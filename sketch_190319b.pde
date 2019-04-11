int cols, rows;
int gridsize = 60;
int i, g, h;
int bones = 4;
int s = second();
int elapsed=60;
int attempMovement;
boolean a=true, b=true, c=true, d=true;
int currentPosition [] = {5, 6}; ///Y y X
int movement = 4;
boolean boneA=true, boneB=true, boneC=true, boneD=true;
int [][] map = 
  {

  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 0}, 
  {0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0}, 
  {0, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 0}, 
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0}, 
  {0, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 0}, 
  {0, 1, 0, 3, 1, 1, 1, 1, 1, 1, 1, 0}, 
  {0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0}, 
  {0, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 0}, 
  {0, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 

};

int sleep = 0;


/*int [][] plane = 
 {
 
 {0,0,0,0,0,0,0,0,0,0,0,0},
 {0,1,1,1,1,1,1,1,1,1,2,0},
 {0,1,0,1,1,1,0,0,1,1,1,0},
 {0,1,0,1,1,1,3,1,1,1,1,0},
 {0,1,1,1,1,2,1,1,1,1,1,0},
 {0,1,1,1,1,1,1,1,1,1,1,0},
 {0,1,1,0,1,1,1,1,1,1,1,0},
 {0,1,1,1,1,1,1,1,1,1,1,0},
 {0,1,1,1,1,1,1,1,1,3,1,0},
 {0,3,1,2,1,1,1,0,1,1,2,0},
 {0,1,1,1,1,1,1,0,1,1,1,0},
 {0,0,0,0,0,0,0,0,0,0,0,0},
 
 };
 */
void setup() {
  cols = 10;
  rows = 10;
}

public void settings() {
  size(600, 690);
}

void draw() {
  drawBackground(255);
  drawGrid();
  drawObjstacles();
  drawSewer();
  drawBones(boneA, boneB, boneC, boneD);
  drawStats();
}

void drawCircle(int position[]) {
  circle((position[0]*60)-30, (position[1]*60)-30, 10);
}

void drawBackground(int value) {
  background(value);
}

void validation(int movement) {



  while (movement<4) {
    System.out.println("Inicia validacion");
    attempMovement = int(random(4));
    int y = currentPosition[0];
    int x = currentPosition[1];

    if (attempMovement == 0) {
      //  System.out.println("la posicion actual es: "+plane[y][x]);
      //  System.out.println("arriba es : "+plane[y][x-1]);
      if (map[y][x-1]==0) {
        //   System.out.println("No me puedo mover");
      } else {
        currentPosition [1] = currentPosition [1]-1; 

        drawDog(currentPosition);
        movement=5;
      }

      if (map[y][x-1]==2) {
        elapsed=elapsed+30;
        map[y][x-1]=1;
      }
      if (map[y][x-1]==3) {
        elapsed=0;
      }
    }



    if (attempMovement == 1) {
      // System.out.println("la linea hacie[y+6][x]+plane[y+7][x]);
      if (map[y+1][x]==0) {
        // System.out.println("No me puedo mover");
      } else {
        currentPosition [0] = currentPosition [0]+1; 

        drawDog(currentPosition);
        movement=5;
      }


      if (map[y+1][x]==2) {
        map[y+1][x]=1;
        elapsed=elapsed+30;
      }
      if (map[y+1][x]==3) {
        elapsed=0;
      }
    }

    if (attempMovement == 2) {
      // System.out.println("la posicion actual es: "+plane[y][x]);
      // System.out.println("abajo es : "+plane[y][x+1]);
      if (map[y][x+1]==0) {
        //  System.out.println("No me puedo mover");
      } else {
        currentPosition [1] = currentPosition [1]+1; 

        drawDog(currentPosition);
        movement=5;
      }

      if (map[y][x+1]==2) {
        map[y][x+1]=1;
        elapsed=elapsed+30;
      }
      if (map[y][x+1]==3) {
        elapsed=0;
      }
    }

    if (attempMovement == 3) {
      //System.out.println("actual: "+plane[y][x]);
      //System.out.println("la linea hacia izquierda es: "+plane[y-1][x]);
      if (map[y-1][x]==0) {
        //System.out.println("No me puedo mover");
      } else {
        currentPosition [0] = currentPosition [0]-1; 

        drawDog(currentPosition);
        movement=5;
      }

      if (map[y-1][x]==2) {
        map[y-1][x]=1;
        elapsed=elapsed+30;
      }
      if (map[y-1][x]==3) {
        elapsed=0;
      }
    }
  }// fin de while

  if (currentPosition[0]==10 && currentPosition[1] == 1 ) {
    System.out.println("Se encontro el hueso D +++++++++++++++");
    boneD=false;
  }

  if (currentPosition[0]==5 && currentPosition[1] == 4 ) {
    System.out.println("Se encontro el hueso C +++++++++++++++");
    boneA=false;
  }

  if (currentPosition[0]==3 && currentPosition[1] == 9 ) {
    System.out.println("Se encontro el hueso B +++++++++++++++");
    boneB=false;
  }

  if (currentPosition[0]==10 && currentPosition[1] == 9 ) {
    System.out.println("Se encontro el hueso C +++++++++++++++");
    boneC=false;
  }
}// end validation

void drawGrid() {
  stroke(0);
  for (int i = 0; i < rows; i++  ) {
    g = g  + gridsize;
    line(0, g, width, g);
  }
  g = 0;
  i = 0;

  for (int i = 0; i < cols; i++  ) {
    h = h +  gridsize;
    line(h, 0, h, height);
  }
  h = 0;
}


public void drawDog(int position[]) {
  int a = ((position[0])*60)-60;
  int b = ((position[1])*60)-60;
  noStroke();
  fill(0);

  rect(a+30, b+30, 2, 2);

  rect(a+30, b+16, 2, 2);///
  rect(a+28, b+16, 2, 2);///
  rect(a+26, b+16, 2, 2);///A
  rect(a+24, b+16, 2, 2);///


  rect(a+32, b+18, 2, 2);///b
  rect(a+22, b+18, 2, 2);///

  rect(a+34, b+20, 2, 2);///c
  rect(a+20, b+20, 2, 2);///


  rect(a+34, b+22, 2, 2);///d
  rect(a+20, b+22, 2, 2);///
  rect(a+24, b+22, 2, 2);///
  rect(a+16, b+22, 2, 2);///


  rect(a+36, b+24, 2, 2);///e
  rect(a+18, b+24, 2, 2);///
  rect(a+14, b+24, 2, 2);///
  rect(a+24, b+24, 2, 2);///

  rect(a+36, b+26, 2, 2);///f
  rect(a+28, b+26, 2, 2);///
  rect(a+16, b+26, 2, 2);///

  rect(a+36, b+28, 2, 2);///g
  rect(a+28, b+28, 2, 2);///
  rect(a+16, b+28, 2, 2);///
  rect(a+44, b+28, 2, 2);///

  rect(a+36, b+30, 2, 2);///h
  rect(a+34, b+30, 2, 2);///
  rect(a+32, b+30, 2, 2);///
  rect(a+30, b+30, 2, 2);///
  rect(a+26, b+30, 2, 2);///
  rect(a+24, b+30, 2, 2);///
  rect(a+22, b+30, 2, 2);///
  rect(a+20, b+30, 2, 2);///
  rect(a+18, b+30, 2, 2);///
  rect(a+42, b+30, 2, 2);///
  rect(a+46, b+30, 2, 2);///


  rect(a+40, b+32, 2, 2);///i
  rect(a+44, b+32, 2, 2);///i
  rect(a+33, b+32, 2, 2);///
  rect(a+27, b+32, 2, 2);///
  rect(a+23, b+32, 2, 2);///

  rect(a+23, b+34, 2, 2);///j
  rect(a+25, b+34, 2, 2);///
  rect(a+35, b+34, 2, 2);///
  rect(a+37, b+34, 2, 2);///
  rect(a+43, b+34, 2, 2);///

  rect(a+41, b+36, 2, 2);///k
  rect(a+23, b+36, 2, 2);///

  rect(a+38, b+38, 2, 2);///l
  rect(a+23, b+38, 2, 2);///

  rect(a+38, b+40, 2, 2);///m
  rect(a+23, b+40, 2, 2);///

  rect(a+38, b+42, 2, 2);///n
  rect(a+32, b+42, 2, 2);///n
  rect(a+30, b+42, 2, 2);///n
  rect(a+28, b+42, 2, 2);///n
  rect(a+23, b+42, 2, 2);///


  rect(a+38, b+44, 2, 2);///o
  rect(a+32, b+44, 2, 2);///
  rect(a+28, b+44, 2, 2);///
  rect(a+23, b+44, 2, 2);///

  rect(a+38, b+46, 2, 2);///p
  rect(a+32, b+46, 2, 2);///
  rect(a+28, b+46, 2, 2);///
  rect(a+23, b+46, 2, 2);///

  rect(a+36, b+48, 2, 2);///p
  rect(a+34, b+48, 2, 2);///
  rect(a+27, b+48, 2, 2);///
  rect(a+25, b+48, 2, 2);///
}

public void drawBones(boolean a, boolean b, boolean c, boolean d) {

  fill(255, 228, 181);
  if (a) {
    noStroke();
    circle(253, 223, 20);
    circle(269, 229, 20);

    circle(270, 212, 20);

    circle(272, 198, 20);
    circle(287, 204, 20);
  }
  if (b) {
    noStroke();
    circle(148, 527, 20);
    circle(136, 520, 20);

    circle(150, 510, 20);

    circle(167, 500, 20);
    circle(153, 493, 20);
  }

  if (c) {
    noStroke();
    circle(553, 520, 20);
    circle(568, 527, 20);

    circle(568, 509, 20);

    circle(586, 500, 20);
    circle(571, 493, 20);
  }

  if (d) {
    noStroke();
    circle(575, 10, 20);
    circle(586, 15, 20);

    circle(572, 26, 20);

    circle(557, 38, 20);
    circle(573, 42, 20);
  }
}




public void drawSewer() {

  fill(100);
  ellipse(30, 530, 55, 15);
  fill(10);
  ellipse(30, 531, 35, 8);

  fill(100);
  ellipse(330, 170, 55, 15);
  fill(10);
  ellipse(330, 171, 35, 8);

  fill(100);
  ellipse(510, 470, 55, 15);
  fill(10);
  ellipse(510, 471, 35, 8);
}





void drawStats() {



  fill(100);
  rect(0, 600, 600, 90);

  if (sleep==30) {

    System.out.println("durmiendo");
    delay(10000);
    elapsed=elapsed-10;

    sleep=0;
  }

  if (s!=second()) {
    elapsed=elapsed-1;
    sleep++;
    validation(int(random(4)));
  }

  if (elapsed<=0) {
    fill(255, 0, 0);
    textSize(52);
    text("Game Over", 5, 645); 
    noLoop();
    fill(0, 102, 153);
  } else {

    drawDog(currentPosition);
    fill(255);
    textSize(32);
    text(elapsed, 5, 640);

    fill(0, 102, 153);
  }

  // Values from 0 - 59
  s = second();
}




void drawObjstacles() {
  stroke(0);

  //--building
  fill(100);
  rect(60, 60, 60, 120); 
  fill(75); //grey roof
  rect(55, 60, 70, 10); //roof

  fill(240, 230, 60); //yellow
  rect(65, 80, 10, 10); //window
  rect(85, 80, 10, 10); //window  
  rect(105, 80, 10, 10); //window

  rect(65, 100, 10, 10); //window
  rect(85, 100, 10, 10); //window  
  rect(105, 100, 10, 10); //window

  rect(65, 120, 10, 10); //window
  rect(85, 120, 10, 10); //window  
  rect(105, 120, 10, 10); //window

  rect(65, 140, 10, 10); //window
  rect(85, 140, 10, 10); //window  
  rect(105, 140, 10, 10); //window

  fill(153, 76, 0); //brown
  rect(85, 160, 10, 20); //door
  //--building


  //--building
  fill(100);
  rect(360, 480, 60, 120); 
  fill(75); //grey roof
  rect(355, 480, 70, 10); //roof

  fill(240, 230, 60); //yellow
  rect(365, 500, 10, 10); //window
  rect(385, 500, 10, 10); //window  
  rect(405, 500, 10, 10); //window

  rect(365, 520, 10, 10); //window
  rect(385, 520, 10, 10); //window  
  rect(405, 520, 10, 10); //window

  rect(365, 540, 10, 10); //window
  rect(385, 540, 10, 10); //window  
  rect(405, 540, 10, 10); //window

  rect(365, 560, 10, 10); //window
  rect(385, 560, 10, 10); //window  
  rect(405, 560, 10, 10); //window

  fill(153, 76, 0); //brown
  rect(385, 580, 10, 20); //door
  //--building




  //--building
  fill(100);
  rect(300, 60, 120, 60); 
  fill(75); //grey roof
  rect(295, 60, 130, 10); //roof




  fill(240, 230, 60); //yellow
  rect(310, 80, 10, 10); //window
  rect(330, 80, 10, 10); //window
  rect(355, 80, 10, 10); //window
  rect(380, 80, 10, 10); //window
  rect(400, 80, 10, 10); //window

  fill(153, 76, 0); //brown
  rect(355, 100, 10, 20); //window

  //--building




  //--building
  fill(100);
  rect(120, 300, 60, 60); 
  fill(75); //grey roof
  rect(115, 300, 70, 10); //roof

  fill(240, 230, 60); //yellow
  rect(130, 320, 10, 10); //window
  rect(160, 320, 10, 10); //window

  fill(153, 76, 0); //brown
  rect(145, 340, 10, 20); //door
  //--building
}
