/*
//Gameover Window
*/

class GameOverScreen extends Screen {
  
  PImage BG;
  PFont mono;
  
  GameOverScreen(Consumer<Integer> changeScreen, ObjectHandler objectHandler) {
    super(changeScreen, objectHandler);
    BG = loadImage("GOver.png");
    mono = createFont("Anonymous Pro Bold.ttf", 40);
  }

  void update() {
  }

  void draw() {
    background(255);
    image(BG, 0, 0);
    textFont(mono);
    text("Your Score:" + objectHandler.player.points, 230, 450);
  }
}
