/*
//Function Creates game map
*/

void loadMap(int[] pixels, int w, int h, int tw, int th, ObjectHandler handler) {
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++ ) {
      int loc = x + y * w;
      float c = pixels[loc];
      if (c == 0xFFFF0000) {
        handler.addBlock(x * tw, y * th, tw, th);
      }
      if (c == 0xFF0000FF) {
        handler.setPlayer(x * tw, y * th, tw, th);
      }
      if (c == 0xFFFF00FF) {
        handler.addRat(x * tw, y * th, tw, th);
      }
      if (c == 0xFFFFFFFF) {
        handler.addPotato(x * tw, y * th, tw, th);
      }
    }
  }
}
