/*
* Fire Emblem is copyrighted and owned by Nintendo.
* Idea: make the movement display based on an array
*/

// Chrom is the test unit
void setup() {
  size(700, 720);
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
int numItems = 21;
/*String[] weapons = new String[numItems];
int[] weaponMts = new int[numItems];
int[] weaponAvos = new int[numItems];
int[] weaponHits = new int[numItems];
int[] weaponCrits = new int[numItems];
int[] weaponCritavos = new int[numItems];
int[] weaponRanges = new int[numItems];*/
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

/*for (int i = 0; i< numItems; i++) {
  weapons[i] = 
}*/
// creating arrays
  // 4 character limit on class names
  String[] classes = {"Merc", "Hero", "Bers"};
  String[] weapons = {"Bronze Sword", "Iron Sword", "Steel Sword", "Silver Sword", "Brave Sword", "Bronze Axe", "Iron Axe", "Steel Axe", "Silver Axe", "Brave Axe", "Bronze Lance", "Iron Lance", "Steel Lance", "Silver Lance", "Brave Lance", "Bronze Bow", "Iron Bow", "Steel Bow", "Silver Bow", "Crescent Bow", "Garbage Sword"};
  int[] weaponMts = {bronzeS1.mt, ironS1.mt, steelS1.mt, silverS1.mt, braveS1.mt, bronzeA1.mt, ironA1.mt, steelA1.mt, silverA1.mt, braveA1.mt, bronzeL1.mt, ironL1.mt, steelL1.mt, silverL1.mt, braveL1.mt, bronzeB1.mt, ironB1.mt, steelB1.mt, silverB1.mt, crescentB1.mt, garbageS1.mt};
  int[] weaponAvos = {bronzeS1.avo, ironS1.avo, steelS1.avo, silverS1.avo, braveS1.avo, bronzeA1.avo, ironA1.avo, steelA1.avo, silverA1.avo, braveA1.avo, bronzeL1.avo, ironL1.avo, steelL1.avo, silverL1.avo, braveL1.avo, bronzeB1.avo, ironB1.avo, steelB1.avo, silverB1.avo, crescentB1.avo, garbageS1.avo};
  int[] weaponHits = {bronzeS1.hit, ironS1.hit, steelS1.hit, silverS1.hit, braveS1.hit, bronzeA1.hit, ironA1.hit, steelA1.hit, silverA1.hit, braveA1.hit, bronzeL1.hit, ironL1.hit, steelL1.hit, silverL1.hit, braveL1.hit, bronzeB1.hit, ironB1.hit, steelB1.hit, silverB1.hit, crescentB1.hit, garbageS1.hit};
  int[] weaponCrits = {bronzeS1.crit, ironS1.crit, steelS1.crit, silverS1.crit, braveS1.crit, bronzeA1.crit, ironA1.crit, steelA1.crit, silverA1.crit, braveA1.crit, bronzeL1.crit, ironL1.crit, steelL1.crit, silverL1.crit, braveL1.crit, bronzeB1.crit, ironB1.crit, steelB1.crit, silverB1.crit, crescentB1.crit, garbageS1.crit};
  int[] weaponCritavos = {bronzeS1.critavo, ironS1.critavo, steelS1.critavo, silverS1.critavo, braveS1.critavo, bronzeA1.critavo, ironA1.critavo, steelA1.critavo, silverA1.critavo, braveA1.critavo, bronzeL1.critavo, ironL1.critavo, steelL1.critavo, silverL1.critavo, braveL1.critavo, bronzeB1.critavo, ironB1.critavo, steelB1.critavo, silverB1.critavo, crescentB1.critavo, garbageS1.critavo};
  int[] weaponRanges = {bronzeS1.range, ironS1.range, steelS1.range, silverS1.range, braveS1.range, bronzeA1.range, ironA1.range, steelA1.range, silverA1.range, braveA1.range, bronzeL1.range, ironL1.range, steelL1.range, silverL1.range, braveL1.range, bronzeB1.range, ironB1.range, steelB1.range, silverB1.range, crescentB1.range, garbageS1.range};
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
