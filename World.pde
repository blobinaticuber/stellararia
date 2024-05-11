class World {
  
  String name;
  int numberOfChunks;
  int worldHeight;
  
  Chunk[] chunks;
  
  
  World(String name, int numberOfChunks, int worldHeight) {
    this.name = name;
    this.numberOfChunks = numberOfChunks;
    this.worldHeight = worldHeight;
    
    chunks = new Chunk[numberOfChunks];
    
    for (int n = 0; n < numberOfChunks; n++) {
      chunks[n] = new Chunk(worldHeight, n);
    }
  }
  
  
  void display() {
    for (Chunk c: chunks) c.display();
  }
  
  
}
