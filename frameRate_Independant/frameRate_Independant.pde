float ballY = 250;
float deltaPerSecond = 30;
long lastFrame = millis();
 
void setup() {
  size(500, 500);
  frameRate(30);
}
 
void draw() {
   background(0);
  frameRate(40+random(100));
  text("frameRate = " + frameRate, width/20, height/20);
  
 
  long thisFrame = millis();
 
  float secondsElapsed = (thisFrame-lastFrame)/1000.0;
 
  ballY = ballY + deltaPerSecond*secondsElapsed;
 
  if (ballY < 0 || ballY > height) {
    deltaPerSecond *= -1;
  }
 
  ellipse(width/2, ballY, 10, 10);
 
  lastFrame = thisFrame;
}
