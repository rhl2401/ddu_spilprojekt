<<<<<<< Updated upstream
=======
 //Import sound library
import processing.sound.*;
ArrayList<SoundFile> soundFiles = new ArrayList<SoundFile>();
ArrayList<String> soundNames = new ArrayList<String>();

>>>>>>> Stashed changes
// X-value to shift all objects along x-axis
float world_x = 0;
float world_max = 9000;
float player_move_speed = 8;

// Bagground image
PImage background;
<<<<<<< Updated upstream
=======
// Mario image
PImage mario_sprite;
// Goomba imgage
PImage goomba_sprite;

>>>>>>> Stashed changes

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();

<<<<<<< Updated upstream
=======
Mario player;
Goomba enemy1;
Goomba enemy2;
  
>>>>>>> Stashed changes

void setup() {
  size(1900, 1000);
  background = loadImage("background.png");
  
<<<<<<< Updated upstream
  stage_objs.add(new Stage(0, 940, 1880, 100));
  stage_objs.add(new Stage(1400, 800, 50, 50));
=======
  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false; 
  mario_sprite = loadImage("mario.png");
  goomba_sprite = loadImage("goomba.png");
  player = new Mario(900, 800);
  enemy1 = new Goomba(900,800);
  enemy2 = new Goomba(1000,800);
  
  initSound();
  playSound("overworld", 0.5);
  
  generateStage();
>>>>>>> Stashed changes
}


void draw() {
  clear(); 
  
   // Display background and for it to move slowly, only move 1/3 of the other elements
  image(background, -world_x/5, 0, 2500, 1000);

  // Detect any keypress
  if (keyPressed) {
    if (key == 'A' || key == 'a') {
      if (world_x > 0) world_x -= player_move_speed;
    } else if (key == 'D' || key == 'd') {
<<<<<<< Updated upstream
      if (world_x < world_max) world_x += player_move_speed;
    }
  }
  
  
=======
      player.move("right");
      keys[1] = true;
      //if (world_x < world_max) world_x += player_move_speed;
    } 
  }



>>>>>>> Stashed changes
  for (int i=0; i<stage_objs.size(); i++) {
    Stage obj = stage_objs.get(i);
    obj.display();
  }
<<<<<<< Updated upstream
=======
  for (int i=0; i<cubes.size(); i++) {
    Cube obj = cubes.get(i);
    obj.display();
  }
  
  
  player.display();
  player.jump();
  player.update();
  player.checkEdges();
  enemy1.display();
  enemy1.movement();
  enemy2.movement();
  enemy2.display();
>>>>>>> Stashed changes
}
