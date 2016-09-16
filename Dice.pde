Die[] dice = new Die[25];
int sum;

void setup() {
	size(650, 700);
	rectMode(CENTER);
	stroke(0);
	fill(255);
	textSize(50);
	textAlign(CENTER, BOTTOM);
	for(int i = 0; i < 5; i++) {
		for(int j = 0; j< 5; j++) {
			dice[i*5+j] = new Die(75+125*i, 75+125*j, 100);
		}
	}
}

void draw() {
	background(255);
	fill(255);
	for(int i = 0; i<dice.length; i++) {
		dice[i].roll();
	}
	// fill(0);
	text("Sum: " + sumDice(), width/2, height);
}

void mousePressed() {
	for(int i = 0; i<dice.length; i++) {
		dice[i].click();
	}
}

int sumDice() {
	sum = 0;
	for(int i = 0; i < dice.length; i++) {
		sum += dice[i].number;
	}
	return sum;
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
		this.show();
		this.showNumber();
		//done accelerating
		if(this.rotation >= 360 && this.accelerating) {
			this.accelerating = false;
			this.decelerating = true;
			this.rotation = 360;
			this.rotation += rotateAmount;
			this.number = (int)(Math.random()*6)+1;
		}
		//done decelerating
		if(this.rotation >= 720 && this.decelerating) {
			this.decelerating = false;
			this.rotation = 0;
			this.rotateAmount = 1;
		}
		if(this.accelerating) {
			this.rotateAmount *= this.acceleration;
			this.rotation += this.rotateAmount;
		}
		if(this.decelerating) {
			this.rotateAmount /= this.acceleration;
			this.rotation += this.rotateAmount;
		}

		// System.out.println(this.number);
	}

	void show() {
		stroke(0);
		pushMatrix();
		translate(this.x, this.y);
		rotate(radians(this.rotation));
		rect(0, 0, this.size, this.size, this.size/15);
		popMatrix();
	}

	void showNumber() {
		pushMatrix();
		translate(this.x, this.y);
		rotate(radians(this.rotation));
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
		popMatrix();
	}
	void click() {
		if(mouseX >= this.x-(this.size/2) && mouseX <= this.x+(this.size/2) && mouseY >= this.y-(this.size/2) && mouseY <= this.y+(this.size/2) && !this.accelerating && !this.decelerating) {
			this.accelerating = true;
		}
	}
}
