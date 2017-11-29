public class wall {
   int mapX;
   int mapY;
   int appearance;
   String mainAppearance;
   String type;
   
   wall(String look, int look2, int whatX, int whatY) {
     mapX = whatX;
     mapY = whatY;
     mainAppearance = look;
     appearance = look2;
   }
   
   void display() {
     fill(0);
     if (mainAppearance == "Straight") {
       if (appearance == 1) {
         rect(mapX*scale, mapY*scale + scale/4, scale, scale/2);
         type = "Wall";
       } else if (appearance == 2) {
         rect(mapX*scale + scale/4, mapY*scale, scale/2, scale);
         type = "Wall";
       }
     } else if (mainAppearance == "Corner") {
       if (appearance == 1) {
         rect(mapX*scale + scale/4, mapY*scale + scale/4, scale/4*3, scale/2);
         rect(mapX*scale + scale/4, mapY*scale, scale/2, scale/4*3);
         type = "Wall";
       } else if (appearance == 2) {
         rect(mapX*scale + scale/4, mapY*scale + scale/4, scale/4*3, scale/2);
         rect(mapX*scale + scale/4, mapY*scale + scale/4, scale/2, scale/4*3);
         type = "Wall";
       } else if (appearance == 3) {
         rect(mapX*scale, mapY*scale + scale/4, scale/4*3, scale/2);
         rect(mapX*scale + scale/4, mapY*scale + scale/4, scale/2, scale/4*3);
         type = "Wall";
       } else if (appearance == 4) {
         rect(mapX*scale, mapY*scale + scale/4, scale/4*3, scale/2);
         rect(mapX*scale + scale/4, mapY*scale, scale/2, scale/4*3);
         type = "Wall";
       }
     } else if (mainAppearance == "Door") {
       if (appearance == 1) {
         rect(mapX*scale, mapY*scale + scale/4, scale/4, scale/2);
         rect(mapX*scale + scale/4*3, mapY*scale + scale/4, scale/4, scale/2);
         type = "Door";
       } else if (appearance == 2) {
         rect(mapX*scale + scale/4, mapY*scale, scale/2, scale/4);
         rect(mapX*scale + scale/4, mapY*scale + scale/4*3, scale/2, scale/4);
         type = "Door";
       }
     } else if (mainAppearance == "Thick Door") {
       if (appearance == 1) {
         rect(mapX*scale, mapY*scale, scale/4, scale);
         rect(mapX*scale + scale/4*3, mapY*scale, scale/4, scale);
         type = "Door";
       } else if (appearance == 2) {
         rect(mapX*scale, mapY*scale, scale, scale/4);
         rect(mapX*scale, mapY*scale + scale/4*3, scale, scale/4);
         type = "Door";
       }
     } else if (mainAppearance == "Thick") {
       rect(mapX*scale, mapY*scale, scale, scale);
         type = "Wall";
     }
   }
}
