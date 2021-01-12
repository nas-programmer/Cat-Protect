/* //<>//
//Rat Object Class
*/

import java.util.Random;

class Rat extends Entity {
  Random random = new Random();

  boolean touching = false;
  int health = 100;

  Rat(float x, float y, int w, int h, ObjectHandler objectHandler, Sprites sprites) {
    super(x, y, w, h, ObjectID.RAT, objectHandler, sprites);
  }

  void update() {
    tryAdvance();
    //Random Movement
    int choose = random.nextInt(10);
    if (choose == 0) {
      xVel = (random.nextInt(8) - 2);
      yVel = (random.nextInt(8) - 4);
    }
  }

  void draw() {
    image(sprites.getRat(), x, y);
  }


  void onCollision(Entity entity) {
    if (entity.objectId == ObjectID.POTATO) {
      objectHandler.removeEntity(entity);
      objectHandler.eaten++;
    }
  }
}
