/*
* Fire Emblem is copyrighted and owned by Nintendo.
* Idea: make the movement display based on an array
*/

// Chrom is the test unit
void setup() {
  size(700, 720);
  String[] weaponNames = {};
  /*weaponNames = append(weaponNames, "yes");
  weaponNames = append(weaponNames, "yes");
  weaponNames = append(weaponNames, "yes");
  println(weaponNames);*/
}

// setting up variables
  // how many units there are
  int unit = 0;
  // map variables // scale is the square width when drawing the map // w and h are width and height // 11 is max width, 15 is max height at scale 40
  int scale = 40;
  int w = 11;
  int h = 18;
  // if the cursor is currently selecting anything
  boolean select = false;
  // what turn it is
  int turn = 0;
  // to keep track of how many allies and enemies there are
  int numOEnemies;
  int numOAllies;
  // combined combat stats
  int attackcombohit;
  int attackdamage;
  int defendcombohit;
  int defenddamage;
  int attackingUnit = -1;
  int defendingUnit = -1;
  int attackSquare;
  int defendSquare;

// drawing the map
  map map1 = new map(w, h, scale);
  int maxsquare = w * h - 1;

//creating items
public int numItems = 0;
String[] weapons = {};
int[] weaponMts = {};
int[] weaponAvos = {};
int[] weaponHits = {};
int[] weaponCrits = {};
int[] weaponCritavos = {};
int[] weaponRanges = {};

// creating sword objects
  item bronzeS1 = new item("Sword", "bronze");
  item ironS1 = new item("Sword", "iron");
  item steelS1 = new item("Sword", "steel");
  item silverS1 = new item("Sword", "silver");
  item braveS1 = new item("Sword", "brave");
  item garbageS1 = new item("Sword", "garbage");

// creating axe objects
  item bronzeA1 = new item("Axe", "bronze");
  item ironA1 = new item("Axe", "iron");
  item steelA1 = new item("Axe", "steel");
  item silverA1 = new item("Axe", "silver");
  item braveA1 = new item("Axe", "brave");
  
// creating lance objects
  item bronzeL1 = new item("Lance", "bronze");
  item ironL1 = new item("Lance", "iron");
  item steelL1 = new item("Lance", "steel");
  item silverL1 = new item("Lance", "silver");
  item braveL1 = new item("Lance", "brave");

// creating bow objects
  item bronzeB1 = new item("Bow", "bronze");
  item ironB1 = new item("Bow", "iron");
  item steelB1 = new item("Bow", "steel");
  item silverB1 = new item("Bow", "silver");
  item crescentB1 = new item("Bow", "crescent");

// creating healing items
  item vulnerary = new item("Healing", "Vuln");

/*for (int i = 0; i< numItems; i++) {
  weapons[i] = 
}*/
// creating arrays
  // 4 character limit on class names
  String[] classes = {"Merc", "Hero", "Bers"};
  String[] labels = {"/", "Level ", "exp ", "move ", "Strength  ", "Magic  ", "Skill  ", "Speed  ", "Luck  ", "Defense  ", "Resistance  ", "Atk  ", "Hit  ", "Avo  ", "Crit  "};
  
// 8 character limit on names
character[] characters = {new character("test dum", 1, "Bers", "Steel Bow", "Ally", 0), new character("Chrom", 5, "Merc", "Garbage Sword", "Ally", 1), new character("Enemy", 5, "Merc", "Steel Axe", "Enemy", 2)};
wall[] map1walls = {new wall("Straight", 1, 0, 5), new wall("Straight", 1, 1, 5), new wall("Straight", 1, 2, 5), new wall("Straight", 1, 3, 5), new wall("Straight", 1, 4, 5), new wall("Door", 1, 5, 5), new wall("Straight", 1, 6, 5), new wall("Straight", 1, 7, 5), new wall("Straight", 1, 8, 5), new wall("Straight", 1, 9, 5), new wall("Straight", 1, 10, 5)};
wall[] map2walls = {new wall("Thick", 1, 5, 5), new wall("Thick Door", 2, 5, 6)};
Cursor cursor = new Cursor();
Menu menu = new Menu();
wall[][] maps = {map1walls, map2walls};


void draw() {
  background(204);
  map1.display(1);
    /*println("start");
  for (int i = 0; i < weaponNames.length; i++) {
    println(weaponNames[i]);
  } println("end");*/
  
  for (int i = 0; i < characters.length; i++) {
    characters[i].unit1.display();
  }
  
  cursor.display();
  menu.display();
  
  /*for (int i = 0; i < characters.length; i++) {
    println(characters[i].name + "X: " + characters[i].unit1.mapX);
    println(characters[i].name + "Y: " + characters[i].unit1.mapY);
  }*/
}


void keyPressed() {
  if ((key == 'w') || (keyCode == UP)) {
    if ((!menu.on) && (menu.selectedFunction < 2)) {
      cursor.move("up");
    } else if (menu.selectedFunction == 2) {
      if (attackSquare > 0) {
        attackSquare--;
      }
    } else if (menu.selectedFunction == 3) {
      if (characters[menu.selectedUnit].unit1.selectedItem > 0) {
        characters[menu.selectedUnit].unit1.selectedItem--;
      } else if (characters[menu.selectedUnit].unit1.selectedItem == 0) {
        characters[menu.selectedUnit].unit1.selectedItem = characters[menu.selectedUnit].unit1.inventory.length-1;
      }
    } else {
      if (menu.item > 1) {
        menu.item--;
      }
    }
  } else if ((key == 'a') || (keyCode == LEFT)) {
    if ((!menu.on) && (menu.selectedFunction < 2)) {
      cursor.move("left");
    }
  } else if ((key == 's') || (keyCode == DOWN)) {
    if ((!menu.on) && (menu.selectedFunction < 2)) {
      cursor.move("down");
    } else if (menu.selectedFunction == 2) {
      if (characters[menu.selectedUnit].unit1.rng == 1) {
        if (attackSquare < characters[menu.selectedUnit].unit1.square-1) {
          attackSquare++;
        }
      } else if (characters[menu.selectedUnit].unit1.rng == 2) {
        if (attackSquare < characters[menu.selectedUnit].unit1.square-1) {
          attackSquare++;
        }
      }
    } else if (menu.selectedFunction == 3) {
      if (characters[menu.selectedUnit].unit1.selectedItem < characters[menu.selectedUnit].unit1.inventory.length-1) {
        characters[menu.selectedUnit].unit1.selectedItem++;
      } else if (characters[menu.selectedUnit].unit1.selectedItem == characters[menu.selectedUnit].unit1.inventory.length-1) {
        characters[menu.selectedUnit].unit1.selectedItem = 0;
      }
    } else {
      if (menu.item < menu.itemMax) {
        menu.item++;
      }
    }
  } else if ((key == 'd') || (keyCode == RIGHT)) {
    if ((!menu.on) && (menu.selectedFunction < 2)) {
      cursor.move("right");
    }
  } else if (key == 'z') {
    if (menu.on) {
      menu.on = false;
      select = false;
    } else if (menu.selectedFunction > 0) {
      menu.selectedFunction = 0;
      select = false;
      menu.item = 1;
      attackSquare = 1;
    }
  } else if (key == 'l') {
    characters[0].unit1.exp += 120;
  } else if (key == ' ') {
    if ((menu.on == false)) {
      cursor.select();
    } else {
      menu.select();
    }
  }
}
