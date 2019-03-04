//http://paulbourke.net/geometry/supershape/
float n1 = 0.3;
float n2 = 0.3;
float n3 = 0.3;

float m = 0;
float a = 1;
float b = 1;

float osc = 0;

int radius = 200;
int total = 200;

float h = 0;
  

void setup(){
  size(800,800);
  colorMode(HSB);

}

void draw(){
  m = map((float) Math.sin(osc), -1.0, 1.0, 0, 10.0);
  osc += 0.005;

  
  background(255);
  translate(width/2, height/2);
  textSize(20);
  h = h + 0.05;
  float g = map(sin(h), -1, 1, 0, 255);
  stroke(g, g, g);
  noFill();
  text("m = " + floor(m), -width/2.2, -height/2.2);
  
  float increment = TWO_PI / (float) total;
  strokeWeight(2);
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += increment) {
    float r = super_shape(angle);
    float x = radius * r * cos(angle);
    float y = radius * r * sin(angle);
    vertex(x, y);
  }
  endShape(CLOSE);
}

float super_shape(float theta){
  float part1 = (1 / a) * cos(theta * m / 4);
  part1 = abs(part1);
  part1 = pow(part1, n2);

  float part2 = (1 / b) * sin(theta * m / 4);
  part2 = abs(part2);
  part2 = pow(part2, n3);

  float part3 = pow(part1 + part2, 1 / n1);

  if (part3 == 0) {
    return 0;
  }

  return (1 / part3);
}
