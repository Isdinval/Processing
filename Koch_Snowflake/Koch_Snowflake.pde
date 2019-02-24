ArrayList<Segment> segments;

// Parameter for zoom() using mouse's clics
float sval = 0.5;


/*************************************************/
/*************************************************/
void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}


/*************************************************/
/*************************************************/
void zoom() {
  if(mousePressed) { 
    sval -= 0.01; 
  } 
  else {
    sval += 0.01; 

  }
  scale(sval);
}


/*************************************************/
/*************************************************/
void mousePressed() {
  ArrayList<Segment> nextGeneration = new ArrayList<Segment>();

  for (Segment s : segments) {
    Segment[] children = s.generate();
    addAll(children, nextGeneration);
  }
  segments = nextGeneration;
}


/*************************************************/
/*************************************************/
void setup() {
  size(1000, 1000);
  segments = new ArrayList<Segment>();
  translate(width/2, height/2);

  PVector a = new PVector(-100, -200);
  PVector b = new PVector(100, -200);
  PVector c = new PVector(200, -50);
  PVector d = new PVector(0, 150);
  PVector e = new PVector(-200, -50);
    
  Segment s1 = new Segment(a, b);
  Segment s2 = new Segment(b, c);
  Segment s3 = new Segment(c, d);
  Segment s4 = new Segment(d, e);
  Segment s5 = new Segment(e, a);
  
  segments.add(s1);
  segments.add(s2);
  segments.add(s3);
  segments.add(s4);
  segments.add(s5);
}


/*************************************************/
/*************************************************/
void draw() {
  background(0);
  translate(width/2, height/2);
  zoom();

  
  for (Segment s : segments) {
    s.show();
  }

}
