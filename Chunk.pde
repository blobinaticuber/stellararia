class Chunk {

  final int chunkWidth = 16;
  int chunkHeight;
  int pos;

  Block[][] blocks;


  Chunk(int worldHeight, int pos) {
    this.pos = pos;
    chunkHeight = worldHeight;
    blocks = new Block[chunkWidth][chunkHeight];

    // noise() function gives perlin noise
    for (int i = 0; i < blocks.length; i++) {
      for (int k = 0; k < blocks[0].length; k++) {
        //surface Y is where the surface of the world is
        float surfaceY = 20 + noise((i*0.05) + (pos*chunkWidth)) *4;
        int type = 1;
        if (k < surfaceY) type = 0;
        if (k > surfaceY+1) type = 2;
        if (k > surfaceY+8) type = 3;
        blocks[i][k] = new Block(type, i*50, k*50);
      }
    }
  }

  void display() {
    pushMatrix();
    translate((pos*chunkWidth*50)+viewOffsetX,viewOffsetY);
    for (int i = 0; i < chunkWidth; i++) {
      for (int k = 0; k < chunkHeight; k++) {
        blocks[i][k].display();
      }
    }
    popMatrix();
  }
}
