public class Menu {
  boolean on = false;
  int selectedUnit;
  int item;
  int itemMax;
  int selectedFunction;
  String[] labels = {"Move", "Attack", "Item"};
  
  Menu() {
    itemMax = labels.length;
    item = 1;
    selectedUnit = -1;
  }
  
  void display() {
    stroke(0);
    strokeWeight(1);
    textSize(15);
    if (selectedUnit != -1) {
      if (on) {
        for (int i = 0; i < itemMax; i++) {
          if (item-1 == i) {
            fill(0, 255, 0);
          } else {
            fill(204);
          }
          rect(characters[selectedUnit].unit1.mapX*scale + scale/4*5, characters[selectedUnit].unit1.mapY*scale - scale/4 + 16*i, 100, 16);
        }
        fill(0);
        for (int i = 0; i < itemMax; i++) {
          text(labels[i], characters[selectedUnit].unit1.mapX*scale + scale/4*5 + 4, characters[selectedUnit].unit1.mapY*scale + 4 + 16*i);
        }
      }
    } else {
      on = false;
    }
  }
  
  void select() {
    selectedFunction = item;
    on = false;
    if (selectedFunction == 2) {
      attackingUnit = selectedUnit;
    }
  }
}
