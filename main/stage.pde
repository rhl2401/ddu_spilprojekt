
class Stage {
  float x, y, w, h;
  PImage img;
  
  Stage (float x_in, float y_in, float w_in, float h_in) {
    x = x_in;
    y = y_in;
    w = w_in;
    h = h_in;
    img = loadImage("ground1.png");
  }
  
  void display() {
    image(img, x-world_x, y, w, h); 
  }
}
