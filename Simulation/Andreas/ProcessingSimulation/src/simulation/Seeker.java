package simulation;

import processing.core.*;

/**
 * The Seeker class extend Actor and is a Super-Class for all Objects which pick a goal-Object and than try to
 * close the distance to that object.
 * 
 * @author Andreas Wagner
 *
 */
public class Seeker extends Actor {
	protected Actor goal;
	protected String[] goalJobs;
	protected int speed;
	private static int reflectDirection = 1;

	public Seeker(PApplet applet, Actor[] others, String[] goalJobs) {
		super(applet, others);
		this.goalJobs = goalJobs;
		this.speed = 2;
	}

	public void act() {
		if (goal == null) {
			searchGoal();
		} else if (!goalIsReached()) {
			moveTowardsGoal();
		} else {
			goal = null;
		}
	}

	private void searchGoal() {
		for (Actor someone : others) {
			for (String job : goalJobs) {
				if (job == someone.getJob() && someone.isNotMarked()) {
					goal = someone;
					someone.mark();
					break;
				}
			}
			if (goal != null) {
				break;
			}
		}
	}

	private void moveTowardsGoal() {
		if (goal.positionX > this.positionX) {
			positionX += speed;
		} else {
			positionX -= speed;
		}

		if (goal.positionY > this.positionY) {
			positionY += speed;
		} else {
			positionY -= speed;
		}
	}

	private boolean goalIsReached() {
		if (calcDistanceTo(goal) <= (this.radius + goal.radius)) {
			return true;
		} else {
			return false;
		}
	}

	public void onCollision(String job) {
		if (job == this.job) {
			positionX += reflectDirection * radius / 2;
			reflectDirection *= -1;
		} else {
			positionX -= speed;
		}
	}
}
