

class Flagpole {
  float x, y, w, h;
  PImage img;
  
  Flagpole (float x_in) {
    x = x_in;
    h = unit * 12;
    w = h / 3.215;
    y = (unit * 18) - h;
    img = loadImage("flagpole.png");
  }
  
  void display() {
    image(img, x-world_x, y, w, h);
  }
  
  Box getBox() {
    return new Box("flagpole", x-world_x+w/1.3, y, w, h);
  }
}
