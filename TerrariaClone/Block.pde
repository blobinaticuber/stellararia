class Block extends Placeable {
  
  int type;
  int x;
  int y;
  
  Block(int type, int x, int y) {
    this.type = type;
    this.x = x;
    this.y = y;
  }
  
  void display(){
  pushMatrix();
    translate(x,y);
    switch (type){
     case 0: fill(0,0,0,0); // air
     break;
     case 1: fill(0,255,0); // grass
     break;
     case 2:  fill(128,64,0); // dirt
     break;
     case 3:  fill(198,195,184); //stone
     break;
     case 4: fill(232,199,77); //wood
     break;
     default: fill(300,100,100); //missing texture
     break;
    }
    stroke(64);
    rect(0,0,BLOCK_SIZE,BLOCK_SIZE);
    popMatrix();
  }
  
}
