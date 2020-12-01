/* //<>//
Author: Andreas Wagner
Matrikelnummer: 301730

Lernfragen:

1. 
Eine Funktionsschnittstelle hat den allgemeinen Aufbau:

rückgabetyp nameDerFunktion(datentyp Prameter1, datentyp Parameter 2){
  
Rückgabetyp: Datentyp des Werts, den die Funktion mittels eines Return-Statements ausgibt

Rückgabewert: Wert, der mittels eines Return-Statements von der Funktion ausgegeben wird

Prameter: Wert, den die Funtkion als Input nimmt, um abhängig vom Parameter ihren Ablauf anzupassen. Eine Funktion kann
          beliebig viele Parameter haben.
          
          
2. 
Creator: Erstellt die Definition und definiert die Funktionsschnittstelle und die Abläufe innerhalb der Funktion. 
         Bestimmt welcher Wert von der Funktion ausgegeben wird.
           
Client: Wendet die Funktion, die vom Creator erstellt wurde an. Kennt nur die Schnittstelle und den Rückgabetyp der 
        Funktion.

3. 
Beispielfunktionen:

Definition:

1.)
 
   float division(float a, float b){
     return (a/b);
   }
   
2.) 
  
   boolean divisibleByFive(int a){
     if (a%5==0){
       return (true);
     }else{
       return (false);
     }
   }

Implementierung:

  1.) float c = division(1, 2);
  
  2.) if (divisibleByFive(13)){
        // Things to do
    }
   
  
*/
float spaceShipX;
float spaceShipY;

float torpedoX;
float torpedoY;
boolean torpedoExists;

float meteorX;
float meteorY;
float meteorSpeedY;
float meteorSpeedX;
float meteorDiameter;

float explosionX;
float explosionY;
float explosionDiameter;

boolean startScreen = true;
boolean gameOver = false;
boolean tutorial;
int tutorialCounter;

float[] starsX = new float[200];
float[] starsY = new float[200];

int points; // you get points for shooting meteors, you lose point for letting them through

float superX;
float superY;
int superCounter;
int superTrigger;
boolean superShot; // superShot turns the torpedo into a growing laserbeam
float superWeight; // determines the width of the laserbeam



void drawSpaceShip() {
  //draws our little spaceship
  stroke(125);
  fill(125);
  triangle(spaceShipX-10, spaceShipY, spaceShipX+10, spaceShipY, spaceShipX, spaceShipY-30);
  triangle(spaceShipX-5, spaceShipY, spaceShipX - 20, spaceShipY, spaceShipX-5, spaceShipY-13);
  triangle(spaceShipX+5, spaceShipY, spaceShipX + 20, spaceShipY, spaceShipX+5, spaceShipY-13);
  triangle(spaceShipX-5, spaceShipY, spaceShipX - 20, spaceShipY, spaceShipX-15, spaceShipY+5);
  triangle(spaceShipX+5, spaceShipY, spaceShipX + 20, spaceShipY, spaceShipX+15, spaceShipY+5);
  fill(30);
  triangle(spaceShipX-5, spaceShipY -10, spaceShipX + 5, spaceShipY-10, spaceShipX, spaceShipY-25);
}

void moveSpaceShip() {
  //sets spaceShipX to the mouse position, spaceShipY is not affected
  if ((mouseX <= width-30) && (mouseX >= 30)) {
    spaceShipX = mouseX;
  }
}

void drawTorpedo() {
  // draws a torpedo
  if (!superShot) {
    strokeWeight(3);
    stroke(204, 0, 204);
    line(torpedoX, torpedoY, torpedoX, torpedoY-10);
    if (torpedoY >= 0) {
      torpedoY -= 7;
    } else {
      torpedoExists = false;
    }
    strokeWeight(1);
  } else {
    if (superWeight < 60) {
      strokeWeight((int)superWeight);
      stroke(255, 0, 255);
      line(spaceShipX, spaceShipY - 60, spaceShipX, 0);
      superWeight += 0.2;
      strokeWeight(1);
    } else {
      torpedoExists = false;
      resetSuper();
    }
  }
}

void fireTorpedo() {
  //fires a new torpedo
  torpedoExists = true;
  torpedoX = spaceShipX;
  torpedoY = spaceShipY -30;
}

void drawMeteor() {
  //draws meteor an respawns it, when it reaches the bottom
  stroke(204, 255, 255);
  fill(204, 255, 255);
  if (meteorY <= height) {
    circle(meteorX, meteorY, meteorDiameter);
    meteorY += meteorSpeedY;
    meteorX += meteorSpeedX;
  } else {
    points -= meteorDiameter/2;
    meteorSpeedY -= 0.2; // slows meteors if they pass by the spaceship
    spawnMeteor();
  }
}

void explodeMeteor() {
  //triggers explosion and respawns meteor
  explosionX = meteorX;
  explosionY = meteorY;
  explosionDiameter = 1;
  spawnMeteor();
}

void drawExplosion() {
  //draws a growing explosion
  if (explosionDiameter <= 120 && explosionDiameter > 0) {
    stroke(255, 0, 0);
    noFill();
    circle(explosionX, explosionY, explosionDiameter);
    explosionDiameter += 5;
  } else {
    explosionDiameter = 0;
  }
}

void spawnMeteor() {
  //creates a new meteor at a random x-Position with a random diameter
  meteorX = random(30, width-30);
  meteorY = -40;
  meteorDiameter = 30 + random(70);
  if (meteorX <= width/2) {
    //gives every meteor a slight sidewards momentum
    meteorSpeedX = random(-0.3, 1);
  } else {
    meteorSpeedX = random(-1, 0.3);
  }
}

void resetSuper() {
  superCounter = 0;
  superX = 20 + random(width-40);
  superY = 0;
  superTrigger = (int)random(2400);
  superShot = false;
  superWeight = 1;
}

void drawSuper() {
  //draws the Super-Item
  if (superIsCaught()) {
    superShot = true;
    superCounter ++;
  } else if (superCounter == superTrigger) {
    if (superY < height) {
      fill(255, 255, 0);
      stroke(255, 255, 0);
      triangle(superX-15, superY, superX+15, superY, superX, superY+30);
      fill(255, 0, 0);
      textSize(24);
      text("S", superX-8, superY+18);
      superY++;
    } else {
      resetSuper();
    }
  } else {
    superCounter++;
  }
}

void showTutorial() {
  fill(255);
  textSize(36);
  if (tutorialCounter < 300) {
    text("Move Spaceship by moving the Mouse!", width/2-350, height/2);
    tutorialCounter++;
  } else if (tutorialCounter < 600) {
    text("Shoot torpedos by clicking!", width/2-260, height/2);
    tutorialCounter++;
  } else if (tutorialCounter < 900) {
    text("Try to catch the Super-Item!", width/2-270, height/2);
    tutorialCounter++;
  } else {
    tutorial = false;
  }
}

boolean meteorIsHit() {
  //checks whether the meteor has been hit by the torpedo
  if (!superShot) {
    float distance = pow((torpedoX - meteorX), 2) + pow((torpedoY - meteorY), 2);
    float minDistance = pow((meteorDiameter/2), 2);
    if (distance <= minDistance) {
      return true;
    } else {
      return false;
    }
  } else {
    if (abs(meteorX - spaceShipX) <= (meteorDiameter/2 + superWeight/2)) {
      return true;
    } else {
      return false;
    }
  }
}

boolean spaceShipIsHit() {
  //checks whether the spaceship hase been hit by a meteor
  float distance = pow((spaceShipX - meteorX), 2) + pow((spaceShipY - meteorY), 2);
  float minDistance = pow((meteorDiameter/2 + 20 ), 2);
  if (distance < minDistance) {
    return true;
  } else {
    return false;
  }
}

boolean superIsCaught() {
  float distance = pow((spaceShipX - superX), 2) + pow((spaceShipY - superY), 2);
  float minDistance = pow((15+20), 2);
  if (distance < minDistance && !superShot) {
    return true;
  } else {
    return false;
  }
}


void mousePressed() {
  //assings mousebutton a context dependend action
  if (startScreen) {
    startScreen = false;
    tutorial = true;
    tutorialCounter = 0;
  } else if (gameOver) {
    gameOver = false;
    setup();
  } else if (!torpedoExists) {
    fireTorpedo();
  }
}

void setup() {
  size(840, 840);
  background(0);
  spaceShipX = width/2;
  spaceShipY = height - 40;
  torpedoExists = false;
  spawnMeteor();
  meteorSpeedY = 1;
  explosionDiameter = 0;
  points = 0;
  resetSuper();
  for (int i = 0; i< starsX.length; i++) {
    starsX[i] = random(width);
    starsY[i] = random(height); //fills the arrays with random coordinates
  }
}

void draw() {
  if (startScreen) { //displays Start-Screen
    background(0);
    for (int i=0; i<= 100; i++) {
      fill(255);
      stroke(255);
      circle(starsX[i], starsY[i], 3); //displays stars which move across the screen
      if (starsY[i] < height) {
        starsY[i] += 2;
      } else {
        starsY[i] = 0;
      }
    }
    fill(255, 255, 0);
    textSize(64);
    text("Meteor Defense", width/2 -250, 200);
    textSize(24);
    fill(255);
    text("(Press Mouse-Button to start the Game!)", width/2-250, height-200);
  } else if (gameOver) { //displays GameOver-Screen
    background(0);
    drawMeteor();
    drawExplosion();
    fill(255, 0, 0);
    textSize(72);
    text("Game Over!", width/2 -210, 200);
    textSize(24);
    fill(255);
    text("(Press Mouse-Button to restart the Game!)", width/2-250, height-200);
    if (meteorY > random(height)) {
      explodeMeteor();
      if (meteorSpeedY <= 7) {
        meteorSpeedY += 0.2;
      }
      spawnMeteor(); //creates a constant flow of exploding meteors
    }
  } else {
    background(0);
    drawSpaceShip();
    moveSpaceShip();
    drawMeteor();
    drawExplosion();
    drawSuper();
    if (tutorial) {
      showTutorial();
    }
    textSize(24);
    fill(255);
    text("Points: " + points, 20, 30);
    if (torpedoExists) {
      drawTorpedo();
        if (meteorIsHit()) {
          points += meteorDiameter; // bigger Meteors give more points
          explodeMeteor();
        meteorSpeedY += 0.2;
        if (!superShot) {
          torpedoExists = false; //stops torpedos from flying through the meteor
        }
      }
    }
    if (spaceShipIsHit()) {
      gameOver = true;
      spawnMeteor();
    }
  }
}
