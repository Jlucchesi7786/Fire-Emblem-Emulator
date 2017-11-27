public class character {
  String name;
  String job;
  int lvl;
  String align;
  
  int strgro;
  int maggro;
  int sklgro;
  int spdgro;
  int lckgro;
  int defgro;
  int resgro;
  int hpgro;
  unit unit1;
  
  character(String aName, int level, String aJob, String firstItem, String neutral, int place) {
    name = aName;
    job = aJob;
    lvl = level;
    align = neutral;
    
    strgro = round(random(100));
    maggro = round(random(100));
    sklgro = round(random(100));
    spdgro = round(random(100));
    lckgro = round(random(100));
    defgro = round(random(100));
    resgro = round(random(100));
    hpgro = round(random(100));
    
    unit1 = new unit(name, job, lvl, firstItem, strgro, maggro, sklgro, spdgro, lckgro, defgro, resgro, hpgro, align, place);
  }
}
