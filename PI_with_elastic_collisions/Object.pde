class Object {
  float x;
  float y;
  float w;
  float m;
  float xConstraint; 



  float v;

  color col;
  String name;

  Object(float x_, float w_, float m_, float v_, float xConstraint_, color col_, String name_) {
    x = x_;
    w = w_;
    y = height - w;
    xConstraint = xConstraint_;
    m = m_;
    v = v_;

    col = col_;
    name = name_;

    w = map(log(m), 1, 100000000, 20, 300);
  }

  void show() {
    x = constrain(x, xConstraint, 1.3*width);
    fill(col);
    stroke(0);
    square(constrain(x, xConstraint, width), y - w, w);
    //rect(x, height/2 - w, w, w);

    y = height/2;
    textSize(20);
    textAlign(CENTER);
    text(name, x+w/2, y + 30);
    text("M = " + m + " kg", x+w/2, y + 2*30);
  }

  void update() {
    x += v;
  }

  boolean collide(Object Other) {
    float leftA = this.x;
    float rightA = this.x + this.w;
    float topA = this.y;
    float bottomA = this.y + this.w;

    float leftB = Other.x;
    float rightB = Other.x + Other.w;
    float topB = Other.y;
    float bottomB = Other.y + Other.w;

    return !(rightA < leftB  || leftA > rightB || bottomA < topB || topA > bottomB);
  
  }

  void reverseVelocity() {
    v *= -1;
  }

  float bounce(Object Other) {
    float sumM = m + Other.m;
    float newV = ((m - Other.m)/sumM) * v + (2*Other.m/sumM) * Other.v;
    return newV;
  }

  boolean hitWall() {
    return (this.x <= 0);
  }

  void setConstrain(float x) {
    xConstraint = x;
  }
}
