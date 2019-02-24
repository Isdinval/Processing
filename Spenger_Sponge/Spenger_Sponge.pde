Box b;
ArrayList<Box> sponge;

// Parameters for mouse's rotation
float newXmag, newYmag = 0; 
float xmag, ymag = 0;

// Parameter for Zoom using mouse's clics
float sval = 0.5;


/*************************************************/
/*************************************************/

void zoom() {
  if(mousePressed && mouseButton == RIGHT) { 
    sval += 0.005; 
  } 
  else {
    sval -= 0.01; 
  }
  sval = constrain(sval, 0.5, 2.0);
  scale(sval);
}



/*************************************************/
/*************************************************/
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


/*************************************************/
/*************************************************/
void setup() {
  size(600,600, P3D);
  sponge = new ArrayList<Box>();
  b = new Box(0,0,0,200);
  sponge.add(b);
}


/*************************************************/
/*************************************************/
void mousePressed() {
  if (mouseButton == LEFT) {
    ArrayList<Box> next = new ArrayList<Box>();
    for (Box b : sponge) {
      ArrayList<Box> newBoxes = b.generate();
      next.addAll(newBoxes);
  }
  sponge = next;
  }
}


/*************************************************/
/*************************************************/
void draw() {
  
  background(0);
  translate(width/2, height/2);
  
  rotationWithMouse();
  zoom();
   
    for (Box b : sponge) {
      b.show();
    }
}
