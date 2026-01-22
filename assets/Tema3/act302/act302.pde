// Variables globals
PVector v1, v2, v3, v4;       // Declaració de dos objectes (v1, v2) de la classe PVector

// Solució per a controlar el mouseClicked
boolean clic;

// Funció setup: només s'executa una vegada a l'inici de l'execució.
void setup () {  
  size (640,480);       // Configura les dimensions de l'aplicació
  v1 = new PVector ();  // Instanciació de l'objecte v1
  v1.x = 140;          // Accés a l'atribut x de l'objecte v1
  v1.y = 80;          // Accés a l'atribut y de l'objectes v2

  v2 = new PVector (140, 400); // Instanciació de l'objecte v2
  v3 = new PVector (500, 80);
  v4 = new PVector (500, 400);
  
  clic = false;
}

// Funció draw: s'executa 60 vegades per segon (60Hz freqüència del monitor)
void draw () { 
  background (255);  // Pinta el fons de blanc //<>//
  // Per mostrar el que passa amb els PVectors dibuixarem un punt a cada vector
  stroke (255,0,0);
  strokeWeight (10);
  // Dibuixem els punts al seu lloc
  point (v1.x, v1.y);
  point (v2.x, v2.y);
  point (v3.x, v3.y);
  point (v4.x, v4.y);

  // Dibuixem una línia que els uneixca
  stroke (0);
  strokeWeight (2);
  line (v1.x, v1.y, v2.x, v2.y);
  line (v1.x, v1.y, v3.x, v3.y);
  line (v1.x, v1.y, v4.x, v4.y);
  line (v2.x, v2.y, v3.x, v3.y);
  line (v2.x, v2.y, v4.x, v4.y);
  line (v3.x, v3.y, v4.x, v4.y);
  
  // Calculem la distància amb PVector.dist
  textSize (25);
  rectMode (CENTER);
  textAlign (CENTER);
  
  if (clic) {
    // Primer línia
    float distancia = PVector.dist (v1, v2);
    PVector posText = new PVector (v1.x, (v2.y+v1.y)/2);
    fill (0,220,100);
    rect (posText.x, posText.y, 120, 60, 20);
    fill (0);
    text (distancia, posText.x, posText.y+7);
    
    // Segona línia
    distancia = PVector.dist (v1, v3);
    posText = new PVector ((v3.x+v1.x)/2, v1.y);
    fill (0,220,100);
    rect (posText.x, posText.y, 120, 60, 20);
    fill (0);
    text (distancia, posText.x, posText.y+7);
    
    // Tercera línia
    distancia = PVector.dist (v1, v4);
    posText = new PVector ((v1.x+v4.x)/2, (v1.y+v4.y)/2);
    fill (0,220,100);
    rect (posText.x, posText.y, 120, 60, 20);
    fill (0);
    text (distancia, posText.x, posText.y+7);
    
    // Quarta línia
    distancia = PVector.dist (v2, v3);
    posText = new PVector ((v2.x+v3.x)/2, (v2.y+v3.y)/2);
    fill (0,220,100);
    rect (posText.x, posText.y, 120, 60, 20);
    fill (0);
    text (distancia, posText.x, posText.y+7);
    
    // Cinquena línia
    distancia = PVector.dist (v2, v4);
    posText = new PVector ((v2.x+v4.x)/2, v2.y);
    fill (0,220,100);
    rect (posText.x, posText.y, 120, 60, 20);
    fill (0);
    text (distancia, posText.x, posText.y+7);
    
    // Cinquena línia
    distancia = PVector.dist (v3, v4);
    posText = new PVector (v3.x, (v3.y+v4.y)/2);
    fill (0,220,100);
    rect (posText.x, posText.y, 120, 60, 20);
    fill (0);
    text (distancia, posText.x, posText.y+7);
  }
}

// Declaració d'altres funcions. Opcional

// Esedeveniments
void mouseClicked () {
  clic = !clic;
}
void mousePressed () {}
void keyPressed   () {}
void keyReleased  () {}
void mouseDragged () {}
void mouseMoved   () {}
