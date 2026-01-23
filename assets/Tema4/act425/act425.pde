// Configuració inicial
int diametre = 30;
int separacio = 10;
int files = 10;
int columnes = 10;

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  fill(0);
  
  // Dibuix de la graella de cercles
  for (int y = 0; y < files; y++) {
    for (int x = 0; x < columnes; x++) {
      
      // Si arribem a la posició (7, 7), aturem tot el dibuix
      if (x == 7 && y == 7) {
        break; // ix del bucle interior
      }
      
      // Si la suma dels índexs és múltiple de 5, ometem el cercle
      if ((x + y) % 5 == 0) {
        continue; // salta a la següent iteració
      }
      
      // Càlcul de la posició del cercle
      int posX = x * (diametre + separacio) + diametre;
      int posY = y * (diametre + separacio) + diametre;
      
      // Dibuix del cercle
      circle(posX, posY, diametre);
    }
    
    // Si s'ha arribat a la fila 7, també trenquem el bucle exterior
    if (y == 7) {
      break;
    }
  }
}

void draw() {
  // No cal fer res ací
}
