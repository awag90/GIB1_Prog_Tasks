class ClockSetter {
  /*
  This class allows the User to set the Time of the clock either manually (via keyboard) or set
   the Time to local Time automatically
   */

  Clock clock;

  // Strings for DisplayField object
  String name;
  String timeString;
  String instructions;

  // controll variables
  int[] validButtonTypes = {0, 1};
  int[] blinking = {1, 1, 2, 1, 1}; // Controll Array for blinking-effect
  int blinkCounter; // main controll value for this class
  char[] buffer = {'0', '0', ':', '0', '0'} ; // Saves the values for the bufferString


  public ClockSetter(Clock clock) {
    this.clock = clock;
    this.name = "Uhr stellen";
    this.instructions = "Geben sie die gewünschte Uhrzeit ein, oder klicken sie auf \n das Uhr Symbol um die Uhr automatisch zu stellen";
    this.blinkCounter = 0;
  }

  void createTimeString() {
     //Creates a String from the Buffer-Array with a blinking-effect on the active digit

    Time time = clock.time;

    //Changes the value for the active number in the Controll-Array (blinking) every 20 Frames
    if (time.counter%20 == 0) {
      if (blinking[blinkCounter] == 1) {
        blinking[blinkCounter] = 0;
      } else if (blinking[blinkCounter]==2) {
        blinkCounter++;
      } else {
        blinking[blinkCounter] = 1;
      }
    }

    //Creates a String from the Buffer-Array. If (binking[i] == 0) the digit will be set to a String of whitespace. 
    timeString = "";
    for (int i = 0; i< 5; i++) {
      char c = buffer[i];
      if (blinking[i] >= 1) {
        timeString += c;
      } else {
        timeString += "  ";
      }
    }
  }


  void setClock(char k) {
    // Takes a key input, checks whether it is a valid digit an then sets active digit to that digit.
    // After all digits have been changed, it sets the time of the clock to the values in the Buffer-Array.
    if (Character.isDigit(k)) {
      switch (blinkCounter) {
      case 0:
        if (Character.getNumericValue(k) <= 2) {
          buffer[0] = k;
          blinkCounter++;
          blinking[0] = 1;
          break;
        }
      case 1:
        if (Character.getNumericValue(buffer[0])<=1) {
          if (Character.getNumericValue(k) <= 9) {
            buffer[1] = k;
            blinkCounter++;
            blinking[1] = 1;
            break;
          }
        } else {
          if (Character.getNumericValue(k) <= 3) {
            buffer[1] = k;
            blinkCounter++;
            blinking[1] = 1;
            break;
          }
        }
      case 3:
        if (Character.getNumericValue(k) <= 5) {
          buffer[3] = k;
          blinkCounter++;
          blinking[3] = 1;
          break;
        }
      case 4:
        if (Character.getNumericValue(k) <= 9) {
          buffer[4] = k;
          blinkCounter = 0 ;
          blinking[4] = 1;
          //Changing Time to the Values from the Buffer-Array
          clock.time.hours = Character.getNumericValue(buffer[0])*10 + Character.getNumericValue(buffer[1]);
          clock.time.minutes = Character.getNumericValue(buffer[3])*10 + Character.getNumericValue(buffer[4]);
          break;
        }
      }
    }
  }

  void autoSetClock() {
    // Reads local time of the PC and changes time and Buffer-Array to the local Time
    buffer[0] = Character.forDigit((hour()/10), 10);
    buffer[1] = Character.forDigit((hour() - (hour()/10)*10), 10);
    buffer[3] = Character.forDigit((minute()/10), 10);
    buffer[4] = Character.forDigit((minute() - (minute()/10)*10), 10);
    clock.time.hours = hour();
    clock.time.minutes = minute();
  }
}
