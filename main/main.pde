//Import sound library
import processing.sound.*;
ArrayList<SoundFile> soundFiles = new ArrayList<SoundFile>();
ArrayList<String> soundNames = new ArrayList<String>();

// X-value to shift all objects along x-axis
float world_x = 0;
float world_max = 9000;
float player_move_speed = 8;
float unit = 50;

// Score
ScoreBoard score = new ScoreBoard();

// Bagground image
PImage background;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();
ArrayList<Cube> cubes = new ArrayList<Cube>();


void setup() {
  size(1900, 1000);
  background = loadImage("background.png");
  
  initSound();
  playSound("overworld", 0.5);
  
  generateStage();
}


void draw() {
  clear();   
  
  // Display background and for it to move slowly, only move 1/3 of the other elements
  background(48, 220, 255);
  //image(background, -world_x/5, 0, 2500, 1000);
  
  // Display scoreboard 
  score.display();

  // Detect any keypress
  if (keyPressed) {
    if (key == 'A' || key == 'a') {
      if (world_x > 0) world_x -= player_move_speed;
    } else if (key == 'D' || key == 'd') {
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
}
