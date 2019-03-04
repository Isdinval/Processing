import peasy.*;

Planet sun;
PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[7];
PImage starfield;

void setup() {
  //fullScreen(P3D);
  size(1200, 1000, P3D);
  sunTexture  = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\sun.jpg");
  textures[0] = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\mars.jpg");
  textures[1] = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\earth.jpg");
  textures[2] = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\mercury.jpg");
  textures[3] = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\venus.jpg");
  textures[4] = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\jupiter.jpg");
  textures[5] = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\saturn.jpg");
  textures[6] = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\uranus.jpg");
  
  
  starfield = loadImage("C:\\Users\\Olivier RAYMOND\\Documents\\Processing\\NEW Projects\\Solar_System\\data\\starfield.png");


  cam = new PeasyCam(this, 1000);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(4, 1);
}
void draw() {
  starfield.resize(width, height);  
  background(starfield);
    pointLight(255, 255, 255, 0, 0, 0);

  sun.show();
  sun.orbit();
}
