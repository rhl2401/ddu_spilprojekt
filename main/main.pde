// X-value to shift all objects along x-axis
float world_x = 0;
float world_max = 9000;
float player_move_speed = 8;
float standard_size = 50;

// Bagground image
PImage background;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();


void setup() {
  size(1900, 1000);
  background = loadImage("background.png");
  
  stage_objs.add(new Stage(0, 940, 1880, 100));
  stage_objs.add(new Stage(1400, 800, 50, 50));
}


void draw() {
  clear(); 
  
   // Display background and for it to move slowly, only move 1/3 of the other elements
  image(background, -world_x/5, 0, 2500, 1000);

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
}
