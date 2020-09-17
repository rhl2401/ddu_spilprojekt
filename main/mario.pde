
boolean max_left = false;
boolean max_right = false;
boolean can_jump;/* = true;*/
boolean right = false;
boolean left = false; 

class Mario {
  float location_x; 
  float location_y;
  float x = 900, y=800;
  float g = 0.5;
  float yspeed, xspeed;
  float w = unit;
  float h = unit*2;
  boolean canMove = true;
  boolean hitFlagpole = false;
  boolean playedFlagpoleSlide = false;
  boolean playedComplete = false;
  int flagTimer;
  
  Mario(float x, float y) {
    location_x = x;
    location_y = y;
  }

  Box getBox() {
    return new Box("player", x, y, w, h);
  }

  void update() {
    if (canMove) {
      player.y += yspeed;
      player.x += xspeed;
      player.yspeed += g;
      if (player.yspeed < 0) {
        g = 0.6;
      } else {
        g = 0.4;
      }
    }
    
    
    // Mario collision with cubes
    Box playerBox = player.getBox();
    for (int i=0; i<cubes.size(); i++) {
      Cube c = cubes.get(i);
      if (boxCollision(playerBox, c.getBox())) {
        Box b = c.getBox();
        String dir = directionFromBoxes(playerBox, b);
        println(dir);
        if (dir == "bottom") {
          player.y = b.y - player.h;
          yspeed = 0;
          can_jump = true;
        } //Other angles
      }
    }
  }


  void display() {
    if (right == true) {
      pushMatrix();
      translate(player.x, player.y);
      scale(1, 1);
      image(mario_sprite, 0, 0, 50, 100);
      popMatrix();
    } else if (left == true) {
      pushMatrix();
      translate(player.x, player.y);
      scale(-1, 1);
      image(mario_sprite, 0-w, 0, 50, 100);
      popMatrix();
    }
  }

  void jump() { 
    if (can_jump) {
      {
        player.yspeed = -15;
        can_jump = false;
        keys[2] = true;
        playSound("jump");
      }
    }
  }

  void move() {
    if (canMove) {
      if (keys[1]) {
        if (player.x > width_w*0.55) {
          world_x += player_move_speed;
        } else {
          player.x += player_move_speed;
        }
      } 
      if (keys[0]) 
      {
        if (player.x < width_w*0.45) {
          world_x -= player_move_speed;
        } else {
          player.x -= player_move_speed;
        }
      }
    }

    // Mario hits flagpole, stop and fix position for 1 sek
    if (boxCollision(player.getBox(), flagpole.getBox()) && !hitFlagpole) {
      canMove = false;
      hitFlagpole = true;
      flagTimer = millis();
      if (soundOn) main_theme.stop();
    }
    
    // Mario is fixed on flagpole. Play sound and slide downwards
    if (millis()-flagTimer > 1000 && y < unit*16 && hitFlagpole) {
      y += 5;
      if (!playedFlagpoleSlide) { 
        playSound("flagpole"); 
        playedFlagpoleSlide = true;
      }
    }
    
    // Mario has slid down the pole, play cource_clear and run away!
    if (y > unit*16-5 && hitFlagpole && millis()-flagTimer > 2000) {
      if (!playedComplete) {
        playSound("stage_complete_classic");
        playedComplete = true;
      }
      
      if (millis()-flagTimer > 2300) {
        x += player_move_speed;
      }
    }
  }


  void checkEdges() {
    if (y >= 900-h) {
      y = 900-h;
      yspeed *=0;
      can_jump = true;
      
    }
  }
}
