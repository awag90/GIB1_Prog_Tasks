package simulation;

/*
 * Aufgaben:
 * 1. this- Stellt den Bezug zur aktuellen Klasse her. Dadurch können z.B. lokale Variablen in Funktionen gleich heißen wie 
 * wie Attribute der Klasse und es ist für den Compiler klar, dass sich z.B. this.applet auf das Attribut und applet auf den Parameter 
 * bezieht. Gleichzeitig kann mit this() der Konstruktor der Methode aufgerufen werden, wie z.B. in der Actor Klasse benutzt.
 *  super - Stellt den Bezug zur Mutterklasse her. Dadurch kann z.B. zwischen einem lokalen und einem Attribut der
 * Mutterklasse unterschieden werden. Mit super() kann außerdem der Konstruktor der Mutterklasse aufgerufen werden.(z.B. in Cruiser)
 * 
 * 2. Actor ist die zentrale Mutterklasse in der Simulation. Alle anderen Klassen außer Simulation erben von Actor. Dadurch
 * können sie Methoden und Funktionen der Klasse Actor benutzen. Die Koodrinaten positionX und PositionY finden sich zum Beispiel
 * in keiner der Sub-Klassen, werden aber trotzdem in jeder Sub-Klasse benutzt. Die Sub_klassen erben die Koordinaten von Actor.
 * 
 * 3. Das zentrale Element der Simulation ist ein Actor-Array. In diesem Array befindet sich jedoch kein einziges Objekt vom Typ
 * Actor. Alle enthaltenen Objekte sind von Sub-Klassen von Actor, durch Polymorpie können sie aber hier benutzt werden wie 
 * Objekte vom Typ Actor und es kann auf alle Methoden zugegriffen werden, die die Sub-Klassen von Actor erben.
 * Sind diese Methoden in der Sub-Klasse überschrieben, wird die überschriebene Methode benutzt, ansonsten die von Actor. 
 * Das initialisieren von Objekten einer Sub-Klasse in einer Variable oder Array der Mutterklasse nennt man Up-Casting.
 */
import processing.core.PApplet;
/**
 * This application simulates the spread of a Virus. Patients can be either infected or non infected. Testers determine the status of Patients and Medics try
 * to heal Patients that have been tested positive. 
 * The application uses Processing as a GUI-Library.
 * 
 *  @author Andreas Wagner
 *  
 */
public class Simulation extends PApplet {
	private static final long serialVersionUID = 4595280232780247313L;
	private static final int HEALTHY_PATIENTS = 80;
	private static final int INFECTED_PATIENTS = 10;
	private static final int MEDICS = 4;
	private static final int TESTERS = 3;
	private static final int RESEARCHERS = 2;
	protected Actor[] actors;

	public void setup() {
		size(720, 720);
		actors = new Actor[HEALTHY_PATIENTS + INFECTED_PATIENTS + MEDICS + TESTERS + RESEARCHERS];

		int members = 0;
		for (int i = members; i < HEALTHY_PATIENTS; i++) {
			actors[i] = new Patient(this, actors, false);
		}
		members += HEALTHY_PATIENTS;

		for (int i = members; i < members + INFECTED_PATIENTS; i++) {
			actors[i] = new Patient(this, actors, true);
		}
		members += INFECTED_PATIENTS;

		for (int i = members; i < members + MEDICS; i++) {
			actors[i] = new Medic(this, actors);
		}
		members += MEDICS;

		for (int i = members; i < members + TESTERS; i++) {
			actors[i] = new Tester(this, actors);
		}
		members += TESTERS;
		
		for (int i = members; i < members + RESEARCHERS; i++) {
			actors[i] = new Researcher(this, actors);
		}

		background(255);
	}

	public void draw() {
		background(255);

		// First act ...
		for (int i = 0; i < actors.length; i++) {
			if (actors[i] != null) {
				actors[i].act();
			}
		}
		// ... then visualize the current state of each actor
		for (int i = 0; i < actors.length && actors[i] != null; i++) {
			if (actors[i] != null) {
				actors[i].checkCollision();
				actors[i].display();
			}
		}
		displayInfectedCounter(20, 40);
		displayVaccineStatus(this.width/2-50, 40);
	}
	
	private int countInfected(){
		int count = 0;
		for (Actor actor: actors) {
			if (actor.getJob() == "IT" || actor.getJob() == "IU") {
				count++;
			}
		}
		return count;
	}
	
	private void displayInfectedCounter(float positionX, float positionY) {
		this.fill(0,0,255);
		this.textSize(28);
		this.text("Infizierte: " + countInfected(), positionX, positionY);
	}
	
	private void displayVaccineStatus(float positionX, float positionY) {
		this.fill(0,0,255);
		this.textSize(28);
		this.text("Impfstoffentwicklung: " + Researcher.getVaccineStatus()+ "%", positionX, positionY);
	}

	static public void main(String[] passedArgs) {
		PApplet.main(new String[] { Simulation.class.getName() });
	}

}
