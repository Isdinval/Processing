class Drop {
  float x = random(-100, width);
  float y = random(-600, 0);
  float z = random(0, 20);
  float yspeed = random(4, 20);
  float xspeed = random(1, 3);
  float len = map(z, 0, 20, 10, 25);

/**************************************************/
/**************************************************/
  void fall() {
    y = y + yspeed;
    x = x + 2;
    yspeed = yspeed + 0.2;
    if (y > height) {
      y = random(-100, 0);
      x = random(-100, width);
      yspeed = map(z, 0, 20, 4, 20);
    }
  }
  
  
/**************************************************/
/**************************************************/
  void show() {
    float thick = map(z, 0, 20, 1.5, 2);
    //stroke(138, 43, 226);
    stroke(30, 144, 255);
    stroke(random(0,80), random(80,160), random(160,255));
    strokeWeight(thick);
    line(x, y, x, y + len);
  }
}
