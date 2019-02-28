
Button b;

void setup() {
  size(640, 360);
  b = new Button(width/2 - 100/2, height/2 - 20/2, 100, 20, "Start");

}

void draw() {
  background(255);
  b.display();
  b.update();
  
  
  translate(width/2, height/2);
  

  
}
