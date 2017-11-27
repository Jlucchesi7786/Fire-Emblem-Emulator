public class map {
  int xPos;
  int yPos;
  int w;
  int h;
  int number;
  
  int scale;
  
  map(int w1, int h1, int scale1) {
    w = w1;
    h = h1;
    scale = scale1;
  }
  
  void display(int whichMap) {
    number = whichMap;
    for (int x = 0; x < w; x++) {
      for (int y = 0; y < h; y++) {
        fill(204);
        strokeWeight(1);
        stroke(0);
          
        xPos = x*scale;
        yPos = y*scale;
        rect(xPos, yPos, scale, scale);
      }
    }
    
    for (int i = 0; i < maps.length; i++) {
      if (number-1 == i) {
        for (int a = 0; a < maps[i].length; a++) {
          maps[i][a].display();
        }
      }
    }
  }
}
