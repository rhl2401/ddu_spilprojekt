// X-value to shift all objects along x-axis
float world_x = 0;

// Stage objects 
ArrayList<Stage> stage_objs = new ArrayList<Stage>();


void setup() {
  size(1900, 1000);
  
  stage_objs.add(new Stage(20, 900, 1880, 50));
}

void draw() {
  clear(); 
  
  for (int i=0; i<stage_objs.size(); i++) {
    Stage obj = stage_objs.get(i);
    obj.display();
  }
}
