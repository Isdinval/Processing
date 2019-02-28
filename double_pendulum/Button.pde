class Button {
  float xpos; // X pos of the button
  float ypos;
  float widthButton; 
  float heightButton;
  color rectColor;
  color rectHighlight;
  boolean rectOver = false;
  boolean locked = false;
  int cnt = 0;
  String name;
  boolean state = false;
  
  
  Button(float xpos_, float ypos_, float widthButton_, float heightButton_, String name_){
    xpos = xpos_;
    ypos = ypos_;
    widthButton = widthButton_;
    heightButton = heightButton_;
    name = name_;
    rectColor = color(210);
    rectHighlight = color(190);
  }
  


  boolean overRect(float x, float y, float width, float height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  boolean update() {
  if (overRect(xpos, ypos, widthButton, heightButton)) {
    rectOver = true;
    if (mousePressed == true && locked == false) {
      locked = true;
      state = !state;
      delay(200);
      locked = false;
    }
  } else {
    rectOver = false;
  }
  return state;
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
    textAlign(CENTER, CENTER);
    fill(0);
    text(name, xpos, ypos-4, widthButton, heightButton);
    textAlign(CENTER);
  }

}
