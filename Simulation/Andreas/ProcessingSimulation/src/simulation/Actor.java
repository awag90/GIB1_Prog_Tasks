package simulation;

/**
 * Actor is the Super-Class for all other classes in the Simulation. There are currently no Objects of the Type Actor in the Simulation, but all other Objects
 * inherit attributes and methods from Actor.
 * The x- and y-positions of all objects are inherited from actor and the role a object plays in the simulation is saved as a two letter string in the 
 * job-attribute.
 * 
 * @author Andreas Wagner
 */
import java.util.Properties;
import java.util.Random;

import processing.core.PApplet;

public abstract class Actor {
	protected PApplet applet;
	protected Actor[] others;
	protected int positionX;
	protected int positionY;
	protected int radius;
	protected String job;
	protected boolean marked;
	protected int markTimer;

	protected Properties properties;
	
	/**
	 * @param applet 
	 * The Processing PApplet that is used as a GUI
	 * @param others
	 * An array of all other Objects currently in the simulation
	 */
	public Actor(PApplet applet, Actor[] others) {
		this(applet, new Random().nextInt(applet.width), new Random().nextInt(applet.height));
		this.radius = 10;
		this.others = others;
		this.marked = false;
	}

	public Actor(PApplet applet, int x, int y) {
		this.applet = applet;
		positionX = x;
		positionY = y;
	}

	public String getJob() {
		return job;
	}
	
	/**
	 * The Actions a Actor-Object takes during one frame of the Simulation.
	 * The act-methods mainly consists of movement.
	 */
	public void act() {
		positionX++;
		positionY++;
	}
	
	/**
	 * Displays the Object in the PApplet
	 */
	public void display() {
		applet.ellipse(positionX, positionY, 2 * radius, 2 * radius);
	}
	/**
	 * Checks the distance between the current object and all Actor-Objects in others. If there are collisions
	 * the onCollision-Method is executed.
	 */
	public void checkCollision() {
		for (Actor someone : others) {
			double minDistance = this.radius + someone.radius;
			if (calcDistanceTo(someone) <= minDistance && !isTheSameAsThis(someone)) {
				someone.onCollision(job);
			}
		}
	}

	protected double calcDistanceTo(Actor someone) {
		double xOfVector = this.positionX - someone.positionX;
		double yOfVector = this.positionY - someone.positionY;
		double distance = Math.sqrt(Math.pow(xOfVector, 2) + Math.pow(yOfVector, 2));
		return distance;
	}

	private boolean isTheSameAsThis(Actor someone) {
		if (someone.positionX != this.positionX && someone.positionY != this.positionY) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * On Collision two actors objects pass a String with their job-title to each other. This Method then specifies 
	 * what the object should do if it collides with a object of a certain job. The onCollision method of Actor is just
	 * a placeholder and should be overridden.
	 * @param job
	 */
	protected abstract void onCollision(String job); 
		

	protected boolean isNotMarked() {
		return !marked;
	}

	protected void mark() {
		marked = true;
		markTimer = 120;
	}

	protected void checkMark() {
		if (markTimer > 0) {
			markTimer--;
		} else {
			marked = false;
		}
	}

}
