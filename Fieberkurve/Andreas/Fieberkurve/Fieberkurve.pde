class Fieberkurve{
  float[] temperaturen;
  
  public Fieberkurve(boolean demoModus){
    temperaturen = new float[30];
    
    if (demoModus){
      randomInitialisierung();
    }else{
      for (int i = 0; i < temperaturen.length; i++){
        temperaturen[i] = 0; 
      }
    }
  }
  
  void hinzufuegen(int tag, float temp){
    if ( tag >=0 || tag <= 30){
      temperaturen[tag-1] = temp;
    }else{
      println("Ungültiger Wert für Tag in Fieberkurve.hinzufuegen");
    }
  }
  
  void randomInitialisierung(){
    for (int i = 0; i < temperaturen.length; i++){
      temperaturen[i] = random(35,41);
    }
  }
}
