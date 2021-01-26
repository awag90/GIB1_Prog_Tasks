package prog1.vererbung;

import java.util.Random;
import processing.core.PApplet;
import processing.core.PImage;

public class Germ extends Actor {
	protected PImage img;
		
		public Germ(PApplet context, String image) { //Constructor mit flexibler Übergabe eines Bildes
			super(context);
			img = context.loadImage(image);
			img.resize(40, 40);
		}
		
		public void act() {
			
		}

		public void display() {
			
			if(germDesinfected == false) {
			context.image(img, positionX-20, positionY-22);
			context.noStroke();
			context.fill(200,0,0,50);
			context.ellipse(positionX, positionY, radius, radius);
			} else {
				
			}
		}
		
}
		
	
