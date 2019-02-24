float r = 20;
float a = 0;
ArrayList<PVector> heart = new ArrayList<PVector>();

void setup() {
  size(800,800);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  stroke(30,30,30);
  strokeWeight(8);
  fill(150, 0, 100);
  beginShape();
  for (PVector v : heart) {
    float x = r * 16 * pow(sin(a), 3);
    float y = -r * (13 * cos(a) - 5 * cos(2*a) - 2 * cos(3*a) - cos(4*a));
    vertex(v.x,v.y);
  }
  endShape();
  
  float x = r * 16 * pow(sin(a), 3);
  float y = -r * (13 * cos(a) - 5 * cos(2*a) - 2 * cos(3*a) - cos(4*a));
  heart.add(new PVector(x,y));
  a += 0.01;
}
