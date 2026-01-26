// Variables globals
Particula g1, g2, g3, g4, g5, g6, g7, g8, g9, g10;

// Configuració inicial de l'aplicació
void setup () {
  size (640, 480);
  g1  = new Particula ();
  g2  = new Particula (new PVector(50, 50), new PVector (-0.1, 0.7), 30, 45);
  g3  = new Particula ();
  g4  = new Particula (new PVector(150, 30), new PVector (-0.3, 0.4), 50, 40);
  g5  = new Particula ();
  g6  = new Particula ();
  g7  = new Particula ();
  g8  = new Particula ();
  g9  = new Particula ();
  g10 = new Particula ();
  
  println(g1.diguesHola ());
  println(g2.diguesHola ());
  println(g3.diguesHola ());
  println(g4.diguesHola ());
  println(g5.diguesHola ());
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
  
  g1.mostrar(this);
  g2.mostrar(this);
  g3.mostrar(this);
  g4.mostrar(this);
  g5.mostrar(this);
  g6.mostrar(this);
  g7.mostrar(this);
  g8.mostrar(this);
  g9.mostrar(this);
  g10.mostrar(this);
}

// Control d'esdeveniments
void keyPressed   () {}
void keyReleased  () {}
void mouseClicked () {}
