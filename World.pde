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
  
  float getSurfaceHeight(int a) {
    return 20 + noise(a*0.05)*15;
  }
  
  
  
  
  void display() {
    // future optimization for big worlds:
    // if chunk would be draw offscreen, don't draw it
    for (Chunk c: chunks) c.display();
  }
  
  
}
