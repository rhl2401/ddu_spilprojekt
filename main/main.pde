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
boolean started = false;

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
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

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
  if (started == false) {
    image(mario_sprite, 900, 800, 50, 100);
  }

  // Update plyer object
  player.update();

  // Display scoreboard 
  score.display();


  /*if (keyPressed) {
   if (key == 'A' || key == 'a' && keys[0]) {
   player.move("left");
   keys[0]=true;
   } else if (key == 'D' || key == 'd') {
   player.move("right");
   keys[1] = true;
   //if (world_x < world_max) world_x += player_move_speed;
   } 
   }*/

  for (int i=0; i<stage_objs.size(); i++) {
    Stage obj = stage_objs.get(i);
    obj.display();
  }
  for (int i=0; i<cubes.size(); i++) {
    Cube obj = cubes.get(i);
    obj.display();
  }

  for (int i=0; i<pipes.size(); i++) {
    Pipe obj = pipes.get(i);
    obj.display();
  }



  player.display();
  player.jump();
  player.update();
  player.checkEdges();
  player.direction();

  println("acc: " + player.acc);
  println("vel: "+ player.vel);
}

void keyPressed() 
{
  started = true;
  if (key == 'A' || key == 'a') 
  {
    left = true;
    right = false;
    player.move("left");
    keys[0] = true;
  } 
  if (key == 'D' || key == 'd') 
  {
    left = false;
    right = true;
    player.move("right");
    keys[1] = true;
  }
  player.vel = new PVector(0, 0);
  if (key == 'w' || key == 'W' && can_jump == true) 
  {
    player.acc = new PVector(0, -10);
    can_jump = false;
    keys[2] =false;
  }


  /*if (frameCount < frameCount+1) {
   player.acc = new PVector(0, 0);
   if (key == 'w' || key == 'W' && can_jump == true) {
   player.acc = new PVector(0, -10);
   can_jump = false;
   keys[2] = true;
   }
   }*/
}

void keyReleased() 
{
  if (key == 'a' || key == 'A') keys[0] = false;
  if (key == 'd' || key == 'D') keys[1] = false;
  if (key == 'w' || key == 'W') keys[2] = false;
}
