
//Set Variables
int distance=150;
int half;
boolean diamonds=true;


//Movement Variables
int top=40;
int move1 = 0;
boolean increase1=true;
int move2 = 20;
boolean increase2=false;

void setup(){
  size(700, 700);
  half=700/2;
}

void draw(){
  background(100);
  stroke(100, 0, 100);
  
  strokeWeight(4);
  drawLines();
  move();
  
}

void drawLines(){
  //Sets the 0,0 point in (350,150) to rotate the square
  translate(half, distance);
  pushMatrix();
    rotate(radians(45));
    //Int to cut the lines and make them shorter, and not a full square.
    int cut=50;
    
    //Paralels
    line(0+cut, 0+move1, 300-cut, 0+move1);
    line(0+cut, 300+move1, 300-cut, 300+move1);
    
    line(300+move2, 0+cut, 300+move2, 300-cut);
    line(0+move2, 0+cut, 0+move2, 300-cut);
    
    
    if(diamonds)
      drawDiamonds();
    rectMode(CORNER);
  popMatrix();
}

void drawDiamonds(){
  rectMode(CENTER);
  fill(0, 255, 0);
  stroke(0, 255, 0);
  rect(0, 0, 120, 120);
  rect(0, 300, 120, 120);
  rect(300, 0, 120, 120);
  rect(300, 300, 120, 120);
  
}

boolean shouldIncrease(int move, boolean increase){
  if(move==0){
    return true;
  }else if (move==top){
    return false;
  }else{
    return increase;
  }
}

void move(){
  increase1=shouldIncrease(move1, increase1);
  if(increase1){
    move1++;
  }else{
    move1--;
  }
  
  increase2=shouldIncrease(move2, increase2);
  if(increase2){
    move2++;
  }else{
    move2--;
  }
}

void mouseReleased(){
  diamonds=true;
}

void mousePressed(){
  diamonds=false;
}