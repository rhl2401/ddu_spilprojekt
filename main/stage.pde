
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



class Pipe {
  float x, y;
  PImage img, flower_img;
  boolean hasFlower = false;
  float flowerShowTime = 3;
  float flowerTimer;
  float y_coord = y;  //used for flower
  boolean can_kill; //used for flower

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
    if (hasFlower && player.canMove) flowerScript();
    image(img, x-world_x, y, unit*2, unit*3); 
  }
  
  void flowerScript() {
    float time = millis() % ((flowerShowTime + flowerTimer) * 1000);
    if (time < 500) {
      can_kill = true;
      y_coord = y - time/20;
    } else if (time > 2500 && time < 3000) {
      y_coord = y + (time-2000)/20;
    } else if (time > 3000) {
      can_kill = false;
    }
    image(flower_img, x-world_x+unit/2, y_coord-unit, unit, unit*1.5);
  }

  Box getBox() {
    return new Box("pipe", x-world_x, y_coord-unit, unit*2, unit*3);
  }
}



class Coin {
  float x, y;
  float w = unit*.8, h = unit*.8;
  PImage coin;
  
  Coin(float x_in, float y_in) {
    x = x_in; 
    y = y_in; 
    coin = loadImage("coin.png");
  }
  
  void display() {
    image(coin, x-world_x, y, w, h);
  }
  
  Box getBox() {
    return new Box("coin", x-world_x, y, w, h); 
  }
}





void generateCubes(float x, float y, int count) {
  generateCubes(x, y, count, false);
}

void generateCubes(float x, float y, int count, boolean withCoins) {
  for (int i=0; i<count; i++) {
    cubes.add(new Cube(x+unit*i, y));
    if (withCoins) {
      coins.add(new Coin(x+unit*i, y-unit));
    }
  }
}

void generateCoins(float x, float y, int count) {
  for (int i=0; i<count; i++) {
    coins.add(new Coin(x+unit*i, y));
  } 
}



void generateStage() {
  // Ground
  stage_objs.add(new Stage(-2000, unit*18, 2000, 100));
  stage_objs.add(new Stage(0, unit*18, 2000, 100));
  stage_objs.add(new Stage(2000, unit*18, 2000, 100));
  stage_objs.add(new Stage(4000, unit*18, 2000, 100));
  stage_objs.add(new Stage(6000, unit*18, 2000, 100));

  // Generate stage automatically
  stageGenerator(100);

  // Add a pipe!
  pipes.add(new Pipe(unit*23, unit*17, true));
}

class Confetti {
  PVector speed = new PVector(0, 0);
  PVector location;
  PVector vel;
  PVector acc; 
  float startAngle = 0;
  float angleVel = 0.23;
  float x, y;
  float aVel = 0.1; 
  float a;
  color col;
  boolean isAlive = true;
  float lifespan = 255;

  Confetti(float x, float y) {
    location = new PVector(x, y);
    vel = new PVector(random(-2, 2), random(-1, 1));
    acc = new PVector(0, 1);
    col = color(random(0, 255), random(0, 255), random(0, 255));
  }


  void update() {
    vel.add(acc);
    acc.limit(3);
    vel.limit(10);
    location.add(vel);
    acc.mult(0);
    lifespan -= 2;
    
  }

  void display() {
    a += aVel;
    pushMatrix();
    rectMode(CENTER);
    translate(location.x+flagpole.x-world_x+flagpole.w/1.3,flagpole.y+location.y);
    rotate(a);
    rect(0,0, 20,10);
    fill(col);
    stroke(0);
    popMatrix();
  }
}
