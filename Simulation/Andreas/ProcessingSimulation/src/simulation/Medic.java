package simulation;

/**
 * Medics try to find Patients that have been tested positive (job = "IT") and collide with them.
 * 
 * @author Andreas Wagner
 */
import processing.core.*;

public class Medic extends Seeker {
	private static final String[] GOALJOBS = { "IT" };

	public Medic(PApplet applet, Actor[] others) {
		super(applet, others, GOALJOBS);
		this.job = "M";
	}

	public void display() {
		applet.fill(0, 0, 255);
		applet.ellipse(positionX, positionY, 2 * radius, 2 * radius);
	}
}
