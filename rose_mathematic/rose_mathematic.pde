float r;
float k =1;
float n;
float d;
float offset = 0;

HScrollbar hs_r, hs_n, hs_d, hs_offset;  


void setup() {
  size(800, 800);
  
  int min_r = 0;
  int max_r = 200;
  int min_n = 1;
  int max_n = 9;  
  int min_d = 1;
  int max_d = 9;
  int min_offset = 0;
  int max_offset = 2;
  
  colorMode(RGB, 255, 255, 255, 1);

  hs_r = new HScrollbar(20, 40, width/4, 16, 1, "r", min_r, max_r);
  hs_n = new HScrollbar(20, 80, width/4, 16, 1, "n", min_n, max_n);
  hs_d = new HScrollbar(20, 120, width/4, 16, 1, "d", min_d, max_d);
  hs_offset = new HScrollbar(20, 160, width/4, 16, 1, "offset", min_offset, max_offset);
}

void draw() {
  background(230);
 
  hs_r.update();
  hs_n.update();
  hs_d.update();
  hs_offset.update();
  hs_r.display();
  hs_n.display();
  hs_d.display();
  hs_offset.display();
  
  r = hs_r.getPos();
  n = (int)hs_n.getPos();
  d = (int)hs_d.getPos();
  offset = (int)hs_offset.getPos();
  k = n/d;
  println("n = " + n + "   d = " + d + "   k = " + k + "   offset = " + offset);
  textSize(20);
  fill(0);
  text("k = " + nf(k, 1, 2), 0.66*width, 70);
  
  translate(width/2, height/2);
  noFill();
  stroke(230, 9, 116, 0.7);
  strokeWeight(1.5);
  beginShape();
  for (float i = 0; i< TWO_PI*d; i = i + 0.01) {
    float x = r*(cos(k*i) + offset)*cos(i);
    float y = r*(cos(k*i) + offset)*sin(i);
    vertex(x,y);
  }
  endShape();
}
