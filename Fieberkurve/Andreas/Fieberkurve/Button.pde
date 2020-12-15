class Button{
  // Initialisiert Button mit Icon und Dimensionen
  int id;
  int buttonHeight;
  int buttonWidth;
  float buttonStartY;
  float buttonStartX;
  PImage icon;
  
  public Button(int id, int buttonHeight, int buttonWidth, PImage icon){
    this.buttonHeight = buttonHeight;
    this.buttonWidth = buttonWidth;
    this.icon = icon;
    this.icon.resize(buttonWidth,buttonHeight);
    this.id = id;
  }
  
  void display(float x, float y){
    fill(0);
    image(icon, x, y);
    this.buttonStartY = y;
    this.buttonStartX = x;
  }
}
