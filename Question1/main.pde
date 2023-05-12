void setup() {
  size(1200, 600);
  translate(width /2 , height /2);
  background(150, 110, 50);
  parseFile();
}

void parseFile() {
  // Open the file with createWriter() object
  BufferedReader reader = createReader("input.txt");
  String outputMessage = "";
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line, ";");
      // Parse the array according to ";" then ","(inside parseArray()).
      parseArray(pieces);
      // Create the output message 
      outputMessage = eval(testLines, message);
    }
    reader.close();
    // Write the output to the output file.
    PrintWriter output = createWriter("output.txt");
    output.println(outputMessage); 
    output.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
} 
