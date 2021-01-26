package simulation;

import java.io.IOException;
import java.util.Random;

import processing.core.PApplet;
import processing.core.PImage;

public class Cruiser extends Actor {
	protected PImage img;
	private double turnProbability;
	
	/**
	 * @param turnProbability
	 * The Probability of the Cruiser turning with 1 meaning the Cruiser turn every Frame, 0 meaning the Cruiser never turns.
	 * The Default Value is 0.5 meaning the Chance of turning is 50%
	 */
	public Cruiser(PApplet applet, int x, int y, float turnProbability) {
		this(applet, x, y, "doc.png");
		if (turnProbability >= 0 && turnProbability <= 1) {
			this.turnProbability = turnProbability;
		}else {
			System.err.println("turnProbabillity should be between 0 an 1");
		}
	}
	
	public Cruiser(PApplet applet, int x, int y) throws IOException {
		super(applet, x, y);
		img =  applet.loadImage("doc.png");
		turnProbability = 0.5;
	}

	public Cruiser(PApplet applet, int x, int y, String image)  {
		super(applet, x, y);
		img =  applet.loadImage(image);
		turnProbability = 0.5;
	}
	
	public void act() {
		final int turnX = new Random().nextInt(100);
		if (turnX > (1-turnProbability)*100)
			positionX = positionX + new Random().nextInt(2);
		else 
			positionX = positionX - new Random().nextInt(2);
		
		final int turnY = new Random().nextInt(100);
		if (turnY > (1-turnProbability)*100)
			positionY = positionY + new Random().nextInt(2);
		else 
			positionY = positionY - new Random().nextInt(2);
	}
	
	public void display() {
		applet.image(img, positionX, positionY);
	}
	
	public void onCollision(String job) {
		
	}
	
}
