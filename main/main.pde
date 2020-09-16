
// Import sound library
import processing.sound.*;
ArrayList<SoundFile> soundFiles = new ArrayList<SoundFile>();
ArrayList<String> soundNames = new ArrayList<String>();

//Mario attributes 
float jump_speed = 15;

// X-value to shift all objects along x-axis
float world_x = 0;
float world_max = 9000;
int width_w = 1900;
int height_w = 1000;
float player_move_speed = 8;
float unit = 50;
boolean started = false;

boolean[] keys;

// Score
ScoreBoard score = new ScoreBoard();

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
  goomba_sprite = loadImage("goomba.png");
  player = new Mario(900, 800);

  initSound();
  playSound("overworld", 0.5);

  goombas.add(new Goomba(900, 800));
  goombas.add(new Goomba(1000, 800));

  generateStage();
}


void draw() {

  clear();   
  background(48, 220, 255);
  if (started == false) {
    image(mario_sprite, 900, 800, 50, 100);
  }
  // Display scoreboard 
  score.display();

  // Loop through all objects in arraylists and display them
  for (Stage s : stage_objs) s.display();
  for (Cube c : cubes) c.display();
  for (Pipe p : pipes) p.display();
  for (Goomba g : goombas) {
    g.movement();
    g.display();
  }

  //player attributes
  player.display();
  player.update();
  player.move();
  player.checkEdges();
  //println(can_jump);
  //println(player.location.y);
  println(keys);
}

void keyPressed() 
{
  started = true;
  if (key == 'A' || key == 'a') 
  {
    left = true;
    right = false;
    //player.move();
    keys[0] = true;
  } 
  if (key == 'D' || key == 'd') 
  {
    left = false;
    right = true;
    //player.move();
    keys[1] = true;
  }

  if ((key == 'w' || key == 'W') && can_jump) 
  {
    player.yspeed = -jump_speed;
    can_jump = false;
    keys[2] = true;
    playSound("jump");
  }
}

void keyReleased() 
{
  if (key == 'a' || key == 'A') keys[0] = false;
  if (key == 'd' || key == 'D') keys[1] = false;
  if (key == 'w' || key == 'W') keys[2] = false;
}
