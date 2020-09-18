
class ScoreBoard {
  int points = 0;
  int coins = 0;
  PImage coin, clock;

  ScoreBoard() {
    coin = loadImage("coin.png");
    clock = loadImage("clock.png");
  }

  void display() {
    textSize(28);
    fill(255);
    text(nf(points, 8), 20, 40);
    image(coin, 20, 60, 40, 40);
    text("X " + nf(coins, 2), 70, 90);
    
    int current_time = int((total_time*1000-millis())/1000);
    image(clock, 1900-150, 20, 40, 40);
    text(nf(current_time, 3), 1800, 50);
  }

  void addPoints (int count_points) {
    points += count_points;
  }

  void reset() {
    points = 0;
  }
}
