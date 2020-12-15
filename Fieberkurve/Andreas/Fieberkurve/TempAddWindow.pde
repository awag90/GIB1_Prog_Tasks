class TempAddWindow {
  // Zeigt ein Fenster, dass dem User die Möglichkeit zur Eingabe von Temperaturwerten für ein Datum
  Fieberkurve[] kurven;
  boolean open;
  Button[] buttons;
  int day;
  int month;
  float temp;
  int clickCounter;

  public TempAddWindow(Fieberkurve[] kurven) {
    this.kurven = kurven;
    open = false;
    month = month();
    day = day();
    temp = 37.0;

    PImage upArrow = loadImage("up_button.png");
    PImage downArrow = loadImage("down_button.png");
    buttons = new Button[6];
    // Fügt Buttons hinzu. upArrow und down Arrow werden abwehselnd als Icon verwendet
    for (int i = 0; i< buttons.length; i++) {
      if (i%2==0) {
        buttons[i] = new Button(i+1, 30, 30, upArrow);
      } else {
        buttons[i] = new Button(i+1, 30, 30, downArrow);
      }
    }
  }

  void display() {
    // stellt das Fenster dar
    listenForClick();
    background(100);

    fill(255);
    textSize(48);
    text("Tag: ", width/2-340, height/2-75);
    drawTextField(day, (width/2-220), (height/2-120));
    buttons[0].display(width/2-100, height/2-120);
    buttons[1].display(width/2-100, height/2 -(120-buttons[0].buttonHeight));

    fill(255);
    textSize(48);
    text("Monat: ", width/2, height/2-75);
    drawTextField(month, (width/2+180), (height/2-120));
    buttons[2].display(width/2+300, height/2-120);
    buttons[3].display(width/2+300, height/2 -(120-buttons[0].buttonHeight));

    fill(255);
    textSize(48);
    text("Temperatur: ", width/2-370, height/2+150);
    drawTextField(temp, (width/2 - 60), (height/2+100));
    buttons[4].display(width/2+60, height/2+100);
    buttons[5].display(width/2+60, height/2 +(100+buttons[0].buttonHeight));
  }

  void addTemp() {
    kurven[month-1].hinzufuegen(day, temp);
    open = false;
  }

  void listenForClick() {
    // Stellt fest ob die Maus gedrückt wurde und gleicht die Mauskoordinaten mit den Buttons in buttons ab.
    if (mousePressed && clickCounter%10==0) {
      for (Button b : buttons) {
        if (mouseX >= b.buttonStartX && mouseX <= b.buttonStartX + b.buttonWidth) {
          if ( mouseY >= b.buttonStartY && mouseY <= b.buttonStartY + b.buttonHeight) {
            switch (b.id) {
            case 1:
              if ( day < 30) {
                day ++;
              } else {
                day = 1;
              }
              break;
            case 2:
              if (day > 1) {
                day--;
              } else {
                day = 30;
              }
              break;
            case 3:
              if (month < 12) {
                month ++;
              } else {
                month = 1;
              }
              break;
            case 4:
              if (month > 1) {
                month --;
              } else {
                month = 12;
              }
              break;
            case 5:
              if ( temp < 45) {
                temp += 0.1;
              }
              break;
            case 6:
              if ( temp > 25) {
                temp -= 0.1;
              }
              break;
            }
          }
        }
      }
    }
    clickCounter += 1;
  }


  void drawTextField(int num, float xPos, float yPos) {
    // Zeichnet ein Textfeld mit rect und text
    fill(255);
    stroke(0);
    rect(xPos, yPos, 120, 60);
    textSize(48);
    fill(0);
    text(num, (xPos+30), yPos+50);
  }

  void drawTextField(float num, float xPos, float yPos) {
    String sub = ("" + num).substring(0, 4);
    fill(255);
    stroke(0);
    rect(xPos, yPos, 120, 60);
    textSize(48);
    fill(0);
    text(sub, (xPos+10), yPos+50);
  }
}
