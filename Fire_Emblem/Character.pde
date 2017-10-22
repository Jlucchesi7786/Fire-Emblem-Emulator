public class character {
  int[] inventory;
  int actualX;
  int actualY;
  
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
  }
  
  void display(int x, int y) {
    actualX = x*40 + 10;
    actualY = y*40;
    
    fill(0);
    rect(actualX, actualY, 20, 40);
  }
}
