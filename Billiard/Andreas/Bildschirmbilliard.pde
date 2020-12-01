/*

 zu 1.)
 
   Relationale Operatoren:
   
   Größer- Gleich >=
   Kleiner Gleich <=
   Größer >
   kleiner <
   gleich ==
   ungleich !=
   
   Beispiel Gleichheit:
   
     int i;
     if (i == 5){
       println(i);
     }
   
zu 2.)

  Erweiterte if-Bedingung:
  
    int i;
    if (i==5){
      println(i)
    }else if (i > 5){
      prinln("i ist zu hoch!")
    }else{
      println("i ist zu niedrig")
    }
    
    
zu 3.)

  Logische Operatoren:
  
  und &&
  oder ||
  nicht !
  
    String essen;
    boolean lecker;
    
    if (essen == "Pizza" && lecker){
      println(" :) ") 
    }else if (essen == "Rosenkohl" || essen == "Wirsing" && !lecker){
      println(" :( ")
    }
 
 
 */


float ballX;
float ballY;
int diameter;
float speedX;
float speedY;
boolean ballIsMoving;
boolean reflectBlock;
boolean win;
color ballColor;
int points;

float holeXNW;
float holeYNW;
float holeXSW;
float holeYSW;
float holeXNE;
float holeYNE;
float holeXSE;
float holeYSE;



void hole(float x, float y){
  //draws a hole
  strokeWeight(1);
  stroke(0);
  fill(0);
  circle(x,y,40);
}

void ball(){
  //draws the ball
  stroke(ballColor);
  fill(ballColor);
  circle(ballX, ballY, diameter);
}

void aimCircle(){
  // visualizes maximum speed
  stroke(0);
  noFill();
  circle(ballX, ballY, (diameter*5));
}

void aimArrow(int weight){
  //draws a line from the ball to the mouse
  stroke(0);
  strokeWeight(weight);
  line(mouseX,mouseY,ballX, ballY);
}

void reflectX(){
  //reflects the ball at the right and left border and decreases speed by 20%
  speedX *= -0.8;
  speedY *= 0.8;
}

void reflectY(){
  //reflects the ball at the up and down border and decreases speed by 20%
  speedX *= 0.8;
  speedY *= -0.8;
}

void checkWin(){
  //Checks whether the ball has hit any of the holes, if it hits it resests ball position 
  // and increases the points
  float[] holes = {holeXNW,holeYNW,holeXNE,holeYNE,holeXSW,holeYSW,holeXSE,holeYSE};
  for (int i=0; i<holes.length-1; i+=2){
    float distance = pow((ballX-holes[i]),2)+pow((ballY-holes[i+1]),2);
    float minDistance = pow((diameter/2+10),2);
    if ((distance <= minDistance) && (abs(speedX) <= 20) && (abs(speedY) <=20)){
      // If speed is to high, ball will reflect from the hole. This makes scoring a hit a little more challenging.
      ballX = width/2;
      ballY = height/2;
      ballColor = color(255,0,0);
      speedX = 0;
      speedY = 0;
      points += 10;
      win = true;
      break;
    }
  }
}

void pointsText(){
  textSize(14);
  fill(0);
  String msg = "Points: " + points;
  text(msg, (width/2 - 50), 20);
}

void mousePressed(){
  ballColor = color(255,0,0);
}
void mouseReleased(){
  float distance = pow((ballX-mouseX),2)+pow((ballY-mouseY),2);
  float minDistance = pow((diameter*2.6),2);
  if (!ballIsMoving && (distance < minDistance)){ 
    //blocks function while ball is moving and limits the maximum speed
    speedX = (ballX - mouseX)*0.6; // The distance between ball and Mouse is used to set the speed
    speedY = (ballY - mouseY)*0.6; // A dampening factor of 0.6 is used to prevent to high speeds, because they will lead to glitchy behavior of the ball
    ballIsMoving = true;
  }
}

void setup(){
  size(600,400);
  background(0,153,0);
  ballX = width/2;
  ballY = height/2;
  holeXNW = 10;
  holeYNW = 10;
  holeXSW = 10;
  holeYSW = height - 30;
  holeXNE = width - 15;
  holeYNE = 10;
  holeXSE = width - 15;
  holeYSE = height - 30;
  diameter = 30;
  ballIsMoving = false;
  points = 0;
  ballColor = color(255,0,0);
  ball();
}

void draw(){
  background(0,153,0);
  hole(holeXNW,holeYNW);
  hole(holeXNE,holeYNE);
  hole(holeXSE,holeYSE);
  hole(holeXSW,holeYSW);
  ball();
  pointsText();
  
  if (ballIsMoving){
    ballX += speedX;
    ballY += speedY;
    speedX *= 0.99;
    speedY *= 0.99; // Slows the Ball by 1% each Frame
    
    if (! reflectBlock){
      if ((ballX>=(width-5-(diameter/2))||ballX<=(diameter/2+5))){
        reflectX();
        reflectBlock = true; 
        // Blocks reflection for one frame to keep ball from getting stuck at the wall
      }
      if ((ballY>=(height-20-(diameter/2))||ballY<=(diameter/2+5))){
        reflectY();
        reflectBlock = true;
      }
    }else{
      reflectBlock = false;
    }
    
    if ((abs(speedX)<=0.1)&&(abs(speedY)<=0.1)){
      //stops balls when speed is below 0.1
      ballIsMoving = false;
      if(!win){
        ballColor = color(100);
      }else{
        win = false;
      }
    }
    checkWin();
  }else{
    if (mousePressed){
      float distance = pow((ballX-mouseX),2)+pow((ballY-mouseY),2);
      float minDistance = pow((diameter*2.5),2);
      if (distance <= 250){
        aimArrow(1);
      }else if (distance <= 750){
        aimArrow(2);
      }else if (distance <= 1500){
        aimArrow(3);
      }else if (distance <= 3000){
        aimArrow(4);
      }else if (distance <= 6000){
        aimArrow(5);
      }
      aimCircle();
      if (distance > minDistance){ //limits maximum speed
        mouseReleased(); //triggers mouse released function if circle is crossed
      }
    }
  }
}
