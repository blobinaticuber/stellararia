abstract class Entity extends GameObject {
  //entities are all creatures, like mobs, players, bosses, etc
  float x;
  float y;
  float[] hitbox;
  float hitboxWidth;
  float hitboxHeight;
  //assuming hitbox is square
  int healthPoints;
  int defencePoints;
  int attackpoints;
  int moveSpeed;
}
