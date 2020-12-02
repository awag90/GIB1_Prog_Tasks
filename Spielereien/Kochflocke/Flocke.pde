class Flocke {
  Line[] lines;
  float FAKTOR = sqrt(3)/2; //Faktor für die Dreieckshöhe

  public Flocke(float x1, float y1, float x2, float y2, float x3, float y3) {
    lines = new Line[3];
    lines[0] = new Line(x1, y1, x2, y2);
    lines[1] = new Line(x2, y2, x3, y3);
    lines[2] = new Line(x3, y3, x1, y1);
  }

  void display() {
    for (int i=0; i<lines.length; i++) {
      lines[i].display();
    }
  }

  void kochify() {
    //Teilt jede Linie in lines in 4 Linien mit einem gleichschenkligen Dreieck in der Mitte
    
    //Buffer-Array mit Platz für 4 mal so viele Linien initialisieren
    Line[] linesBuffer = new Line[4*lines.length];

    for (int i = 0; i < lines.length; i++) {
      //Linie aus Array abrufen
      Line l = lines[i]; 
      
      // Endpunkte für neue Linien berechnen
      float xp1 = ((2* l.xStart + l.xEnd)/3); //<>//
      float yp1 = ((2* l.yStart + l.yEnd)/3); //<>//
      
      float xp2 = ((( l.xStart + l.xEnd)/2)-(FAKTOR*(l.yEnd - l.yStart)/3)); //Tausche - vor "(FAKTOR..." zu + um cooles Kristallmuster zu erhalten //<>//
      float yp2 = ((( l.yStart + l.yEnd)/2)-(FAKTOR*(l.xStart-l.xEnd)/3)); //Hier auch //<>//
      
      float xp3 = ((l.xStart + 2*l.xEnd)/3); //<>//
      float yp3 = ((l.yStart + 2*l.yEnd)/3); //<>//
      
      //Linien dem Buffer-Array hinzufügen
      linesBuffer[4*i] = new Line(l.xStart, l.yStart, xp1, yp1);
      linesBuffer[4*i+1] = new Line(xp1, yp1, xp2, yp2);
      linesBuffer[4*i+2] = new Line(xp2,yp2, xp3, yp3);
      linesBuffer[4*i+3] = new Line(xp3, yp3, l.xEnd, l.yEnd);
    }
    // Buffer-Array in lines übertragen
    lines = linesBuffer;
  }
}
