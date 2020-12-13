class ScrollingText {
  // Takes a long String and scrolls through it
  String displayString;
  String baseString;
  String name;
  int startInt;
  Time time;
  int[] validButtonTypes = {0};


  public ScrollingText(String baseString, Time time) {
    this.startInt = 1;
    this.baseString = baseString;
    this.time = time;
  }

  void createDisplayString() {
    if (time.counter%15==0 && startInt < baseString.length()) {
      startInt++;
    }else if (time.counter%15==0){
      startInt = 1;
    }
      
    if (startInt+ 12 <= baseString.length()-1) {
      displayString = baseString.substring(startInt, startInt+12);
    } else {
      displayString = baseString.substring(startInt, baseString.length());
      for( int i = 0; i <12-(baseString.length()-startInt);i++){
        displayString+= " ";
      }
    }
  }
}
