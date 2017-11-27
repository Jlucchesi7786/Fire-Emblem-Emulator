/*
* Fire Emblem is copyrighted by Nintendo.
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
  int select = -1;
  // what turn it is
  int turn = 0;
  int numOEnemies;
  int numOAllies;
  // combined combat stats
  int combohit;
  int damage;
  int attackingUnit = -1;
  int defendingUnit = -1;
  int attackSquare;

// drawing the map
  map map1 = new map(w, h, scale);
  int maxsquare = w * h - 1;

// creating sword objects
  bSword bronzeS1 = new bSword();
  iSword ironS1 = new iSword();
  stSword steelS1 = new stSword();
  siSword silverS1 = new siSword();
  b2Sword braveS1 = new b2Sword();

// creating axe objects
  bAxe bronzeA1 = new bAxe();
  iAxe ironA1 = new iAxe();
  stAxe steelA1 = new stAxe();
  siAxe silverA1 = new siAxe();
  b2Axe braveA1 = new b2Axe();
  
// creating lance objects
  bLance bronzeL1 = new bLance();
  iLance ironL1 = new iLance();
  stLance steelL1 = new stLance();
  siLance silverL1 = new siLance();
  b2Lance braveL1 = new b2Lance();

// creating bow objects
  bBow bronzeB1 = new bBow();
  iBow ironB1 = new iBow();
  stBow steelB1 = new stBow();
  siBow silverB1 = new siBow();
  cBow crescentB1 = new cBow();

// creating arrays
  // 4 character limit on class names
  String[] classes = {"Merc", "Hero", "Bers"};
  String[] weapons = {"Bronze Sword", "Iron Sword", "Steel Sword", "Silver Sword", "Brave Sword", "Bronze Axe", "Iron Axe", "Steel Axe", "Silver Axe", "Brave Axe", "Bronze Lance", "Iron Lance", "Steel Lance", "Silver Lance", "Brave Lance", "Bronze Bow", "Iron Bow", "Steel Bow", "Silver Bow", "Crescent Bow"};
  int[] weaponMts = {bronzeS1.mt, ironS1.mt, steelS1.mt, silverS1.mt, braveS1.mt, bronzeA1.mt, ironA1.mt, steelA1.mt, silverA1.mt, braveA1.mt, bronzeL1.mt, ironL1.mt, steelL1.mt, silverL1.mt, braveL1.mt, bronzeB1.mt, ironB1.mt, steelB1.mt, silverB1.mt, crescentB1.mt};
  int[] weaponAvos = {bronzeS1.avo, ironS1.avo, steelS1.avo, silverS1.avo, braveS1.avo, bronzeA1.avo, ironA1.avo, steelA1.avo, silverA1.avo, braveA1.avo, bronzeL1.avo, ironL1.avo, steelL1.avo, silverL1.avo, braveL1.avo, bronzeB1.avo, ironB1.avo, steelB1.avo, silverB1.avo, crescentB1.avo};
  int[] weaponHits = {bronzeS1.hit, ironS1.hit, steelS1.hit, silverS1.hit, braveS1.hit, bronzeA1.hit, ironA1.hit, steelA1.hit, silverA1.hit, braveA1.hit, bronzeL1.hit, ironL1.hit, steelL1.hit, silverL1.hit, braveL1.hit, bronzeB1.hit, ironB1.hit, steelB1.hit, silverB1.hit, crescentB1.hit};
  int[] weaponCrits = {bronzeS1.crit, ironS1.crit, steelS1.crit, silverS1.crit, braveS1.crit, bronzeA1.crit, ironA1.crit, steelA1.crit, silverA1.crit, braveA1.crit, bronzeL1.crit, ironL1.crit, steelL1.crit, silverL1.crit, braveL1.crit, bronzeB1.crit, ironB1.crit, steelB1.crit, silverB1.crit, crescentB1.crit};
  int[] weaponCritavos = {bronzeS1.critavo, ironS1.critavo, steelS1.critavo, silverS1.critavo, braveS1.critavo, bronzeA1.critavo, ironA1.critavo, steelA1.critavo, silverA1.critavo, braveA1.critavo, bronzeL1.critavo, ironL1.critavo, steelL1.critavo, silverL1.critavo, braveL1.critavo, bronzeB1.critavo, ironB1.critavo, steelB1.critavo, silverB1.critavo, crescentB1.critavo};
  int[] weaponRanges = {bronzeS1.range, ironS1.range, steelS1.range, silverS1.range, braveS1.range, bronzeA1.range, ironA1.range, steelA1.range, silverA1.range, braveA1.range, bronzeL1.range, ironL1.range, steelL1.range, silverL1.range, braveL1.range, bronzeB1.range, ironB1.range, steelB1.range, silverB1.range, crescentB1.range};
  String[] labels = {"/", "Level ", "exp ", "move ", "Strength  ", "Magic  ", "Skill  ", "Speed  ", "Luck  ", "Defense  ", "Resistance  ", "Atk  ", "Hit  ", "Avo  ", "Crit  "};

// 8 character limit on names
character[] characters = {new character("test dum", 1, "Merc", "Steel Bow", "Ally", 0), new character("Enemy", 5, "Merc", "Steel Axe", "Enemy", 1), new character("Chrom", 5, "Merc", "Steel Sword", "Ally", 2)};
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
}


void keyPressed() {
  if ((key == 'w') || (keyCode == UP)) {
    if ((menu.on == 0) && (menu.selectedFunction < 2)) {
      cursor.move("up");
    } else if (menu.selectedFunction == 2) {
      if (attackSquare > 0) {
        attackSquare--;
      }
    } else if (menu.selectedFunction == 3) {
      if (characters[menu.selectedUnit].unit1.selectedItem > 0) {
        characters[menu.selectedUnit].unit1.selectedItem--;
      }
    } else {
      if (menu.item > 1) {
        menu.item--;
      }
    }
  } else if ((key == 'a') || (keyCode == LEFT)) {
    if ((menu.on == 0) && (menu.selectedFunction < 2)) {
      cursor.move("left");
    }
  } else if ((key == 's') || (keyCode == DOWN)) {
    if ((menu.on == 0) && (menu.selectedFunction < 2)) {
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
      }
    } else {
      if (menu.item < menu.itemMax) {
        menu.item++;
      }
    }
  } else if ((key == 'd') || (keyCode == RIGHT)) {
    if ((menu.on == 0) && (menu.selectedFunction < 2)) {
      cursor.move("right");
    }
  } else if (key == 'l') {
    characters[0].unit1.exp += 100;
  } else if (key == ' ') {
    if ((menu.on == 0)) {
      cursor.select();
    } else {
      menu.select();
    }
  }
}
