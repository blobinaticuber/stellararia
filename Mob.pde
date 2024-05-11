abstract class Mob extends Entity {
 /*I'm imagining that mobs would have an ai method, which gets called each "frame" of the game. 
 the ai method would be different for each mob, (or subclass of mob, whatever), and it would 
 determine whether the mob walks or flys or attacks or what. */
 abstract boolean ai();
 //eventually implement loot tables in this class
}
