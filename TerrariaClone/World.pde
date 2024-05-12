class World {
  
  final int WORLD_CENTER;
  
  String name;
  int numberOfChunks;
  int worldHeight;
  
  Chunk[] chunks;
  
  
  World(String name, int numberOfChunks, int worldHeight) {
    this.name = name;
    this.numberOfChunks = numberOfChunks;
    this.worldHeight = worldHeight;
    
    WORLD_CENTER = numberOfChunks*8;
    
    chunks = new Chunk[numberOfChunks];
    
    for (int n = 0; n < numberOfChunks; n++) {
      chunks[n] = new Chunk(worldHeight, n);
    }
  }
  
  float getSurfaceHeight(float a) {
    return 20 + noise(a*0.05)*15;
  }
  
  
  
  
  void display() {
    // future optimization for big worlds:
    // if chunk would be draw offscreen, don't draw it
    for (Chunk c: chunks) c.display();
  }
  
  int chunkNumCoordsAreIn(float x) {
    //given some coordinates, this method returns the number of the chunk that the coordinates are in
   int chunkNum = (int)(x/(Chunk.chunkWidth*BLOCK_SIZE));
   //Chunk desired = this.chunks[chunkNum];
   //return desired;
   return chunkNum;
 }
 
 Chunk chunkCoordsAreIn(float x) {
   //given some coordinates, this method returns the chunk that the coordinates are in
   Chunk desired = this.chunks[chunkNumCoordsAreIn(x)];
   return desired;
 }
 
 int xToChunkX(float x){
  //this method takes any coordinates and finds the coordinates of that block in whatever chunk its in 
  int chunkXIsIn = (int)(x/(Chunk.chunkWidth*BLOCK_SIZE));
   int inChunkBlockXCoord = ((int)(x/BLOCK_SIZE))-chunkXIsIn*Chunk.chunkWidth;
   return inChunkBlockXCoord;
 }
  
  Block xyToBlock(float x, float y){
   //given an x,y coordinate, this method returns the block at that coordinate.
   Chunk chunkBlockIsIn = chunkCoordsAreIn(x);
   int inChunkBlockXCoord = xToChunkX(x);
   Block DesiredBlock = chunkBlockIsIn.blocks[inChunkBlockXCoord][(int)y/BLOCK_SIZE];
   return DesiredBlock;
  }
  
}
