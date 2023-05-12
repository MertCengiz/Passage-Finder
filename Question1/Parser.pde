ArrayList <ArrayList<Line>> polygons = new ArrayList<ArrayList<Line>>();      // Store the lines of polygons, passages, and test lines in ArrayLists.
ArrayList <Line> passages = new ArrayList<Line>();                            // The numbers are not known, one has to use instead of arrays.
ArrayList <Line> testLines = new ArrayList<Line>();

int parseMode = 0;  // Create a variable to know parsing what type of line (polygon, passage, or test line).

void parseArray(String[] pieces){  
     
  if (pieces.length < 2)   // This happens only in the line is empty, increase the mode variable.
        parseMode++;
  else{
    if (parseMode == 0){  // Finds polygons by spitting according to ",", creates the lines.
      ArrayList<Line> lines = new ArrayList<>();
        for (int i = 0; i < (pieces.length - 1); i++){
          String[] pieceOfPieces = split(pieces[i], ",");
          String x1 = pieceOfPieces[0];
          String y1 = pieceOfPieces[1];
          pieceOfPieces = split(pieces[i + 1], ",");
          String x2 = pieceOfPieces[0];
          String y2 = pieceOfPieces[1];
          Line line = new Line(x1, x2, y1, y2);
          lines.add(line);
          stroke(0);  // Draws black
          line(float(x1) * 50, float(x2)*50, float(y1)*50, float(y2)*50); // Draws the polygon walls.
        }
        String[] pieceOfPieces = split(pieces[pieces.length - 1], ","); // Creates the last line with the same procedure above.
        String x1 = pieceOfPieces[0];
        String y1 = pieceOfPieces[1];
        pieceOfPieces = split(pieces[0], ",");
        String x2 = pieceOfPieces[0];
        String y2 = pieceOfPieces[1];
        Line line = new Line(x1, x2, y1, y2);
        lines.add(line);
        polygons.add(lines);
        line(float(x1)*50, float(x2)*50, float(y1)*50, float(y2)*50); // Draws the polygon walls.
    }
    else{
       String[] pieceOfPieces = split(pieces[0], ","); // Parse the tuple and creates lines and adds the related arraylist.
       String x1 = pieceOfPieces[0];
       String y1 = pieceOfPieces[1];
       pieceOfPieces = split(pieces[1], ",");
       String x2 = pieceOfPieces[0];
       String y2 = pieceOfPieces[1];
       if (parseMode == 1){ // Determines Passages.
         Line passage = new Line(x1, y1, x2, y2);   
         passages.add(passage);
         stroke(0, 255, 255); // Draws green & blue (turquoise)
         line(float(x1)*50, float(x2)*50, float(y1)*50, float(y2)*50); // Draws the passages.
       }
       else if (parseMode == 2){ // Determines Test Lines.
         Line test = new Line(x1, y1, x2, y2);    
         testLines.add(test);
         stroke(0, 255, 0); // Draws green
         line(float(x1)*50, float(x2)*50, float(y1)*50, float(y2)*50); // Draws the test lines.
       }
    }
  }
}
