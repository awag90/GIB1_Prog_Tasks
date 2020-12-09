class Bubble {
  float diameter;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;

  public Bubble(float diameter, float xPos, float yPos) {
    this.diameter = diameter;
    this.xPos = xPos;
    this.yPos = yPos;

    xSpeed = random(-2, 2);
    ySpeed = random(2);
  }

  void move() {
    if (yPos <= height && (xPos > 0 && xPos < width)) {
      xPos += xSpeed;
      yPos += ySpeed;
    } else {
      xPos = random(width);
      yPos = 0;
      xSpeed = random(-2, 2);
      ySpeed = random(2);
    }
  }
    void display() {
      stroke(#AF1383);
      fill(#AF1383);
      circle(xPos, yPos, diameter);
    }
  }
