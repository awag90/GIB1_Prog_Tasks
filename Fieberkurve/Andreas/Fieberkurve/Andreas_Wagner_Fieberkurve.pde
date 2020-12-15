FieberChartJahr jahr;
ScrollBar bar;
boolean demoModus;
Fieberkurve[] kurven;
TempAddWindow addWindow;
Button plusButton;


void mousePressed() {
  if (mouseX >= plusButton.buttonStartX && mouseX <= plusButton.buttonStartX + plusButton.buttonWidth) {
    if (mouseY >= plusButton.buttonStartY && mouseY <= plusButton.buttonStartY + plusButton.buttonHeight) {
      if (!addWindow.open) {
        addWindow.open = true;
      } else {
        addWindow.addTemp();
      }
    }
  }
}


void setup() {
  size(1680, 840);
  background(255);

  PImage plus = loadImage("plus_button.png");
  plusButton = new Button(0, 90, 90, plus);

  demoModus = true; // Auf false stellen um leere Fieberkurve zu erhalten
  kurven = new Fieberkurve[12];
  for (int i = 0; i < kurven.length; i++) {
    kurven[i] = new Fieberkurve(demoModus);
  }

  FieberChart[] charts = new FieberChart[kurven.length];
  for (int i = 0; i < charts.length; i++) {
    charts[i] = new FieberChart(kurven[i],2);
  }

  jahr = new FieberChartJahr(60, 30, 2020, charts);
  bar = new ScrollBar(width-30, 0, 30, height-20);
  addWindow = new TempAddWindow(kurven);
}

void draw() {
  background(255);
  if (!addWindow.open) {
    // Zeigt Feiberkurve
    jahr.displayChart();
    bar.display();
    bar.scroll(jahr);
    plusButton.display(width-135, height-120);
  } else {
    // Zeigt addWindow
    addWindow.display();
    plusButton.display(width-135, height-120);
  }
}
