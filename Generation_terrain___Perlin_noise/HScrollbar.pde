class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  String name;
  int sh, sw;
  float min, max;
  float spos_map;

  HScrollbar (float xp, float yp, int sw_, int sh_, int l, String name_, float min_, float max_, float beginValue_) {
    swidth = sw_;
    sheight = sh_;
    int widthtoheight = sw_ - sh_;
    ratio = (float)sw_ / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    //spos = xpos + swidth/2 - sheight/2;
    spos = abs(beginValue_ + xpos);
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
    name = name_;
    min = min_;
    max = max_;
    spos_map = beginValue_;
    
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {

      newspos = constrain(mouseX-sheight/2, xpos, xpos + swidth - sheight);

    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
      spos_map = map(spos, xpos, xpos + swidth - 1.5*sheight, min, max);
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    textSize(20);
    textAlign(CENTER);
    fill(0);
    text(name, xpos + swidth + 30 , ypos + 0.8*sheight );
    text((int)spos_map, spos + 5, ypos-2);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos_f() {
    return (float)spos_map;
    //return (float)spos_map * ratio;
  }
  
  int getPos_i() {
    return (int)spos_map;
    //return (float)spos_map * ratio;
  }
}
