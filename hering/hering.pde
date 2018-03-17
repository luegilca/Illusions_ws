color backLineColor;
color frontLineColor;
int lineCount;
int rightGap;
int leftGap;

void setup( ) {
  size( 500, 500 );
  // blue color for the lines around center
  backLineColor = color( 0, 0, 255 );
  // red color for the vertical lines
  frontLineColor = color( 255, 0, 0 );
  // number of lines around the canvas center
  lineCount = 200;
  // 30% of width/2 gap between the vertical lines
  int gap = ( ( ( width / 2 ) * 15) / 100 ); 
  leftGap = width / 2 - gap;
  rightGap = width / 2 + gap;
}

void draw( ) {  
  background( 255 );
  drawLines( );
  // paints and draw the vertical lines
  stroke( frontLineColor );
  strokeWeight( 1.5 );
  line( rightGap, 0, rightGap, height);
  line( leftGap, 0, leftGap, height);
}

void drawLines( ) {
  pushMatrix();
  translate( width / 2, height / 2 );
  strokeWeight( 0.5 );
  stroke( backLineColor );
  for( int i = 0; i < lineCount; i ++ ) {
    rotate( radians( 6 ) );
    line( 0, 0, width, height );
  }
  popMatrix();
}

void mousePressed( ) {
  backLineColor = color( 255 );
}

void mouseReleased( ) {
  backLineColor = color( 0, 0, 255 );
}