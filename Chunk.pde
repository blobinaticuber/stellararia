class Chunk {

  final int chunkWidth = 16;
  int chunkHeight;
  int pos;

  Block[][] blocks;


  Chunk(int worldHeight, int pos) {
    this.pos = pos;
    chunkHeight = worldHeight;
    blocks = new Block[chunkWidth][chunkHeight];

    // GARBAGE TEMPORARY WORLD GENERATION CODE:
    // has a few blocks of air, then random grass/dirt below that
    for (int i = 0; i < blocks.length; i++) {
      for (int k = 0; k < blocks[0].length; k++) {
        if (k>6) blocks[i][k] = new Block( (int)random(1, 3), i*50, k*50);
        else blocks[i][k] = new Block(0, i*50, k*50);
      }
    }
  }

  void display() {
    pushMatrix();
    translate(pos*chunkWidth*50,0);
    for (int i = 0; i < chunkWidth; i++) {
      for (int k = 0; k < chunkHeight; k++) {
        blocks[i][k].display();
      }
    }
    popMatrix();
  }
}
