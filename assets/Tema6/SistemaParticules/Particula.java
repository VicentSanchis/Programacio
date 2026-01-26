import processing.core.PApplet;
import processing.core.PVector;

public class Particula {
  private static int totalParticules;
  private PVector posicio;
  private PVector direccio;
  private PVector vel;
  private float   velocitat;
  private int     grandaria;
  private int     pinta;

  // Constructor per defecte
  public Particula () {
    float x = 250 + (float)(Math.random() * (350 - 250));
    float y = 50 + (float)(Math.random() * (150 - 50));

    this.posicio   = new PVector (x,y);
    this.direccio  = new PVector (0, -1);
    this.velocitat = 5;
    this.pinta     = 0xFFFF0000;
    this.grandaria = 25;

    // Calculem la velocitat vectorial
    this.vel = this.direccio.copy();
    this.vel.normalize();
    this.vel.mult(this.velocitat);
    
    totalParticules ++;
  }

  // Constructor parametritzat
  public Particula (PVector pos, PVector dir, float vel, int gran) {
    this.posicio   = pos;
    this.direccio  = dir;
    this.velocitat = vel;
    this.grandaria = gran;
    
    // Color aleatori entre gris i blau
    int r = 80 + (int)(Math.random() * 81);   // 80..160
    int g = r;                                // mateix valor → gris
    int b = 160 + (int)(Math.random() * 96);  // 160..255
    int a = 255;
    int pinta = (a << 24) | (r << 16) | (g << 8) | b;

    // Calculem la velocitat vectorial
    this.vel = this.direccio.copy();
    this.vel.normalize();
    this.vel.mult(this.velocitat);
    
    totalParticules ++;
  }

  public void mostrar (PApplet app) {
    app.fill (pinta);
    app.circle (this.posicio.x, this.posicio.y, this.grandaria);
  }

  public void actualitzar () {
    PVector acceleracio = new PVector (0, 0);
    acceleracio.add(Fisica2D.gravetat());
    acceleracio.add(Fisica2D.friccio(vel));
    vel.add(acceleracio);
    posicio.add(vel);
  }

  public void saluda (PApplet app) {
    app.println("Hola soc " + this.getId() + " i estic a la poscio: " + this.posicio);  
  }

  public String getId () {
    return this.toString();
  }
  
  public void setColor(int r, int g, int b) {
    if ((r < 0 || r > 255) || (g < 0 || g > 255) || (b <0 || b > 255)) 
      return;
      
    // Aquest mètode és susceptible de llençar una excepció
    this.pinta = 0xFF000000 | (r << 16) | (g << 8) | b;
  }
  
  public static int mostraTotalParticules () {
    return Particula.totalParticules;
  }
  
  public static Particula crearParticula (PVector origen) {
    float xDir = (float) (Math.random()*2-1);
    float yDir = (float) (Math.random()*5)*(-1);
    float v    = (float) (Math.random()*10);
    int   g    = (int)   (10 + Math.random()*(30-10));
    PVector dir = new PVector (xDir, yDir);
    Particula p = new Particula (origen.copy(), dir, v, g);
    return p;
  }
}
