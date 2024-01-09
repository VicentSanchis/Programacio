/**
* Programació modular: en aquesta activitat dibuixarem una peça
* de dominó utilitzant funcions
* @author: Vicent Sanchis
* @since: 1/1272021
*/
// Constants
final int BAIX  = 0;
final int DALT  = 1;
final int AMPLE = 200; 
final int ALT   = 360;

// Variables globals
int origenX, origenY; // Coordenades de l'origen de la pe+ça de dominó
int a1x, a1y, a2x, a2y, b1x, b1y, b2x, b2y, b3x, b3y, c1x, c1y, c2x, c2y;

// Setup: s'executa només una vegada
void setup () {
  size(640,480); 
  origenX = 50;
  origenY = 50;
  
  // Calculem les posicions relatives del punts de les peces
  a1x = b1x = c1x = origenX + AMPLE/4;
  a1y = a2y = origenY + ALT/8;
  a2x = c2x = b3x = origenX + 3*AMPLE/4;
  b1y = b2y = b3y = origenY + 2*ALT/8;
  b2x = origenX + AMPLE/2;
  c1y = c2y = origenY + 3*ALT/8;
}

// Draw: bucle que s'executa 30 vegades per segon
void draw() {
  dibuixarDomino(5,4);
}

// DibuixarDomino: Funció principal que s'encarrega de dibuixar
// la peça de dominó
void dibuixarDomino(int a, int b) {
  dibuixarBuida();
  dibuixarPunts(a, DALT);
  dibuixarPunts(b, BAIX);
}

// DibuixarBuida: s'encarrega de dibuixar l'estructura buida de la peça
void dibuixarBuida() {
  // Dibuixem el marc de la peça
  strokeWeight(5);
  stroke(0);
  rect(origenX,origenY,AMPLE,ALT);
  
  // Dibuixem la línia del mig
  strokeWeight(3);
  line(origenX,origenY+ALT/2,origenX+AMPLE,origenY+ALT/2);
  
  // Dibuixem la boleta
  strokeWeight(2);
  stroke(0);
  fill(255,204,0);
  ellipse(origenX+AMPLE/2,origenY+ALT/2,15,15);
  fill(255);
}

// DibuixarPunts: dibuixa els punts que es passen per paràmetre i baix o dalt
// depenent del segon paràmetre
void dibuixarPunts(int punts, int pos) {
  int offsetY = 0;
  
  if (pos != DALT && pos != BAIX) {
    println("Error: posició incorrecta");
    return;
  }
  if (punts > 6) {
    println("Error: les peces tenen un màxim de 6 punts");
    return;
  }
  
  if (pos == BAIX) 
    offsetY = 180;
  
  stroke(0);
  strokeWeight(25);
  switch(punts) {
    case 0:
      break;
      
    case 1:
      point(b2x,b2y+offsetY);
      break;
     
    case 2:
      point(a1x,a1y+offsetY);
      point(c2x,c2y+offsetY);
      break;
      
    case 3:
      point(a1x,a1y+offsetY);
      point(b2x,b2y+offsetY);
      point(c2x,c2y+offsetY);
      break;
      
    case 4:
      point(a1x,a1y+offsetY);
      point(a2x,a2y+offsetY);
      point(c1x,c1y+offsetY);
      point(c2x,c2y+offsetY);
      break;
      
    case 5:
      point(a1x,a1y+offsetY);
      point(a2x,a2y+offsetY);
      point(b2x,b2y+offsetY);
      point(c1x,c1y+offsetY);
      point(c2x,c2y+offsetY);
      break;
      
    case 6:
      point(a1x,a1y+offsetY);
      point(a2x,a2y+offsetY);
      point(b1x,b1y+offsetY);
      point(b3x,b3y+offsetY);
      point(c1x,c1y+offsetY);
      point(c2x,c2y+offsetY);
      break;
  }
}
