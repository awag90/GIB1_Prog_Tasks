package prog1.vererbung;

import java.util.Properties;
import java.util.Random;

import processing.core.PApplet;

public abstract class Actor   {
	protected PApplet context;

	protected int positionX;
	protected int positionY;
	
	
	protected boolean isHealthy = true;
	protected boolean isPatient;
	protected boolean isDoctor;
	protected boolean isGerm;
	protected boolean germDesinfected;
	
	protected int radius = 65;
	protected Properties properties;
	protected int turn = 50; // default

	public Actor(PApplet context) {
		this(context, new Random().nextInt(650), new Random().nextInt(650));

	}

	public Actor( PApplet context, int turn) {
		this(context, new Random().nextInt(650), new Random().nextInt(650));
		
		this.turn = turn;

	}

	public Actor(PApplet context, int x, int y) {
		this.context = context;
		positionX = x;
		positionY = y;
	}

	public void changeDirection() {
		if (positionX < -10) {
			positionX = context.width;
		}
		if (positionX > context.width +10) {
			positionX =  0;
		}
		if (positionY > context.height +10) {
			positionY = 0;
		}
		if (positionY < -10) {
			positionY = context.height;
		}
	}

	public void act() {
		positionX++;
		positionY++;
	}

	public void display() {
		context.rect(positionX, positionY, 10, 10);
	}
}
