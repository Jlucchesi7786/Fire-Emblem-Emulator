public class map {
  int xPos;
  int yPos;
  int w;
  int h;
  
  int square;
  
  map(int w1, int h1, int squareWidth) {
    w = w1;
    h = h1;
    square = squareWidth;
  }
  
  void display() {
    for (int x = 0; x < w; x++) {
      for (int y = 0; y < h; y++) {
        fill(204);
        strokeWeight(1);
        stroke(0);
        
        xPos = x*square;
        yPos = y*square;
        rect(xPos, yPos, square, square);
      }
    }
  }
}
