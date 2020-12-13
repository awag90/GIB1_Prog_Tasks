class Toolbar {
  // Container for different kinds of buttons
  
  //Coordinates an dimensions
  int startPointX;
  int startPointY;
  int barWidth;
  int barHeight;
  //DisplayField which the Toolbar corresponds to
  DisplayField display;
  //Buttons that are contained in the toolbar
  Button[] buttons;

  public Toolbar(DisplayField display, int barWidth, Button[] buttons) {
    this.display = display;
    this.startPointX = this.display.startPointX + this.display.fieldWidth;
    this.startPointY = this.display.startPointY;
    this.barWidth = barWidth;
    this.barHeight = this.display.fieldHeight;
    this.buttons = buttons;
  }

  void show() {
    //Displays toolbar and active buttons.
    fill(display.fg);
    stroke(display.fg-50);
    rect(startPointX, startPointY, barWidth, barHeight);

    float buttonY = 0.5* buttons[0].buttonHeight;
    for (Button b : buttons) {
      for (int i : display.validButtonTypes) {
        if (b.type == i) {
          b.display(startPointX, buttonY);
          b.active = true;
        }
      }
      buttonY += 1.75*b.buttonHeight;
    }
  }
}
