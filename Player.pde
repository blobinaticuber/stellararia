class Player extends Entity {
 final int INVENTORY_SIZE = 36;
 
 int x;
 int y;
 
 Item[] inventory = new Item[INVENTORY_SIZE];
 
 Player(int x, int y) {
   this.x = x;
   this.y = y;
 }
 
 
 void display() {
   if (y < Earth.getSurfaceHeight(x)*50) y+=4;
   println(Earth.getSurfaceHeight(x)*50);
   println(y);
   pushMatrix();
   translate(x,y);
   fill(128,0,128);
   rect(0,0,40,90);
   popMatrix();
 }
}
