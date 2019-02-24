// Parameter for mouse' rotation
float newXmag, newYmag = 0; 
float xmag, ymag = 0;

// Parameter for Zoom using mouse's clics
float sval = 0.5;




void zoom() {
  if(mousePressed) { 
    sval += 0.01; 
  } 
  else {
    sval -= 0.01; 
  }
  sval = constrain(sval, 0, 2.0);
  println(sval);
  scale(sval);
}



void rotationWithMouse() {
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
}

void setup() {
  size(800, 800,P3D);
  background(255);
  lights();
}

void draw() {
  //background(255);

  translate(width/2, height/2, 0.30);
  rotationWithMouse();
  zoom();
  for (int x=-2; x <3; x++) {
    for (int y=-2; y <3; y++) {
      for (int z=-2; z <3; z++) {
        pushMatrix();
        scale(90);
        fill(random(45, 255), random(45, 255), random(45, 255), 90);
        noStroke();
        translate(x, y, z);
        
        box(1);
        popMatrix();
      }
    }
  }
  

}
