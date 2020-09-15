
boolean max_left = false;
boolean max_right = false;
boolean can_jump = false;
boolean right = false;
boolean left = false; 

class Mario {
  PVector location; 
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector gravity = new PVector(0, 0.3);

  Mario(float x, float y) {
    location = new PVector(x, y);
  }

  void update() {
    vel.add(acc);
    vel.add(gravity);
    vel.limit(10);
    location.add(vel);

    //vel.mult(0);

    acc.mult(0);
  }

  void display() {
    float w = 50;
    float h = 100;
    fill(48, 220, 255);
  }
  
  void direction() {
    if (right == true) {
       pushMatrix();
       translate(player.location.x,player.location.y);
       scale(1,1);
       imageMode(CENTER);
       image(mario_sprite,0,0,50,100);
       popMatrix();
    } else if (left == true) {
       pushMatrix();
       translate(player.location.x,player.location.y);
       scale(-1,1);
       imageMode(CENTER);
       image(mario_sprite,0,0,50,100);
       popMatrix();
    }
    
  }

  void jump() { 

    /*if (keyPressed) {
      //int jump_frames = frameCount;
      if (frameCount < frameCount+1) {
        acc = new PVector(0, 0);
        if (key == 'w' || key == 'W' && can_jump == true) {
          acc = new PVector(0, -10);
          can_jump = false;
          keys[2] =false; 
        }
      }
    }*/
  }

  void move(String direction) {
    if (direction == "right") {
      if (location.x > width_w*0.55) {
        world_x += player_move_speed;
      } else {
        location.x += player_move_speed;
      }
    } else if (direction == "left") {
      if (location.x < width_w*0.45) {
        world_x -= player_move_speed;
      } else {
        location.x -= player_move_speed;
      }
    }
  }


  void checkEdges() {

    if (location.y < 200) {
      location.y = 200;
    } else if (location.y > height-200) {
      location.y = height-200;
      can_jump = true;
    }
  }

  //Possible two-keys-at-once

 
}
