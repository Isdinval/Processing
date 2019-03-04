class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets;
  float orbitSpeed;
  PVector v;
  int index;
  float angle_planet;
  PShape globe;
  
  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = o;
    angle_planet = TWO_PI;
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void orbit() {
  angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i=0; i< planets.length; i++) {
         planets[i].orbit();
       }
     }
  }
  
  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i=0; i< planets.length; i++) {
      float r = radius/(level*2);
      float d = random(4*(radius + r)/(level+1), (radius + r)*15/(level+1));
      float o = random(-0.03, 0.03);
      
      index = i +1;
      planets[i] = new Planet(r, d, o, textures[index]);
      if (index > textures.length) index = 1;

      if (level < 2) {
        int num = int(random(0,7));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  
  void show(){
    pushMatrix();
    noStroke();
    fill(255);

    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    angle_planet = angle_planet +1;
    noStroke();
    translate(v.x, v.y, v.z);
    rotate(10*angle, v.x, v.y, v.z);
    shape(globe);
    if (planets != null) {
      for (int i=0; i< planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}
