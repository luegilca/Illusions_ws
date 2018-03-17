float currentPosition;
float rate;
int circleCount;
int circleSize;
int miniSize;
int rotation;
int maxPosition; 

void setup() {
  size( 500, 500 ); 
  currentPosition = 0.0;
  rate = 0.04;
  circleSize = height / 2;
  miniSize = circleSize / 10;
  circleCount = 1;
  maxPosition = circleSize / 2 - miniSize ;
} 

void draw() {
  background( 255 );
  ellipseMode( CENTER );
  translate( width / 2, height / 2 );
  fill( color( 0, 204, 204 ) );
  noStroke();
  ellipse( 0, 0, circleSize, circleSize );
  
  for( int i = 0; i < circleCount; i++ ) {
    pushMatrix();
    float diff = i * PI / circleCount;
    float position = map( sin( currentPosition + diff ), -1, 1, -maxPosition, maxPosition );
    rotate( diff );
    fill( color( 153, 0, 76 ) );
    ellipse( position, 0, miniSize, miniSize );  
    popMatrix();
  }
  currentPosition += rate;
}

void mousePressed() {
  circleCount++;
  if( circleCount >= 10 ) 
    circleCount = 1;
}