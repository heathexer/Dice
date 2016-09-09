Die die = new Die();

void setup() {
	rectMode(CENTER);
	size(500, 500);
	stroke(0);
	fill(255);
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
	float acceleration = 1.1;
	float rotation = 0;
	float rotateAmount = 1;
	Die() {
		
	}
	void roll() {
		this.show(rotation);
		if(rotation >= 360 && accelerating) {
			accelerating = false;
			decelerating = true;
			rotation = 360;
			rotation += rotateAmount;
		}
		if(rotation >= 720 && decelerating) {
			decelerating = false;
			rotation = 0;
			rotateAmount = 1;
		}
		if(accelerating) {
			rotateAmount *= acceleration;
			rotation += rotateAmount;
		}
		if(decelerating) {
			rotateAmount /= acceleration;
			rotation += rotateAmount;
		}
		System.out.println(rotation);
	}
	void show(float rotPos) {
		background(255);
		translate(width/2, height/2);
		rotate(radians(rotPos));
		rect(0, 0, 100, 100, 6);
	}
}