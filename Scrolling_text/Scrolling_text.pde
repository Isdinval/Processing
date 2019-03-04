import processing.sound.*;

String txt;
float y = 0;
PFont myFont;
SoundFile file;
PImage img;


void setup() {
  fullScreen(P3D);
  //size(1200, 600, P3D);
  String[] lines = loadStrings("Star Wars Opening.txt");
  txt = join(lines, "\n");
  y = height/2;
  img = loadImage("Starwars-logo.png");
  
  colorMode(RGB);
  
  myFont = createFont("Franklin Gothic Book", width*0.1);

  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "star-wars-music-theme.mp3");
  file.play();
}

void draw() {
  
  background(0);

  fill(0);
  rect(0, 0, width, height/3 + 20*2);
  fill(249, 159, 24);
  textFont(myFont);
  image(img, width/3, 20, width/3, height/3);
  //text("STAR WARS", width/2, 200);
  translate(width/2, height/2);
  fill(249, 159, 24);
  textSize(width*0.03);
  textAlign(CENTER);
  rotateX(PI/4);
  float w  = -width*0.8;
  text(txt, -w/2, y, w, 1.3*height);
  
  y -= 0.5; 
}
