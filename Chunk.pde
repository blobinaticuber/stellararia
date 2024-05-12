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
    for (int x = 0; x < blocks.length; x++) {
      for (int y = 0; y < blocks[0].length; y++) {
        //surface Y is where the surface of the world is
        float surfaceY = 20 + noise((x+(pos*chunkWidth))*0.05)*15;
        //float surfaceY = Earth.getSurfaceHeight(x+(pos*chunkWidth));
        int type = 1;
        if (y < surfaceY) type = 0;
        if (y > surfaceY+1) type = 2;
        if (y > surfaceY+8) type = 3;
        blocks[x][y] = new Block(type, x*50, y*50);
      }
    }
  }

  void display() {
    pushMatrix();
    translate((pos*chunkWidth*50),0);
    for (int i = 0; i < chunkWidth; i++) {
      for (int k = 0; k < chunkHeight; k++) {
        blocks[i][k].display();
      }
    }
    popMatrix();
  }
}
