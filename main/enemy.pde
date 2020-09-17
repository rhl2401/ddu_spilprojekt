

class Enemy {
  PVector e_location = new PVector();
  PVector dir;
  float enemy_vel = 1;
  float w = unit;
  float h = unit;
  boolean e_right = true;
  boolean e_left = false;

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

  void display_g() {
    //image(goomba_sprite, e_location.x-world_x, e_location.y, w, h);

    if (e_right == true) {
      pushMatrix();
      translate(e_location.x-world_x, e_location.y);
      scale(-1, 1);
      image(goomba_sprite, 0-w, 0, w, h);
      popMatrix();
    } else if (e_left == true) {
      pushMatrix();
      translate(e_location.x-world_x, e_location.y);
      scale(1, 1);
      image(goomba_sprite, 0, 0, w, h);
      popMatrix();
    }
  }

  Box getBox() {
    //rect(e_location.x-world_x, e_location.y, w, h);
    return new Box("goomba", e_location.x-world_x, e_location.y, w, h);
  }
}

class Koopa extends Enemy {
  Koopa(float x_in, float y_in) {
    super(x_in, y_in, unit, unit);
  }

  void display_k() {
    //image(goomba_sprite, e_location.x-world_x, e_location.y, w, h);

   if (e_right == true) {
      pushMatrix();
      translate(e_location.x-world_x, e_location.y);
      scale(-1, 1);
      image(koopa_sprite, 0-w, 0, w, h);
      popMatrix();
    } else if (e_left == true) {
      pushMatrix();
      translate(e_location.x-world_x, e_location.y);
      scale(1, 1);
      image(koopa_sprite, 0, 0, w, h);
      popMatrix();
    }
  }

  Box getBox() {
    //rect(e_location.x-world_x, e_location.y, w, h);
    return new Box("koopa", e_location.x-world_x, e_location.y, w, h);
  }
}
