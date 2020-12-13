class UhrBenutzen{
  // Diese Klasse enthält die in der Aufgabe geforderten Anwendungsbeispiele aus dem Aufgabenblatt
  
  Clock clock;
  
  public UhrBenutzen(Clock clock){
    this.clock = clock;
  }
  
  void uhrKaufen(){
    clock = new Clock(0,0,0);
  }
  
  void uhrStellen(){
    ClockSetter cs = new ClockSetter(clock);
    cs.autoSetClock();
  }
  
  void uhrStarten(){
    clock.time = new Time(0,0,0);
  }
  
  String uhrzeitAusgeben(){
    return clock.timeString;
  }
}
