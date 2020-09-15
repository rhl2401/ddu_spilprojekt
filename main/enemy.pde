
class Enemy {
  PVector e_location = new PVector();
  PVector dir;
  float enemy_vel = 1;
  float w = 10;
  float h = 10;
  
  Enemy (float x_in, float y_in, float w_in, float h_in) {
    
    e_location.x = x_in;
    e_location.y = y_in;
    w = w_in;
    h = h_in;
  }

  void movement() {
    e_location = new PVector(e_location.x, e_location.y);
    dir = new PVector(-enemy_vel, 0);
    e_location.add(dir);
  }

}

class Goomba extends Enemy {
  
    Goomba(float x_in, float y_in) {
      super(x_in, y_in, unit, unit);
    }
    
    void display() {
      image(goomba_sprite,e_location.x-world_x,e_location.y, w, h);
    }
  }