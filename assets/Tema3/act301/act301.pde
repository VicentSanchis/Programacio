// Variables globals
PVector v1, v2;       // Declaració de dos objectes (v1, v2) de la classe PVector

// Funció setup: només s'executa una vegada a l'inici de l'execució.
void setup () {  
  size (640,480);       // Configura les dimensions de l'aplicació
  v1 = new PVector ();  // Instanciació de l'objecte v1
  v1.x = 160;          // Accés a l'atribut x de l'objecte v1
  v1.y = 240;          // Accés a l'atribut y de l'objectes v2

  v2 = new PVector (480, 240); // Instanciació de l'objecte v2
}

// Funció draw: s'executa 60 vegades per segon (60Hz freqüència del monitor)
void draw () { 
  background (255);  // Pinta el fons de blanc
  // Per mostrar el que passa amb els PVectors dibuixarem un punt a cada vector
  stroke (255,0,0);
  strokeWeight (10);
  // Dibuixem els punts al seu lloc
  point (v1.x, v1.y);
  point (v2.x, v2.y);

  // Dibuixem una línia que els uneixca
  stroke (0);
  strokeWeight (2);
  line (v1.x, v1.y, v2.x, v2.y);
  
  // Calculem la distància amb PVector.dist
  float distancia = PVector.dist (v1, v2);
  PVector posText = new PVector (320, 240);
  textSize (25);
  rectMode (CENTER);
  fill (0,220,100);
  rect (posText.x, posText.y, 120, 60, 20);
  fill (0);
  textAlign (CENTER);
  text (distancia, posText.x, posText.y+7);
}

// Declaració d'altres funcions. Opcional

// Esedeveniments
void mouseClicked  () {}
void mouseReleased () {}
void mousePressed  () {}
void keyPressed    () {}
void keyReleased   () {}
void mouseDragged  () {}
void mouseMoved    () {}
