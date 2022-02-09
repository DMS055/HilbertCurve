int o = 1;
int N = int(pow(2, o));
int total = N * N;

PVector[] path = new PVector[total];

void setup() {
  size(500, 500);
  background(0);
  
  for (int i = 0; i < total; i++) {
    path[i] = hcurve(i);
    float len = width / N;
    path[i].mult(len);
  }
}

int iterator = 0;
void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(2);
  beginShape();
  for (int i = 0; i < path.length; i++){
    vertex(path[i].x, path[i].y);
  }
  endShape();
}

PVector hcurve(int i) {
 PVector[] points = {
  new PVector(0, 0), 
  new PVector(0, 1),
  new PVector(1, 1),
  new PVector(1, 0)
 };
 return points[i];
}
