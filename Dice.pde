void setup() {
	rectMode(CENTER);
	size(500, 500);
	stroke(0);
	fill(255);
}

Die die = new Die(width/2, width/2, 100);

void draw() {
	die.roll();
}

void mousePressed() {
	if(!die.accelerating && !die.decelerating) {
		die.accelerating = true;
	}
}
class Die {
	int x, y, size;
	boolean accelerating = false;
	boolean decelerating = false;
	float acceleration = 1.1;
	float rotation = 0;
	float rotateAmount = 1;
	Die(int xPos, int yPos, int size) {
		this.x = xPos;
		this.y = yPos;
		this.size = size;
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
		System.out.println(this.size);
	}
	void show(float rotPos) {
		background(255);
		translate(this.x, this.y);
		rotate(radians(rotPos));
		rect(0, 0, this.size, this.size, this.size/15);
	}
	void click() {
		// if(mouseX >= this.x-)
	}
}