class Line{

  float x1;
  float x2;
  float y1;
  float y2;
  
  // Create a line with values below.
  
  Line(String xOne, String xTwo, String yOne, String yTwo){
    x1 = float(xOne);
    x2 = float(xTwo);
    y1 = float(yOne);
    y2 = float(yTwo);
  }
  
  // Find the distance (For the test points)
  
  float lineDistance(){
    float dist = sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
    return dist; 
  }
  
}
