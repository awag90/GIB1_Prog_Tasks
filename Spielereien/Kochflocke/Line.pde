class Line{
  float xStart;
  float xEnd;
  float yStart;
  float yEnd;
  
  public Line(float xStart, float yStart, float xEnd, float yEnd){
    this.xStart = xStart;
    this.xEnd = xEnd;
    this.yStart = yStart;
    this.yEnd = yEnd;
  }
  
  void display(){
    line(xStart,yStart,xEnd,yEnd);
  }
}
