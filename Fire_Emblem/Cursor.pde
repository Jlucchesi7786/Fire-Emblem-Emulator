public class Cursor {
  int actualX;
  int actualY;
  int mapX;
  int mapY;
  
  int phase;
  int selecting;
  
  Cursor() {
    phase = 1;
    selecting = 0;
  }
  
  void display(int x, int y) {
    mapX = x;
    mapY = y;
    
    noFill();
    strokeWeight(2.5);
    stroke(0, 0, 255);
    
    if (phase == 1) {
      actualX = x*40 - 5;
      actualY = y*40 - 5;
      
      rect(actualX, actualY, 50, 50);
    }
  }
}
