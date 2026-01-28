// Variables globals
Particula p1, p2, p3, p4, p5;

// Configuració inicial de l'aplicació
void setup () {
  size (640, 480);
  
  p1 = Particula.crearParticula(new PVector (320, 240));
  p2 = Particula.crearParticula(new PVector (320, 240));
  p3 = Particula.crearParticula(new PVector (320, 240));
  p4 = Particula.crearParticula(new PVector (320, 240));
  p5 = Particula.crearParticula(new PVector (320, 240));
  
  println(Particula.mostraTotalParticules());
}

// Bucle de joc o mètode draw
void draw () {
  background(255);
  p1.mostrar(this); //<>//
  p2.mostrar(this);
  p3.mostrar(this);
  p4.mostrar(this);
  p5.mostrar(this);
  
  p1.actualitzar();
  p2.actualitzar();
  p3.actualitzar();
  p4.actualitzar();
  p5.actualitzar();
}

// Control d'esdeveniments
void mouseClicked () {}
void keyPressed   () {}
void keyReleased  () {}
