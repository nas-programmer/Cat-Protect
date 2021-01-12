/*
//Main Game Class
*/

class Game {
  InputHandler inputHandler;
  ObjectHandler objectHandler;
  Sprites sprites;
  ScreenHandler screenHandler;

  final int width, height;

  Game(int tileSize, int width, int height) {
    this.width = width;
    this.height = height;
    sprites = new Sprites("SpriteSheet1.png", tileSize);  //Making an instance of the spritesheet
    inputHandler = new InputHandler();                    //Initializing the Input eventhandler class
    objectHandler = new ObjectHandler(this.inputHandler, this.sprites); //Initializes the object event handler class
    screenHandler = new ScreenHandler(objectHandler);      //Initializes the object event handler class
    //Load game map
    PImage mapImg = loadImage("level.png");                
    mapImg.loadPixels();
    loadMap(mapImg.pixels, mapImg.width, mapImg.height, tileSize, tileSize, this.objectHandler);
  }

  void update() {
    screenHandler.update();
  }

  void draw() {
    screenHandler.draw();
  }

  void mousePressed(MouseEvent event) {
    if (screenHandler.currentScreen instanceof InitScreen) {
      screenHandler.updater.accept(1);
    } else if (screenHandler.currentScreen instanceof GameScreen) {
    }
  }

  void keyPressed(int keyCode, char key) {
    inputHandler.keyPressed(keyCode, key);
  }

  void keyReleased(int keyCode, char key) {
    inputHandler.keyReleased(keyCode, key);
  }
}
