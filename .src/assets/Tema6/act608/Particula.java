import processing.core.PApplet;
import processing.core.PVector;

class Particula {
  PVector posicio;
  PVector direccio;
  PVector velocitat;
  float   velocitatEscalar;
  float   profunditat;
  int     llarg;
  int     pinta;

  // Constructor per defecte
  Particula () {
    float x = 50 + (float)(Math.random() * 640-50);
    float y = 50 + (float)(Math.random() * 100-50);

    this.posicio          = new PVector (x, y);
    float dx = (float) (-0.2 + Math.random() * (0.2 - (-0.2))); // Entre -0.2 i +0.2
    float dy = (float) (0.2 + Math.random() * (1.0 - 0.2));     // Entre 0.2 i 1
    this.direccio         = new PVector (dx, dy);
    this.velocitatEscalar = 10 + (float) Math.random()*(30-10);        // Entre 10 i 30
    this.pinta            = 0xFF0000DA;
    this.llarg            = 35 + (int) Math.random()*(70-35);   // Entre 15 i 70    

    // Calculem la velocitat vectorial
    if (direccio.mag() > 0) {
      this.direccio.normalize();
      this.velocitat = PVector.mult(this.direccio, this.velocitatEscalar);
    }
  }

  // Constructor parametritzat
  Particula (PVector pos, PVector dir, float velEsc, int gran) {
    this.posicio          = pos;
    this.direccio         = dir;
    this.velocitatEscalar = velEsc;
    this.llarg            = gran;

    // Color aleatori entre gris i blau
    int r = 80 + (int)(Math.random() * 81);   // 80..160
    int g = r;                                // mateix valor → gris
    int b = 160 + (int)(Math.random() * 96);  // 160..255
    int a = 255;
    this.pinta = (a << 24) | (r << 16) | (g << 8) | b;


    // Calculem la velocitat vectorial
    if (direccio.mag() > 0) {
      this.direccio.normalize();
      this.velocitat = PVector.mult(this.direccio, this.velocitatEscalar);
    }
  }

  void mostrar(PApplet app) {

    // Ajust visual segons la profunditat
    float escala = 0.5f + profunditat;   // entre 0.5 i 1.5
    float llargaria = llarg * escala;

    // Vector final de la gota
    PVector finalGota = direccio.copy();
    finalGota.mult(llargaria);

    // Punt final de la línia
    float x2 = posicio.x + finalGota.x;
    float y2 = posicio.y + finalGota.y;

    // Estil de dibuix
    app.stroke(pinta);
    app.strokeWeight(1 + profunditat * 2);

    // Dibuix de la gota
    app.line(posicio.x, posicio.y, x2, y2);
  }

  void actualitzar () {

    PVector acceleracio = new PVector(0, 0);

    // Gravetat
    PVector g = new PVector(0, 0.3f);
    g.mult(0.5f + profunditat);
    acceleracio.add(g);

    // Fricció correcta
    PVector f = velocitat.copy();
    f.mult(-1);
    f.normalize();
    f.mult(0.02f);
    f.mult(1.0f - profunditat);
    acceleracio.add(f);

    // Direcció base de la gota
    PVector velDir = direccio.copy();
    velDir.mult(velocitatEscalar * (0.5f + profunditat));
    acceleracio.add(velDir);

    // Actualització
    velocitat.add(acceleracio);

    float velocitatMax = velocitatEscalar * (0.5f + profunditat);
    velocitat.limit(velocitatMax);

    posicio.add(velocitat);
}


  String diguesHola () {
    return "Hola soc pluja" + this.toString ();
  }
}
