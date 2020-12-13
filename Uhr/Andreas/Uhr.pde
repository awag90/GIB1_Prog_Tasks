/*
Author: Andreas Wagner
Matrikelnummer: 301730

Lernfragen:
  1. Eine Klasse ist ein Bauplan für ein Objekt. Eine Klasse enthält Variablen, die den Zustand des Objekts 
  beschreiben und Methoden, die das Verhalten des Objekts beschreiben. Jede Klasse enthält einen Constructor,
  eine Funktion, die ein Objekt dieser Klasse erzeugt. Dieser Constructor kann Parameter enthalten, oder statisch sein.
  Der Constructor wird für die Initialisierung eines Objekts der Klasse benutzt.

  2. Der Creator definiert die Klasse, er legt fest welche Variablen und Methoden die Klasse enthält und definiert diese.
  Der Client initialisert und benutzt ein Objekt der Klasse und wendet die Methoden der Klasse an.

*/

int BACKGROUND = 0;
int TEXTCOLOR = 255;

DisplayField display;
Toolbar toolbar;

void setup() {
  size(420, 180);
  background(BACKGROUND);
  // Loading images for buttons
  PImage upArrow = loadImage("up_button.png");
  PImage downArrow = loadImage("down_button.png");
  PImage clock = loadImage("clock.png");
  //initializing Buttons
  Button[] buttons = {new Button(0, 0, 30, 30, upArrow), new Button(1, 1, 30, 30, clock), new Button(2, 0, 30, 30, downArrow)};
  //initializing dislply and toolbar
  display = new DisplayField(0, 0, width-30, height, BACKGROUND, TEXTCOLOR);
  toolbar = new Toolbar(display, 30, buttons);
}

void keyPressed() {
  if (display.keyboardIsActive) {
    display.cs.setClock(key);
  }
}

void mousePressed() {
  //checks wheter the coordinates of the click match the cordinates of a button in the toolbar
  if (mouseX >= toolbar.startPointX && mouseX <= toolbar.startPointX + toolbar.barWidth) {
    for (Button b : toolbar.buttons) {
      if (b.active && mouseY >= b.buttonStartY && mouseY <= b.buttonStartY + b.buttonHeight) {
        // does stuff depending on the buttons id
        switch (b.id) {
        case 0:
          if (display.controll < display.maxControll) {
            display.controll += 1;
            for (Button bu : toolbar.buttons) {
              bu.active = false; //resets active buttons when display is changed
            }
          }
          break;
        case 1:
          display.cs.autoSetClock();
          break;
        case 2:
          if (display.controll > 0) {
            display.controll -= 1;
            for (Button bu : toolbar.buttons) {
              bu.active = false;
            }
          }
          break;
        }
      }
    }
  }
}

void draw() {
  background(BACKGROUND);
  display.show();
  toolbar.show();
}
