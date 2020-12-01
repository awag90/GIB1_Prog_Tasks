int meteoritNumber = 0;
boolean gameOver = false;

/////////////////////////////////////////////////////////
// Objekt

class Spaceship {
  int x = 200;
  int y = 550;

  int left () {
    return x - 50;
  }

  int right () {
    return x + 50;
  }
  int top () {
    return y - 10;
  }

  int bottom () {
    return y - 10;
  }

  void move () { //Bewegung des Schiffs anhand Mausposition
    x = mouseX;

    // Grenzen des Spielfeldes
    if (x >= width - 15) {
      x = width - 15;
    }
    if (x <= 0 + 15) {
      x = 0 + 15;
    }
  }

  void draw () { // Malen des Spaceships
    // Spaceship
    fill(10, 193, 38);
    stroke(0, 0, 0);
    ellipse(x, y - 12.5, 14, 19);//Alien
    stroke(0, 0, 0);
    ellipse(x-3, y - 17.5, 1, 1);//Auge
    ellipse(x+3, y - 17.5, 1, 1);//Auge

    fill(120, 210, 224, 75);
    ellipse(x, y - 10, 30, 40);//Ufodeckel

    fill(54, 56, 152);
    ellipse(x, y, 100, 30);//Ufo
    fill(0);
    ellipse(x, y, 30, 10);

    fill (255);
    rect (x - 2, y - 38, 5, 10); //Kanone
  }
  void erase () {
    clear ();
  }
  Kanonenkugel shoot () {
    return new Kanonenkugel (x, y - 20); //Neue Kanonkugel wird erzeugt S. Z.131
  }
}

/////////////////////////////////////////////////////////
// Objekt Meteorit

class Meteorit { 
  int x = (int) random (15, width - 15);
  float y = 0;
  float speed = 0.3;

  int left () {
    return x - 15;
  }

  int right () {
    return x + 15;
  }

  int top () {
    return (int)y - 15;
  }

  int bottom () {
    return (int)y + 15;
  }

  //Bewegung Meteorit
  void move () {
    y = (y + speed);
    speed = speed * 1.001; //generelle Beschleunigung
  }

  //Malen des Meteoriten
  void draw () {
    fill (170, 0, 0);
    ellipse (x, y, 20, 20 );
  }

  boolean unten () {
    return y >= height;
  }

  boolean collidesWith (Spaceship ship) {
    return right() >= ship.left() && left () <= ship.right() && bottom () > ship.top ();
  }

  Meteorit () {
    meteoritNumber = meteoritNumber +1; 
    speed = 0.2 + meteoritNumber * 0.2; //Neuer Meteor wird um 0.2 schneller
  }
}

/////////////////////////////////////////////////////////
//Objekt Kanonekugel

class Kanonenkugel {
  int x ;
  int y ;

  //Wird beim erzeugen der Kanonenkugel aufgerufen (nur einmal)
  Kanonenkugel (int xStart, int yStart) //Koordinaten vom Raumschiff
  {
    x = xStart; //mein x ist der xStart, der vom Raumschiff übergeben wird
    y = yStart;
  }

  int left () {
    return x - 2;
  }

  int right () {
    return x + 2;
  }

  int top () {
    return y - 2;
  }

  int bottom () {
    return y + 2;
  }

  void draw () {
    fill (255);
    ellipse (x, y, 6, 6);
  }

  void move () {
    y = y - 7;
  }

  boolean oben () {
    return bottom () < 0;
  }

  boolean collidesWith (Meteorit meteorit) { //M = Parametertyp, m = Name des Objekts
    return right() >= meteorit.left() && left () <= meteorit.right() && top () < meteorit.bottom ();
  }
}

/////////////////////////////////////////////////////////
//Erzeugung des Objekts, dabei ist "ship" die Variable

Spaceship ship = new Spaceship (); 
Meteorit meteorit = new Meteorit ();
Kanonenkugel kugel = null;

/////////////////////////////////////////////////////////

void setup () {
  size (400, 600);
}

/////////////////////////////////////////////////////////

void draw () {
  if (gameOver) {
    return; // es wir nichts mehr aufgerufen
  }
  background (0);

  ship.draw (); //Draw routine im ship wird aufgerufen

  meteorit.move ();
  meteorit.draw ();

  if (kugel!= null) { //Wenn es Kugel gibt, wird kugel aufgerufen
    kugel.move();
    kugel.draw();
    if (kugel.collidesWith (meteorit)) {
      meteorit = new Meteorit ();
      kugel = null;
    }
    if (kugel != null && kugel.oben()) {
      kugel = null;
    }
  }

  if (meteorit.unten()) { //Wenn Meteor Boden, dann erzeuge neuen
    meteorit = new Meteorit ();
  }

  if (meteorit.collidesWith (ship)) {
    ship.erase ();
    textSize (50);
    fill (255);
    text ("GAME OVER", 50, 300, 100);
    gameOver = true;
  }
}

/////////////////////////////////////////////////////////

void mouseMoved () {
  ship.move (); //Move routine im ship wird aufgerufen
}

/////////////////////////////////////////////////////////

void mouseClicked () {
  if (kugel == null) {
    kugel = ship.shoot ();  //in ship wird shoot aufgerufen
  }
  if (gameOver) { //bei Game Over und Mausklick geht das Programm zu
    exit ();
  }
}