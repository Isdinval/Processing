import peasy.*;

PeasyCam cam;
float x = 10;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0 / 3.0;

ArrayList<PVector> points = new ArrayList<PVector>();


void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 600);
  colorMode(RGB);
}

void draw() {
  background(230);
  
  float dt = 0.008;
  
  float dx = (a*(y - x))*dt;
  x = x + dx;
  float dy = (x*(b - z) - y)*dt;
  y = y + dy;
  float dz = (x*y - c*z)*dt;
  z = z + dz;
  
  points.add(new PVector(x,y,z));
  
  scale(5);
  float col = 0;
  noFill();
  stroke(0);


  beginShape();
  for (PVector v : points) {
    stroke(col, col/2, col*2);
    vertex(v.x, v.y, v.z);
    col = col + 0.09;
    if (col > 255) {
      col = 0;
    }
  }
  endShape();
  
  strokeWeight(3);
  point(x, y, z);
  strokeWeight(0.5);
  
  beginShape();  
  for (PVector v : points) {
    stroke(col*2, col, col/2);
    vertex(-v.x, -v.y, -v.z);
    col = col + 0.09;
    if (col > 255) {
      col = 0;
    }
  }
  endShape();
  strokeWeight(3);
  point(-x, -y, -z);
  
  println("x = " + x, "y = " + y, "z = " + z, "h = " + col);
  strokeWeight(0.5);
  
}
