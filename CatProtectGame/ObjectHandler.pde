/* //<>//
//Game Object Event Handler Class
*/

import java.util.List;
import java.util.ArrayList;

class ObjectHandler {

  List<Entity> entities = new ArrayList<Entity>();
  Player player = null;
  int eaten = 0;
  
  InputHandler inputHandler;
  Sprites sprites;

  ObjectHandler(InputHandler inputHandler, Sprites sprites) {
    this.inputHandler = inputHandler;
    this.sprites = sprites;
  }

  void addBlock(int x, int y, int w, int h) {
    Block block = new Block(x, y, w, h, this, sprites);
    entities.add(block);
  }

  void addPotato(int x, int y, int w, int h) {
    Potato potato = new Potato(x, y, w, h, this, sprites);
    entities.add(potato);
  }

  
  void addRat(int x, int y, int w, int h) {
    Rat rat = new Rat(x, y, w, h, this, sprites);
    entities.add(rat);
  }


  void setPlayer(int x, int y, int w, int h) {
    player = new Player(x, y, w, h, this, inputHandler, sprites);
    entities.add(player);
  }

  void removeEntity(Entity entity) {
    entities.remove(entity);
  }

  void update() {
    List<Entity> objects = entities;
    for (int i = 0; i < objects.size(); i++) {
      if (i >= objects.size()) {
        break;
      }
      objects.get(i).update();
    }
  }

  void draw() {
    List<Entity> objects = entities;
    for (int i = 0; i < objects.size(); i++) {
      if (i >= objects.size()) {
        break;
      }
      objects.get(i).draw();
    }
  }
}
