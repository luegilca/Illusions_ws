float rot =360.0;
boolean value=true;

void setup(){
  size(650, 650);
  noStroke();
  
}

void draw(){
    background(255);
    draw_big();
    
    draw_corners();

}

void mousePressed(){
  value=false;
}

void mouseReleased(){
  value=true;
}
void draw_corners(){
    if (value==true){
      rectMode(CORNER);
      fill(150, 0, 150);
      rect(0, 0, 300, 300);
      rect(350, 0, 300, 300);  
      rect(0, 350, 300, 300);    
      rect(350, 350, 300, 300);
    }
}

void draw_big(){
  fill(255, 255, 0);
    rectMode(CENTER);
    pushMatrix();
      rot-=2;
      if (rot < 0) rot = 360;
      translate(width/2, height/2);
      rotate(radians(rot));
      rect(0, 0, 450, 450);
    popMatrix();  
}