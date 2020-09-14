
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
  
  Box getBox() {
    return new Box("stage", x, y, w, h);
  }
}



class Cube {
  float x, y;
  PImage img;
  
  Cube (float x_in, float y_in) {
    x = x_in;
    y = y_in;
    img = loadImage("block.png");
  }
  
  void display() {
    image(img, x, y, standard_size, standard_size); 
  }
  
  Box getBox() {
    return new Box("cube", x, y, standard_size, standard_size);
  }
}





void generateStage() {
  stage_objs.add(new Stage(0, 940, 2000, 100));
  stage_objs.add(new Stage(2000, 940, 2000, 100));
  stage_objs.add(new Stage(1400, 800, 50, 50));
  
  cubes.add(new Cube(900, 800));
  cubes.add(new Cube(900+standard_size, 800));
  cubes.add(new Cube(900+standard_size*2, 800));
}
