
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

boolean boxCollision(Box b1, Box b2) {
    if ((b1.x + b1.w > b2.x && 
       b1.x + b1.w < b2.x + b2.w && 
       b1.y + b1.h > b2.y && 
       b1.y + b1.h < b2.y + b2.h) ||
       (b2.x + b2.w > b1.x && 
       b2.x + b2.w < b1.x + b1.w && 
       b2.y + b2.h > b1.y && 
       b2.y + b2.h < b1.y + b1.h)) {
     return true; 
   } else {
     return false;
   }
}



float degreesBetween(Box b1, Box b2) {
  PVector b1_vec = new PVector(b1.x+b1.w/2, b1.y+b1.h/2);
  PVector b2_vec = new PVector(b2.x+b2.w/2, b2.y+b2.h/2);
  PVector vec_between = b2_vec.sub(b1_vec);
  PVector water_straight = new PVector(1, 0); 
  return degrees(PVector.angleBetween(water_straight, vec_between));
}
