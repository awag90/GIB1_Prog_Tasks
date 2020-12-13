class DisplayField { //<>// //<>// //<>//
  //Container for objects from other classes. Reads Strings from these objects and displays them on the screen.

  //Objects
  Clock clock;
  ClockSetter cs;
  ScrollingText st;
  //Coordinates and dimensions
  int fieldWidth;
  int fieldHeight;
  int startPointX;
  int startPointY;
  //controll variables of the class
  int controll;
  int maxControll;
  boolean keyboardIsActive;
  int[] validButtonTypes;
  //Colors
  int bg;
  int fg;

  public DisplayField(int startPointX, int startPointY, int fieldWidth, int fieldHeight, int bg, int fg) {
    this.startPointX = startPointX;
    this.startPointY = startPointY;
    this.fieldWidth = fieldWidth;
    this. fieldHeight = fieldHeight;
    this.bg = bg;
    this .fg = fg;

    this.controll = 0;
    this.maxControll = 2; //limits values of controll
    this.keyboardIsActive = false;
    this.clock = new Clock(0, 0, 0);
    this.cs = new ClockSetter(this.clock);
    String scrollString = " Frohe Weihnachten und ein gesundes Neues Jahr!!! ";
    this.st = new ScrollingText(scrollString, this.clock.time);
  }

  void show() {
    //displays a rectangle and strings as text inside it
    clock.update();
    cs.createTimeString();

    // Strings to be displayed
    String displayString = "";
    String nameString = "";
    String instructions = "";

    switch (controll) {
      //Uses controll-variable to decide from which object the Strings are taken
    case 0:
      //Clock-Object
      displayString = clock.timeString;
      nameString = clock.name;
      validButtonTypes = clock.validButtonTypes;
      keyboardIsActive = false;
      break;

    case 1:
      //ClockStetter-Object
      displayString = cs.timeString;
      nameString = cs.name;
      instructions = cs.instructions;
      validButtonTypes = cs.validButtonTypes;
      keyboardIsActive = true;
      break;

    case 2:
      //ScrollText-Object
      st.createDisplayString();
      displayString = st.displayString;
      validButtonTypes = st.validButtonTypes;
      break;
    }

    //Displaying the Strings
    strokeWeight(5);
    stroke(bg+50);
    fill(bg);
    rect(startPointX, startPointY, fieldWidth, fieldHeight);

    fill(fg);
    textSize(42);
    text(displayString, startPointX+fieldWidth/2 - displayString.length()* 12, fieldHeight/2+10);

    textSize(24);
    text(nameString, startPointX+fieldWidth/2 - nameString.length() *6, startPointY+30);

    textSize(12);
    text(instructions, startPointX+10, startPointY+ fieldHeight -40);
  }
}
