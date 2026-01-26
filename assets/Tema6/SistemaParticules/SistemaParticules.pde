// Variables globals
Particula p1, p2, p3;

// Configuració inicial de l'aplicació
void setup () {
  size (640, 480);
  //p1 = new Particula ();
  //p2 = new Particula ();
  //p3 = new Particula ();
  
  p1 = Particula.crearParticula(new PVector (320, 240));
  p2 = Particula.crearParticula(new PVector (320, 240));
  p3 = Particula.crearParticula(new PVector (320, 240));
  //p1.saluda(this);
  println(Particula.mostraTotalParticules());
}

// Bucle de joc o mètode draw
void draw () {
  background(255);
  p1.mostrar(this); //<>//
  p2.mostrar(this);
  p3.mostrar(this);
  
  p1.actualitzar();
  p2.actualitzar();
  p3.actualitzar();
}

// Control d'esdeveniments
void mouseClicked () {}
void keyPressed   () {}
void keyReleased  () {}
