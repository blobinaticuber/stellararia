class Block {
  
  int type;
  int x;
  int y;
  
  Block(int type, int x, int y) {
    this.type = type;
    this.x = x;
    this.y = y;
  }
  
  void display() {
    pushMatrix();
    translate(x,y);
    if (type==0) fill(0,0,0,0); // air
    if (type==1)fill(0,255,0); // grass
    if (type==2) fill(128,64,0); // dirt
    stroke(64);
    rect(0,0,50,50);
    popMatrix();
  }
  
  
  
}
