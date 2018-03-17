  
  //General Variables
  int xPoint;
  int yPoint;
  int size;
  int half;
  float speed;
  
  
  //Variables for the big circles
  float colour;
  int distance;
  int circleSize;
  float topyMovement;
  float bottomyMovement;
  float leftxMovement;
  float rightxMovement;
  
  //Variables for the small circles
  float c;
  int d;
  int cs;
  int tym;
  int bym;
  int lxm;
  int rxm;
  
void setup(){
    //Initialize a 500x500 project and set the background to black
    size(520, 460);
    
    xPoint=190;
    yPoint=155;
    size=150;
    half=size/2;
    speed=-1;
    
    //Initialize big circles
    distance=75;
    circleSize=100;
    colour=140;
    topyMovement= yPoint-distance;
    bottomyMovement=yPoint+size+distance;
    leftxMovement=xPoint-distance;
    rightxMovement=xPoint+size+distance;
    
    //Initialize small circles
    d=40;
    c=255;
    cs=20;
    tym=yPoint+d;
    bym=yPoint+size-d;
    lxm=xPoint+d;
    rxm=xPoint+size-d;
}

void draw(){
  stroke(255);
  background(0);
  fill(0);
  strokeWeight(2);
  rect (xPoint, yPoint, size, size);
  
  //Based on the position of the top circle, we decide if change directions or not
  if(topyMovement==150||topyMovement==yPoint-distance){
    speed=-speed;
  }
  move_circles();
  
  fill(colour);   
  stroke(colour);
  draw_big_circles();
  
  fill(c);   
  stroke(c);
  draw_small_circles();
}


void draw_big_circles(){
  //Verticals
  ellipse(xPoint+half, topyMovement, circleSize, circleSize);
  ellipse(xPoint+half, bottomyMovement, circleSize, circleSize);
  //Horizontal
  ellipse(leftxMovement, yPoint+half, circleSize, circleSize);
  ellipse(rightxMovement, yPoint+half, circleSize, circleSize);  
}

void draw_small_circles(){
  //Verticals
  ellipse(xPoint+half, tym, cs, cs);
  ellipse(xPoint+half, bym, cs, cs);
  //Horizontal
  ellipse(lxm, yPoint+half, cs, cs);
  ellipse(rxm, yPoint+half, cs, cs);  
}

void move_circles(){
   topyMovement+=speed;
   leftxMovement+=speed;
   bottomyMovement-=speed;
   rightxMovement-=speed;
   
   tym-=speed;
   lxm-=speed;
   bym+=speed;
   rxm+=speed;
}