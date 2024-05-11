abstract class Entity extends GameObject{
 //entities are all creatures, like mobs, players, bosses, etc
 float x;
 float y;
 float[] hitbox; 
 //hitbox could be an array of 4 points, topleft, topright, bottomleft, bottomright.
 int healthPoints;
 int defencePoints;
 int attackpoints;
 int moveSpeed;
}
