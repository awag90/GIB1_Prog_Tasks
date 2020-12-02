void drawCoordSystem() {
  stroke(255);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  for (int i = 0; i<= 500; i+=10) {
    if ( i== 50 || i== 150 || i==350 || i==450) {
      line(i, (height/2-5), i, (height/2+5));
      line((width/2-5), i, (width/2+5), i);
    } else {
      line(i, (height/2-2.5), i, (height/2+2.5));
      line((width/2-2.5), i, (width/2+2.5), i);
    }
  }
}

float convert2Pixel(float y) {
  return (height/2 - 100*y); //<>//
}

float convert2Value(float x) {
  return(-2.5+(x/100)); //<>//
}

float power(float x, int e) {
  float res = x;
  for (int i = 1; i < e; i++) {
    res *= x;
  }
  return res;
}



void setup() {
  size(500, 500);
  background(0);
  stroke(255);
  drawCoordSystem();
  for (float x = 0; x < width; x+= 0.1) {
    float y = convert2Pixel(3*power(convert2Value(x), 2));
    point(x, y); //<>//
  }
}
