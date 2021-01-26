package simulation;

import processing.core.*;
import java.util.Random;

/**
 * The majority of all Objects in the Simulation should be of the type patient. Patients move around the field randomly, 
 * They change direction if they collide with other Actors or if they reached the edge of the field.
 * Patient can currently have the following jobs:
 * "IT" - Infected & Tested
 * "HT" - Healthy & Tested
 * "IU" - Healthy & Untested
 * "HU" - Healthy & Untested
 * 
 * @author Andreas Wagner
 *
 */
public class Patient extends Actor {
	private Random rand;
	private boolean infected;
	private boolean tested;
	private int xDirection;
	private int yDirection;
	private static int virulenz = 5;

	public Patient(PApplet applet, Actor[] others, boolean infected) {
		super(applet, others);
		this.rand = new Random();
		this.infected = infected;
		this.tested = false;
		setStartingJob();
		setStartingDirection();
	}

	private void setStartingDirection() {
		if (rand.nextBoolean()) {
			xDirection = 1;
		} else {
			xDirection = -1;
		}

		if (rand.nextBoolean()) {
			yDirection = 1;
		} else {
			yDirection = -1;
		}
	}

	private void setStartingJob() {
		if (infected && tested) {
			this.job = "IT";
		} else if (infected) {
			this.job = "IU";
		} else {
			this.job = "HU";
		}
	}
	
	/**
	 * Patients move randomly across the field. They turn if they reach the edge.
	 */
	public void act() {
		checkMark();
		if (positionX <= 0 + radius || positionX >= applet.width + radius) {
			turnX();
		}
		if (positionY <= 0 + radius || positionY >= applet.height - radius) {
			turnY();
		}
		positionX += xDirection * rand.nextInt(2);
		positionY += yDirection * rand.nextInt(2);
	}

	private void turnX() {
		xDirection *= -1;
		positionX += xDirection * 2;
	}

	private void turnY() {
		yDirection *= -1;
		positionY += yDirection * 2;
	}

	private void fullTurn() {
		turnX();
		turnY();
	}

	public void display() {
		applet.fill(getColor());
		applet.ellipse(positionX, positionY, 2 * radius, 2 * radius);
	}

	private int getColor() {
		if (tested && infected) {
			return (applet.color(255, 0, 0));
		} else if (tested && !infected) {
			return (applet.color(0, 255, 0));
		} else {
			return (applet.color(100));
		}
	}
	
	/**
	 * Patients have the most diverse behavior on collision. They can be infected(onCollision with a infected Patient),
	 * tested (onCollion with a Tester) or healed (onCollision with a Medic) 
	 */
	public void onCollision(String job) {
		fullTurn();
		switch (job) {
		case ("IU"):
			tryToInfect();
			break;
		case ("IT"):
			tryToInfect();
			break;
		case ("M"):
			tryToHeal();
			break;
		case ("T"):
			test();
		}
	}

	private void tryToInfect() {
		if (!infected && (rand.nextInt(11-virulenz) == 1)) { 
			infected = true;
			tested = false;
			this.job = "IU";
		}
	}

	private void tryToHeal() {
		if (infected && tested) {
			infected = false;
			tested = false;
			this.job = "HU";
		}
	}

	private void test() {
		tested = true;
		if (infected) {
			this.job = "IT";
		} else {
			this.job = "HT";
		}
	}
	
	public static void setVirulenz(int vir) {
		if (virulenz <= 10 && virulenz >= 1) {
			virulenz = vir;
		}
	}

}
