

class Flagpole {
  float x, y, w, h;
  float house_y;
  PImage img, house;
  
  Flagpole (float x_in) {
    x = x_in;
    h = unit * 12;
    w = h / 3.215;
    y = (unit * 18) - h;
    house_y = y + unit*3;
    img = loadImage("flagpole.png");
    house = loadImage("house.png");
  }
  
  void display() {
    image(img, x-world_x, y, w, h);
    image(house, x-world_x+unit*18-w+w/3, house_y, w, h-unit*3);
  }
  
  Box getBox() {
    return new Box("flagpole", x-world_x+w/1.3, y, 15, h);
  }
  
  Box getTopBox() {
    return new Box("flagpole", x-world_x+w/1.3, y-unit, 15, 10);
  }
}
