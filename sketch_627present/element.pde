class Element {
  int count=0;
  float x, y, s;
  float offsetX, offsetY;
  PFont font;
  char data[]={
    'a', 'à', 'b', 'c', 'd', 
    'e', 'è', 'é', 'f', 'g', 
    'h', 'i', 'ì', 'j', 'k', 
    'l', 'm', 'n', 'o', 'ò', 
    'p', 'q', 'r', 's', 't', 
    'u', 'ù', 'ü', 'v', 'w', 
    'x', 'y', 'z', 'A', 'B', 
    'C', 'D', 'E', 'F', 'G', 
    'H', 'I', 'J', 'K', 'L', 
    'M', 'N', 'O', 'P', 'Q', 
    'R', 'S', 'T', 'U', 'V', 
    'W', 'X', 'Y', 'Z', '0', 
    '1', '2', '3', '4', '5', 
    '6', '7', '8', '9', '%', 
    '/', '|', '\\', '(', ')', 
    '#', '?', '!', 'π', '*', 
    '+', '-', '_', ';', ':', 
    '^', '=', '$', '@', '"', 
    '<', '>'};
  Element() {
    x=0;
    y=0;
    s=10;
    font=createFont("andale-mono.ttf",12);
  }
  void display(int i, float _x, float _y) {
    pushMatrix();
    //translate(width/2,height/2);
    //for(int i=0;i<data.length;i++){
    //background(0);
    //textSize(20);
    textFont(font);
    fill(255);
    textAlign(CENTER, CENTER);
    text(data[i], _x, _y);
    //}
    popMatrix();
  }
}