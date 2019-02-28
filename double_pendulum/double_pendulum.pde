float r1 = 200;
float r2 = 200;
float m1 = 10;
float m2 = 20;
float a1 = PI/2;
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
float a1_a = 0;
float a2_a = 0;
float g = 0.1;

float px2 = -1;
float py2 = -1;

float cx;
float cy;

PGraphics canvas;
int cnt = 0;

color[] colours = new color[4];
HScrollbar hs_r1, hs_r2, hs_m1, hs_m2, hs_a1, hs_a2, hs_g; 
Button b_start, b_stop, b_reset;

void setup() {
  fullScreen();
  //size(900, 900);
  colorMode(RGB, 255, 255, 255, 1);
  pixelDensity(1);
  colours[0] = color(229, 252, 255, 0.3);
  colours[1] = color(122, 79, 242, 0.7);
  colours[2] = color(230, 9, 116, 0.7);
  colours[3] = color(229, 252, 255);
  
  
  cx = width/2;
  cy = height/3;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(colours[3]);
  canvas.endDraw();
  
  hs_r1 = new HScrollbar(width/4, 0.77*height, width/6, 16, 1, "r1", 10, 200, 150);
  hs_r2 = new HScrollbar(width/4, 0.82*height, width/6, 16, 1, "r2", 10, 200, 130);
  hs_m1 = new HScrollbar(width/4, 0.87*height, width/6, 16, 1, "m1", 10, 100, 50);
  hs_m2 = new HScrollbar(width/4, 0.92*height, width/6, 16, 1, "m2", 10, 100, 20);  
  hs_g  = new HScrollbar(width/4 + 80 + width/6, 0.87*height, width/6, 16, 1, "g", 0, 20, 1); 
  
  b_start = new Button(width/3 + 40 + width/6, 0.77*height, 130, 35, "Start/Pause");

}

void draw() {


  
  image(canvas, 0,0);
  stroke(170);
  fill(240);
  rect(width/5, 0.72*height, 0.57*width, 0.24*height);
  noStroke();
  noFill();
  hs_r1.update();
  hs_r1.display();
  hs_r2.update();
  hs_r2.display();
  hs_m1.update();
  hs_m1.display();  
  hs_m2.update();
  hs_m2.display();
  hs_g.update();
  hs_g.display();
  
  boolean start = b_start.update();
  b_start.display();


  
  if (start) {
  r1 = hs_r1.getPos();
  r2 = hs_r2.getPos();
  m1 = hs_m1.getPos();
  m2 = hs_m2.getPos();
  g = hs_g.getPos();
  
    float num1 = -g*(2*m1 + m2) * sin(a1) - m2*g*sin(a1-2*a2) -2*sin(a1 - a2)*m2*(a2_v*a2_v*r2 + a1_v*a1_v*r1*cos(a1-a2));
  float den1 = r1*(2 * m1 + m2 - m2 * cos(2*a1 - 2*a2));
  a1_a = num1/den1;
  float num2 = 2*sin(a1-a2)*(a1_v*a1_v*r1*(m1+m2) + g*(m1+m2)*cos(a1) + a2_v*a2_v*r2*m2*cos(a1-a2));
  float den2 = r2*(2*m1 + m2 - m2*cos(2*a1 - 2*a2));
  a2_a = num2/den2;

    stroke(0);
    strokeWeight(2);
    translate(cx, cy);
    
    float x1 = r1 * sin(a1);
    float y1 = r1 * cos(a1);
    float x2 = x1 + r2 * sin(a2);
    float y2 = y1 + r2 * cos(a2);
    
    line(0, 0, x1, y1);
    fill(0);
    ellipse(x1, y1, m1, m1);
    line(x1, y1, x2, y2);
    fill(0);
    ellipse(x2, y2, m2, m2);
    
    a1_v += a1_a;
    a2_v += a2_a;
    a1 += a1_v;
    a2 += a2_v;
    
    //println("x2 = " + x2 + "   y2 = " + y2);
    
    a1_v *= 0.999; // Dampening 
    a2_v *= 0.999; // Dampening
    
    canvas.beginDraw();
    canvas.translate(cx, cy);
    canvas.strokeWeight(2);
    //canvas.stroke(random(255), random(255), random(255));
    if (frameCount > 1) {
      float trans = map(x2, -1*(r1+r2), r1 + r2, 0, 1);
      color lineColour = lerpColor(colours[1], colours[2], trans);
      canvas.stroke(lineColour);
      canvas.line(px2, py2, x2, y2);
    }
    canvas.endDraw();
    
    px2 = x2;
    py2 = y2;
  }
}
