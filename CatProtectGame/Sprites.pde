/*
//Class to load Sprites
*/

class Sprites {
  final PImage[][] sprites;

  Sprites(String path, int tileSize) {
    sprites = loadSprites(path, tileSize);
  }

  PImage getPotato() {
    return sprites[0][0];
  }

  PImage getBlock() {
    return sprites[0][1];
  }

  PImage getRat() {
    return sprites[1][0];
  }

  PImage[][] getPlayer() {
    PImage[][] player = {{sprites[3][0], sprites[3][0]}, {sprites[1][1], sprites[2][1]}, {sprites[2][0], sprites[2][0]}, {sprites[3][1], sprites[0][2]}};
    return player;
  }
  
  
  PImage[][] loadSprites(String path, int tileSize) {
    PImage spriteBlock = loadImage(path);
    PImage[][] sprites = new PImage[spriteBlock.width / tileSize][spriteBlock.height / tileSize];
    for (int x = 0; x < spriteBlock.width / tileSize; x ++) {
      for (int y = 0; y < spriteBlock.height / tileSize; y ++) {
        sprites[x][y] = spriteBlock.get(tileSize * x, tileSize * y, tileSize, tileSize);
      }
    }
    return sprites;
  }
}
