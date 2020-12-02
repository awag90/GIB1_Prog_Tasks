  /* Author @Steffen Marz
  
    1. Hier die 6 relationen Operatoren die wir gelernt haben: 
         > größer als         Bsp: x=5; println(x<10); Ausgabe: true  |  x=5; println(x<3); Ausgabe: false
         < kleiner als         Bsp: x=5; println(x>10); Ausgabe: false  |  x=5; println(x>3); Ausgabe: true
         >= größer gleich       Bsp: x=5; y=10; println(x<=10); println(y<=10); Ausgabe: true ,  true   |   Bsp: x=5; y=10; println(x<=5); println(y<=5); Ausgabe: true,  false
         <= kleiner gleich      ....
         == gleich              Bsp: x=5; println((x+1)==5); println(x==6); true   ,   false   
         !=ungleich (not)       Bsp: x=5; println(x!=6); println(x!=5); true     ,    false
        Konkrete Anwendungen sieht man in dem Programm eigentlich bei jeder If-Funktion.
  
    2.  Auszug aus meinem Code füe das Spiel "Catch the Ball"
          if (keyCode==ENTER&&(stopSpeed<0)){
           score2=stopSpeed*-1*2.5;
           scoreFinal=score+score2;
           println("You scored " + scoreFinal + " points");
         } 
         else if (keyCode==ENTER&&(stopSpeed>=0)){
           score2=stopSpeed*2.5;
           scoreFinal=score+score2;
           println("You scored " + scoreFinal + " points");
           
           Hierbei handelt es sich um eine erweiterte IF-Funktion die in dem void keyReleased(){} liegt. Sie bestimmt die Anzahl der Punkte die dem Spieler ausgegeben werden.
           Man brauch hier eine erweiterte IF-Funktion, da in dem Fall dass der Ball sich rückwärts bewegt und der Spieler den Ball anhält die Geschwindigkeit negativ ist. 
           Also würde in dem Fall score 2 (die Punkte die durch eine höhere Geschwindigkeit entstehen) negativ sein und so würde er score (mehr Punkte je weiter in der Mitte der Ball angehalten wird)
           vermindern. 
           So wird festgelegt dass wenn die Taste die losgelassen wird ENTER ist UND die Variable stopSpeed (wird früher festgelegt & übernimmt die Geschwindigkeit bevor der Ball gestoppt wird)
           kleiner als 0 ist, also negativ, der stopspeed noch mal minus 1 gerechnet wird um ihn positiv zu machen, bevor er mit dem score verrechnet wird. Darauft folgt eine else if Bedingung
           (funktioniert in dem Fall auch mit einer normalen If Bedingung) bei welcher, damit sie ausgeführt wird, die ENTER Taste losgelassen und der stopspeed größer gleich 0 sein. Die Rechnung ist 
           dann quasi die gleiche, nur dass nicht mal minus 1 genommen wird. Bei beiden wird dann der finale Punktestand ausgegeben.
           
         Auszug aus meinem Code für smartes Zeichen
            if(mouseX<width/3){                             
              background(#FF7E7E);
            }
            else if(mouseX<width/1.5){
              background(#A07EFF);
            }
            else{
              background(#7EFFC0);
            }
           Hier wird der Hintergrund je nachdem wo sich mouseX auf dem Bildschirm befindet verändert. Ist mouseX kleiner als die weite geteilt durch 3, kommt eine bestimmte Farbe, ist mouseX kleiner
           als die weite durch 1.5 kommt eine andere Farbe und ist das auch nicht der Fall kommt wieder eine andere Farbe.
           
           
     3. Ein Beispiel für eine logische Konjunktion und Negation lässt sich in Zeile 142 finden :
       if (mousePressed&&(circleHit==true) && (mouseX !=oldX || mouseY !=oldY)&&!(mouseX>width || mouseX < 0 || mouseY > height || mouseY < 0 ))
       
         Das && zeigt eine logische Konjunktion, das ! eine logische Negation und das || ein logisches oder. In der Aufgabenstellung steht nur dass wir ein Beispiel angeben müssen, dieses aber nicht 
         erklären, daher bleibt die Erklärung etwas knapp. 
        Sind in einer If-Bedingung 2 Bedingungen mit einem && verbunden, müssen beide true sein damit die If-Funktion ausgeführt wird.
        Sind in einer If-Bedingung 2 Bedingungen mit einem ! verbunden, muss die Bedingung vor der das ! steht false sein und die andere true, damit die If-Bedingung ausgeführt wird.
        Sind in einer If-Bedingung 2 Bedingungen mit einem || verbunden, wird die If-Bedinung nur ausgeführt, wenn eine der beiden Bedingungen oder beide Bedingungen wahr sind.
       Des weiteren gibt es das logische entweder oder --> ^
 
 
  *  Bildschirmbilliard: Klickt der Spieler mit der Maus auf den Ball kann er diesen bewegen. Je nach Richtung und Geschwindigkeit der Mausbewegung 
  *  Ball in eine Richtung und wird mit der Zeit langsamer. Rollt der Ball nichtmehr, kann der Spieler in wieder Rollen lassen.
  *
  */
  
//diameter of the ball
int diameter=25;
//startpoint of the ball
float startpointX=150;
float startpointY=200;
//X and Y speed of the Ball. You need to use 2 variables for speed, otherwise the ball will just go backwards when he hits a wall.
float speedX=0;
float speedY=0;
//variable to change speed from for example 3 to -3 and from -3 to 3
int block=-1;
//variable to slow down the ball
float slowborder=0.85;  //when it hits the wall
float slowfield=0.999; //while rolling
//colours of the ball
int red=255;
int green=0;
int blue=0;
//variable to keep the value of mouseX and mouseY when the mouse is pressed
float oldX;
float oldY;
//prevent the player to klick while the ball is moving
boolean circleHit=false;



void setup() {
  size(600, 400);
  background(#007C05);
}

void draw() {
  size(600, 400);
  background(#007C05);

  fill(red, green, blue);
  ellipse(startpointX, startpointY, diameter, diameter);

  //border
  noFill();
  stroke(#025F14);
  strokeWeight(10);
  rect(5, 5, 590, 390);
  noStroke();


  //Main Ball

  //colour

  fill(red, green, blue);
  ellipse(startpointX, startpointY, diameter, diameter);


 startpointX=startpointX+speedX;
 startpointY=startpointY+speedY;


  //X Bounce
  if (startpointX>=580) {
    startpointX=startpointX-5;    //needed for Ball not to get stuck
    speedX=speedX*slowborder;
    speedY=speedY*slowborder;
    speedX=speedX*block;
  }
  if (startpointX<=20) {
    startpointX=startpointX+5;   //needed for Ball not to get stuck
    speedX=speedX*slowborder;
    speedY=speedY*slowborder;
    speedX=speedX*block;
  }
  
  //Y Bounce
  if (startpointY>=380) {
    startpointY=startpointY-5;    //needed for Ball not to get stuck
    speedY=speedY*slowborder;
    speedX=speedX*slowborder;
    speedY=speedY*block;
  }
  if (startpointY<=20) {
    startpointY=startpointY+5;     //needed for Ball not to get stuck
    speedY=speedY*slowborder;
    speedX=speedX*slowborder;
    speedY=speedY*block;
  }
    
 //determine the speed by substracting the oldX/Y value from the current mouse position when the mouse is released under the condition that the current mouse position is in the field
 if (mousePressed&&(circleHit==true) && (mouseX !=oldX || mouseY !=oldY)&&!(mouseX>width || mouseX < 0 || mouseY > height || mouseY < 0 )){
   speedX=(mouseX-oldX)/2; // /2 to slow the ball 
   speedY=(mouseY-oldY)/2;
 }
 //other possibility to slow the speed
 /*if (speedX>=30){
   speedX=30;
 }
  if (speedX<=(-30)){
    speedX=-30;
  }
  if (speedY>=30){
    speedY=30;
  }
  if (speedY<=-30){
    speedY=-30;
  }*/

 //friction of the ball
 else{
   speedX=speedX*slowfield;
   speedY=speedY*slowfield;
 }

 //used to move the ball when the player clicks
 if (mousePressed&&(circleHit==true)){
    startpointX=mouseX;
    startpointY=mouseY;
    }

  //Stop the Ball without having it stuck in the Wall    
  if (speedY<=0.5 && (speedY>=(-0.6))&&(startpointY>50)&&(startpointY<350)&&(startpointX>100)&&(startpointX<500)) {
    speedY=speedY*0;
    speedX=speedX*0;
    
    
  }
  if (speedX<=0.6 && (speedX>=(-0.6))&&(startpointY>50)&&(startpointY<350)&&(startpointX>100)&&(startpointX<500)) {
    speedX=speedX*0;
    speedY=speedY*0;
    
  }
  //set colours & set circleHit to false while the Ball is moving
  if (speedX>0.5 || speedY>0.5){
  red=255;
  green=0;
  blue=0;
  circleHit=false;
  }
  if (speedX==0 && speedY==0){
    red=136;
    green=136;
    blue=136;
  }
  //use of a boolean so that the player can only move the ball when he clicks on it
 if (mouseX>startpointX-12.5&&(mouseX<startpointX+12.5)&&(mouseY>startpointY-12.5)&&(mouseY<startpointY+12.5)){
  circleHit=true;
  }     

}

void mousePressed(){
  if (mousePressed&&(circleHit==true)){
    oldX=startpointX;
    oldY=startpointY;
  }
}
