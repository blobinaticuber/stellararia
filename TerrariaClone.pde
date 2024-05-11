// terraria clone??
// but with space dimensions maybe idk

World Earth;

void setup() {
  size(1920,1080);  
  Earth = new World("Earth", 2, 100);
}


void draw() {
  background(0);
  Earth.draw();
}
