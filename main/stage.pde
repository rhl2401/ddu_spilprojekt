
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
    image(img, x-world_x, y, unit, unit); 
  }
  
  Box getBox() {
    return new Box("cube", x, y, unit, unit);
  }
}


void generateCubes(float x, float y, int count) {
  for (int i=0; i<count; i++) {
    cubes.add(new Cube(x+unit*i, y));
  }
}





void generateStage() {
  stage_objs.add(new Stage(0, unit*18, 2000, 100));
  stage_objs.add(new Stage(1900, unit*18, 2000, 100));
  
  generateCubes(unit*18, unit*15, 4);
  generateCubes(unit*24, unit*13, 3);
  generateCubes(unit*29, unit*11, 2);
  generateCubes(unit*35, unit*10, 3);
}
