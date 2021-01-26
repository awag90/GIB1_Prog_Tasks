package prog1.vererbung;

import java.util.Random;

import processing.core.PApplet;
import processing.core.PImage;

public class Patient extends Actor {
	protected PImage img;

	
	public Patient(PApplet context, String image) {
		super(context);
		img = context.loadImage(image);
	}
	
	
	public Patient(PApplet context, String image, int turn) {
		super(context);
		img =  context.loadImage(image);
		this.turn = turn;
	}

	
	public void act() {
		final int turnX = new Random().nextInt(100);
		if (turnX > turn)
			positionX = positionX + new Random().nextInt(3);
		else
			positionX = positionX - new Random().nextInt(3);

		final int turnY = new Random().nextInt(100);
		if (turnY > turn)
			positionY = positionY + new Random().nextInt(3);
		else
			positionY = positionY - new Random().nextInt(3);

	}

	public void display() {
		context.image(img, positionX-24, positionY-25);
		context.noStroke();
		if(isHealthy == false) {
			
		context.fill(255, 0, 0, 100);
		} else {
			
		context.fill(0, 250, 0, 100);
		}
		context.ellipse(positionX, positionY, radius, radius);

	}
}
