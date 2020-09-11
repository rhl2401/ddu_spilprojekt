
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


static String[] BoxCollider(Box b1, Box b2) {
  String[] arr = new String[4];
  if ((b1.x + b1.w > b2.x && 
       b1.x + b1.w < b2.x + b2.w && 
       b1.y + b1.h > b2.y && 
       b1.y + b1.h < b2.y + b2.h) ||
       (b2.x + b2.w > b1.x && 
       b2.x + b2.w < b1.x + b1.w && 
       b2.y + b2.h > b1.y && 
       b2.y + b2.h < b1.y + b1.h)) {
     
     arr[0] = "true";
     arr[1] = b1.tag;
     arr[2] = b2.tag;
     arr[3] = "Noget her"; 
   } else {
     arr[0] = "false";
   }
   
   return arr;
}
