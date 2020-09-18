
void stageGenerator(int stage_width) {
  float start_x = unit*20;
  int last_level = 0;
  for (int i=0; i<stage_width;) {
    int current_count = int(random(.9, 4));
    boolean generateCubes = random(1) > .4;

    if (generateCubes) {
      int current_level;
      if (i == 0) {
        current_level = int(random(15.9, 18));
      } else {
        current_level = int(random(last_level-3.1, 18));
      }
      boolean hasCoins = random(1) > .4;
      generateCubes(start_x+i*unit, unit*current_level, current_count, hasCoins);
      last_level = current_level;
    }
    
    i += current_count;
  }
}