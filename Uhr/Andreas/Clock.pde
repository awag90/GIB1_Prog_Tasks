class Clock {
  // Turns a Time-Object into a String which can be displayed
  Time time;
  String timeString;
  String name;
  int[] validButtonTypes = {0};

  public Clock(int hours, int mins, int secs) {
    this.time = new Time(hours, mins, secs);
    this.name = "Uhr";
  }

  void update() {
    // Advances time and turn it into a String
    time.tick();

    String secString;
    String minString;
    String hString;

    if (time.seconds <= 9) {
      secString = "0" + time.seconds;
    } else {
      secString = "" + time.seconds;
    }

    if (time.minutes <= 9) {
      minString = "0" + time.minutes;
    } else {
      minString = "" + time.minutes;
    }

    if (time.hours <= 9) {
      hString = "0" + time.hours;
    } else {
      hString = "" + time.hours;
    }
    timeString = hString + ":" + minString + ":"+ secString;
  }
     
}
