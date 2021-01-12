/*
//Menu Window
*/

class InitScreen extends Screen {
  
    PImage BG;
  
  InitScreen(Consumer<Integer> changeScreen, ObjectHandler objectHandler) {
    super(changeScreen, objectHandler);
    BG = loadImage("Start.png");
  }

  void update() {
  }

  void draw() {
    background(0);
    image(BG, 0, 0);
  }
}
