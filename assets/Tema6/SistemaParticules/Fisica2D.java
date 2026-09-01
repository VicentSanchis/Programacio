import processing.core.PVector;

public class Fisica2D {

  // Constants físiques globals
  public static final float GRAVETAT = 0.3f;
  public static final float FRICCIO_AIRE = 0.02f;

  // Aplica la gravetat
  public static PVector gravetat() {
    return new PVector(0, GRAVETAT);
  }

  // Calcula força de fricció
  public static PVector friccio(PVector velocitat) {
    PVector f = velocitat.copy();
    f.mult(-1);
    f.normalize();
    f.mult(FRICCIO_AIRE);
    return f;
  }
}
