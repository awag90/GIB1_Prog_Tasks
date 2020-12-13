class Button{
  int id;
  int type;
  int buttonHeight;
  int buttonWidth;
  float buttonStartY;
  PImage icon;
  boolean active;
  
  public Button(int id, int type, int buttonHeight, int buttonWidth, PImage icon){
    this.id = id;
    this.type = type;
    this.buttonHeight = buttonHeight;
    this.buttonWidth = buttonWidth;
    this.icon = icon;
    this.icon.resize(buttonWidth,buttonHeight);
    this.active = false;
  }
  
  void display(float x, float y){
    fill(0);
    image(icon, x, y);
    this.buttonStartY = y;
  }
}
