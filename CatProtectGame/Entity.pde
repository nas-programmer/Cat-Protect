/*
//Main Entity Class, Game Object Class
*/

abstract class Entity {
  float x, y, xVel, yVel;
  int w, h;
  ObjectID objectId;
  ObjectHandler objectHandler;
  Sprites sprites;

  Entity(float x, float y, int w, int h, ObjectID objectId, ObjectHandler objectHandler, Sprites sprites) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.objectId = objectId;
    this.objectHandler = objectHandler;
    this.sprites = sprites;
  }

  abstract void update(); //Abstract Update Method

  abstract void draw();  //Abstract Draw Method

  abstract void onCollision(Entity crate); //Abstract Collision Detection Method
  
  //Detect collision
  boolean intersects(Entity other) {
    return other.w > 0 && other.h > 0 && w > 0 && h > 0
      && other.x < x + w && other.x + other.w > x
      && other.y < y + h && other.y + other.h > y;
  }
  
  // Gets Collided Object
  Entity getCollidingEntity() {
    List<Entity> objects = this.objectHandler.entities;
    for (int i = 0; i < objects.size(); i++) {
      Entity gameObject = objects.get(i);
      if (!gameObject.equals(this) && intersects(gameObject)) {
        return gameObject;
      }
    }
    return null;
  }
  
  //Repositions the Player Object Based on the collision
  void tryAdvance() {
    float oldX = x;
    x += xVel;
    Entity entityX = getCollidingEntity();
    if (entityX != null) {
      onCollision(entityX);
      x = oldX;
    } 

    float oldY = y;
    y += yVel;
    Entity entityY = getCollidingEntity();
    if (entityY != null) {
      onCollision(entityY);
      y = oldY;
    }
  }
}
