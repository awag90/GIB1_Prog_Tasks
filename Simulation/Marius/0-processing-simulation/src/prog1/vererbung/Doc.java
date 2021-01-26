package prog1.vererbung;

import java.util.Random;
import processing.core.PApplet;
import processing.core.PImage;

public class Doc extends Actor {
	protected PImage img;
		
		public Doc(PApplet context, String image) {
			super(context);
			img = context.loadImage(image);
		}
		
		public Doc(PApplet context, String image, int turn)  {
		super(context);
		
		img =  context.loadImage(image);
		
	}
	
	public void act() {
		final int turnX = new Random().nextInt(100);
	
		if (turnX > turn)
			positionX = positionX + new Random().nextInt(6);
		else
			positionX = positionX - new Random().nextInt(6);
		final int turnY = new Random().nextInt(100);
		if (turnY > turn)
			positionY = positionY + new Random().nextInt(6);
		else 
			positionY = positionY - new Random().nextInt(6);
	}
	
	public void display() {
		//context.image(img, positionX, positionY);
		context.image(img, positionX-30, positionY-30);
		context.noStroke();
		if(isHealthy == false) {
			context.fill(255, 0, 0, 100);
			} else {
			context.fill(0, 200, 200, 100);
			}
		context.ellipse(positionX, positionY, radius, radius);
	}
}
