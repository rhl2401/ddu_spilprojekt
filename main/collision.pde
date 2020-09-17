
class Box {
  String tag;
  float x, y, w, h; 
  
  Box (String tag_in, float x_in, float y_in, float w_in, float h_in) {
    tag = tag_in;
    x = x_in;
    y = y_in;
    w = w_in;
    h = h_in;
  }  
}



boolean valueInRange(float val, float min, float max) {
  return (val >= min) && (val <= max);
}


boolean boxCollision(Box A, Box B) {
  boolean xOverlap = valueInRange(A.x, B.x, B.x+B.w) || valueInRange(B.x, A.x, A.x + A.w);
  boolean yOverlap = valueInRange(A.y, B.y, B.y+B.h) || valueInRange(B.y, A.y, A.y+A.h);
  return xOverlap && yOverlap;
}



float degreesBetween(Box A, Box B) {
  PVector b1_vec = new PVector(A.x+A.w/2, A.y+A.h/2);
  PVector b2_vec = new PVector(B.x+B.w/2, B.y+B.h/2);
  PVector vec_between = b2_vec.sub(b1_vec);
  PVector water_straight = new PVector(1, 0); 
  return degrees(PVector.angleBetween(water_straight, vec_between));
}


// Function to return a direction from an angle
String directionFromAngle(float angle) {
  String direction = "";
  if (angle > 315 || angle <= 45) direction = "right";
  if (angle > 45 && angle <= 135) direction = "bottom";
  if (angle > 135 && angle <= 225) direction = "left";
  if (angle > 225 && angle <= 315) direction = "top";
  return direction;
}


// Function to merge the two function above
String directionFromBoxes(Box A, Box B) {
  return directionFromAngle(degreesBetween(A, B));
}
