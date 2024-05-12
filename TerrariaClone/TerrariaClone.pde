// terraria clone??
// but with space dimensions maybe idk

World Earth;
Player Steven;

int viewOffsetX = 0;
int viewOffsetY = 0;
final int BLOCK_SIZE = 50;

void setup() {
  rectMode(CORNER);
  size(1920, 1080);
  Earth = new World("Earth", 20, 100);
  Steven = new Player((Earth.WORLD_CENTER)*BLOCK_SIZE,200);
}


void draw() {
  background(0);
  pushMatrix();
  translate(viewOffsetX - (Earth.WORLD_CENTER)*BLOCK_SIZE, viewOffsetY);
  Earth.display();
  Steven.display();
  popMatrix();
}

void mouseDragged() {
  viewOffsetX -= ((pmouseX-mouseX));
  viewOffsetY -= ((pmouseY-mouseY));
}

//controls:
 void keyPressed(){
   if(key == 'd')
  Steven.moveRight();
  else if(key == 'a')
  Steven.moveLeft();
  
  if(keyCode == ' '){ //JUMP
    Steven.jump();
  }
 }
 
 void keyReleased(){
  if(key == 'd' || key == 'a')
    Steven.xMomentum = 0;
}
 
void mousePressed() {
  if (mouseButton == LEFT) { //mine block
    Block blockClicked = Earth.xyToBlock(mouseX-viewOffsetX+(Earth.WORLD_CENTER*BLOCK_SIZE),mouseY-viewOffsetY);
    println("block mined at " + blockClicked.x + "," + blockClicked.y);
    if (blockClicked.type != 0){
      blockClicked.type = 0;
    }
  } else if (mouseButton == RIGHT) { //place block
    Block blockClicked = Earth.xyToBlock(mouseX-viewOffsetX+(Earth.WORLD_CENTER*BLOCK_SIZE),mouseY-viewOffsetY);
    println("block mined at " + blockClicked.x + "," + blockClicked.y);
    if (blockClicked.type == 0){
      blockClicked.type = 4;
    }
  } else {
    println("pressed center button");
  }
}
