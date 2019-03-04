// Grid parameters
int cols, rows;
int scl = 18;
int w = 3000;
int h = 3000;

// Terrain parameters
float flying = 0;
float[][] terrain;
float minTerrain;
float maxTerrain;
color[] colours = new color[4];

// Scrolbar parameters
HScrollbar hs_min, hs_max, hs_scl, hs_fly; 
// Button parameter
Button b_start, b_mode;

/************************************************************/
/*********************       SETUP       ********************/
/************************************************************/
void setup() {
  //size(600, 600, P3D);
  fullScreen(P3D);
  
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  minTerrain = -225;
  maxTerrain = 275;
  
  colorMode(RGB, 255, 255, 255, 1);
  pixelDensity(1);
  colours[0] = color(229, 252, 255, 0.3);
  colours[1] = color(133, 109, 79 ); // Marron
  colours[2] = color(49, 140, 231); // Bleu France
  colours[3] = color(229, 252, 255);
  
  hs_min = new HScrollbar(20, 40, width/6, 16, 1, "min", -350, 0, -225);
  hs_max = new HScrollbar(20, 80, width/6, 16, 1, "max", 0, 350, 275);
  hs_scl = new HScrollbar(width/6 + 100, 40, width/6, 16, 1, "scl", 18, 100, 18);
  b_start = new Button(width/6 + 120 , 60, 130, 35, "Start/Pause");
  b_mode  = new Button(width/6 + 100 + 180, 60, 130, 35, "View Mode");

}



/************************************************************/
/**********************       DRAW       ********************/
/************************************************************/
void draw() {
  background(colours[3]);
  
  stroke(0);
  fill(150);

  rect(10, 10, 2*(width/6 + 80), 95);
  hs_min.update();
  hs_min.display();
  hs_max.update();
  hs_max.display();
  hs_scl.update();
  hs_scl.display();
  boolean start = b_start.update();
  b_start.display();
  boolean mode = b_mode.update();
  b_mode.display();
  
  minTerrain = hs_min.getPos_f();
  maxTerrain = hs_max.getPos_f();
  float scl = hs_scl.getPos_f();
  
  if (start) {
    flying -= 0.1;
    float yoff = flying;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        noiseDetail(4, 0.53);
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, minTerrain, maxTerrain);
        xoff += 0.1;
      }
      yoff += 0.1;
    }
    
    stroke(0);
    translate(width/2, height/2 + 50);
    if (!mode) {
      rotateX(PI/3.5);
    }
    translate(-w/2, -h/2);
  
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        float z_bis = terrain[x][y]*scl;
        float trans = map(z_bis, minTerrain, maxTerrain, 0, 1);
        color lineColour = lerpColor(colours[2], colours[1], trans);
        fill(lineColour);
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
      endShape();
    }
  }
}
