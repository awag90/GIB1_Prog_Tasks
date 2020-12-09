class Welt {
  Bubble[] bubbles;
  Spieler spieler;

  public Welt(int numberOfBubbles) {
    bubbles = new Bubble[numberOfBubbles];
    for ( int i=0; i< bubbles.length; i++) {
      bubbles[i] = new Bubble(random(10, 20), random(width), random(height/3));
    }
    spieler = new Spieler(15);
  }

  boolean collision() {
    for (int i= 0; i < bubbles.length; i++) {
      float minDistance = pow(spieler.size/2 + bubbles[i].diameter/2, 2);
      float distance = pow(spieler.xPos - bubbles[i].xPos, 2) + pow(spieler.yPos - bubbles[i].yPos, 2);

      if (distance <= minDistance) {
        return true;
      }
    }
    return false;
  }
}
