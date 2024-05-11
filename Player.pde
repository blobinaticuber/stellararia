class Player extends Entity {
 final int INVENTORY_SIZE = 36;
 Item[] inventory = new Item[INVENTORY_SIZE];
 void display() {
   println("display player");
 }
}
