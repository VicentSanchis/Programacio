public class Cono {
  private int       ample;
  private int       alt;
  private color     col;
  private PVector   posicio;
  private ArrayList <Piroclast> alPiroclasts;
  
  public Cono () {
    this.ample   = 100;
    this.alt     = 60;
    this.posicio = new PVector (320, 135);
    this.col     = 70;
    
    // Inicialitzem el conjunt d'arrays a punt de ser expulsats.
    this.alPiroclasts = new ArrayList<Piroclast>();
  }
  
  public void display () {
    fill(col);
    rectMode(CENTER);
    triangle (posicio.x, posicio.y, posicio.x-(ample/2), posicio.y+alt, posicio.x+(ample/2), posicio.y+alt);
    
    mostraPiroclasts (); //<>//
  }
  
  public void expulsar () {
      Piroclast p = new Piroclast (this.posicio, 10, color(255,0,0)); //<>//
      alPiroclasts.add (p);
  }
  
  private void mostraPiroclasts () {
    for (int i=0; i < alPiroclasts.size(); i ++) {
      Piroclast p = alPiroclasts.get(i);
      p.display();
      p.update();
    }
  }
  
  public ArrayList<Piroclast> getPiroclasts () {
    return this.alPiroclasts;
  }
  
  public int getTotalPiroclasts () {
    return this.alPiroclasts.size();
  }
}
