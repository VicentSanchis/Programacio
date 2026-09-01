import processing.core.PApplet;
import processing.core.PVector;

public class Lava extends Particula {
    public Lava (PVector posInicial) {
        posicio = posInicial.copy();
        vel = new PVector(0, 5f);
        pinta = 0xFFFF5500;
    }
}
