
boolean max_left = false;
boolean max_right = false;
boolean can_jump = true;
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
  boolean hitFlagpole = false;
  
  Mario(float x, float y) {
    location_x = x;
    location_y = y;
  }

  Box getBox() {
    rect(x, y, w, h);
    return new Box("player", x, y, w, h);
  }

  void update() {
    player.y += yspeed;
    player.x += xspeed;
    player.yspeed += g;
    if (player.yspeed < 0) {
      g = 0.6;
    } else {
      g = 0.4;
    }
  }

  void display() 
  {
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
    imageMode(CORNER);
  }

  void jump() { 
    if (can_jump) {
      {
        player.yspeed = -2;
        can_jump = false;
        keys[2] = true;
        playSound("jump");
      }
    }
  }

  void move() {
    
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
    
    if (keys[2] && can_jump) 
    {
      player.jump();
    }
  }

  void checkEdges() {

    if (y >= 900-h/2) {
      y = 900-h/2;
      yspeed *=0;
      can_jump = true;
      
    }
  }
}
