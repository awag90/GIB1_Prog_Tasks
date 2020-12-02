/*
     1. Eine Programmierschnittstelle kann man sich als gemeinsamen Vertrag zwischen CLient und Creator
      vorstellen. Ohne diesen Vertrag können beide nicht mit einander kommunizieren. Ohne Kommunikation
      kann der Client nichts vom Creator benutzen - es findet keine Wiederverwendung statt. Dies war aber
      ein wesentlicher Beweggrund für die Einführung von Funktionen.
      Man kann quasi den Funktionsnamen als Schnittstelle zwischen Client und Creator sehen.
      Eine Funktion kann keinen, einen oder mehrere Parameter enthalten, deren Werte sich typischerweise erst
      zur Laufzeit ergeben. Ein Parameter ist eine Variable mit Bezug zu einer Funktion und hat einen Datentyp
      und einen Namen.
      Ein Rückgabetyp einer Funktion ist der Datentyp, in dessen Form der Rückgabewert gewünscht ist. void, draw oder setup geben keinen Wert zurück, z. B. int, float oder boolean schon.
      Ein Rückgabewert ist ein Wert, welcher in dem entsprechenden Datentyp an die Funktion zurück gegeben wird. 
      
      2.
      Der Client benutzt bzw. verwendet eine Funktion. Er muss den Funktionsnamen des Creators benutzen, insofern er 
      seine Funktion benutzen möchte.
      Der Creator legt die Funktion fest und bestimmt die Definition. Client und Creator kommunizieren über eine gemeinsame Schnittstelle.
      
      3.
      Siehe Code :)
      
     Programm: 
     
     1. Das Raumschiff lässt sich horizontal bewegen. 
     2. Die Grenzen des Spielfelds werden erkannt. 
     3. Meteroiten bewegen sich in vertikaler Richtung. 
     4. Zu jedem Zeitpunkt gibt es max. einen Metereoiten.
     5. Mit zunehmender Spieldauer bewegen sich die Meteroiten schneller auf das Raumschif zu.
     6. Bei einer Kollision mit einem Meteroiten wird das Raumschiff zerstört.
     7. Wenn das Raumschiff zerstört ist, ist das Spiel beendet. 8. Das Raumschiff kann Meteroiten mit Kanonen abwehren.
     9. Zu jedem Zeitpunkt kann ein Raumschiff nur einen Kanonenschuss abgeben.
     10. Sie steuern das Raumschiff über die Maus.
     
     Extra: 
     - Ist das Raumschiff zerstört, wird das Spiel beendet und der Punktestand angezeigt. (Zeitpunkte+Punkte pro Abschuss)
     - Der Spieler kann das Spiel durch klicken auf den retry button neu starten.
     - Schöne Sounds :) 
     
     !!!!! Damit Code funktioniert Sound Libary importieren! Scetch --> Libary importieren --> nach sound suchen --> Sound Libary von der Processing foundation installieren !!!!!
     
*/

PImage ship; //Picture declaration of the spaceship
PImage meteor; //Picture declaration of the meteor
PImage lasershot; // ||    || of the lasershot
PImage explosion;//  ||    || of the explosion
PImage gameoverpic;//||    || of the game over screen 
PImage retry;// ||    ||  of the retry button
float stopX; // variable to get the X value of fallX from when the shot hits the meteor
float stopY;// same with y
float fallX=random(0,775); //x-variable for the meteor --> set to random so that it changes position everytime
float fallY;// variable for the y-value of the meteor
float fallspeed=1; //variable to increase the speed of the meteor everytime it reappears 
float shotX; //x-variable for the laser shot
float shotY; //y-variable for the laser shot
float shotSpeed=10; //speed of the laser shot
boolean hit=false; //check if laser shot hits meteor
boolean dead; //check if meteor hits spaceship
int t;  //time for explosion so that it stays for more frames--> if timer reaches 0 it dissapears
float score; //player get 0.01 points every frame and 5 points for every destroyed meteor
boolean shotblock;
import processing.sound.*;
SoundFile shotsound;
SoundFile explosionsound;

void setup(){

  size(800,800);
  //import of the images


  ship= loadImage("ship.png"); //https://www.pikpng.com/pngl/m/220-2205494_space-invaders-ship-clipart.png
  meteor= loadImage("meteor.jpg"); //https://www.clipartmax.com/png/middle/233-2335631_meteor-icon-asteroid.png
  lasershot= loadImage("lasershot.png"); //https://freepikpsd.com/wp-content/uploads/2019/10/laser-shot-png-Transparent-Images.png
  explosion= loadImage("explosion.png"); //https://w7.pngwing.com/pngs/788/491/png-transparent-the-fire-of-the-explosion-fire-pattern-spark-flame.png
  gameoverpic= loadImage("gameover.png"); //https://art.pixilart.com/ebcdb77d7128b3f.png
  retry= loadImage("retry.png"); //https://lh3.googleusercontent.com/proxy/2fIGeva94CqhZB0xXu076Ywv3vYdk3gRtGDD1qZdDwYJpy_5tj70yctOfOwE7fEKvRYh1Joc5lbXMTRL8VVUgneTBjaY3nes
  shotsound = new SoundFile(this, "shotsound.mp3");
  explosionsound = new SoundFile(this, "explosionsound.mp3");
  
}
void draw(){
  background(0);
  //collosion (meteor-laser) check
  collision();
  //collision(meteor-ship) check
  gameover();
  //if player is not dead (dead is defined in gameover()), show spaceship
  if (dead==false){
  spaceship();
  }
  //timer for the explosion (needs to be above meteor so that the pictures dont collide when meteor falls into the explosion
  if (t>0&&dead==false){
  t--;
  image(explosion,stopX-70,stopY+40,200,80);
  }
  //if theres no hit of the meteor (defined in collision()) and player is not dead show the meteor and the lasershot
  if(hit==false&&dead==false){
  meteor();
  shot();
  }
 // if meteor is detroyed or player got hit reset the game
  if (hit==true||dead==true){
  reset();
  }
  //retryscreen (game over and retry button)
  if (dead==true){
  retryscreen();
  }
  //score of the player
  if( dead==false){
  score+=0.01;
  }
  
}
//spaceship image
void spaceship(){
  if (mouseX>=750){
    mouseX=750;
  }
  image(ship,mouseX,700,50,50);
}
//meteor x-position and increasing fall speed
void meteor(){ 
    
    fallY+=3*fallspeed;
   if (fallY>800){
     fallY=0;
     fallspeed+=0.3;
     fallY=fallY*fallspeed;
     fallX=random(25,775);
   }
    image(meteor,fallX,fallY,50,100);
}
//laser shot and reset after it reaches 0
 void shot(){      
     
     if (shotY<=700&&shotY>=(-10)){
       shotY-=10;     
       shotblock=true;
     }
      if (shotY<=0){
       shotY=900;
       shotblock=false;
     }
     image(lasershot,shotX,shotY,50,50);
       
   }
//detects collision between meteor and laser shot and grants the player 5 points when he hits the meteor
void collision(){
  if (shotY>=fallY&&shotY<=fallY+100&&shotX>=fallX-20&&shotX<=fallX+50 ){
    hit=true;
    stopY=fallY;
    stopX=fallX;
    fallspeed+=0.3;
    score+=5;
    explosionsound.play();
    shotblock=false;
  }
    else {
      hit=false;
    }
}
//detects if spaceship got hit by meteor
void gameover(){
  if (fallY+100<=800 && fallY+50>=650 && fallX>=mouseX-25 && fallX<=mouseX+25){
    dead=true;
    println("You scored " + score + " points!");
  }
}
//game over screen and retry button + resets the fall speed and the score
void retryscreen(){
    image(gameoverpic,0,0,850,800); 
    image(retry,300,600,200,100);
 //show score on Game over screen --> round score
    int roundscore= round(score);
    textSize(32);
    textAlign(CENTER,CENTER);
    text("You scored " + roundscore + " points!",400,400);
    fallspeed=1;
}
//reset if when player gets hit or meteor gets destroyed
void reset(){
  shotY=900;
  t=70;
  fallX=random(0,750);
  fallY=0;
  
}

void mousePressed(){ 
  //when the mouse is pressed shotX overtakes the value of mouseX, this way the shot doesn't move with the spaceship after it moves
  if (mousePressed&&mouseButton == LEFT&&dead==false&&shotblock==false){
    shotX=mouseX;
    shotY=700;
    shotsound.play();
  }
  //defines the retry area. if the player klicks it the meteor y value gets set back to 0 and the boolean dead is false again
  if (mouseX>=300&&mouseX<=500&&mouseY>=600&&mouseY<=700&&dead==true){
    fallY=0;
    t=0;
    dead=false;
    score=0;
  }
}
