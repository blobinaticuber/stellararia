class Player extends Entity {
  final int INVENTORY_SIZE = 36;

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
    this.hitboxWidth = 45;
    this.hitboxHeight = 90;
  }

  Block[] findBlockUnderPlayer() {
    //this method finds the 2 blocks below the player, so that the player can stand or fall.

    //this section checks the left block
    Chunk playerChunk = Earth.chunkCoordsAreIn(this.x);
    int inChunkBlockX = Earth.xToChunkX(this.x);
    int inChunkBlockY = (int)(this.y/BLOCK_SIZE)+2;
    Block blockBelowPlayerLeft = playerChunk.blocks[inChunkBlockX][inChunkBlockY];

    //this section checks the right block
    float rightx = this.x+hitboxWidth;
    playerChunk = Earth.chunkCoordsAreIn(rightx);
    inChunkBlockX = Earth.xToChunkX(rightx);
    Block blockBelowPlayerRight = playerChunk.blocks[inChunkBlockX][inChunkBlockY];
    Block[] LRBlocks = {blockBelowPlayerLeft, blockBelowPlayerRight};
    return LRBlocks;
  }

  int findSurfaceUnderPlayer() {
    Chunk pChunk = Earth.chunkCoordsAreIn(this.x);
    Block[] temp = findBlockUnderPlayer(); //starts out with blocks directly under player
    //0 is left, 1 is right
    int surfaceY = -1;

    while (surfaceY == -1) {

      //left block
      if (temp[0].type != 0) {
        surfaceY = temp[0].y;
        break;
      }
      temp[0] = pChunk.blocks[(temp[0].x)/BLOCK_SIZE][(temp[0].y)/BLOCK_SIZE+1];

      //right block
      if (temp[1].type != 0) {
        surfaceY = temp[1].y;
        break;
      }
      temp[1] = pChunk.blocks[(temp[1].x)/BLOCK_SIZE][(temp[1].y)/BLOCK_SIZE+1];
    }
    return surfaceY;
  }

  void movePlayerY() {
    int surface = findSurfaceUnderPlayer();
    if (this.y+100 < surface) {
      float potentialy = constrain(y+yMomentum, 0, surface-100);
      if (Earth.xyToBlock(x, potentialy).type == 0) {
        y = potentialy;
        yMomentum+=0.5;
      } else {
        yMomentum = 0;
      }
    } else {
      yMomentum = 0;
    }
  }

  void movePlayerX() {
    float potentialx = x+xMomentum;
    if (Earth.xyToBlock(potentialx, y+hitboxHeight).type == 0 && Earth.xyToBlock(potentialx, y).type == 0) {
      if (Earth.xyToBlock(potentialx+hitboxWidth, y+hitboxHeight).type == 0 && Earth.xyToBlock(potentialx+hitboxWidth, y).type == 0) {
        x = potentialx;
      }
    }
  }



  void display() {
    pushMatrix();
    translate(x, y);
    fill(128, 0, 128);
    rect(0, 10, hitboxWidth, hitboxHeight);
    popMatrix();
  }

  void jump() {
    if (this.y+100 == findSurfaceUnderPlayer()) { //so player cannot jump midair
      y -= 10;
      yMomentum = -10;
    }
  }

  void moveRight() {
    xMomentum = moveSpeed;
  }

  void moveLeft() {
    xMomentum = -moveSpeed;
  }
}
