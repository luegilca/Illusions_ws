PGraphics canvas;
color startColor;
color endColor;
color rectColor;

void setGradientColor( int startX, int endX, int startY, int endY, color c1, color c2 ) {
  noFill();
  for( int i = startX; i <= startX + endX; i++ ){
    //scaling position 'i' on the canvas to [0, 1] range.
    float inter = map( i, startX, startX + endX, 0, 1 );
    //getting a color between 'c1' and 'c2' with 'inter' increment.
    color c = lerpColor( c1, c2, inter );
    //color of line
    stroke( c );
    //draws the line
    line( i, startY, i, startY + endY );
  }  
}

void setup( ) {
  size( 800, 400 );
  canvas = new PGraphics();
  //Black color
  startColor = color(0);
  //White color
  endColor = color(255);
  //Gray color for the middle rectangle
  rectColor = color(128);
}

void draw( ) {
  canvas.beginDraw();
  setGradientColor( 0, width, 0, height, startColor, endColor );
  /**
  *   Calculates coordiates of width (80% of total width, centered) and 
  *   height (40 pixels height, centered) of the solid color rectangle.
  **/
  int rectStartX = width * 1/10;
  int rectEndX = width * 8/10;
  int rectStartY = height/2 - 20;
  int rectEndY = 40;
  // Drawing the rectangle, without gradient (e.g. startColor == endColor)
  setGradientColor( rectStartX , rectEndX, rectStartY, rectEndY, rectColor, rectColor );
  canvas.endDraw();
  
  image( canvas, 0, 0 );
}

//Changes the background to all black when click is pressed
void mousePressed( ) {
  endColor = color( 0 );
}

//Restores backgound gradient when click is released
void mouseReleased( ) {
  endColor = color( 255 );
}