class FieberChartJahr {
  // Zeichnet bis zu 12 FieberCharts übereinander und beschriftet diese mit dem Monat
  float startPosX;
  float startPosY;
  float spacer;
  int jahr;
  FieberChart[] charts;
  // Array dient der Beschiftung der Monats-Charts
  String[] monatsNamen = {"Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"};

  public FieberChartJahr(float startPosX, float startPosY, int jahr, FieberChart[] charts) {
    this.startPosX = startPosX;
    this.startPosY = startPosY;
    this.jahr = jahr;
    spacer = 120;

    if (charts.length <= 12){
      this.charts = charts;
    }
  }

  void displayChart() {
    // Zeichnet bis zu 12 FieberCharts
    fill(0,0,255);
    textSize(36);
    text(jahr, startPosX, startPosY+spacer/2);
    for (int i =0; i< charts.length; i++) {
      textSize(18);
      fill(0,0,255);
      text(monatsNamen[i], startPosX, startPosY+ spacer+i*(spacer+100)); //y verändert sich abhänig von i und dem spacing
      charts[i].displayChart(startPosX, startPosY+2*spacer+i*(spacer+100));
    }
  }
}
