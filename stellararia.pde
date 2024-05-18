// terraria clone??
// but with space dimensions maybe idk

World Earth;
Player Steven;

int viewOffsetX = 0;
int viewOffsetY = 0;
final int BLOCK_SIZE = 48;

PImage bg;
PImage dirt;
PImage grass;
PImage stone;
PImage stoneBrick;

void setup() {
  rectMode(CORNER);
  size(1920, 1080);
  Earth = new World("Earth", 20, 100);
  Steven = new Player((Earth.WORLD_CENTER)*BLOCK_SIZE, 200);
  bg = loadImage("images/Earth_day_bg.png");
  dirt = loadImage("images/dirt.png");
  grass = loadImage("images/grass.png");
  stone = loadImage("images/stone.png");
  stoneBrick = loadImage("images/stoneBrick.png");
}


void draw() {
  background(bg);
  pushMatrix();
  translate(viewOffsetX - (Earth.WORLD_CENTER)*BLOCK_SIZE, viewOffsetY);
  Earth.display();
  Steven.movePlayerX();
  Steven.movePlayerY();
  Steven.display();
  popMatrix();
}

void mouseDragged() {
  // change camera dragging to middle button only
  if (mouseButton != LEFT && mouseButton != RIGHT) {
    viewOffsetX -= ((pmouseX-mouseX));
    viewOffsetY -= ((pmouseY-mouseY));
  }
}

//controls:
void keyPressed() {
  if (key == 'd')
    Steven.moveRight();
  else if (key == 'a')
    Steven.moveLeft();

  if (keyCode == ' ') { //JUMP
    Steven.jump();
  }
}

void keyReleased() {
  if (key == 'd' || key == 'a')
    Steven.xMomentum = 0;
}

void mousePressed() {
  if (mouseButton == LEFT) { //mine block
    Block blockClicked = Earth.xyToBlock(mouseX-viewOffsetX+(Earth.WORLD_CENTER*BLOCK_SIZE), mouseY-viewOffsetY);
    println("block mined at " + blockClicked.x + "," + blockClicked.y);
    if (blockClicked.type != 0) {
      blockClicked.type = 0;
    }
  } else if (mouseButton == RIGHT) { //place block
    float adjustedX = mouseX-viewOffsetX+(Earth.WORLD_CENTER*BLOCK_SIZE);
    float adjustedY = mouseY-viewOffsetY;

    if (!((Steven.x < adjustedX && adjustedX < Steven.x+Steven.hitboxWidth)&&(Steven.y < adjustedY && adjustedY < Steven.y+Steven.hitboxHeight))) {
      //above line checks to make sure
      Block blockClicked = Earth.xyToBlock(adjustedX, adjustedY);
      if (blockClicked.type == 0) {
        blockClicked.type = 4;
      }
    }//outside of checking if block is placed inside player
  }
}
