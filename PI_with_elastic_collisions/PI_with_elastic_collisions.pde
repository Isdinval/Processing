Object block1;
Object block2;

int cnt = 0;
int digits = 5;

float timeSteps = 5*pow(10, digits - 1);


int wall;
//float timeSteps = 50000;

void setup() {
  println(timeSteps);
  size(1500, 800);
  wall = 200;
  float m2 = pow(100, digits - 1);
  block1 = new Object(width/5, 20, 1, 0, 0, color(255, 0, 0), "block n°1");
  block2 = new Object(width/3, 100, m2, -5/timeSteps, 20, color(50, 50, 50), "block n°2");
  block1.setConstrain(0);
  block2.setConstrain(block1.w);
}

void draw() {
  background(230);
  
  for (int i = 0; i < timeSteps; i++) {
    block1.update();
    block2.update();
    if (block1.collide(block2)) {
      float v1 = block1.bounce(block2);
      float v2 = block2.bounce(block1);
      block1.v = v1;
      block2.v = v2;
      cnt++;
    }

    if (block1.hitWall()) {
      block1.reverseVelocity();
      cnt++;
    }
  }
  
  fill(0);
  textSize(32);
  text("Nombre de collisions = " + nf(cnt/(pow(10, digits-1)), 1, digits-1), 280, 40);
  //text(nf(cnt, digits+1), 100, 40);
  
  block1.show();
  block2.show();


  showWallAndFloor();
}


// Affiche le mur et le sol
void showWallAndFloor() {
  fill(0);
  stroke(0);
  line(0, height/2, width, height/2); // Floor
  strokeWeight(3);
  line(0, 0, 0, height); // Wall
}

// Affiche le nbr de collisions entre les trois objects
void showNbrCollisions(int nbrCollision) {
  textSize(40);
  textAlign(CENTER);
  fill(0);
  text(nbrCollision/pow(10, digits-1), width/5, 0.7*height);
}
