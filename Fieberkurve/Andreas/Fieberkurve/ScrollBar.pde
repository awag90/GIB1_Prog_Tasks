class ScrollBar {
  float startPosX;
  float startPosY;
  float barWidth;
  float barHeight;
  Button upButton;
  Button downButton;

  public ScrollBar(float startPosX, float startPosY, float barWidth, float barHeight) {
    this.startPosX = startPosX;
    this.startPosY = startPosY;
    this.barWidth = barWidth;
    this.barHeight = barHeight;

    PImage upArrow = loadImage("up_button.png");
    PImage downArrow = loadImage("down_button.png");

    upButton = new Button(0, 30, (int)barWidth, upArrow);
    downButton = new Button(0, 30, (int)barWidth, downArrow);
  }

  void display() {
    strokeWeight(3);
    stroke(240);
    fill(200);
    rect(startPosX, startPosY, barWidth, barHeight);
    upButton.display(startPosX, startPosY);
    downButton.display(startPosX, startPosY+barHeight-30);
    strokeWeight(1);
  }

  void scroll(FieberChartJahr chart) {
    // Verschiebt die startPosY des charts, wenn einer der Buttons gedrückt wird
    if ( mousePressed && mouseX >= startPosX && mouseX <= startPosX+barWidth) {
      if (mouseY >= startPosY && mouseY <= startPosY + 30) {
        chart.startPosY += 2;
      } else if (mouseY >= startPosY+barHeight-30 && mouseY <= startPosY+barHeight) {
        chart.startPosY -= 2;
      }
    }
  }
}
