public class character {
  int[] inventory;
  int actualX;
  int actualY;
  int selected;
  
  int hp;
  int str;
  int mag;
  int skl;
  int spd;
  int lck;
  int def;
  int res;
  
  int mov;
  
  int strgro;
  int maggro;
  int sklgro;
  int spdgro;
  int lckgro;
  int defgro;
  int resgro;
  
  character() {
    selected = 0;
  }
  
  void display(int x, int y) {
    actualX = x*40 + 10;
    actualY = y*40;
    
    strokeWeight(1);
    stroke(0);
    fill(0);
    rect(actualX, actualY, 20, 40);
  }
  
  void info() {
    
  }
}
