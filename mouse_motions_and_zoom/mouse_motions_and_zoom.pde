
// Parameters for mouse's rotation
float newXmag, newYmag = 0; 
float xmag, ymag = 0;

// Parameter for Zoom using mouse's clics
float sval = 0.5;

// Parameter for cube's grid
int cols;
int rows;
int depths; 

int nbrCol = 10;
int nbrRow = 10;
int nbrDepth = 10;
float cube_lenght_x, cube_lenght_y,cube_lenght_z;

int cnt = 0;

/*************************************************/
/*************************************************/

void zoom() {
  if(mousePressed) { 
    sval += 0.005; 
  } 
  else {
    sval -= 0.01; 
  }
  sval = constrain(sval, 0.2, 2.0);
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
void setup()  { 
  size(800, 800, P3D); 
  noStroke(); 
  scale(0.5);
  
  cube_lenght_x = (int)width/nbrCol;
  println("cube_lenght_x = " + cube_lenght_x);
  cube_lenght_y = (int)height/nbrRow;
  cube_lenght_z = (int)800/nbrDepth;
  cols = width/(int)cube_lenght_x;
  rows = height/(int)cube_lenght_y;
  depths = 800/(int)cube_lenght_z;
} 


/*************************************************/
/*************************************************/
void draw()  { 
  background(0.5);
  
  translate(width/2, height/2, depths/2);
  fill(255);
  sphere(5);

  rotationWithMouse();
  zoom();
  for (int i = -cols/2; i < cols/2 ; i++) {
    for (int j = -rows/2; j < rows/2 ; j++) {
      for (int k = -depths/2; k < depths/2 ; k++) {
        int x = i*(int)cube_lenght_x;
        int y = j*(int)cube_lenght_y;
        int z = k*(int)cube_lenght_z;
        pushMatrix();
        translate(x+ 0.5*(int)cube_lenght_x, y+ 0.5*(int)cube_lenght_y, z+ 0.5*(int)cube_lenght_z);
        noFill();
        stroke(random(0,80), random(80,160), random(160,255));
        strokeWeight(3);
        box(cube_lenght_x, cube_lenght_y, cube_lenght_z);
        popMatrix();
      }
    }
  }
}
