map map1;
B_Sword ok;
void setup() {
  background(204);
  size(700, 600);
  
  map1 = new map(10, 12);
  ok = new B_Sword(1);
}

void draw() {
  map1.display();
}
