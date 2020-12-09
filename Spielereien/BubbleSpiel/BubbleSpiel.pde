Welt welt;
boolean gameOver;
int gameOverCounter;

void setup() {
  welt = new Welt(100);
  background(255);
  size(720, 720);
  gameOver = false;
  gameOverCounter = 0;
}

void keyPressed() {
  welt.spieler.move(key,5);
}

void draw() {
  background(255);

  if (!gameOver) {
    welt.spieler.display();
    
    /*
      for (int i= 0; i< welt.bubbles.length ; i++){
         welt.bubbles[i].display();
         welt.bubbles[i].move();
      }
    
     */
    for (Bubble b : welt.bubbles) {
      b.display();
      b.move();
    }
    if (welt.collision()) {
      gameOver = true;
    }
  } else {
    if (gameOverCounter <= 2400) {
      fill(255, 0, 0);
      textSize(36);
      text("Game Over", width/2 -120, height/2);
    }else{
      setup();
    }
  }
}
