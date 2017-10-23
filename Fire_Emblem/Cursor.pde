public class Cursor {
  int anima;
  int selecting;
  
  int actualX;
  int actualY;
  int mapX;
  int mapY;
  
  Cursor() {
    anima = 0;
    selecting = 0;
  }
  
  void display() {
    if (select == 1) {
      anima = 0;
    }
    
    if (anima < 60) {
      anima++;
    } else {
      anima = 0;
    }
    
    actualX = mapX * map1.square;
    actualY = mapY * map1.square;
    
    noFill();
    stroke(0, 168, 255);
    strokeWeight(7);
    if (anima <= 20) {
        rect(actualX-4, actualY-4, map1.square+8, map1.square+8);
    } else if (anima <= 40) {
        rect(actualX-6, actualY-6, map1.square+12, map1.square+12);
    } else if (anima <= 60) {
        rect(actualX-8, actualY-8, map1.square+16, map1.square+16);
    }
  }
  
  void select(int unit) {
    /*if (
    }*/
  }
  
  void move(String direction) {
    if (direction == "up") {
      if (mapY > 0) {
        mapY--;
      }
    } else if (direction == "right") {
      if (mapX < map1.w-1) {
        mapX++;
      }
    } else if (direction == "down") {
      if (mapY < map1.h-1) {
        mapY++;
      }
    } else if (direction == "left") {
      if (mapX > 0) {
        mapX--;
      }
    }
  }
}
