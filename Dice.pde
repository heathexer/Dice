Die die = new Die();

void setup() {
	rectMode(CENTER);
	size(500, 500);
	stroke(0);
	fill(0);
}
void draw() {
	die.roll();
}
void mousePressed() {
	if(!die.accelerating && !die.decelerating) {
		die.accelerating = true;
	}
}
class Die {
	boolean accelerating = false;
	boolean decelerating = false;
	float acceleration = 1.05;
	float rotation = 1;
	Die() {
		
	}
	void roll() {
		background(255);
		translate(width/2, height/2);
		rotate(radians(rotation-1));
		rect(0, 0, 100, 100, 8);
		if(rotation >= 360) {
			accelerating = false;
			decelerating = true;
		}
		if(rotation <= 1) {
			decelerating = false;
			rotation = 1;
		}
		if(accelerating) {
			rotation *= acceleration;
		}
		if(decelerating) {
			rotation /= acceleration;
		}
	}
}