public class unit {
  // job is what class the unit is. references the classes[] array.
  int job;
  
  // lvl is the unit's level, from 1 to 20
  int lvl;
  
  // exp is the exp value the unit has, from 0 to 99. if the number gets to or exceeds 100, the unit gains a level
  int exp;
  
  // mov is how many squares the unit can move in a turn
  int mov;
  
  // selected tells the unit if it is currently being selected
  boolean selected;
  String name;
  
  // alignment tells it if it's part of the player's team or not.
  String alignment;
  
  // complicated. used for moving. it tells the unit what its X and Y were before moving.
  int pMovX;
  int pMovY;
  
  // misleading name. they're the mediator variable inbetween changing places
  int edgeX;
  int edgeY;
  
  // tells which unit is currently being moved. if no unit is being moved, should be -1 so as not to reference any unit in the characters[] array
  int moving;
  
  // rng keeps track of the attack range of the current weapon
  int rng;
  // the main 7 stats, along with the HP stat and an array to contain them all
  int str;
  int mag;
  int skl;
  int spd;
  int lck;
  int def;
  int res;
  int hp;
  int max;
  int[] stats = {str, mag, skl, spd, lck, def, res, max};
  
  int square;
  int safe;
  
  // the growth percentages for each stat and an array to contain them
  int strgrofinal;
  int maggrofinal;
  int sklgrofinal;
  int spdgrofinal;
  int lckgrofinal;
  int defgrofinal;
  int resgrofinal;
  int hpgrofinal;
  int[] growths = {strgrofinal, maggrofinal, sklgrofinal, spdgrofinal, lckgrofinal, defgrofinal, resgrofinal, hpgrofinal};
  
  // the combat stats of the unit, and an array for them
  int atk;
  int hit;
  int avo;
  int crit;
  int critevade;
  int[] mainStats = {atk, avo, hit, crit};
  
  // attacking keeps track of if the unit is attacking
  boolean attacking = false;
  boolean dead = false;
  
  // place is the units place in the characters[] array
  int place;
  
  // mapX and mapY keep track of where the unit is on the map
  int mapX;
  int mapY;
  int[] inventory = {0, 1, 7, 17, 15};
  int[] attackSquaresX = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
  int[] attackSquaresY = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
  int[][] attackPlaces = {attackSquaresX, attackSquaresY};
  
  // selectedItem tells which of the items in the unit's inventory is currently being selected
  int selectedItem;
  
  // trying to create a way for the objects to work together
    // trying to make unit object work inside character object
  public subclass foo;
  
  unit(String aName, String ajob, int level, String item1, int growth1, int growth2, int growth3, int growth4, int growth5, int growth6, int growth7, int growth8, String align, int place1) {
    alignment = align;
    if (align == "Enemy") {
      numOEnemies++;
    } else if (align == "Ally") {
      numOAllies++;
    }
    foo = new subclass(ajob);
    name = aName;
    job = foo.job;
    place = place1;
    
    growths[0] = strgrofinal = foo.strgro + growth1;
    growths[1] = maggrofinal = foo.maggro + growth2;
    growths[2] = sklgrofinal = foo.sklgro + growth3;
    growths[3] = spdgrofinal = foo.spdgro + growth4;
    growths[4] = lckgrofinal = foo.lckgro + growth5;
    growths[5] = defgrofinal = foo.defgro + growth6;
    growths[6] = resgrofinal = foo.resgro + growth7;
    growths[7] = hpgrofinal = foo.hpgro + growth8;
    
    stats[0] = str = foo.str;
    stats[1] = mag = foo.mag;
    stats[2] = skl = foo.skl;
    stats[3] = spd = foo.spd;
    stats[4] = lck = foo.lck;
    stats[5] = def = foo.def;
    stats[6] = res = foo.res;
    stats[7] = max = foo.max;
    
    mov = foo.mov;
    
    for (int i = 0; i < weapons.length; i++) {
      if (item1 == weapons[i]) {
        inventory[0] = i+1;
      }
    }
    rng = weaponRanges[inventory[0]-1];
    mainStats[0] = stats[0] + weaponMts[(inventory[0]-1)];
    mainStats[1] = floor(stats[2]*1.5) + weaponHits[inventory[0]-1] + (stats[4]/2);
    mainStats[2] = stats[3] + weaponAvos[(inventory[0]-1)] + (stats[4]/2);
    mainStats[3] = (stats[4]/2) + (stats[2]/2) + weaponCrits[(inventory[0]-1)];
    critevade = mainStats[2] + weaponCritavos[inventory[0]-1];
       
    atk = mainStats[0];
    hit = mainStats[1];
    avo = mainStats[2];
    crit = mainStats[3];
    
    // if you need to make a higher than level 1 character
    if (lvl > 1) {
      for (int i = 1; i < lvl; i++) {
        for (int z = 0; z < 7; z++) {
          int growth = round(random(100));
          if (growth <= growths[z]) {
            stats[z]++;
          }
        }
      }
      str = stats[0];
      mag = stats[1];
      skl = stats[2];
      spd = stats[3];
      lck = stats[4];
      def = stats[5];
      res = stats[6];
    }
    unit++;
    mapX = round(random(w));
    mapY = round(random(h));
    moving = -1;
    lvl = level;
    hp = max;
    exp = 0;
    selected = false;
  }
  
  // shows the unit on the map. Could use more detailed sprites or something
  void display() {
    if (!select) {
      selected = false;
    }
    
    if (hp <= 0) {
      dead = true;
    } else {
      dead = false;
    }
    
    if (!dead) {
      for (int i = 0; i < maps[map1.number-1].length; i++) {
        if ((maps[map1.number-1][i].mapY == mapY) && (maps[map1.number-1][i].mapX == mapX) && (maps[map1.number-1][i].type != "Door")) {
          mapY++;
        }
      }
      /*for (int i = 0; i < maps[map1.number-1].length; i++) {
        if (mapX+1 != maps[map1.number-1][i].mapX) {
          println(i);
        }
        /*if ((mapX == maps[map1.number-1][i].mapX) && (mapY == maps[map1.number-1][i].mapY)) {
          
          if (mapX == w) {
            mapX--;
          } else {
            mapX++;
          }
          if (mapY == h) {
            mapX--;
          } else {
            mapX++;
          }
        }
      }*/
      levelup();
      hover();
      selected();
      
      if (mapX < map1.w) {
        if (mapX > -1) {
          if (mapY < map1.h) {
            if (mapY > -1) {
              if (alignment == "Enemy") {
                fill(155, 0, 0);
              } else {
                fill(0, 0, 155);
              }
              stroke(0);
              strokeWeight(0);
              rect(mapX*scale+1, mapY*scale+1, scale-1, scale-1);
            } else {
              mapY++;
            }
          } else {
            mapY--;
          }
        } else {
          mapX++;
        }
      } else {
        mapX--;
      }
    } else {
      mapX = -1;
      mapY = -1;
    }
  }
  
  // when the cursor is hovering over the unit, it needs to show more info
  void hover() {
    if (((cursor.mapX == mapX) && (cursor.mapY == mapY)) || (selected)) {
      
      if (select) {
        selected = true;
      }
      
      // displays attack range
      if (((moving == -1) || (moving == place))) {
        if (menu.selectedFunction < 2) {
          for (int x = 0; x < mov*2 + 1 + rng*2; x++) {
            for (int y = 0; y < mov*2 + 1 + rng*2; y++) {
              int xStart = (mapX - mov - rng) * scale;
              int yStart = (mapY - mov - rng) * scale;
              safe = 0;
              noStroke();
              fill(255, 0, 0);
              if (((x-mov-rng)+(y-mov-rng) <= mov+rng) && ((x-mov-rng)-(y-mov-rng) >= -mov-rng) && ((x-mov-rng)+(y-mov-rng) >= -mov-rng) && ((x-mov-rng)-(y-mov-rng) <= mov+rng)) {
                if ((xStart + x*scale + scale <= w*scale) && (xStart + x*scale + scale >= 0) && (yStart + y*scale + scale <= h*scale) && (yStart + y*scale + scale >= 0)) {
                  for (int i = 0; i < characters.length; i++) {
                    if ((characters[i].unit1.mapX*scale != xStart + (x*scale)) || (characters[i].unit1.mapY*scale != yStart + (y*scale))) {
                      safe++;
                    }
                  }
                  for (int i = 0; i < maps[map1.number-1].length; i++) {
                    if ((maps[map1.number-1][i].mapX*scale != xStart + (x*scale)) || (maps[map1.number-1][i].mapY*scale != yStart + (y*scale))) {
                      safe++;
                    }
                  }
                  if (safe == characters.length + maps[map1.number-1].length) {
                    rect(xStart + (x*scale)+1, yStart + (y*scale)+1, scale-1, scale-1);
                  }
                }
              }
            }
          }
          
          // displays how far unit can move
          for (int x = 0; x < mov*2 + 1; x++) {
            for (int y = 0; y < mov*2 + 1; y++) {
              int xStart = (mapX - mov) * scale;
              int yStart = (mapY - mov) * scale;
              if (((x-mov)+(y-mov) <= mov) && ((x-mov)-(y-mov) >= -mov) && ((x-mov)+(y-mov) >= -mov) && ((x-mov)-(y-mov) <= mov)) {
                noStroke();
                if (alignment == "Enemy") {
                  fill(255, 72, 0);
                } else {
                  fill(111, 126, 255);
                }
                
                if ((xStart + x*scale + scale <= w*scale) && (xStart + x*scale + scale >= 0) && (yStart + y*scale + scale <= h*scale) && (yStart + y*scale + scale >= 0)) {
                  safe = 0;
                  for (int i = 0; i < characters.length; i++) {
                    if ((characters[i].unit1.mapX*scale != xStart + (x*scale)) || (characters[i].unit1.mapY*scale != yStart + (y*scale))) {
                      safe++;
                    }
                  }
                  for (int i = 0; i < maps[map1.number-1].length; i++) {
                    if ((maps[map1.number-1][i].mapX*scale != xStart + (x*scale)) || (maps[map1.number-1][i].mapY*scale != yStart + (y*scale))) {
                      safe++;
                    }
                  }
                  if (safe == characters.length + maps[map1.number-1].length) {
                    rect(xStart + (x*scale)+1, yStart + (y*scale)+1, scale-1, scale-1);
                  }
                }
              }
            }
          }
        } else if (menu.selectedFunction == 2) {
          int a = 0;
          fill(255, 0, 0);
          noStroke();
          for (int x = 0; x < rng*2 + 1; x++) {
            for (int y = 0; y < rng*2 + 1; y++) {
              int xStart = (mapX - rng) * scale;
              int yStart = (mapY - rng) * scale;
              safe = 0;
              if (((x-rng)+(y-rng) == rng) || ((x-rng)-(y-rng) == -rng) || ((x-rng)+(y-rng) == -rng) || ((x-rng)-(y-rng) == rng)) {
                if ((xStart + x*scale + scale <= w*scale) && (xStart + x*scale + scale >= 0) && (yStart + y*scale + scale <= h*scale) && (yStart + y*scale + scale >= 0)) {
                  for (int i = 0; i < characters.length; i++) {
                    if ((characters[i].unit1.mapX*scale != xStart + (x*scale)) || (characters[i].unit1.mapY*scale != yStart + (y*scale))) {
                      if (characters[i].align == "Ally") {
                        safe++;
                      }
                    }
                  }
                  for (int i = 0; i < maps[map1.number-1].length; i++) {
                    if ((maps[map1.number-1][i].mapX*scale != xStart + (x*scale)) || (maps[map1.number-1][i].mapY*scale != yStart + (y*scale))) {
                      safe++;
                    }
                  }
                  if (safe == numOAllies + maps[map1.number-1].length) {
                    rect(xStart + x*scale + 1, yStart + y*scale + 1, scale-1, scale-1);
                    attackSquaresX[a] = xStart/scale + x;
                    attackSquaresY[a] = yStart/scale + y;
                    a++;
                  }
                }
              }
            }
          }
          square = a;
        }
        
        fill(0);
        textSize(20);
        text(name, 450, 20);
        
        // tells the class the unit is
        for (int i = 1; i <= classes.length; i++) {
          if (job == i) {
            text(classes[i-1], 550, 20);
          }
        }
        
        // tells which weapons unit has and changes the stats to suit
        for (int z = 0; z < inventory.length; z++) {
          for (int i = 1; i <= weapons.length; i++) {
            if (inventory[z] == i) {
              textSize(15);
              if ((menu.selectedFunction == 3) && (z == selectedItem)) {
                fill(255, 0, 0);
              } else {
                fill(0);
              }
              text(weapons[i-1], 450, 250 + 20*z);
              
              mainStats[0] = stats[0] + weaponMts[(inventory[0]-1)];
              mainStats[1] = floor(stats[2]*1.5) + weaponHits[inventory[0]-1] + (stats[4]/2);
              mainStats[2] = stats[3] + weaponAvos[(inventory[0]-1)] + (stats[4]/2);
              mainStats[3] = (stats[4]/2) + (stats[2]/2) + weaponCrits[(inventory[0]-1)];
              critevade = mainStats[2] + weaponCritavos[inventory[0]-1];
            }
          }
        }
        atk = mainStats[0];
        hit = mainStats[1];
        avo = mainStats[2];
        crit = mainStats[3];
          
        // displaying stats
        fill(0);
        text(hp + "/" + stats[7], 625, 30);
            
        textSize(15);
        text("Level " + lvl, 550, 40);
        text("exp " + exp, 550, 57);
        text("move " + mov, 550, 74);
        
        // displays strength, magic, skill, speed, luck, defense, and resistance stats
        for (int i = 0; i < 7; i++) {
          text(labels[i+4] + stats[i], 450, 50 + i*17);
        }
        
        // shows atk, hit, avoid, and crit stats
        int a = 11;
        for (int y = 0; y < 2; y++) {
          for (int x = 0; x < 2; x++) {
            text(labels[a] + mainStats[a-11], 475 + 75*x, 185 + 30*y);
            a++;
          }
        }
        
        // if attacking shows the attack rates.
        if (attacking) {
          textSize(17);
          fill(0, 0, 255);
          text("Hit: " + attackcombohit + "%", 450, 450);
          text("Damage: " + attackdamage, 450, 469);
          text(characters[defendingUnit].unit1.hp + " > " + (characters[defendingUnit].unit1.hp - attackdamage), 450, 494);
          fill(255, 0, 0);
          text("Hit: " + defendcombohit + "%", 600, 450);
          text("Damage: " + defenddamage, 600, 469);
          text(characters[attackingUnit].unit1.hp + " > " + (characters[attackingUnit].unit1.hp - defenddamage), 600, 494);
        }
      }
    }
  }
  
  
  // when the character levels up
  void levelup() {
    if (exp >= 100) {
      if (lvl < 20) {
        lvl += 1;
        exp -= 100;
        
        for (int z = 0; z < 8; z++) {
          int growth = round(random(100));
          if (growth <= growths[z]) {
            stats[z]++;
          }
          str = stats[0];
          mag = stats[1];
          skl = stats[2];
          spd = stats[3];
          lck = stats[4];
          def = stats[5];
          res = stats[6];
          hp = stats[7];
        }
      }
    }
    if (lvl == 20) {
      exp = 0;
    }
  }
  
  void selected() {
    if (menu.selectedFunction == 1) {
      pMovX = cursor.mapX;
      pMovY = cursor.mapY;
      int origY = cursor.origY;
      int origX = cursor.origX;
      
      /*if ((pMovX < origX) && (pMovY < origY)) {
        if ((origX - pMovX) + (origY - pMovY) <= mov) {
          edgeX = cursor.mapX;
          edgeY = cursor.mapY;
        }
      } else if ((pMovX > origX) && (pMovY < origY)) {
        if ((pMovX - origX) + (origY - pMovY) <= mov) {
          edgeX = cursor.mapX;
          edgeY = cursor.mapY;
        }
      } else if ((pMovX > cursor.origX) && (pMovY > cursor.origY)) {
        if ((pMovX - origX) + (pMovY - origY) <= mov) {
          edgeX = cursor.mapX;
          edgeY = cursor.mapY;
        }
      } else if ((pMovX < cursor.origX) && (pMovY > cursor.origY)) {
        if ((origX - pMovX) + (pMovY - origY) <= mov) {
          edgeX = cursor.mapX;
          edgeY = cursor.mapY;
        }
      } else if (pMovX == origX) {
        if ((origY - pMovY >= -mov) && (origY - pMovY <= mov)) {
          edgeX = cursor.mapX;
          edgeY = cursor.mapY;
        }
      } else if (pMovY == origY) {
        if ((origX - pMovX >= -mov) && (origX - pMovX <= mov)) {
          edgeX = cursor.mapX;
          edgeY = cursor.mapY;
        }
      }*/
      if ((pMovX != origX) || (pMovY != origY)) {
        edgeX = cursor.mapX;
        edgeY = cursor.mapY;
      }
      fill(0, 0, 155);
      rect(edgeX*scale, edgeY*scale, scale, scale);
    }
  }
  
  void attackSetup() {
    attackcombohit = hit - characters[defendingUnit].unit1.avo;
    attackdamage = atk - characters[defendingUnit].unit1.def;
    if (attackcombohit > 100) {
      attackcombohit = 100;
    }
    if (characters[defendingUnit].unit1.hp - attackdamage <= 0) {
      attackdamage = characters[defendingUnit].unit1.hp;
    }
    attacking = true;
    boolean defRange = true;
    /*for (int i = 0; i < characters[defendingUnit].unit1.attackSquare; i++) {
      
    }*/
    if ((defRange)) {
      defendcombohit = hit - characters[attackingUnit].unit1.avo;
      defenddamage = atk - characters[attackingUnit].unit1.def;
      if (defendcombohit > 100) {
        defendcombohit = 100;
      }
      if (characters[attackingUnit].unit1.hp - defenddamage <= 0) {
        defenddamage = characters[attackingUnit].unit1.hp;
      }
    }
    attacking = true;
  }
  
  void attack() {
    int hit = round(100);
    if (hit <= attackcombohit) {
      characters[defendingUnit].unit1.hp -= attackdamage;
    }
    hit = round(100);
    if (hit <= defendcombohit) {
      characters[attackingUnit].unit1.hp -= defenddamage;
    }
    attacking = false;
    menu.selectedFunction = 0;
    attackSquare = 0;
    select = false;
    menu.item = 1;
    attackcombohit = 0;
    attackdamage = 0;
    defendcombohit = 0;
    defenddamage = 0;
  }
  
  void equip() {
    int equip1;
    for (int i = 0; i < inventory.length; i++) {
      if (selectedItem == i) {
        equip1 = inventory[0];
        inventory[0] = inventory[i];
        inventory[i] = equip1;
      }
    }
  rng = weaponRanges[inventory[0]-1];
  menu.selectedFunction = 1;
  }
}
