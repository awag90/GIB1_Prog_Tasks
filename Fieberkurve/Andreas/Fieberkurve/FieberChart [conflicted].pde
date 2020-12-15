class FieberChart {

  float spacing;
  Fieberkurve fieberkurve;

  public FieberChart(Fieberkurve fieberkurve) {
    this.fieberkurve = fieberkurve;
    spacing = 20;
  }

  void displayChart(float x, float y) {
    for (int i = 0; i < fieberkurve.temperaturen.length; i++) {
      float temp = fieberkurve.temperaturen[i];
      int day = i+1;
      fill(255);
      stroke(0);
      if (temp <= 37.5) {
        rect((x + i*(30+spacing)), y, 30, -2*temp);

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
      } else {
        rect((x + i*(30+spacing)), y, 30, -2*37.5);
        fill(255, 0, 0);
        rect((x + i*(30+spacing)), y -(37.5*2), 30, (-2*(temp-37.5)));

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
