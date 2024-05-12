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
 }
 
 Chunk chunkPlayerIsIn() {
   int chunkPlayerIsIn = (int)(this.x/(Chunk.chunkWidth*BLOCK_SIZE));
   Chunk playerChunk = Earth.chunks[chunkPlayerIsIn];
   return playerChunk;
 }
 
 Block findBlock() {
   //this method finds the block below the player, so that the player can stand or fall.
   int chunkPlayerIsIn = (int)(this.x/(Chunk.chunkWidth*BLOCK_SIZE));
   Chunk playerChunk = Earth.chunks[chunkPlayerIsIn];
   //in-chunk x-coordinate of the block below the player:
   int inChunkBlockX = ((int)(this.x/BLOCK_SIZE))-chunkPlayerIsIn*Chunk.chunkWidth;
   int inChunkBlockY = (int)(this.y/BLOCK_SIZE)+2;
   Block blockBelowPlayer = playerChunk.blocks[inChunkBlockX][inChunkBlockY];
   //debugging
  return blockBelowPlayer; 
 }
 
 int findSurfaceUnderPlayer(){
   Chunk pChunk = chunkPlayerIsIn();
   Block temp = findBlock(); //starts out with block directly under player
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
 
 void display() {
   fall(); 
   
   pushMatrix();
   translate(x,y);
   fill(128,0,128);
   rect(0,0,PLAYER_WIDTH,PLAYER_HEIGHT);
   popMatrix();
 }
 
 void jump() {
   yMomentum -= 10;
  println("yippee!"); 
 }
}
