package prog1.vererbung;

import java.util.Random;

import processing.core.PApplet;
import processing.core.PImage;

public class Doc extends Actor {
	protected PImage doc;
	protected PImage docHealed;
	private int startingPoint;
	private int temp;
	private boolean success=false;
	private int healTimer=60;

	public Doc(PApplet context, int x, int y, String image, String imageHealed, int startingPoint) {
		super(context, x, y);
		doc = context.loadImage(image);
		docHealed= context.loadImage(imageHealed);
		this.role = "doc";
		this.startingPoint = startingPoint;
		this.temp = startingPoint;
	}

	public void act(Actor[] actors) {
		heal(actors);
	}

	public void heal(Actor[] actors) {
		//all testers start a different starting point. the starting point determines the next actor the need to go to and test

		if (temp == actors.length - 1) {
			temp = startingPoint;
		}
		/*if the next actor the doc needs to heal is a businnes or normal person and it is tested and infected, they start going towards it. As soon as their distance is below 20 it has a 90% healing chance.
		 *The boolean infected of the person to be healed then will be set to false and the doc will then go to the next person. If the actor to be tested is not businnes or person, they will skip it.
		*/
		if (actors[temp] != null && (actors[temp].role == "businnes" || actors[temp].role == "person")
				&& actors[temp].tested && actors[temp].infected&& !success) {

			if (positionX < actors[temp].positionX) {
				positionX += 2;
			} 
			else if (positionX > actors[temp].positionX) {
				positionX -= 2;
			}
			if (positionY < actors[temp].positionY) {
				positionY += 2;
			} 
			else if (positionY > actors[temp].positionY) {
				positionY -= 2;
			}
			if (context.dist(positionX, positionY, actors[temp].positionX, actors[temp].positionY) <= 20 && (actors[temp].infected == true)) {
				int chance=new Random().nextInt(100);
				if(chance<=10) {
					temp++;
				}
				else {
					actors[temp].infected = false;
					temp++;
					success=true;
				}
			}

		}
		else {
			temp++;
		}
	}

	public void display() {
		
		// If the doc heals a person, a green picture of the doc will appear for a certain time in fps. (60fps = 1 sec)
		System.out.println(success);
		if(!success ) {
			context.image(doc, positionX + 40, positionY + 40,70,70);
		}
		else if(success && healTimer>0) {
			context.image(docHealed, positionX +40, positionY+40,70,70);
		}
		if(success) {
			healTimer--;
		}
		if(healTimer<=0) {
			success=false;
			healTimer+=60;
		}
	}
}