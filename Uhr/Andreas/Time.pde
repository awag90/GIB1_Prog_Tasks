class Time {
  // Counts the frames and calculates the time that has passed since the programm has been startet.
  int counter; //frame count
  int seconds;
  int minutes;
  int hours;
  int frames; //frames/s

  public Time(int hours, int mins, int secs) {
    this.hours = hours;
    this.minutes = mins;
    this.seconds = secs;
    this.frames = (int)frameRate; //initializing frame rate as int to compensate for small changes in the frame rate

    this.counter = 0;
  }

  void tick() {
    // counts frames and calculates time
    counter++;
    if (counter%(frames) == 0) {
      seconds++;
    }
    if (seconds > 59) {
      seconds = 0;
      minutes++;
    }
    if (minutes > 59) {
      minutes = 0;
      hours++;
    }
    if (hours > 23) {
      hours = 0;
    }
  }
}
