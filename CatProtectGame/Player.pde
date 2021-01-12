/*
//Player Object Class
*/

class Player extends Entity {
  final InputHandler inputHandler;

  float speed = 4;

  int ammo = 100;
  float index = 0;
  int health = 100;
  PImage[] currPos; 
  int points = 0;
  
  Random random = new Random();

  Player(float x, float y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler, Sprites sprites) {
    super(x, y, w, h, ObjectID.PLAYER, objectHandler, sprites);
    this.inputHandler = inputHandler;
  }

  void update() {    
    tryAdvance();
    
    currPos = sprites.getPlayer()[2]; 
    
    //Direction of movement is selected
    if (inputHandler.up) {
      yVel = -speed;
      currPos = sprites.getPlayer()[0];
    }
    else if (!inputHandler.down) yVel = 0;

    if (inputHandler.down){
      yVel = speed;
      currPos = sprites.getPlayer()[2];
    }
    else if (!inputHandler.up) yVel = 0;

    if (inputHandler.right){
      xVel = speed;
      currPos = sprites.getPlayer()[3];
    }
    else if (!inputHandler.left) xVel = 0;

    if (inputHandler.left){
      xVel = -speed;
      currPos = sprites.getPlayer()[1];
    }
    else if (!inputHandler.right) xVel = 0;
    index += .1;
  }

  void draw() {
    image(currPos[floor(index)%2], x, y);
    if (index > 100) index = 0;
  }

  void onCollision(Entity entity) {
    if (entity.objectId == ObjectID.RAT) {
      points += 1;
      objectHandler.removeEntity(entity);
      objectHandler.addRat((int)random(50, 80), random.nextInt(400), 32, 32);
    }
  }

  void hit() {
    health -= 1;
  }

}
