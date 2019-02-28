float r;
float factor = 0;

void setup() {
  // size(600, 600);
  fullScreen();
  r = height/2 - 16;  
}

PVector getVector(float index, float total) {
  float angle = map(index % total, 0, total, 0, TWO_PI);
  PVector v = PVector.fromAngle(angle - PI);
  v.mult(r);
  return v;
}

void draw() {
  background(255);
  int total = 250;//int(map(mouseX, 0, width, 0, 200));
  factor += 0.01;

  translate(width/2, height/2);

  strokeWeight(2);
  noFill();
  circle(0, 0, r*2);
  
  strokeWeight(2);
  for (int i = 0; i < total; i++) {
    PVector a = getVector(i, total);
    PVector b = getVector(i * factor, total);
    stroke(random(0,130), random(0,45), random(150,255));
    line(a.x, a.y, b.x, b.y);
  }
}
