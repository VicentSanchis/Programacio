import processing.core.PApplet;
import processing.core.PVector;

public class Particula {
  private static int comptador;
  private PVector posicio;
  private PVector direccio;
  private PVector velocitat;
  private float   velocitatEscalar;
  private float   profunditat;
  private int     llarg;
  private int     pinta;

  // Constructor per defecte
  public Particula () {
    comptador ++;
    
    float x = aleatori (50, 640);
    float y = aleatori (50, 100);
    this.posicio          = new PVector (x, y);
    
    setDefaultValues ();
  }
  
  public Particula (int x, int y, int ample, int alt) {
    if (x < 0 || y < 0 || ample < 0 || alt < 0)
      throw new IllegalArgumentException ("Els paràmetres han de ser major a zero");
      
    this.posicio = new PVector (x+ample, y+alt);
    
    setDefaultValues ();
  }

  // Constructor parametritzat
  public Particula (PVector pos, PVector dir, float velEsc, int gran) {
    if (pos == null || dir == null || velEsc < 0 || gran < 0) 
      throw new IllegalArgumentException ("Cap dels arguments del constructor poden ser null");
      
    comptador ++;
    this.posicio          = pos;
    this.direccio         = dir;
    this.velocitatEscalar = velEsc;
    this.llarg            = gran;
    this.profunditat      = (float) Math.random ();

    // Color aleatori entre gris i blau
    int r = aleatori (80, 190);
    int g = r;                                // mateix valor → gris
    int b = aleatori (160, 255);
    this.setColor (r, g, b);
    
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

  public void actualitzar () {

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
  
  public void setColor (int r, int g, int b) {
    if (r < 0  || r > 255 || g < 0  || g > 255 || b < 0  || b > 255)
      throw new IllegalArgumentException ("Els components r, g i b han d'estar entre 0 i 255");
    
    int a = 255;
    this.pinta = (a << 24) | (r << 16) | (g << 8) | b;
  }

  public String diguesHola () {
    String text = "Hola soc pluja" + this.toString () + "\n";
    text       += "-----------------------------\n";
    text       += "Posicio: " + this.posicio + "\n";
    text       += "Direccio: " + this.direccio + "\n";
    text       += "Velocitat: " + this.velocitat + "\n";
    text       += "Escalar: " + this.velocitatEscalar + "\n";
    text       += "Profunditat: " + this.profunditat + "\n";
    text       += "Llargaria: " + this.llarg + "\n";
    text       += "-----------------------------\n";
    
    return text;
  }
  
  private void setDefaultValues () {
    float dx = (float) (-0.2 + Math.random() * (0.2 - (-0.2))); // Entre -0.2 i +0.2
    float dy = (float) (0.2 + Math.random() * (1.0 - 0.2));     // Entre 0.2 i 1
    this.direccio         = new PVector (dx, dy);
    this.velocitatEscalar = 5 + (float) Math.random()*(15-5);        // Entre 5 i 15
    this.pinta            = 0xFF0000DA;
    this.llarg            = 25 + (int) Math.random()*(60-25);   // Entre 25 i 60
    this.profunditat      = (float) Math.random ();

    // Calculem la velocitat vectorial
    if (direccio.mag() > 0) {
      this.direccio.normalize();
      this.velocitat = PVector.mult(this.direccio, this.velocitatEscalar);
    }
  }
  
  private int aleatori (int min, int max) {
    return (int) (min + Math.random()*(max-min));
  }
  
  public static int getTotalParticules () {
    return comptador;
  }
}
