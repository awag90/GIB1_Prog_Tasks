package prog1.vererbung;

import java.util.Random;
import processing.core.PApplet;
import processing.core.PImage;

public class Virus extends Actor {
	
	private int changeSpot;
	private int changeCount = 0;
	private float circleW = 10;
	private float circleH = 10;

	public Virus(PApplet context, String role, int x, int y, int changeSpot) {
		super(context, x, y);
		this.changeSpot = changeSpot;
		this.role = role;

	}

	public void act(Actor[] actors) {
		
		// after changeSpot is at 0, it gets set back and the Hotspots appears at another random location and its widht and heigt get set back 
		
		Random random = new Random();
		if (changeSpot >= 0) {
			changeSpot--;
			changeCount++;
		}

		else {
			circleH = 10;
			circleW = 10;
			positionX = random.nextInt(1400);
			positionY = random.nextInt(800);
			changeSpot += changeCount;
			changeCount = 0;
		}
	}

	public void display() {
		
		// shows the circle and makes it get bigger to a certain value
		Random random = new Random();
		if (circleW < 90) {
			circleW += random.nextFloat();
		}
		if (circleH < 90) {
			circleH += random.nextFloat();
		}
		context.fill(255, 0, 0);
		context.tint(255, 127);
		context.noStroke();
		context.ellipse(positionX, positionY, circleW, circleH);
		context.noFill();
		context.noTint();
	}

}
