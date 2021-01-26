package simulation;

/**
 * Testers try to find untested Patients an collide with them.
 * 
 * @author Andreas Wagner
 */
import processing.core.*;

public class Tester extends Seeker {
	private final static String[] GOALJOBS = { "IU", "HU" };

	public Tester(PApplet applet, Actor[] others) {
		super(applet, others, GOALJOBS);
		this.job = "T";
	}

	public void display() {
		applet.fill(255, 0, 255);
		applet.ellipse(positionX, positionY, 2 * radius, 2 * radius);
	}
}
