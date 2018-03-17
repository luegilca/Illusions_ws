// http://www.ritsumei.ac.jp/~akitaoka/index-e.html
// https://www.openprocessing.org/sketch/230956

int tileSize;
boolean customizable;
int[] matrix;

void setup( ) {
  size( 600, 600 );
  tileSize = 40; // for a 11x11 matrix
  customizable = true;
  matrix = new int[]{
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 5, 2, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 1, 5, 2, 2, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 1, 1, 5, 2, 2, 2, 0, 0, 0, 0,
    0, 0, 0, 1, 1, 1, 1, 5, 2, 2, 2, 2, 0, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 5, 2, 2, 2, 2, 2, 0, 0,
    0, 1, 1, 1, 1, 1, 1, 5, 2, 2, 2, 2, 2, 2, 0,
    0, 6, 6, 6, 6, 6, 6, 0, 4, 4, 4, 4, 4, 4, 0,
    0, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 0,
    0, 0, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 0, 2, 2, 2, 2, 3, 1, 1, 1, 1, 0, 0, 0,
    0, 0, 0, 0, 2, 2, 2, 3, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 2, 2, 3, 1, 1, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 2, 3, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
}

void draw( ) {
  boolean w = true;
  int index = 0;
  for( int i = 0; i < width; i += tileSize ) {
    for( int j = 0; j < height; j += tileSize ) {
      if( matrix[ index ] == 0 )
      {
        drawSingleTile( w, false, i, j, 0, tileSize );
      }
      else
      {
        drawSingleTile( w, customizable, i, j, matrix[ index ], tileSize );
      }
      w = !w;
      index++;
    }
  }  
}

void mousePressed( ) {
  customizable = false;
}

void mouseReleased( ) {
  customizable = true;
}

/**
*    Types:
*    1 - +---+  2 - +---+  3 - +---+  4 - +---+  5 - +---+  6 - +---+ 
*        |  *|      |*  |      |* *|      |*  |      |   |      |  *|          
*        |*  |      |  *|      |   |      |*  |      |* *|      |  *| 
*        +---+      +---+      +---+      +---+      +---+      +---+
**/
void drawSingleTile( boolean isWhite, boolean customizable, int row, int col, int type, int tileSize ) {
  color tileColor = bgColor( isWhite ); 
  rectMode( CORNER );
  fill( tileColor );
  rect( col, row, tileSize, tileSize );
  if( customizable ) {
    int miniSize = 10;
    int[] coords = getMiniCoords( row, col, type );
    pushMatrix( );    
    color miniTile = bgColor( !isWhite );
    fill( miniTile );
    rectMode( CENTER );
    rect( coords[ 0 ], coords[ 1 ], miniSize, miniSize );
    rect( coords[ 2 ], coords[ 3 ], miniSize, miniSize );
    popMatrix( );     
  }
}

int[] getMiniCoords( int row, int col, int type ) {
  int x1 = 0, x2 = 0, y1 = 0, y2 = 0;
    switch ( type ){
      case 1:
        x1 = col + ( tileSize * 80 / 100 );
        y1 = row + ( tileSize * 20 / 100 );
        x2 = col + ( tileSize * 20 / 100 );
        y2 = row +( tileSize * 80 / 100 );
        break;
      case 2:
        x1 = col + ( tileSize * 20 / 100 );
        y1 = row + ( tileSize * 20 / 100 );
        x2 = col + ( tileSize * 80 / 100 );
        y2 = row + ( tileSize * 80 / 100 );
        break;
      case 3:
        x1 = col + ( tileSize * 20 / 100 );
        y1 = row + ( tileSize * 20 / 100 );
        x2 = col + ( tileSize * 80 / 100 );
        y2 = row + ( tileSize * 20 / 100 );
        break;
      case 4:
        x1 = col + ( tileSize * 20 / 100 );
        y1 = row + ( tileSize * 20 / 100 );
        x2 = col + ( tileSize * 20 / 100 );
        y2 = row + ( tileSize * 80 / 100 );
        break;      
      case 5:
        x1 = col + ( tileSize * 20 / 100 );
        y1 = row + ( tileSize * 80 / 100 );
        x2 = col + ( tileSize * 80 / 100 );
        y2 = row + ( tileSize * 80 / 100 );
        break;
      case 6:
        x1 = col + ( tileSize * 80 / 100 );
        y1 = row + ( tileSize * 20 / 100 );
        x2 = col + ( tileSize * 80 / 100 );
        y2 = row + ( tileSize * 80 / 100 );
        break;
    }
    return new int[]{ x1, y1, x2, y2 };    
}

color bgColor( boolean isWhite ) {
  return ( isWhite ) ? color( 255 ) : color( 0 );
}