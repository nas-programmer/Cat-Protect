/*
//Game Window
*/


class GameScreen extends Screen {
  
  float lasttime, timeinterval;
  int time = 0;
  PImage BG;
  
  GameScreen(Consumer<Integer> changeScreen, ObjectHandler objectHandler) {
    super(changeScreen, objectHandler);
    lasttime = millis();
    timeinterval = 1000; //1 second
    time = 60;
    BG = loadImage("BG.png");
  }

  void update() {
    objectHandler.update();
    oneSec();
    if (objectHandler.player.health <= 0 || objectHandler.eaten >= 26 || time == 0) {
      changeScreen.accept(2);
      return;
    }
  }
  
  void oneSec(){
    if(millis() >= lasttime +timeinterval){
      lasttime = millis();
      time--;
    }
  }
  
  void draw() {
    background(99);
    image(BG, 0, 0);
    objectHandler.draw();
    fill(208);
    rect(0, 0, 300, 32);
    fill(0);
    textSize(14);
    text("Time Left: " + time + ", Health: " + objectHandler.player.health + " Points: " + objectHandler.player.points, 10, 18);
  }

}
