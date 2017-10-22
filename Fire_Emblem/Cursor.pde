public class Cursor {
  int actualX;
  int actualY;
  int mapX;
  int mapY;
  
  int anima;
  int selecting;
  
  Cursor() {
    mapX = 0;
    mapY = 0;
    
    anima = 1;
    selecting = 0;
  }
  
  void display() {
    noFill();
    strokeWeight(5);
    stroke(0, 0, 255);
    
    if (phase == 1) {
      actualX = mapX*40 - 5;
      actualY = mapY*40 - 5;
      
      rect(actualX, actualY, 50, 50);
    }
  }
  
  void move(String direction) {
    if (direction == "up") {
      if (mapY > 0) {
        mapY--;
      }
    } else if (direction == "right") {
      if (mapX < map.w) {
        mapX++;
      }
    } else if (direction == "down") {
      if (mapY < map.h) {
        mapY++;
      }
    } else if (direction == "left") {
      if (mapX > 0) {
        mapX--;
      }
    }
    
  }
}
