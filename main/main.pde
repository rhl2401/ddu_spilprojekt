//Import sound library
import processing.sound.*;
ArrayList<SoundFile> soundFiles = new ArrayList<SoundFile>();
ArrayList<String> soundNames = new ArrayList<String>();

// X-value to shift all objects along x-axis
float world_x = 0;
float world_max = 9000;
int width_w = 1900;
int height_w = 1000;
float player_move_speed = 8;
float unit = 50;

PVector gravity = new PVector(0, 4);
boolean[] keys;

// Score
ScoreBoard score = new ScoreBoard();

// Bagground image
PImage background;
// Mario image
PImage mario_sprite;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();
ArrayList<Cube> cubes = new ArrayList<Cube>();

Mario player;

  

void setup() {
  size(1900, 1000);
  frameRate(60);
  
  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false; 
  mario_sprite = loadImage("mario.png");
  player = new Mario(900, 800);
  
  initSound();
  playSound("overworld", 0.5);
  
  generateStage();
}


void draw() {

  clear();   
  background(48, 220, 255);
  
  // Update plyer object
  player.update();
 
  // Display scoreboard 
  score.display();


  if (keyPressed) {
    if (key == 'A' || key == 'a') {
      player.move("left");
      keys[0]=true;
    } else if (key == 'D' || key == 'd') {
      player.move("right");
      keys[1] = true;
      if (world_x < world_max) world_x += player_move_speed;
    } 
  }





  for (int i=0; i<stage_objs.size(); i++) {
    Stage obj = stage_objs.get(i);
    obj.display();
  }
  for (int i=0; i<cubes.size(); i++) {
    Cube obj = cubes.get(i);
    obj.display();
  }
  
  
  player.display();
  player.jump();
  player.update();
  player.checkEdges();
}
