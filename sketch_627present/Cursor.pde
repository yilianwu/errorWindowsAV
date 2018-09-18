class Cursor{
  float px;
  float py;
  int s;
  PShape cursor;
  Cursor(){
    cursor=loadShape("cursor.svg");
  }

  void display(int _s){
    pushMatrix();
    translate(mouseX,mouseY);
    scale(_s);
    shape(cursor,0,0,40,40);
    popMatrix();
  }
  
}