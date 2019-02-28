int cols;
int rows;

float[][] current;
float[][] previous;

float dampening = 0.98;

void setup() {
  size(800, 800);
  cols = width;
  rows = height;
  
  current = new float [cols][rows];
  previous = new float [cols][rows];

}

void mousePressed() {
  previous[mouseX][mouseY] = 5000;
}



void draw() {
  background(0);
  loadPixels();
  
  for (int i = 1; i < cols -1; i++) {
      for (int j = 1; j < rows -1; j++) {
        current[i][j] = (previous[i-1][j] + previous[i+1][j] + previous[i][j-1] + previous[i][j+1])/2 - current[i][j];  
        current[i][j] = current[i][j] * dampening;
        int index = i + j * cols;
        pixels[index] = color(current[i][j]);

      }
  }
  updatePixels();
  
  float[][] temp = previous;
  previous = current;
  current = temp;
}
