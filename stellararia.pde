// terraria clone??
// but with space dimensions maybe idk

World Earth;
Player Steven;

int viewOffsetX = 0;
int viewOffsetY = 0;

void setup() {
  size(1920, 1080);
  Earth = new World("Earth", 20, 100);
  Steven = new Player((Earth.WORLD_CENTER)*50,200);
}


void draw() {
  background(0);
  pushMatrix();
  translate(viewOffsetX - (Earth.WORLD_CENTER)*50, viewOffsetY);
  Earth.display();
  Steven.display();
  popMatrix();
}

void mouseDragged() {
  viewOffsetX -= ((pmouseX-mouseX));
  viewOffsetY -= ((pmouseY-mouseY));
}
