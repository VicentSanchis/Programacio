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
    float x = 250 + (float)(Math.random() * 640);
    float y = 50 + (float)(Math.random() * 50);

    this.posicio          = new PVector (x,y);
    float dx = (float) (-0.4 + Math.random() * (0.4 - (-0.4))); // Entre -0.4 i +0.4
    float dy = (float) (0.2 + Math.random() * (1.0 - 0.2));     // Entre 0.2 i 1
    this.direccio         = new PVector (dx, dy);
    this.velocitatEscalar = (float) Math.random()*(5-3);        // Entre 3 i 5
    this.pinta            = 0xFF0000FF;
    this.llarg            = 25;

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
    this.pinta            = 0xFFFF0000;

    // Calculem la velocitat vectorial
    if (direccio.mag() > 0) {
      this.direccio.normalize();
      this.velocitat = PVector.mult(this.direccio, this.velocitatEscalar);
    }
  }
}
