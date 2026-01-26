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
    this.velocitatEscalar = 3 + (float) Math.random()*(5-3);        // Entre 3 i 5
    this.pinta            = 0xFF0000FF;
    this.llarg            = 35 + (int) Math.random()*(50-15);

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
  
  public void mostrar(PApplet app) {

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

  
  String diguesHola () {
    return "Hola soc pluja" + this.toString ();
  }
}
