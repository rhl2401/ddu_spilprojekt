
boolean max_left = false;
boolean max_right = false;
boolean can_jump = true;

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
    vel.limit(8);
    location.add(vel);

    //vel.mult(0);

    acc.mult(0);
  }

  void display() {
    float w = 50;
    float h = 100;
    fill(48,220,255);
    
    image(mario_sprite,location.x,location.y, w,h);
  }

  void jump() { 

    if (keyPressed && can_jump == true) {
      int jump_frames = frameCount;
      if (frameCount < jump_frames+1) {
        acc = new PVector(0,0);
        if (key == 'w' || key == 'W') {
          acc = new PVector(0, -10);
          can_jump = false;
          keys[2] =false; 

          //} else {
          //  acc.mult(0);
        }
      }
    }
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
  /*
void keyReleased() {
   if (key == 'a')
   keys[0] = false;
   if (key == 'b') 
   keys[1] = false;
   if (key == 'w')
   keys[2] = false;
  }
  
void keyPressed() {
  if (key == 'A' || key == 'a') {
      player.move("left");
      keys[0]=true;
    } else if (key == 'D' || key == 'd') {
      player.move("right");
      keys[1] = true;
    } /// jump here
    
    int jump_frames = frameCount;
      if (frameCount < jump_frames+1) {
        player.acc = new PVector(0,0);
        if (key == 'w' || key == 'W') {
          player.acc = new PVector(0, -10);
          can_jump = false;
          keys[2] =false; 

          //} else {
          //  acc.mult(0);
        }
      }
  
}*/
}
