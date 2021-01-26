package prog1.vererbung;

import java.util.Random;
import processing.core.PApplet;
import processing.core.PImage;

public class Businnes extends Actor {
protected PImage businnes;
protected PImage businnesInfected;
int turn;
int turnTimer;
int turnCount;
int turnX= new Random().nextInt(100);

public Businnes(PApplet context, String role, int x, int y, int turnTimer, String image, String imageInfected) {
	super(context, x, y);
	businnes = context.loadImage(image);
	businnesInfected = context.loadImage(imageInfected);
	this.turnTimer = turnTimer;
	this.role = role;

}

public void act(Actor[] actors) {
 /*ever frame the turnTimer gets subtracted by 1. After it reaches 1, they turnX gets a new value from 0 to 100. Depending on this, the businnes Person moves
	to another direction as long as it is inside the permitted area. Otherwise it will get a new turnX value to move away from the border.
*/
	Random random = new Random();

	if (turnTimer >= 0) {
		turnTimer--;
		turnCount++;
	}

	else {
		turnTimer += turnCount;
		turnCount = 0;
		turnX = random.nextInt(100);
	}
	if (turnX<25 && (positionX<context.width-100) && (positionX>20) && (positionY<context.height-150) && (positionY>20)) {
		positionX = positionX + random.nextInt(3);
		positionY = positionY + random.nextInt(3);
	}
	else if (turnX<50 && (positionX<context.width-100) && (positionX>20) && (positionY<context.height-150) && (positionY>20)) {
		positionX = positionX + random.nextInt(3);
		positionY = positionY - random.nextInt(3);		
			}
	else if (turnX<75 && (positionX<context.width-100) && (positionX>20) && (positionY<context.height-150) && (positionY>20)) {
		positionX = positionX - random.nextInt(3);
		positionY = positionY + random.nextInt(3);
	}
	else if (turnX<100 && (positionX<context.width-100) && (positionX>20) && (positionY<context.height-150) && (positionY>20)) {
		positionX = positionX - random.nextInt(3);
		positionY = positionY - random.nextInt(3);
	}
	else if (positionY <= 20) {
		positionY++;
		turnCount += turnTimer;
		turnTimer -= turnTimer;
	}
	else if (positionX <= 20) {
		positionX++;
		turnCount += turnTimer;
		turnTimer -= turnTimer;
	}
	else if (positionY >= context.height -150) {
		positionY--;
		turnCount += turnTimer;
		turnTimer -= turnTimer;
	} else if (positionX >= context.width - 100) {
		positionX--;
		turnCount += turnTimer;
		turnTimer -= turnTimer;
	}
}

public void display() {
	
	// if the businnes Person is not infected or not tester it looks normal. But when it is infected and tested it appears red
	if (!infected || !tested) {
		context.image(businnes, positionX + 40, positionY + 40, 90, 90);
	}
	if (infected && tested) {
		context.image(businnesInfected, positionX + 40, positionY + 40, 90, 90);
	}
}
}