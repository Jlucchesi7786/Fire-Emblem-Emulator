/*
* Fire Emblem is copyrighted by Nintendo.
*/

map map1;
B_Sword ok;
character Chrom;

void setup() {
  background(204);
  size(700, 600);
  
  map1 = new map(10, 12);
  ok = new B_Sword(1);
  Chrom = new character();
}

void draw() {
  map1.display();
  Chrom.display(0, 0);
}
