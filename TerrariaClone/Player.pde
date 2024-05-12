class Player extends Entity {
 final int INVENTORY_SIZE = 36;
 final int PLAYER_HEIGHT = 100;
 final int PLAYER_WIDTH = 50;
 
//inherits x,y which are floats
//x and y are the top left corner of the players hitbox
 
 float xMomentum;
 float yMomentum;
 
 Item[] inventory = new Item[INVENTORY_SIZE];
 
 Player(int x, int y) {
   this.x = x;
   this.y = y;
   xMomentum = 0;
   yMomentum = 0;
   this.moveSpeed = 5;
 }
 
 Block[] findBlockUnderPlayer() {
   //this method finds the 2 blocks below the player, so that the player can stand or fall.
   
   //this section checks the left block
  Chunk playerChunk = Earth.chunkCoordsAreIn(this.x);
  int inChunkBlockX = Earth.xToChunkX(this.x);
  int inChunkBlockY = (int)(this.y/BLOCK_SIZE)+2;
  Block blockBelowPlayerLeft = playerChunk.blocks[inChunkBlockX][inChunkBlockY];

  //this section checks the right block
  float rightx = this.x+1;
  playerChunk = Earth.chunkCoordsAreIn(rightx);
  inChunkBlockX = Earth.xToChunkX(rightx);
  Block blockBelowPlayerRight = playerChunk.blocks[inChunkBlockX][inChunkBlockY];
  Block[] LRBlocks = {blockBelowPlayerLeft,blockBelowPlayerRight};
  return LRBlocks;
 }
 
 int findSurfaceUnderPlayer(){
   Chunk pChunk = Earth.chunkCoordsAreIn(this.x);
   Block temp = findBlockUnderPlayer()[0]; //starts out with block directly under player
   while(temp.type == 0){
    temp = pChunk.blocks[(temp.x)/BLOCK_SIZE][(temp.y)/BLOCK_SIZE+1];
   }
   return temp.y;
 }
 
 void fall() {
   int surface = findSurfaceUnderPlayer();
   if (this.y < surface){
   y = constrain(y+yMomentum,-100,surface-100);
   yMomentum+=0.5;
   }else{
     yMomentum = 0;
   }
 }
 
 void movePlayer(){
   fall();
   x += xMomentum;
 }
 
 void display() {
   movePlayer(); 
   
   pushMatrix();
   translate(x,y);
   fill(128,0,128);
   rect(0,0,PLAYER_WIDTH,PLAYER_HEIGHT);
   popMatrix();
 }
 
 void jump() {
   y -= 10;
   yMomentum = -10;
 }
 
 void moveRight() {
  xMomentum = moveSpeed;
 } 
 
 void moveLeft() {
  xMomentum = -moveSpeed; 
 }
}
