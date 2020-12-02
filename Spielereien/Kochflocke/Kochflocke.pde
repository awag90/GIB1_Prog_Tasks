Flocke flocke;
int counter;
int tiefe;
int maxTiefe;

void setup(){
  size(640,640);
  flocke = new Flocke(width/2, 40, width/2-240,456, width/2+240,456);
  counter = 1;
  maxTiefe = 20; // Hier gewünschte Tiefe eingeben
}

void draw(){
  background(0);
  stroke(255);
  // nächste Zeile entkommentieren für Party-Modus
  //stroke(random(255),random(255),random(255)); 
  flocke.display();
  counter ++;
  if (counter%120 == 0 && (tiefe <= maxTiefe)){
    flocke.kochify();
    tiefe++;
  }
}
  
