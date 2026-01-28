/**
* public class Piroclast
* ------------------------------------------------------------------------------------------------------------------
* Un piroclast és com s'anomena als objectes que expulsa un volcàr durant una erupció.
* Els piroclasts seran els elements del nostres sistema de partícules.
* @author: Vicent Sanchis
* @since: 10/01/2024
*/
public class Piroclast {
  private int     velocitat;
  private int     grandaria;
  private int     lifeSpan;
  private color   col;
  private PVector posicio;
  private PVector direccio;
  private PVector gravetat;
  private PVector friccio;
  /**
  * Constructor per defecte
  */
  public Piroclast () {
  }
  /**
  * Constructor de la classe Boleta
  */
  public Piroclast (PVector pos, int tam, color col) {
    this.grandaria = tam;
    this.col       = col;
    this.lifeSpan  = 255;
    this.posicio   = pos.copy();
    this.velocitat = (int) random(1,3);
    this.gravetat  = new PVector (0, 0.05f);
    this.direccio  = new PVector (random(-1, 1), random(-2, 0));
    this.direccio.mult (this.velocitat);
  }
  /**
  * mostra la boleta a la posició actual en la que es troba
  */
  public void display () {
    color pinta = color(col, lifeSpan);
    lifeSpan --;
    noStroke();
    fill (pinta);
    circle (posicio.x, posicio.y, grandaria);
  }
  /**
  * Actualitza la posició de la boleta en base al nostre sistema de físiques.
  */
  public void update () {
    friccio = direccio.copy().mult(-0.001);
    direccio.add (friccio);
    direccio.add (gravetat);
    posicio.add (direccio);
  }
  
  public void setGrandaria (int tam) {
    this.grandaria = tam;
  }
  
  public int getGrandaria () {
    return this.grandaria;
  }
}
