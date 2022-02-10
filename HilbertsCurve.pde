int o = 6;
int N = int(pow(2, o));
int total = N * N;

PVector[] path = new PVector[total];

void setup() {
  size(1024, 1024);
  smooth();
  filter(BLUR, 6);
  colorMode(HSB, 360, 255, 255);
  float len = width / N;

  for (int i = 0; i < total; i++) {
    path[i] = hcurve(i);
    path[i].mult(len);
    path[i].add(len/2, len/2);
  }
}

int iterator = 0;
void draw() {
  background(190, 35, 40);

  stroke(255);
  if (o <= 8) {
    strokeWeight(5);
  } else if (o == 8) {
    strokeWeight(2);
  } else if (o == 9) {
    strokeWeight(0.4);
  } else if (o >= 10) {
    // I hate you
    strokeWeight(0.005);
    textAlign(CENTER);
    textSize(120);
    text("I hate you.", 512, 512);
  }

  noFill();
  // "total" in the for loop gives the whole thing complete and "iterator" gives the animation
  for (int i = 1; i < total; i++) {
    float h = map(i, 0, path.length, 0, 360);
    stroke(h, 255, 255);
    line(path[i].x, path[i].y, path[i-1].x, path[i-1].y);
  }

  // Smaller values slow down the drawing process - it may be useful for drawing smaller iterations
  iterator+=5;
  if (iterator >= path.length) {
    iterator = 0;
  }

  // Used for displaing the points
  //  strokeWeight(4);
  //  for (int i = 0; i < path.length; i++) {
  //  vertex(path[i].x, path[i].y);
  //  text(i, path[i].x + 5, path[i].y);
  //  }
}

PVector hcurve(int i) {
  PVector[] points = {
    new PVector(0, 0), 
    new PVector(0, 1), 
    new PVector(1, 1), 
    new PVector(1, 0)
  };

  int index = i & 3;
  PVector v = points[index];
  for (int j = 1; j < o; j++) {
    i = i >>> 2;
    index = i & 3;

    float len = pow(2, j);

    if (index == 0) {
      float temp = v.x;
      v.x = v.y;
      v.y = temp;
    } else if (index == 1) {
      v.y+=len;
    } else if (index == 2) {
      v.x+=len;
      v.y+=len;
    } else if (index == 3) {
      float temp = len - 1 - v.x;
      v.x = len - 1 - v.y;
      v.y = temp;
      v.x+=len;
    }
  }
  return v;
}


