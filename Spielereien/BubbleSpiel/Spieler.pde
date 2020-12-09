class Spieler {
  float xPos;
  float yPos;
  float size;


  public Spieler(float size) {
    xPos = width/2;
    yPos = height-20;
    this.size = size;
  }

  void move(char k, int speed) {
    if (k == 'w') {
      yPos -= speed;
    } else if (k == 'a') {
      xPos -= speed;
    } else if (k == 'd') {
      xPos += speed;
    } else if (k == 's') {
      yPos += speed;
    }
  }
  void display() {
    fill(#82F2F7);
    stroke(#82F2F7);
    rectMode(CENTER);
    rect(xPos, yPos, size, size);
  }
}
