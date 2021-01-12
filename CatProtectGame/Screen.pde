/*
//Main abstract screen Class
*/

import java.util.function.Consumer;

abstract class Screen {

  ObjectHandler objectHandler;
  Consumer<Integer> changeScreen;

  Screen(Consumer<Integer> changeScreen, ObjectHandler objectHandler) {
    this.changeScreen = changeScreen;
    this.objectHandler = objectHandler;
  }

  abstract void update();
  abstract void draw();
}
