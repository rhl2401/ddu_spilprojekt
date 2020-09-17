
// Import sound library
import processing.sound.*;
ArrayList<SoundFile> soundFiles = new ArrayList<SoundFile>();
ArrayList<String> soundNames = new ArrayList<String>();

//Mario attributes 
float jump_speed = 15;

// Sound turn on/off
boolean soundOn = true;
SoundFile main_theme;

// X-value to shift all objects along x-axis
float world_x = 0;
float world_max = 9000;
int width_w = 1900;
int height_w = 1000;
float player_move_speed = 8;
float unit = 50;
boolean started = false;
float stand = 0;

boolean[] keys;

// Score
ScoreBoard score = new ScoreBoard();

// Mario image
PImage mario_sprite;
// Goomba image
PImage goomba_sprite;
// Koopa image
PImage koopa_sprite;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();
ArrayList<Cube> cubes = new ArrayList<Cube>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

// NPCs
ArrayList<Goomba> goombas = new ArrayList<Goomba>();
ArrayList<Koopa> koopas = new ArrayList<Koopa>();

Mario player;
Flagpole flagpole;



void setup() {
  size(1900, 1000);
  frameRate(60);

  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false; 
  mario_sprite = loadImage("mario.png");
  goomba_sprite = loadImage("goomba.png");
  koopa_sprite = loadImage("koopa_sprite.png");
  player = new Mario(900, 800);

  initSound();
  if (soundOn) {
    main_theme = soundFiles.get(0);
    main_theme.amp(.3);
    main_theme.play();
  }

  //Adding elements to stage
  goombas.add(new Goomba(1500, 850));
  goombas.add(new Goomba(1400, 850));
  koopas.add(new Koopa(1600, 850));
  koopas.add(new Koopa(1700, 850));

  flagpole = new Flagpole(2000);

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
    g.display_g();
  }

  for (Koopa k : koopas) {
    k.movement();
    k.display_k();
  }

  //Checks for collision between objects mario and goomba
  for (int i =0; i<goombas.size(); i++) {
    Goomba goomm = goombas.get(i);
    if (boxCollision(player.getBox(), goomm.getBox())) {
      if (directionFromBoxes(player.getBox(), goomm.getBox()) == "right") {
      }
    }
  }

  //Chekcks for collision between Mario and stage
  for (Stage s : stage_objs) {   
    if (boxCollision(player.getBox(), s.getBox())) {
      boxCollision(player.getBox(), s.getBox());
      player.yspeed = 0;
      player.y = unit*16;
      can_jump = true;
    }
  }

  //Checks for collision between goombas and pipe
  for (int i=0; i<goombas.size(); i++) {
    Goomba goom = goombas.get(i);
    for (int j=0; j<pipes.size(); j++) {
      Pipe pip = pipes.get(j);
      if (boxCollision(goom.getBox(), pip.getBox())) {
        if (directionFromBoxes(goom.getBox(), pip.getBox()) == "right") {
          goom.enemy_vel *= -1;
        } else if (directionFromBoxes(goom.getBox(), pip.getBox()) == "left") {
          goom.enemy_vel *= -1;
        }
      }
    }
  }

  //Checks for collision between koopas and pipe
  for (int i=0; i<koopas.size(); i++) {
    Koopa koo = koopas.get(i);
    for (int j=0; j<pipes.size(); j++) {
      Pipe pip = pipes.get(j);
      if (boxCollision(koo.getBox(), pip.getBox())) {
        if (directionFromBoxes(koo.getBox(), pip.getBox()) == "right") {
          koo.enemy_vel *= -1;
        } else if (directionFromBoxes(koo.getBox(), pip.getBox()) == "left") {
          koo.enemy_vel *= -1;
        }
      }
    }
  }

  //Checks for collision between Mario and koopas
  for (int i =0; i<koopas.size(); i++) {
    Koopa koop = koopas.get(i);
    if (boxCollision(player.getBox(), koop.getBox())) {
      if (directionFromBoxes(player.getBox(), koop.getBox()) == "right") {
      }
    }
  }

  flagpole.display();
  //player attributes
  player.display();
  player.update();
  player.move();
  println(player.location_y);
  
}






void keyPressed() 
{
  started = true;
  if (key == 'A' || key == 'a') 
  {
    left = true;
    right = false;
  
    keys[0] = true;
  } 
  if (key == 'D' || key == 'd') 
  {
    left = false;
    right = true;
    
    keys[1] = true;
  }

  if (key == 'w' || key == 'W') 
  {
    keys[2] = true;
  }
}

void keyReleased() 
{
  if (key == 'a' || key == 'A') keys[0] = false;
  if (key == 'd' || key == 'D') keys[1] = false;
  if (key == 'w' || key == 'W') keys[2] = false;
}
