
static class RealMaths {
  // Method to return magnitude of a vector
  static float magnitude(PVector A) {
    return sqrt(pow(A.x, 2) + pow(A.y, 2) + pow(A.z, 2));
  }
  
  // Method to return angle between two vectors in radians or degrees
  static float angleBetween(PVector A, PVector B, boolean returnDegrees) {
    float dotProduct = A.x * B.x + A.y * B.y + A.z * B.z;
    float magnitudes = RealMaths.magnitude(A) * RealMaths.magnitude(B);
    return returnDegrees ? degrees(acos(dotProduct/magnitudes)) : acos(dotProduct/magnitudes);
  }
  
  // Method to return angle between two vectors in redians
  static float angleBetween(PVector A, PVector B) {
    return angleBetween(A, B, false);
  }
  
  // Method to return angle between two vectors in positive direction of rotation from vector A
  static float realAngleBetween2D(PVector A, PVector B) {
    PVector xAxis = new PVector(1,0);
    float angleA = (A.y < 0) ? 360-RealMaths.angleBetween(A,xAxis,true) : RealMaths.angleBetween(A,xAxis,true);
    float angleB = (B.y < 0) ? 360-RealMaths.angleBetween(B,xAxis,true) : RealMaths.angleBetween(B,xAxis,true);
    return (angleB - angleA > 0) ? angleB - angleA : 360 + angleB-angleA;
  }
  
  // Method to return realAngleBetween2D from a vector to horizontal/level
  static float realAngleBetween2D(PVector A) {
    PVector xAxis = new PVector(1,0);
    return realAngleBetween2D(A, xAxis);
  }
  
  // Method to return the vector between two vectors
  static PVector vectorBetween(PVector A, PVector B) {
    return A.sub(B);
  }
  
  // Method to return cross-vector
  static PVector crossVector(PVector A) {
    return new PVector(A.y * (-1), A.x);
  }
  
  // Method to return the unit vector of a vector
  static PVector unitVector(PVector A) {
    float scale = 1 / RealMaths.magnitude(A);
    return new PVector(A.x * scale, A.y * scale);
  }
  
  // Method to return cross product
  static PVector crossProduct(PVector A, PVector B) {
    float A_coord = A.y * B.z - A.z * B.y;
    float B_coord = A.z * B.x - A.x * B.z;
    float C_coord = A.x * B.y - A.y * B.x;
    return new PVector(A_coord, B_coord, C_coord);
  }
}
