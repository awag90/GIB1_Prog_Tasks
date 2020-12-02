/*  //<>//
 Marius Albeser, 
 
 Zu Lernfrage 1:
 Funktionen besitzen 2 Rollen. Creator und Client.
 Creator erstellt/definiert Schnittstelle.
 Schnittstelle besteht aus Rückgabewert  + Name der Funktion(inklusive Parameter).
 Parameter sind temporäre/ lokale Variablen, ganz wichtig - die einen Datentyp haben müssen.
 Rückgabewert ist ein Wert, den eine Funktion zurückgibt z.B. int, boolean, float
 ---> Rückgabetyp beschreibt den Typ des Rückgabewertes
 z.B. int addieren (int a, int b);
 
 Zu Lernfrage 2:
 Creator und Client sind die beiden Rollen.
 Der Creator definiert die Schnittstelle und implementiert den Code-Block in die Funktion. ( Hier können auch andere Funktionen verschachtelt werden)
 z.B. {
 int c = a+b;
 return(c);
 }
 Der Client ruft Name der Funktion auf und guckt dann welche Datentypen bzw. welche Parameter
 benutzt werden dürfen.
 z.B. addieren(2,3);
 
 Zu Lernfrage 3:
 
 **Creator**
 
 boolean isBigger (int number){
 if(number > 10){
 return(true)
 } else {
 return(false)
 }
 }
 
 int differenz (int a, int b){
 int ergebnis = b - a;
 return(ergebnis);
 
 }
 
 **Client**
 isBigger(15);
 differenz(19,20);
 
 
 
 */

int xSpaceship =width/2;
int ySpaceship =750;
int speedShot = 15; //Geschwindigkeit des Schusses
int bulletX;
int bulletY;


float meteorSpeed=1;//anfänglicher Speed
float meteorX; 
float meteorY;
float meteorHitIncrement = 0.3; //wenn Treffer Meteor
float meteorHitDecrement = 0.2;// wenn kein Treffer--->Meteor langsamer

//Booleans
boolean bulletExists;
boolean meteorExists=false;
boolean hitMeteor = false;
boolean hitShip = false;
boolean colorChange=false;



int meteorSize = 80;
int meteorSpeedCap = 15;
int score=0;
int lifesLeft = 3;

PImage meteor;
PImage herzGanz1;
PImage herzGanz2;
PImage herzGanz3;
PImage herzKaputt1;
PImage herzKaputt2;
PImage herzKaputt3;
//Variablen Herz
int herzGanz1X;
int herzGanz2X;
int herzGanz3X;
int herzGanz1Y;
int herzGanz2Y;
int herzGanz3Y;
//Herzgröße
int heartSize=30;
// Variable kaputtes Herz
int herzKaputt1X;
int herzKaputt2X;
int herzKaputt3X;
int herzKaputt1Y;
int herzKaputt2Y;
int herzKaputt3Y;


PImage bg; //background
PImage gameover;
int gameoverX;//Bildcoords
int gameoverY;//Bildcoords



void setup() {
  //Bilder einmalig in setup laden, resize, etc.
  meteor= loadImage("meteor.png");
  meteor.resize(meteorSize, meteorSize);
  gameover = loadImage("game_over.png");
  herzGanz1 = loadImage("herzGanz.png");
  herzGanz2 = loadImage("herzGanz.png");
  herzGanz3 = loadImage("herzGanz.png");
  herzKaputt1 = loadImage("herzkaputt.png");
  herzKaputt2 = loadImage("herzkaputt.png");
  herzKaputt3 = loadImage("herzkaputt.png");
  gameover.resize(360, 360);
  bg = loadImage("earth.jpg");

  herzGanz1.resize(heartSize, heartSize);
  herzGanz2.resize(heartSize, heartSize);
  herzGanz3.resize(heartSize, heartSize);

  herzKaputt1.resize(heartSize, heartSize);
  herzKaputt2.resize(heartSize, heartSize);
  herzKaputt3.resize(heartSize, heartSize);

  //fixe Coords der Herzen bzw. Verknüpfung zu den gebrochenen Herzen
  herzGanz1X = 650;
  herzGanz1Y= 50;
  herzGanz2X= 700;
  herzGanz2Y=50;
  herzGanz3X= 750;
  herzGanz3Y=50;
  herzKaputt1X = herzGanz1X;
  herzKaputt1Y = herzGanz1Y;
  herzKaputt2X = herzGanz2X;
  herzKaputt2Y = herzGanz2Y;
  herzKaputt3X = herzGanz3X;
  herzKaputt3Y = herzGanz3Y;
  gameoverX = 200;
  gameoverY = 200;


  size(800, 800);
}

void draw() {
  frameRate(60);
  background(bg);
  println(lifesLeft);
  image (meteor, meteorX, meteorY);//Meteor in Draw da immer wieder gezeichnet im Game


  fill(150, 200, 100);
  textSize(25);
  text("Score: "+score, 650, 125);
  textSize(15);
  text("Speed: "+ (int(meteorSpeed)), 650, 150);
  noFill();
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  fill(r, g, b);

  //Ausführen der ganzen Funktion

  drawSpaceship();
  moveSpaceship ();
  if (lifesLeft>0) {
    shootBullet();
    flyBullet();
    drawMeteor();
    newMeteor();
    hitMeteor ();
    hitSpaceship ();
    colorChangeOff();
  }


  //Herzanzeige

  if (lifesLeft==3) {
    colorChange=false;

    image (herzGanz1, herzGanz1X, herzGanz1Y);
    image (herzGanz2, herzGanz2X, herzGanz2Y);
    image (herzGanz3, herzGanz3X, herzGanz3Y);
  }
  if (lifesLeft==2) {
    image (herzKaputt1, herzKaputt1X, herzKaputt1Y);
    image (herzGanz2, herzGanz2X, herzGanz2Y);
    image (herzGanz3, herzGanz3X, herzGanz3Y);
  }
  if (lifesLeft==1 ) {
    image (herzKaputt1, herzKaputt1X, herzKaputt1Y);
    image (herzKaputt2, herzKaputt2X, herzKaputt2Y);
    image (herzGanz3, herzGanz3X, herzGanz3Y);
  }
  if (lifesLeft==0 ) {
    image (herzKaputt1, herzKaputt1X, herzKaputt1Y);
    image (herzKaputt2, herzKaputt2X, herzKaputt2Y);
    image (herzKaputt3, herzKaputt3X, herzKaputt3Y);
    colorChange = true;
    image (gameover, gameoverX, gameoverY);
    text("Press ENTER to CONTINUE", 290, 500);
  }
}




void keyPressed() {
  if (keyPressed == true) {//reset game
    lifesLeft = 3;
    score=0;
    meteorSpeed=1;
  }
}

//Shoot left mouse button
void mousePressed() { //wenn maus Klick und keine bullet exists, bullet exists wird true positioniere bullet auf y und x spaceship koordinaten
  if (mouseButton == LEFT) { 
    if ( bulletExists == false) {
      bulletExists=true;
      bulletX=xSpaceship;
      bulletY=ySpaceship - 40;
    }
  }
}


//SpaceShip
void drawSpaceship() {
  rectMode(CENTER);
  if (colorChange==true) {
    for (int j=0; j>1000; j++) {//random Farben Spaceship wenn hit bzw. Spiel vorbei
      float r = random(0, 255);
      float g = random(0, 255);
      float b = random(0, 255);
      fill(r, g, b);
    }
  } else
  {
    fill(100, 0, 10);
  }
  stroke(100, 150, 100);
  strokeWeight(5);
  line(xSpaceship, ySpaceship-40, xSpaceship, 740);
  noStroke();
  rect(xSpaceship, ySpaceship, 50, 40, 5);
}

void moveSpaceship () {
  if ((mouseX <= width-25)&& (mouseX >=25)) {
    xSpaceship = mouseX;
  }
}

void hitSpaceship () {
  if ((meteorY+meteorSize > 720 )&&( meteorX+meteorSize > xSpaceship -25) && (meteorX<xSpaceship +25)) {
    meteorExists=false;
    lifesLeft--;
    hitShip = true;
    colorChange=true;
    meteorSpeed= meteorSpeed - meteorHitDecrement;
    newMeteorAfterHit();
  }
}

void colorChangeOff() {//Farbwechsel aus/ an gekoppelt an Bedidngung bzw. fortlaufend nach hit
  if (colorChange == true && meteorY>150) {
    colorChange = false;
  }
}




//BULLET
void flyBullet() {
  if (bulletExists==true) {// wenn Klick, dann bulletExists true--> bullet wird gezeichnet + bewegt sich nach oben
    bulletY = bulletY - speedShot;
  }
}
void drawBullet() {//bullet Zeichnung
  stroke(#EA32CC);
  strokeWeight(4);
  line(bulletX, bulletY, bulletX, bulletY-15);
  fill(255);
}
void shootBullet() {
  if (bulletY>0) {
    drawBullet();
  } 
  if (bulletY<0) {
    bulletExists=false;
    bulletY = 0;
  }
}


void hitMeteor () {  //Treffer Meteor.... bullet reset+ score
  if (bulletX < meteorX+meteorSize && bulletX >meteorX) {
    if (bulletY<meteorY+meteorSize) {
      bulletExists=false;
      bulletY = 0;
      score= score +10;
      newMeteorAfterHit();
      if (meteorSpeed < meteorSpeedCap) {
        meteorSpeed = meteorSpeed + meteorHitIncrement;
      }
    }
  }
}


//Meteor
void drawMeteor() {
  if (meteorExists==false) {
    meteorY = meteorY + meteorSpeed;
    image (meteor, meteorX, meteorY);
  }
}

void newMeteor() {
  if (meteorY >= height) {
    newMeteorAfterHit();
  }
}

void newMeteorAfterHit() {
  meteorY = -150 + meteorSpeed;
  meteorX= int(random(25, 475));
}
