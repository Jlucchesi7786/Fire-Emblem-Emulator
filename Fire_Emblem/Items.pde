public class item {
  int mt;
  int heal;
  boolean attack;
  int hit;
  int avo;
  int crit;
  int critavo;
  int range;
  int itemID;
  int x2;
  String name;
  String type;
  
  int undefItems;
  
  item(String itemType, String subtype) {
    type = itemType;
    if (itemType == "Sword") {
      range = 1;
      attack = true;
      if (subtype == "bronze") {
        mt = 4;
        hit = 100;
        critavo = 10;
        name = "Bronze Sword";
      } else if (subtype == "iron") {
        mt = 6;
        hit = 90;
        name = "Iron Sword";
      } else if (subtype == "steel") {
        mt = 9;
        hit = 85;
        avo = -5;
        x2 = -3;
        name = "Steel Sword";
      } else if (subtype == "silver") {
        mt = 12;
        hit = 90;
        critavo = -5;
        name = "Silver Sword";
      } else if (subtype == "brave") {
        mt = 6;
        hit = 75;
        itemID = 5;
        name = "Brave Sword";
      } else if (subtype == "garbage") {
        mt = 1;
        hit = 100;
        avo = 100;
        name = "Garbage Sword";
      } else {
        println("sword subtype '" + subtype + "' not found");
      }
    } else if (itemType == "Axe") {
      attack = true;
      range = 1;
      if (subtype == "bronze") {
        mt = 6;
        hit = 80;
        critavo = 10;
        name = "Bronze Axe";
      } else if (subtype == "iron") {
        mt = 8;
        hit = 70;
        name = "Iron Axe";
      } else if (subtype == "steel") {
        mt = 12;
        hit = 65;
        avo = -5;
        x2 = -3;
        name = "Steel Axe";
      } else if (subtype == "silver") {
        mt = 16;
        hit = 70;
        critavo = -5;
        name = "Silver Axe";
      } else if (subtype == "brave") {
        mt = 8;
        hit = 55;
        range = 1;
        name = "Brave Axe";
      } else {
        println("axe subtype '" + subtype + "' not found");
      }
    } else if (itemType == "Lance") {
      attack = true;
      range = 1;
      if (subtype == "bronze") {
        mt = 5;
        hit = 90;
        critavo = 10;
        name = "Bronze Lance";
      } else if (subtype == "iron") {
        mt = 7;
        hit = 80;
        name = "Iron Lance";
      } else if (subtype == "steel") {
        mt = 10;
        hit = 75;
        avo = -5;
        name = "Steel Lance";
      } else if (subtype == "silver") {
        mt = 14;
        hit = 80;
        critavo = -5;
        name = "Silver Lance";
      } else if (subtype == "brave") {
        mt = 7;
        hit = 65;
        name = "Brave Lance";
      } else {
        println("lance subtype '" + subtype + "' not found");
      }
    } else if (itemType == "Bow") {
      attack = true;
      range = 2;
      if (subtype == "bronze") {
        mt = 6;
        hit = 90;
        critavo = 10;
        name = "Bronze Bow";
      } else if (subtype == "iron") {
        mt = 8;
        hit = 80;
        name = "Iron Bow";
      } else if (subtype == "steel") {
        mt = 11;
        hit = 75;
        avo = -5;
        x2 = -3;
        name = "Steel Bow";
      } else if (subtype == "silver") {
        mt = 15;
        hit = 80;
        critavo = -5;
        name = "Silver Bow";
      } else if (subtype == "brave" || subtype == "crescent") {
        mt = 8;
        hit = 65;
        name = "Crescent Bow";
      } else {
        println("bow subtype '" + subtype + "' not found");
      }
    } else if (itemType == "healing" || itemType == "Healing") {
      range = 0;
      attack = false;
      if (subtype == "vuln" || subtype == "vulnerary" || subtype == "Vuln" || subtype == "Vulnerary") {
        heal = 10;
        name = "Vulnerary";
      } else if (subtype == "conc" || subtype == "concoction" || subtype == "Conc" || subtype == "Concoction") {
        heal = 20;
        name = "Confectionary";
      } else if (subtype == "elixir" || subtype == "Elixir") {
        heal = 40;
        name = "Elixir";
      } else {
        println("healing item '" + subtype + "' not found.");
      }
    } else {
      undefItems++;
      println("new item with type '" + itemType + "' and subtype '" + subtype + "' is not defined.");
      println(undefItems + " item(s) not intialized");
    }
    numItems++;
    itemID = numItems;
    weapons = append(weapons, name);
    weaponMts = append(weaponMts, mt);
    weaponAvos = append(weaponAvos, avo);
    weaponHits = append(weaponHits, hit);
    weaponCrits = append(weaponCrits, crit);
    weaponCritavos = append(weaponCritavos, critavo);
    weaponRanges = append(weaponRanges, range);
  }
}
