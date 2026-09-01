import processing.core.PVector;

public class Fisica2D {

  // Constants per a la pluja
  public static final float GRAVETAT_PLUJA = 0.6f;
  public static final float FRICCIO_PLUJA = 0.01f;

  // Gravetat cap avall, depén de la profunditat
  public static PVector gravetatPluja (float profunditat) {
    float g = GRAVETAT_PLUJA * (0.5f + profunditat);
    return new PVector(0, g);
  }

  // Fricció de l’aire (més suau que al volcà)
  public static PVector friccioPluja (PVector velocitat, float profunditat) {
    if (velocitat.mag() == 0) return new PVector(0, 0);

    PVector f = velocitat.copy();
    f.mult(-1);
    f.normalize();
    f.mult(FRICCIO_PLUJA * (1.0f - profunditat));
    return f;
  }

  // Velocitat màxima segons profunditat
  public static float velocitatTerminal (float profunditat) {
    return 6 + 8 * profunditat;
  }
}
