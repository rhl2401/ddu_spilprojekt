
class ScoreBoard {
  int points = 0;
  
  ScoreBoard() {
    points = 100;
  }
  
  void display() {
    
    
    textSize(28);
    fill(255);
    text(nf(points, 8), 20, 40);
  }
  
  void addPoints (int count_points) {
    points += count_points;
  }
  
  void reset() {
    points = 0;
  }
  
}
