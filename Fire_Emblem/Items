public class item {
  int mt;
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
      if (subtype == "bronze") {
        mt = 4;
        hit = 100;
        critavo = 10;
        itemID = 1;
        name = "Bronze Sword";
      } else if (subtype == "iron") {
        mt = 6;
        hit = 90;
        itemID = 2;
        name = "Iron Sword";
      } else if (subtype == "steel") {
        mt = 9;
        hit = 85;
        avo = -5;
        itemID = 3;
        x2 = -3;
        name = "Steel Sword";
      } else if (subtype == "silver") {
        mt = 12;
        hit = 90;
        critavo = -5;
        itemID = 4;
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
        itemID = 21;
        name = "Garbage Sword";
      } else {
        println("sword subtype '" + subtype + "' not found");
        stop();
      }
    } else if (itemType == "Axe") {
      range = 1;
      if (subtype == "bronze") {
        mt = 6;
        hit = 80;
        critavo = 10;
        itemID = 6;
        name = "Bronze Axe";
      } else if (subtype == "iron") {
        mt = 8;
        hit = 70;
        itemID = 7;
        name = "Iron Axe";
      } else if (subtype == "steel") {
        mt = 12;
        hit = 65;
        avo = -5;
        itemID = 8;
        x2 = -3;
        name = "Steel Axe";
      } else if (subtype == "silver") {
        mt = 16;
        hit = 70;
        critavo = -5;
        itemID = 9;
        name = "Silver Axe";
      } else if (subtype == "brave") {
        mt = 8;
        hit = 55;
        range = 1;
        itemID = 10;
        name = "Brave Axe";
      } else {
        println("axe subtype '" + subtype + "' not found");
        stop();
      }
    } else if (itemType == "Lance") {
      range = 1;
      if (subtype == "bronze") {
        mt = 5;
        hit = 90;
        critavo = 10;
        itemID = 11;
        name = "Bronze Lance";
      } else if (subtype == "iron") {
        mt = 7;
        hit = 80;
        itemID = 12;
        name = "Iron Lance";
      } else if (subtype == "steel") {
        mt = 10;
        hit = 75;
        avo = -5;
        itemID = 13;
        name = "Steel Lance";
      } else if (subtype == "silver") {
        mt = 14;
        hit = 80;
        critavo = -5;
        itemID = 14;
        name = "Silver Lance";
      } else if (subtype == "brave") {
        mt = 7;
        hit = 65;
        itemID = 15;
        name = "Brave Lance";
      } else {
        println("lance subtype '" + subtype + "' not found");
        stop();
      }
    } else if (itemType == "Bow") {
      range = 2;
      if (subtype == "bronze") {
        mt = 6;
        hit = 90;
        critavo = 10;
        itemID = 16;
        name = "Bronze Bow";
      } else if (subtype == "iron") {
        mt = 8;
        hit = 80;
        itemID = 17;
        name = "Iron Bow";
      } else if (subtype == "steel") {
        mt = 11;
        hit = 75;
        avo = -5;
        itemID = 18;
        x2 = -3;
        name = "Steel Bow";
      } else if (subtype == "silver") {
        mt = 15;
        hit = 80;
        critavo = -5;
        itemID = 19;
        name = "Silver Bow";
      } else if (subtype == "brave" || subtype == "crescent") {
        mt = 8;
        hit = 65;
        itemID = 20;
        name = "Crescent Bow";
      } else {
        println("bow subtype '" + subtype + "' not found");
        stop();
      }
    } else {
      undefItems++;
      println("new item with type '" + itemType + "' and subtype '" + subtype + "' is not defined.");
      println(undefItems + " item(s) not intialized");
    }
  numItems++;
  println(name);
  /*append(weapons, name);
  append(weaponMts, mt);
  append(weaponAvos, avo);
  append(weaponHits, hit);
  append(weaponCrits, crit);
  append(weaponCritavos, critavo);
  append(weaponRanges, range);*/
  }
}
