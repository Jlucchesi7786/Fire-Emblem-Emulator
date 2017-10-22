map map1;
void setup() {
  background(204);
  size(700, 600);
  
  map1 = new map(10, 12);
}

void draw() {
  map1.display();
}
