float start;
float stop;
float sec_, min_, hour_;
float sec, min, hour;

int cnt = 1;

void setup() {
  size(700, 700);
  strokeWeight(7);


}

void displayHourDigit() {
  int cnt = 1;
  for (float i = -2*TWO_PI/12; i < TWO_PI-3*TWO_PI/12; i = i + TWO_PI/12) {
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  text(cnt, 160*cos(i), 160*sin(i));
  cnt++;
  }
}
void draw() {
  background(210);
  translate(width/2, height/2);
  sec_ = second();
  min_ = minute();
  hour_ = hour();
  fill(0);
  textSize(24);
  text("Il est " + (int)hour_ + ":" + (int)min_ + ":" + (int)sec_, 0, 260);
  fill(170);
  circle(0, 0, 400);
  noFill();
  displayHourDigit();
  rotate(-PI/2);

  sec = map(sec_, 0, 60, 0, TWO_PI);
  min = map(min_, 0, 60, 0, TWO_PI);
  hour = map(hour_, 0, 12, 0, TWO_PI);

  stroke(0,0,255);
  line(0, 0, 100*cos(hour), 100*sin(hour));
  stroke(0,255,0);
  line(0, 0, 150*cos(min), 150*sin(min));
  stroke(255,0,0);
  line(0, 0, 180*cos(sec), 180*sin(sec));
  stroke(0);
  
  fill(0);
  circle(0,0,10);


  
}
