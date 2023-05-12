String message = "";

double XValue;  // A global variable detects intersection points.
double YValue;  // A global variable detects intersection points.

String eval(ArrayList <Line> lines, String message){
  ArrayList<double[]> intersectionPts = new ArrayList<>();  
  for (int i = 0; i < lines.size(); i++){
    boolean hasEntered = false; // If it hasn't entered the "if" clause below, it means there is no intersection.
    if (lines.get(i).lineDistance() <= 1){      
       for (int j = 0; j < polygons.size(); j++) {
         for (int k = 0; k < polygons.get(j).size(); k++){
          // Find the intersection point between polygon lines and test points
           if (findIntersectionPoint (lines.get(i), polygons.get(j).get(k))){
              double[] points = {XValue, YValue}; 
              intersectionPts.add(points);
              hasEntered = true;
           }
         }
       }
       if (!hasEntered){
         message = message + "1\n";
         continue;
       }
       for (int j = 0; j < passages.size(); j++){
          if (findIntersectionPoint(lines.get(i), passages.get(j))){
              for (int k = 0; k < intersectionPts.size(); k = k + 3){
               // If the intersection point between polygon and test line overlaps the intersection
               // the message becomes "1" and continues iteration.
                  if (intersectionPts.get(k)[0] == XValue && intersectionPts.get(k)[1] == YValue){
                      message = message + "1\n";
                      continue;
                  }
              }
          }
       }    
    }
    message = message + "0\n";
  }
  return message;
}
boolean findIntersectionPoint (Line line1, Line line2){
    // Find the line equation a1x + b1y = c1
    double a1 = line1.y2 - line1.y1;
    double b1 = line1.x1 - line1.x2;
    double c1 = (a1 * (line1.x1)) + (b1 * (line1.y1));
    // Find the line equation a2x + b2y = c2
    double a2 = line2.y2 - line2.y1;
    double b2 = line2.x1 - line2.x2;
    double c2 = (a2 * (line2.x1)) + (b2 * (line2.y1));
    // Find the determinant and then intersection points.
    double determinant = a1*b2 - a2*b1;
    if (determinant != 0){
      double x = (b2*c1 - b1*c2)/determinant;
      double y = (a1*c2 - a2*c1)/determinant;
      if (((line1.x1 <= x && x <= line1.x2) || (line1.x2 <= x  && x <= line1.x1)) && ((line1.y1 <= y && y <= line1.y2) || (line1.y2 <= y  && y <= line1.y1))){
          XValue = x;
          YValue = y;
          return true;
      }
    }
    return false;
}
