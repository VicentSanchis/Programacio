// Variables globals
Particula g1, g2, g3, g4, g5;

// Configuració inicial de l'aplicació
void setup () {
  size (640, 480);
  g1 = new Particula ();
  g2 = new Particula (new PVector(50, 50), new PVector (-0.1, 0.7), 3, 20);
  g3 = new Particula ();
  g4 = new Particula (new PVector(150, 30), new PVector (-0.3, 0.4), 5, 25);
  g5 = new Particula ();
  
  println (g1.diguesHola ());
  println (g2.diguesHola ());
  println (g3.diguesHola ());
  println (g4.diguesHola ());
  println (g5.diguesHola ());
}

// Bucle de joc o mètode draw
void draw () {
  background(255); //<>//
}

// Control d'esdeveniments
void keyPressed   () {}
void keyReleased  () {}
void mouseClicked () {}
