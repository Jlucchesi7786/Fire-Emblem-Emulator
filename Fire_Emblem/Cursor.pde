public class Cursor {
  int anima;
  int selecting;
  
  int actualX;
  int actualY;
  int mapX;
  int mapY;
  int origX;
  int origY;
  int selectX;
  int selectY;
  int selectedUnit;
  
  Cursor() {
    anima = 0;
    selecting = 0;
    selectX = -1;
    selectY = -1;
    
    mapX = 5;
    mapY = 5;
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
    
    actualX = mapX * scale;
    actualY = mapY * scale;
    
    noFill();
    stroke(0, 168, 255);
    strokeWeight(7);
    if (anima <= 20) {
        rect(actualX-4, actualY-4, scale+8, scale+8);
    } else if (anima <= 40) {
        rect(actualX-6, actualY-6, scale+12, scale+12);
    } else if (anima <= 60) {
        rect(actualX-8, actualY-8, scale+16, scale+16);
    }
    if (menu.selectedFunction == 2) {
      for (int i = 0; i < characters[selectedUnit].unit1.attackSquaresX.length; i++) {
        if (attackSquare == i) {
          selectX = characters[selectedUnit].unit1.attackSquaresX[i];
          selectY = characters[selectedUnit].unit1.attackSquaresY[i];
        }
      }
      noFill();
      stroke(0, 255, 168);
      strokeWeight(7);
      rect(selectX*scale - 4, selectY*scale - 4, scale+8, scale+8);
    }
  }
  
  void select() {
    if (select == -1) {
      origX = mapX;
      origY = mapY;
      for (int i = 0; i < characters.length; i++) {
        if ((characters[i].unit1.mapX == mapX) && (characters[i].unit1.mapY == mapY)) {
          if (characters[i].align == "Ally") {
            selectedUnit = i;
            select = 1;
            menu.on = 1;
            menu.selectedUnit = i;
            for (int z = 0; z < characters.length; z++) {
              characters[z].unit1.moving = i;
            }
          }
        }
      }
    } else if (menu.selectedFunction == 1) {
      if (characters[selectedUnit].align == "Ally") {
        if ((mapX < origX) && (mapY < origY)) {
          if ((origX - mapX) + (origY - mapY) <= characters[selectedUnit].unit1.mov) {
            characters[selectedUnit].unit1.mapX = mapX;
            characters[selectedUnit].unit1.mapY = mapY;
          }
        } else if ((mapX > origX) && (mapY < origY)) {
          if ((mapX - origX) + (origY - mapY) <= characters[selectedUnit].unit1.mov) {
            characters[selectedUnit].unit1.mapX = mapX;
            characters[selectedUnit].unit1.mapY = mapY;
          }
        } else if ((mapX > origX) && (mapY > origY)) {
          if ((mapX - origX) + (mapY - origY) <= characters[selectedUnit].unit1.mov) {
            characters[selectedUnit].unit1.mapX = mapX;
            characters[selectedUnit].unit1.mapY = mapY;
          }
        } else if ((mapX < origX) && (mapY > origY)) {
          if ((origX - mapX) + (mapY - origY) <= characters[selectedUnit].unit1.mov) {
            characters[selectedUnit].unit1.mapX = mapX;
            characters[selectedUnit].unit1.mapY = mapY;
          }
        } else if (mapX == origX) {
          if (((origY - mapY) >= -characters[selectedUnit].unit1.mov) && ((origY - mapY) <= characters[selectedUnit].unit1.mov)) {
            characters[selectedUnit].unit1.mapY = mapY;
          }
        } else if (mapY == origY) {
          if (((origX - mapX) >= -characters[selectedUnit].unit1.mov) && ((origX - mapX) <= characters[selectedUnit].unit1.mov)) {
            characters[selectedUnit].unit1.mapX = mapX;
          }
        }
      }
      select = -1;
      for (int i = 0; i < characters.length; i++) {
        characters[i].unit1.moving = -1;
      }
      selectedUnit = -1;
    } else if (menu.selectedFunction == 2) {
      for (int i = 0; i < characters.length; i++) {
        if ((characters[i].unit1.mapX == selectX) && (characters[i].unit1.mapY == selectY) && (characters[i].align == "Enemy")) {
          defendingUnit = i;
        }
      }
      if (defendingUnit > -1) {
        attackingUnit = selectedUnit;
        characters[attackingUnit].unit1.attack();
        
      }
      for (int i = 0; i < characters.length; i++) {
        characters[i].unit1.moving = -1;
      }
    } else if (menu.selectedFunction == 3) {
      characters[selectedUnit].unit1.equip();
      select = -1;
      menu.item = 1;
      for (int i = 0; i < characters.length; i++) {
        characters[i].unit1.moving = -1;
      }
    } else {
      select = -1;
      selectedUnit = -1;
      defendingUnit = -1;
      attackingUnit = -1;
      menu.item = 1;
      for (int i = 0; i < characters.length; i++) {
        characters[i].unit1.moving = -1;
      }
    }
    menu.selectedUnit = selectedUnit;
    menu.selectedFunction = 0;
    attackSquare = 0;
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
