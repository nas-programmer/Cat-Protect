/*
//Carrot Object Class
*/

class Potato extends Entity {

  Potato(float x, float y, int w, int h, ObjectHandler objectHandler, Sprites sprites) {
    super(x, y, w, h, ObjectID.POTATO, objectHandler, sprites);
  }

  void update() {
  }

  void draw() {
    image(sprites.getPotato(), x, y);
  }

  void onCollision(Entity crate) {
  }
}
