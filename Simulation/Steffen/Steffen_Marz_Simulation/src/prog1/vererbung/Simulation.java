package prog1.vererbung;

import processing.core.PApplet;
import java.util.Random;
import javax.naming.Context;

public class Simulation extends PApplet {
	public static final int MAX_ACTORS = 100;
	private Actor[] actors;
	protected PApplet context;
	private int numbDoc=4 ;
	private int numbPerson=20;
	private int numbBusinnes=20;
	private int numbTester=3; 
	private int numbHotspots=4;
	
	
	

	public void setup() {
		size(1400, 700);
		actors = new Actor[MAX_ACTORS];

		for (int i = 0; i < numbHotspots; i++) {
			actors[i] = new Virus(this, "virus", new Random().nextInt(1300), new Random().nextInt(600), 240);    // this, role of the actor, X Position, Y Position, time (in fps) to change spot 
		}
		
		int startingPoint = numbHotspots + numbDoc;
		for (int i = numbHotspots; i < numbDoc + numbHotspots; i++) {
			actors[i] = new Doc(this, new Random().nextInt(1300), new Random().nextInt(600), "doc.png", "docHealed.png", startingPoint);  // this, role of the actor, X Position, img 1, img 2, point to determine which actor the doc should check to heal
			startingPoint += (numbPerson + numbBusinnes)/numbDoc;
		}
		
		for (int i = numbDoc + numbHotspots; i < numbPerson + numbDoc + numbHotspots; i++) {
			actors[i] = new Person(this, "person", new Random().nextInt(1300), new Random().nextInt(600), 240,"person.png", "personInfected.png");   // this, role of the actor, X Position, Y Position, time (in fps) to change spot, img 1, img2
		}
		for (int i = numbPerson + numbDoc + numbHotspots; i < numbBusinnes + numbPerson + numbDoc + numbHotspots; i++) {
			actors[i] = new Businnes(this, "businnes", new Random().nextInt(1300), new Random().nextInt(600), 180,"businnes.png", "businnesInfected.png"); // this, role of the actor, X Position, Y Position, time (in fps) to change spot, img 1, img 2
		}
		startingPoint = numbHotspots + numbDoc;
		for (int i = numbPerson + numbDoc + numbBusinnes + numbHotspots; i < numbBusinnes + numbPerson + numbDoc+ numbTester + numbHotspots; i++) {
			actors[i] = new Tester(this, new Random().nextInt(1300), new Random().nextInt(600), "tester.png", startingPoint); // this, role of the actor, X Position, img 1, point to determine which actor the tester should go to
			startingPoint += (numbPerson + numbBusinnes)/numbTester;
		}

	}

	public void draw() {
		background(255);
		infection();
		// First act ...
		for (int i = 0; i < actors.length; i++) {
			if (actors[i] != null) {
					actors[i].act(actors);
			}

		}
		// ... then visualize the current state of each actor
		for (int i = 0; i < actors.length && actors[i] != null; i++) {
			if (actors[i] != null) {
				actors[i].display();
			}

		}

	}

	void infection() {
		//used to check or collision between businnes and person actors. If one of them is infected, the other one will get infected to
		for (int i = numbHotspots; i < actors.length && actors[i] != null; i++) {
			for (int j = numbHotspots; i < actors.length && actors[j] != null; j++) {
				if (context.dist(actors[i].positionX, actors[i].positionY, actors[j].positionX,actors[j].positionY) < 20 && (actors[i].infected == true || actors[j].infected == true)&& (actors[i].role == "businnes" || actors[i].role == "person")&& (actors[j].role == "businnes" || actors[j].role == "person")) {
					actors[i].infected = true;
					actors[j].infected = true;
				}
			}
		}
		//used to check collision between (businnes and person) and hotspots. If either businnes or person walk into a Hotspot, they get infected.
		for (int i = 0; i < numbHotspots; i++) {
			for (int j = numbHotspots; j < actors.length && actors[j] != null; j++) {
				if (context.dist(actors[i].positionX, actors[i].positionY, actors[j].positionX,
						actors[j].positionY) < 50 && (actors[j].role == "businnes" || actors[j].role == "person")) {
					actors[j].infected = true;
				}
			}
		}
	}


	static public void main(String[] passedArgs) {
		System.out.println(Simulation.class.getName());
		PApplet.main(new String[] { Simulation.class.getName() });
	}

}
