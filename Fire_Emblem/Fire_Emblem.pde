public class map {
  int width1;
  int height1;
  int w;
  int h;
  map(int w1, int h1) {
    w = w1;
    h = h1;
  }
  
  void display() {
    for (int x = 0; x < w; x++) {
      for (int y = 0; y < h; y++) {
        fill(204);
        stroke(0);
        
        width1 = x*40;
        height1 = y*40;
        rect(width1, height1, 40, 40);
      }
    }
  }
}void setup() {
  background(204);
  size(700, 600);
}

void draw() {
  
}
