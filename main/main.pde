// X-value to shift all objects along x-axis
float world_x = 0;
float world_max = 9000;
int width_w = 1900;
int height_w = 1000;
float player_move_speed = 8;
PVector gravity = new PVector(0, 4);
boolean[] keys;

// Bagground image
PImage background;
// Mario image
PImage mario_sprite;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();

Mario player;

  

void setup() {
  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false; 
  size(1900, 1000);
  frameRate(30);
  background = loadImage("background.png");
  mario_sprite = loadImage("mario.png");
  player = new Mario(900, 800);

  stage_objs.add(new Stage(0, 940, 1880, 100));
  stage_objs.add(new Stage(1400, 800, 50, 50));
}


void draw() {
  clear(); 
  player.update();


 
  
  if (keyPressed) {
    if (key == 'A' || key == 'a') {
      player.move("left");
      keys[0]=true;
    } else if (key == 'D' || key == 'd') {
      player.move("right");
      keys[1] = true;
    } 
  }





  for (int i=0; i<stage_objs.size(); i++) {
    Stage obj = stage_objs.get(i);
    obj.display();
  }

  player.display();
  player.jump();
  player.update();
  player.checkEdges();
  
  
}
