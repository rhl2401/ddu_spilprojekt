
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

float total_time = 100;

boolean[] keys;

// Score
ScoreBoard score;

// Mario image
PImage mario_sprite;
// Goomba image
PImage goomba_sprite;
// Koopa image
PImage koopa_sprite;
// Koopa shell image
PImage koopa_shell_sprite;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();
ArrayList<Cube> cubes = new ArrayList<Cube>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
ArrayList<Coin> coins = new ArrayList<Coin>();

//Confetti
ArrayList <Confetti> confetti = new ArrayList<Confetti>();
ArrayList <Confetti> particle;

// NPCs
ArrayList<Goomba> goombas = new ArrayList<Goomba>();
ArrayList<Koopa> koopas = new ArrayList<Koopa>();
ArrayList<Mario> marios = new ArrayList<Mario>();

Mario player;
Flagpole flagpole;



void setup() {
  size(1900, 1000);
  frameRate(60);
  particle = new ArrayList<Confetti>();
  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false; 
  mario_sprite = loadImage("mario.png");
  goomba_sprite = loadImage("goomba.png");
  koopa_sprite = loadImage("koopa_sprite.png");
  koopa_shell_sprite = loadImage("koopa_shell_sprite.png"); 
  player = new Mario(900, 800);

  score = new ScoreBoard();

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
    image(mario_sprite, 900, 800, player.w, player.h);
  }
  // Display scoreboard 
  score.display();

  //Display confetti
  if (conf) {
    confetti.add(new Confetti(flagpole.x-100, flagpole.h-100));
    for (int i = 0; i< confetti.size(); i++) {
      Confetti c = confetti.get(i);
      c.display();
    }
  }

  println(confetti.size());

  // Loop through all objects in arraylists and display them
  for (Stage s : stage_objs) s.display();
  for (Cube c : cubes) c.display();
  for (Pipe p : pipes) p.display();
  for (Coin c : coins) c.display();

  //initializing goombas
  for (Goomba g : goombas) {
    if (player.canMove) g.movement();
    g.display_g();
    g.display_g_flat();
    g.goomba_animation();
  }

  //initializing koopas
  for (Koopa k : koopas) {
    if (player.canMove) k.movement();
    k.display_k();
    k.display_k_flat();
    k.koopa_animation();
  }

  //Checks for collision between objects mario and goomba
  for (int i =0; i<goombas.size(); i++) {
    Goomba goomm = goombas.get(i);
    if (boxCollision(player.getBox(), goomm.getBox())) {
      if ((directionFromBoxes(player.getBox(), goomm.getBox()) == "right") && goomm.e_isAlive) {
        player.dies();
      } else if ((directionFromBoxes(player.getBox(), goomm.getBox()) == "left") && goomm.e_isAlive) {
        player.dies();
      } else if ((directionFromBoxes(player.getBox(), goomm.getBox()) == "top") && goomm.e_isAlive) {
        player.dies();
      } else if (directionFromBoxes(player.getBox(), goomm.getBox()) == "bottom") {
        score.addPoints(100);
        goomm.e_isAlive = false;
        println(goomm.e_isAlive);
        player.yspeed = -2;
        if (goomm.animation_complete) {
          goombas.remove(i);
        }
      }
    }
  }

  //Chekcks for collision between Mario and stage
  for (Stage s : stage_objs) {   
    if (boxCollision(player.getBox(), s.getBox())) {
      boxCollision(player.getBox(), s.getBox());
      player.yspeed = 0;
      player.y = unit*18-player.h;
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
          goom.e_right = false;
          goom.e_left = true;
          goom.enemy_vel *= -1;
        } else if (directionFromBoxes(goom.getBox(), pip.getBox()) == "left") {
          goom.e_right = true;
          goom.e_left = false;
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
          koo.e_right = false;
          koo.e_left = true;
          koo.enemy_vel *= -1;
        } else if (directionFromBoxes(koo.getBox(), pip.getBox()) == "left") {
          koo.e_right = true;
          koo.e_left = false;
          koo.enemy_vel *= -1;
        }
      }
    }
  }

  //Checks for collision between Mario and koopas
  for (int i=0; i<koopas.size(); i++) {
    Koopa koop = koopas.get(i);
    if (boxCollision(player.getBox(), koop.getBox())) {
      println(directionFromBoxes(player.getBox(), koop.getBox()));
      if (directionFromBoxes(player.getBox(), koop.getBox()) == "right") {
        player.dies();
      } else if (directionFromBoxes(player.getBox(), koop.getBox()) == "left") {
        player.dies();
      } else if (directionFromBoxes(player.getBox(), koop.getBox()) == "top") {
        player.dies();
      } else if (directionFromBoxes(player.getBox(), koop.getBox()) == "bottom") {
        score.addPoints(100);
        player.yspeed = -2;
        koop.e_isAlive = false;

        if (!koop.e_isAlive) {
          koop.koopa_shell = true;
        }

        if (koop.animation_complete) {
          koopas.remove(i);
        }
      }
    }
  }


  //Checks for collision between Mario and pipes
  for (int i=0; i<pipes.size(); i++) {
    Pipe pi = pipes.get(i);
    if (boxCollision(player.getBox(), pi.getBox())) {
      if (directionFromBoxes(player.getBox(), pi.getBox()) == "left") {
      } else if (directionFromBoxes(player.getBox(), pi.getBox()) == "right") {
      } else if (directionFromBoxes(player.getBox(), pi.getBox()) == "bottom") {
        player.yspeed = 0;
        can_jump = true;
      }
    } else {
      player_move_speed = 8;
    }
  }

  if (conf) {
    particle.add(new Confetti(0, 0));
    for (int i = 0; i < particle.size(); i++) {
      Confetti p = particle.get(i);

      if (p.lifespan < 0) {
        p.isAlive = false;
      }
      if (!p.isAlive) {
        particle.remove(i);
      }

      p.update();
      p.display();
      println(particle.size());
    }
  }

  flagpole.display();

  //player attributes
  if (player.isAlive) {
    player.display();
    player.update();
    player.move();
  }
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
