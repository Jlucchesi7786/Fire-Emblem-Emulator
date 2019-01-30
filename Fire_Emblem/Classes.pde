public class subclass {
  int job;
  int promote1;
  int promote2;
  int mov;
  
  int strgro;
  int maggro;
  int sklgro;
  int spdgro;
  int lckgro;
  int defgro;
  int resgro;
  int hpgro;
  
  int str;
  int mag;
  int skl;
  int spd;
  int lck;
  int def;
  int res;
  int max;
  
  subclass(String type) {
    if (type == "merc" || type == "mercenary" || type == "Merc" || type == "Mercenary") {
      job = 1;
      mov = 5;
    
      strgro = 50;
      maggro = 0;
      sklgro = 50;
      spdgro = 50;
      lckgro = 0;
      defgro = 50;
      resgro = 5;
      hpgro = 120;
    
      str = 8;
      mag = 0;
      skl = 8;
      spd = 10;
      lck = 2;
      def = 5;
      res = 1;
      max = 24;
    } else if (type == "hero" || type == "Hero") {
      job = 2;
      mov = 6;
    
      strgro = 50;
      maggro = 0;
      sklgro = 50;
      spdgro = 50;
      lckgro = 0;
      defgro = 35;
      resgro = 0;
      hpgro = 90;
    
      str = 11;
      mag = 0;
      skl = 11;
      spd = 14;
      lck = 0;
      def = 7;
      res = 6;
      max = 30;
    } else if (type == "bers" || type == "berserker" || type == "Bers" || type == "Berserkers") {
      job = 3;
      mov = 6;
    
      strgro = 25;
      maggro = 0;
      sklgro = 15;
      spdgro = 15;
      lckgro = 0;
      defgro = 0;
      resgro = 0;
      hpgro = 30;
    
      str = 12;
      mag = 0;
      skl = 8;
      spd = 9;
      lck = 0;
      def = 5;
      res = 0;
      max = 24;
    }
  }
}
