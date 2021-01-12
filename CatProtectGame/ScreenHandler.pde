/*
//Screen Event Handler Class
*/

import java.util.function.Consumer;

class ScreenHandler {
  Screen currentScreen;
  ObjectHandler objectHandler;
  ScreenUpdater updater;

  ScreenHandler(ObjectHandler objectHandler) {
    this.objectHandler = objectHandler;
    this.updater = new ScreenUpdater();
    this.currentScreen = new InitScreen(updater, objectHandler);
  }

  void update() {
    this.currentScreen.update();
  }

  void draw() {
    this.currentScreen.draw();
  }
  
  //Class to Change Screens 
  class ScreenUpdater implements Consumer<Integer> {
    void accept(Integer screen) {
      if (screen == 0) {
        currentScreen = new InitScreen(this, objectHandler);
      }
      if (screen == 1) {
        currentScreen = new GameScreen(this, objectHandler);
      }
      if (screen == 2) {
        currentScreen = new GameOverScreen(this, objectHandler);
      }
    }
  }
}
