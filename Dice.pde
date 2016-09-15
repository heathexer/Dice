Die[] dice = new Die[25];
//dice[i] = new Die();

//int j = 75; i<= 775; j+= 125
void setup() {
	size(800, 800);
	rectMode(CENTER);
	stroke(0);
	fill(255);
	for(int i = 0; i < 5; i++) {
		for(int j = 0; j< 5; j++) {
			dice[i*5+j] = new Die(75+125*i, 75+125*j, 100);
		}
	}
}

void draw() {
	for(int i = 0; i<dice.length; i++) {
		dice[i].roll();
	}
}

void mousePressed() {
	for(int i = 0; i<dice.length; i++) {
		dice[i].click();
	}
}

class Die {
	int x, y, size, number;
	boolean accelerating = false;
	boolean decelerating = false;
	float acceleration = 1.1;
	float rotation = 0;
	float rotateAmount = 1;
	Die(int xPos, int yPos, int size) {
		this.x = xPos;
		this.y = yPos;
		this.size = size;
		this.number = (int)(Math.random()*6)+1;
	}
	void roll() {
		this.show(rotation);
		//done accelerating
		if(rotation >= 360 && accelerating) {
			accelerating = false;
			decelerating = true;
			rotation = 360;
			rotation += rotateAmount;
			this.number = (int)(Math.random()*6)+1;
		}
		//done decelerating
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
		this.showNumber();
		System.out.println(this.number);
	}

	void show(float rotPos) {
		background(255);
		translate(this.x, this.y);
		rotate(radians(rotPos));
		rect(0, 0, this.size, this.size, this.size/15);
	}

	void showNumber() {
		if(this.number == 1) {
			ellipse(0, 0, this.size/5, this.size/5);
		} else if(this.number == 2) {
			ellipse(-this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, +this.size/4, this.size/5, this.size/5);
		} else if(this.number == 3) {
			ellipse(0, 0, this.size/5, this.size/5);
			ellipse(-this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, +this.size/4, this.size/5, this.size/5);
		} else if(this.number == 4) {
			ellipse(-this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, +this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(-this.size/4, +this.size/4, this.size/5, this.size/5);
		} else if(this.number == 5) {
			ellipse(0, 0, this.size/5, this.size/5);
			ellipse(-this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, +this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(-this.size/4, +this.size/4, this.size/5, this.size/5);
		} else if(this.number == 6) {
			ellipse(+this.size/4, 0, this.size/5, this.size/5);
			ellipse(-this.size/4, 0, this.size/5, this.size/5);
			ellipse(-this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, +this.size/4, this.size/5, this.size/5);
			ellipse(+this.size/4, -this.size/4, this.size/5, this.size/5);
			ellipse(-this.size/4, +this.size/4, this.size/5, this.size/5);
		} 
	}
	void click() {
		if(mouseX >= this.x-(this.size/2) && mouseX <= this.x+(this.size/2) && mouseY >= this.y-(this.size/2) && mouseY <= this.y+(this.size/2) && !this.accelerating && !this.decelerating) {
			this.accelerating = true;
		}
	}
}
