// terraria clone??
// but with space dimensions maybe idk

// we'd probably refactor and have a World class that contains Chunk objects
Block[][] chunk1 = new Block[20][20];

void setup() {
  size(1920,1080);
  // for all the blocks in chunk1, initialize them to air, green, or red
  for (int i = 0; i < chunk1.length; i++) {
    for (int k = 0; k < chunk1[0].length; k++) {
      // 5 is "sea level"? i guess lol
      if (k>5) chunk1[i][k] = new Block( (int)random(1,3), i*50, k*50);
      else chunk1[i][k] = new Block(0, i*50, k*50);
    }
  }
}


void draw() {
  background(0,64,128);
  for (int i = 0; i < chunk1.length; i++) {
    for (int k = 0; k < chunk1[0].length; k++) {
      chunk1[i][k].draw();
    }
  }
}
