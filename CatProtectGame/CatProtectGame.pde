/* //<>// //<>// //<>//
//Launcher Class
*/


//Main Game instances
Game game;

void setup() {
  size(720, 480, P2D);
  game = new Game(32, width, height);
}

void draw() {
  game.update();
  game.draw();
}

//Input Events
public void mousePressed(MouseEvent event) {
  game.mousePressed(event);
}

void keyPressed(KeyEvent event) {
  game.keyPressed(event.getKeyCode(), event.getKey());
}

void keyReleased(KeyEvent event) {
  game.keyReleased(event.getKeyCode(), event.getKey());
}
