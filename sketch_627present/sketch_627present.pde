import netP5.*;
import oscP5.*;
OscP5 ip;
NetAddress remote;
pdLine kick;
int num=40;
Element elements[]=new Element[num];
Cursor[] mycursor=new Cursor[500];
PImage errorwin;
int i=0;
int count=0;
float winx=-2000;
float winy=-2000;
float offsetX;
float offsetY;
int rand;
int count1=0;
boolean asciistate=false;
void setup() {
  //size(800, 800);
  fullScreen();
  background(0);
   for (int i=0; i<num; i++) {
    elements[i]=new Element();
  }
  offsetX=width/num;
  offsetY=height/num;
  ip = new OscP5(this, 9000);
  kick=new pdLine(0,200);
  
  for(int i=0;i<mycursor.length;i++){
    mycursor[i]=new Cursor();
  }
  errorwin=loadImage("errorwindow.png");
}
void draw() {
  if(asciistate){
    if ((count1++)%3==0) {
    background(0);
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        rand=int(random(0, 92));
        elements[i].display(rand, offsetX/2+offsetX*i, offsetY/2+offsetY*j);
      }
    }
  }
  }
  image(errorwin,winx,winy);
  pushMatrix();
  fill(0,250,125);
  scale(kick.output());
  tint(120);
  image(errorwin,winx,winy);
  popMatrix();

}

void keyPressed() {
  OscMessage myMessage;
  switch(key) {
    case('p'):
    myMessage = new OscMessage("/test");
    myMessage.add(0);
    NetAddress n = new NetAddress("127.0.0.1",8000);
    ip.send(myMessage, n); 
    println("sending a message to "+n);
    break;
    
    case('b'):
    myMessage = new OscMessage("/test");
    myMessage.add(2);
    NetAddress n2 = new NetAddress("127.0.0.1",8000);
    ip.send(myMessage, n2); 
    println("sending a message to "+n2);
    break;
    
    case('a'):
    myMessage = new OscMessage("/test");
    myMessage.add(4);
    NetAddress n4 = new NetAddress("127.0.0.1",8000);
    ip.send(myMessage, n4); 
    println("sending a message to "+n4);
    break;
    
    case('s'):
    
    myMessage = new OscMessage("/test");
    myMessage.add(3);
    NetAddress n3 = new NetAddress("127.0.0.1",8000);
    ip.send(myMessage, n3); 
    println("sending a message to "+n3);

    asciistate=true;
     

    
    break;
    
  }
}

void oscEvent(OscMessage my) {
  if (my.checkAddrPattern("/event")==true) {
    int k=my.get(0).intValue();
    if (k==1) {
      println("received");
      winx=random(0,width);
      winy=random(0,height);
    }
    else if(k==2){
      kick.input(1,0);
      println("kick");
  }
   
  }
}
void mousePressed(){
  count+=2;
}
void mouseClicked(){
  mycursor[i].display(count);
  i++;
  OscMessage myMessage;
  myMessage = new OscMessage("/test");
  myMessage.add(1);
    NetAddress n = new NetAddress("127.0.0.1",8000);
    ip.send(myMessage, n); 
    count=0;
}