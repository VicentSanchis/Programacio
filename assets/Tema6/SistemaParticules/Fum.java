import processing.core.PApplet;
import processing.core.PVector;

public class Fum extends Particula {
  public Fum (PVector posInicial) {
        posicio = posInicial.copy();
        vel = new PVector(0, -3f);
        pinta = 0xFFCCCCCC;
    }
}
