// The stripes that will be colored have this color
color blackStripes;
// Number of colored stripes
int stripeCount;
// Used for feet movement
int xPosition;
// Feet dimenions
int footWidth;
int footHeight;
// Separation between middle of canvas and each foot
int footSeparation;

void setup( ) {
  size( 500, 500 );
  blackStripes = color( 0 );
  stripeCount = 24;
  xPosition = 0;
  footWidth = 80;
  footHeight = 40;
  footSeparation = 60;
}

void draw( ) {
  drawStripes( );
  drawFeet( );
  drawMarkers( );
}

void drawStripes( ) {
  noStroke();
  // Filling rectangles interspersed
  boolean filled = true;
  // 'stripeCount * 2' because there is 'stripeCount' black stripes 
  // and 'stripeCount' white stripes.
  int stripeWidth = width / ( stripeCount * 2 );
  for( int i = 0; i < width; i += stripeWidth ) {
    // Is filled with color or not
    color c = ( filled ) ? blackStripes : color( 255 );    
    filled = !filled;
    fill( c );
    rect( i, 0, stripeWidth, height );
  }
}

void drawFeet( ) {  
  // Blue foot placed at top
  fill( color( 50, 55, 100 ) );
  rect( xPosition, height / 2 - footSeparation, footWidth, footHeight );
  // Yellow foot placed at bottom
  fill( color( 255, 204, 0 ) );
  rect( xPosition, height / 2 + footSeparation, footWidth, footHeight );
  // Move feet pixel by pixel
  if( xPosition < width ) 
    xPosition++;
  else
    xPosition = 0;
}

void drawMarkers( ) {
  // Red point at top of the canvas
  fill( color( 255, 0 ,0 ) );
  ellipse( width / 2 , 60, 5, 5 );
  // When the mouse is pressed, a red rule is painted
  // to show that feet are moving at the same speed.
  if( mousePressed == true)
    stroke( color( 255, 0, 0 ) );
  else
    noStroke();
  line( xPosition + ( footWidth / 2 ), height / 2 - ( footSeparation - footHeight ), xPosition + ( footWidth / 2 ), height / 2 + footSeparation);
}

// When click is pressed, changes the striped background to all white.
void mousePressed( ) {
  blackStripes = color( 255 );
}
// When click is released, the background is restored
void mouseReleased( ) {
  blackStripes = color( 0 );
}