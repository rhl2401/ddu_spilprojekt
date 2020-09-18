
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
    return new Box("stage", x-world_x, y, w, h);
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
    return new Box("cube", x-world_x-2, y-2, unit+4, unit+4);
  }
}


void generateCubes(float x, float y, int count) {
  for (int i=0; i<count; i++) {
    cubes.add(new Cube(x+unit*i, y));
  }
}



class Pipe {
  float x, y;
  PImage img, flower_img;
  boolean hasFlower = false;
  float flowerShowTime = 3;
  float flowerTimer;
  float y_coord = y;  // Used for flower

  Pipe (float x_in, float y_in) {
    x = x_in; 
    y = y_in; 
    y_coord = y;
    img = loadImage("warp_pipe.png");
  }

  Pipe (float x_in, float y_in, boolean pipeHasFlower) {
    x = x_in; 
    y = y_in; 
    y_coord = y;
    img = loadImage("warp_pipe.png");
    hasFlower = pipeHasFlower;

    if (hasFlower) {
      flower_img = loadImage("evil_flower.png");
      flowerTimer = random(3, 9);
    }
  }

  void display() {
    if (hasFlower) flowerScript();
    image(img, x-world_x, y, unit*2, unit*3); 
  }
  
  void flowerScript() {
    float time = millis() % ((flowerShowTime + flowerTimer) * 1000);
    if (time < 500) {
      y_coord = y - time/20;
    } else if (time > 2500 && time < 3000) {
      y_coord = y + (time-2000)/20;
    }
    image(flower_img, x-world_x+unit/2, y_coord-unit, unit, unit*1.5);
  }

  Box getBox() {
    
    return new Box("pipe", x-world_x, y_coord-unit, unit*2, unit*3);
  }
}



void generateStage() {
  stage_objs.add(new Stage(0, unit*18, 2000, 100));
  stage_objs.add(new Stage(1900, unit*18, 2000, 100));

  generateCubes(unit*18, unit*15, 4);
  generateCubes(unit*24, unit*13, 3);
  generateCubes(unit*29, unit*11, 2);
  generateCubes(unit*35, unit*10, 3);

  pipes.add(new Pipe(unit*23, unit*17, true));
}

class Confetti {
  PVector speed = new PVector(0,0);
  float startAngle = 0;
  float angleVel = 0.23;
  Confetti(float x_in, float y_in) {
    x_in = flagpole.x;
    y_in = flagpole.h;
    
  }
  
  void movement() {
    
    
    
  }
  
  void display() {
    
    pushMatrix();
    translate(flagpole.x, flagpole.h);
    color(random(0,255),random(0,255), random(0,255));
    rect(0,0,10,5);
    rotate(PI/4);
    popMatrix();
    
    
  }
  
  
}
