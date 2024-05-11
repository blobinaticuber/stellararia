class Block {
  
  int type;
  int x;
  int y;
  
  Block(int type, int x, int y) {
    this.type = type;
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    pushMatrix();
    translate(x,y);
    if (type==0) fill(0,0,0,0);
    if (type==1)fill(0,255,0);
    if (type==2) fill(255,0,0);
    rect(0,0,50,50);
    popMatrix();
  }
  
  
  
}
