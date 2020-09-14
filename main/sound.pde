
void playSound(String name) {
  playSound(name, 1.0);
}

void playSound(String name, float vol) {  
  int soundIndex = -1;
  
  for (int i=0; i<soundNames.size(); i++) {
    String soundName = soundNames.get(i);
    if (soundName.equals(name)) {
      soundIndex = i;
    }
  }
  
  if (soundIndex != -1) {
    SoundFile sound = soundFiles.get(soundIndex);
    sound.amp(vol);
    sound.play();
  }
  
}


void initSound() {
  soundFiles.add(new SoundFile(this, "overworld.mp3"));
  soundFiles.add(new SoundFile(this, "nsmb_course_clear.wav"));
  soundFiles.add(new SoundFile(this, "nsmb_coin.wav"));
  soundFiles.add(new SoundFile(this, "nsmb_fireball.wav"));
  soundFiles.add(new SoundFile(this, "nsmb_flagpole.wav"));
  soundFiles.add(new SoundFile(this, "nsmb_pipe.wav"));
  soundFiles.add(new SoundFile(this, "nsmb_power-up.wav"));
  soundFiles.add(new SoundFile(this, "nsmb_jump.wav"));
  
  soundNames.add("overworld");
  soundNames.add("stage_complete");
  soundNames.add("coin");
  soundNames.add("fireball");
  soundNames.add("flagpole");
  soundNames.add("pipe");
  soundNames.add("power_up");
  soundNames.add("jump");
}
