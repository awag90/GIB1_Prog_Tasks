package prog1.vererbung;

import java.util.Random;
import processing.core.PApplet;
import processing.core.PImage;

public class Tester extends Actor {
	protected PImage tester;
	private int startingPoint;
	private int temp;

	public Tester(PApplet context, int x, int y, String image, int startingPoint) {
		super(context, x, y);
		tester = context.loadImage(image);
		this.role = "tester";
		tester.resize(40, 60);
		this.startingPoint = startingPoint;
		this.temp = startingPoint;
	}

	public void act(Actor[] actors) {
		//makes the tester use the testing function
		testing(actors);
	}

	public void testing(Actor[] actors) {
		
		//all testers start a different starting point. the starting point determines the next actor the need to go to and test
		if (temp == actors.length - 1) {
			temp = startingPoint;
		}
		
		/*if the next actor the tester needs to test is a businnes or normal person, they start going towards it. As soon as their distance is below 20, the boolean tested of the 
		person to be tested will be set to true and the tester will then go to the next person. If the actor to be tested is not businnes or person, they will skip it
		*/
		if (actors[temp] != null && (actors[temp].role == "businnes" || actors[temp].role == "person")) {

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
				actors[temp].tested = true;
				temp++;
			} 
			else if (context.dist(positionX, positionY, actors[temp].positionX, actors[temp].positionY) <= 20
					&& (actors[temp].infected == false)) {
				temp++;
			}
		} 
		else  {
			temp++;
		}
	}

	public void display() {
		context.image(tester, positionX + 40, positionY + 40);
	}
}