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
     stroke(0,0,0,0);
    rect(0,0,BLOCK_SIZE,BLOCK_SIZE);
     break;
     case 1:// grass
     image(grass,0,0,48,48);
     break;
     case 2:// dirt
     image(dirt,0,0,48,48);
     break;
     case 3://stone
     image(stone,0,0,48,48);
     break;
     case 4: //placeable block
     image(stoneBrick,0,0,48,48);
     break;
     default: fill(300,100,100); //missing texture
     stroke(0,0,0,0);
    rect(0,0,BLOCK_SIZE,BLOCK_SIZE);
     break;
    }
    //stroke(0,0,0,0);
    //rect(0,0,BLOCK_SIZE,BLOCK_SIZE);
    popMatrix();
  }
  
}
