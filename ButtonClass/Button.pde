class Button {
  int xpos; // X pos of the button
  int ypos;
  int widthButton; 
  int heightButton;
  color rectColor;
  color rectHighlight;
  boolean rectOver = false;
  boolean locked = false;
  int cnt = 0;
  String name;
  
  
  Button(int xpos_, int ypos_, int widthButton_, int heightButton_, String name_){
    xpos = xpos_;
    ypos = ypos_;
    widthButton = widthButton_;
    heightButton = heightButton_;
    name = name_;
    rectColor = color(210);
    rectHighlight = color(190);
  }
  


  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  void update() {
  if (overRect(xpos, ypos, widthButton, heightButton)) {
    rectOver = true;
    if (mousePressed == true && locked == false) {
      mousePressed();
      locked = true;
      delay(400);
      locked = false;
    }
  } else {
    rectOver = false;
  }
}

  void mousePressed() {
      println(cnt);
      cnt++;
  }
  
  void display() {    
    noStroke();
    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    rect(xpos, ypos, widthButton, heightButton, 10, 10, 10, 10);
    textSize(16);
    textAlign(CENTER);
    fill(0);
    text(name, xpos, ypos, widthButton, heightButton);
  }

}
