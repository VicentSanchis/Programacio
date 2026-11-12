// Variables globals
Particula g1, g2, g3, g4, g5, g6, g7, g8, g9, g10;

// Configuració inicial de l'aplicació
void setup () {
  size (640, 480);
  g1  = new Gota ();
  g2  = new Gota ();
  g3  = new Gota ();
  g4  = new Gota ();
  g5  = new Gota ();
  g6  = new Gota ();
  g7  = new Gota ();
  g8  = new Gota ();
  g9  = new Gota ();
  g10 = new Gota ();
  
  println(g1.diguesHola ());
  println(g2.diguesHola ());
  println(g3.diguesHola ());
  println(g4.diguesHola ());
  println(g5.diguesHola ());
  println(g6.diguesHola ());
  println(g7.diguesHola ());
  println(g8.diguesHola ());
  println(g9.diguesHola ());
  println(g10.diguesHola ());
}

// Bucle de joc o mètode draw
void draw () {
  background(255); //<>//
  fill (0);
  textSize (20);
  text ("Total: " + Particula.getTotalParticules (), 550, 50);
  
  g1.actualitzar();
  g2.actualitzar();
  g3.actualitzar();
  g4.actualitzar();
  g5.actualitzar();
  g6.actualitzar();
  g7.actualitzar();
  g8.actualitzar();
  g9.actualitzar();
  g10.actualitzar();
  
  g1.mostrar  (this);
  g2.mostrar  (this);
  g3.mostrar  (this);
  g4.mostrar  (this);
  g5.mostrar  (this);
  g6.mostrar  (this);
  g7.mostrar  (this);
  g8.mostrar  (this);
  g9.mostrar  (this);
  g10.mostrar (this);
}

// Control d'esdeveniments
void keyPressed   () {}
void keyReleased  () {}
void mouseClicked () {}
