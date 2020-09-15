
// Import sound library
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
// Goomba imgage
PImage goomba_sprite;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();
ArrayList<Cube> cubes = new ArrayList<Cube>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

// NPCs
ArrayList<Goomba> goombas = new ArrayList<Goomba>();

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
  
  stage_objs.add(new Stage(0, 940, 1880, 100));
  stage_objs.add(new Stage(1400, 800, 50, 50));
  
  initSound();
  playSound("overworld", 0.5);
  
  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false; 
  mario_sprite = loadImage("mario.png");
  goomba_sprite = loadImage("goomba.png");
  player = new Mario(900, 800);
  
  goombas.add(new Goomba(900, 800));
  goombas.add(new Goomba(1000, 800));
  
  
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
    } 
  }



  // Loop through all objects in arraylists and display them
  for (Stage s : stage_objs) s.display();
  for (Cube c : cubes) c.display();
  for (Pipe p : pipes) p.display();
  
  for (Goomba g : goombas) {
    g.movement();
    g.display();
  }
  

  player.display();
  player.jump();
  player.update();
  player.checkEdges();
}
