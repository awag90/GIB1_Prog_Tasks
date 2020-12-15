class FieberChart {
  // Visualisiert ein Objekt der Fieberkurven-Klasse als eine Reihe von Kästchen. Wete oberhalb von 37.5 werden rot dargestellt.
  float spacing;
  Fieberkurve fieberkurve;
  int sizeFactor;

  public FieberChart(Fieberkurve fieberkurve, int factor) {
    this.fieberkurve = fieberkurve;
    spacing = 20;
    this.sizeFactor = factor; 
  }

  void displayChart(float x, float y) {
    // Zeichnet FieberChart mit rect und text
    for (int i = 0; i < fieberkurve.temperaturen.length; i++) {
      float temp = fieberkurve.temperaturen[i];
      int day = i+1;
      fill(255);
      stroke(0);
      if (temp <= 37.5) {
        rect((x + i*(30+spacing)), y, 30, -sizeFactor*temp); // x verändert sich abhängig von i, der Breite eines Kästchens und dem spacing-Wert der Klasse

        textSize(12);
        fill(0);
        if (day < 10) {
          text(day, (x + i*(30+spacing)+10), y - 10);
        } else {
          text(day, (x + i*(30+spacing)+8), y - 10);
        }

        if (temp !=0) { // Wenn temp 0 ist soll keine Temperatur angezeigt werden
          String t = (""+temp).substring(0, 4);
          fill(0, 150, 0);
          text(t, (x + i*(30+spacing)+2), y - 35);
        } else {
          fill(0, 150, 0);
          text("", (x + i*(30+spacing)+2), y - 35);
        }
      } else {
        rect((x + i*(30+spacing)), y, 30, -sizeFactor*37.5);
        fill(255, 0, 0);
        rect((x + i*(30+spacing)), y -(37.5*2), 30, (-sizeFactor*(temp-37.5))); // Kästchen bei Temperaturen > 37.5 setzten sich aus zwei Rechtecken zusammen

        textSize(12);
        fill(0);
        if (day < 10) {
          text(day, (x + i*(30+spacing)+10), y - 10);
        } else {
          text(day, (x + i*(30+spacing)+8), y - 10);
        }

        if (temp !=0) {
          String t = (""+temp).substring(0, 4);
          fill(0, 150, 0);
          text(t, (x + i*(30+spacing)+2), y - 35);
        } else {
          fill(0, 150, 0);
          text("", (x + i*(30+spacing)+2), y - 35);
        }
      }
    }
  }
}
