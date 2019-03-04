import peasy.*;
PeasyCam cam;

float n1 = 0.2; //0.2
float n2 = 1.7; // 1.7
float n3 = 1.7; // 1.7

float m = 7;
float a = 1;
float b = 1;

//float n1 = 1; //0.2
//float n2 = 1; // 1.7
//float n3 = 1; // 1.7

//float m = 0;
//float a = 1;
//float b = 1;

float osc = 0;

int radius = 400;
int total = 100;

float phy, theta;
float r_phy, r_theta;

float x, y, z;
PVector[][] superShape;
float offset = 0;



//*******************************************************
//*******************************************************
float super_shape(float theta){
  float part1 = (1 / a) * cos(theta * m / 4);
  part1 = abs(part1);
  part1 = pow(part1, n2);

  float part2 = (1 / b) * sin(theta * m / 4);
  part2 = abs(part2);
  part2 = pow(part2, n3);

  float part3 = pow(part1 + part2, -1 / n1);

  if (part3 == 0) {
    return 0;
  }

  return part3;
}


//*******************************************************
//*******************************************************
void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 1000);
  superShape = new PVector[total+1][total+1];
  colorMode(RGB);
}


//*******************************************************
//*******************************************************
void draw() {
  background(190);
  
  m = map((float) Math.sin(osc), -1.0, 1.0, -10.0, 10.0);
  osc += 0.001;
  
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = super_shape(lat);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, -PI, PI);
      float r1 = super_shape(lon);
      //r1 = (float)Math.log10(r1);
      float x = radius * r1 * cos(lon) * r2 * cos(lat);
      float y = radius * r1 * sin(lon) * r2 * cos(lat);
      float z = radius * r2 * sin(lat);
      superShape[i][j] = new PVector(x, y, z);
    }
  }
  
  offset += 5;
  for (int i = 0; i < total; i++) {
    float hu = map(i, 0, total, 0, 255*6);
    fill((hu + offset) % 255 , (hu + offset) % 255, 255);
    stroke((hu + offset) % 255);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = superShape[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = superShape[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}
