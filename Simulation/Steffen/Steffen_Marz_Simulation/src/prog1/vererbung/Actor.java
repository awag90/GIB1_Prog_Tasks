package prog1.vererbung;

import java.util.Properties;
import java.util.Random;

import javax.print.Doc;

import processing.core.PApplet;

public class Actor {
	protected PApplet context;

	protected float positionX;
	protected float positionY;
	protected Properties properties;
	protected boolean infected;
	protected boolean tested;
	protected String role;


	public Actor(PApplet context, int x, int y) {
		this.context = context;
		positionX = x;
		positionY = y;
		this.tested = false;
		this.infected = false;
	}

	public void act(Actor[] actors) {
		positionX++;
		positionY++;
	}

	public void display() {

		context.rect(positionX, positionY, 10, 10);
	}

}