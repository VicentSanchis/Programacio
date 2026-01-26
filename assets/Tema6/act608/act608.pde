// Variables globals
Particula g1, g2, g3, g4, g5;

// Configuració inicial de l'aplicació
void setup () {
  size (640, 480);
  g1 = new Particula ();
  g2 = new Particula (new PVector(50, 50), new PVector (-0.1, 0.7), 30, 45);
  g3 = new Particula ();
  g4 = new Particula (new PVector(150, 30), new PVector (-0.3, 0.4), 50, 40);
  g5 = new Particula ();
}

// Bucle de joc o mètode draw
void draw () {
  background(255); //<>//
  g1.actualitzar();
  g2.actualitzar();
  g3.actualitzar();
  g4.actualitzar();
  g5.actualitzar();
  
  g1.mostrar(this);
  g2.mostrar(this);
  g3.mostrar(this);
  g4.mostrar(this);
  g5.mostrar(this);
}

// Control d'esdeveniments
void keyPressed   () {}
void keyReleased  () {}
void mouseClicked () {}
