package simulation;

import processing.core.*;

/**
 * Researcher try to find infected Patients and take samples. All samples add progress to the invention of a vaccine. If a
 * vaccine is developed the virulenz of the infection is reduced to 1 (1 in chance to get infected on contact with infected
 * Patient)
 * 
 * @author Andreas Wagner
 *
 */
public class Researcher extends Seeker {
	private final static String[] GOALJOBS = {"IT"};
	private final static int SAMPLES_TO_VACCINE = 1000;
	private static int samples = 0;
	
	public Researcher(PApplet applet, Actor[] others) {
		super(applet, others, GOALJOBS);
		this.job = "R";
	}
	
	public void onCollision(String job) {
		if (job== "IT") {
			takeSample();
		}
	}
	
	private static void takeSample() {
		if (samples < SAMPLES_TO_VACCINE) {
			samples ++;
		}else {
			Patient.setVirulenz(1);
		}
	}
	
	public void display() {
		applet.fill(255,255,0);
		applet.ellipse(positionX, positionY, 2*radius, 2*radius);
	}
	
	public static int getVaccineStatus() {
		return ((int)(((float)samples/(float)SAMPLES_TO_VACCINE)*100));
	}
	
}
