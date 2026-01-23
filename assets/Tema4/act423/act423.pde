/** //<>//
 * Activitat 335. Dibuixa diagonals
 * -----------------------------------------------------------
 * A una apliació de 500x500 de dimensions dibuixa les dues diagonals.
 * Una representada per quadrats i l'altra amb cercles.
 * @author Vicent Sanchis
 * @since  7 novembre 2023
 * @version 1.0
 */
/**
 * Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació.
 * Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
 * @return void
 */
void setup () {
  size (640, 480);
  fill (255);
}
/**
 * Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
 * És en aquest mètode on aprofitare per fer animacions
 */
void draw () {
  /* Abans deuriem saber quants cercles i quadrats caben a la diagonal.
   Com que l'ample i l'alt ja no són iguals, haurem de considerar els dos
   eixos x i y de forma diferent. Si volem posar 25 elements per diagonal com a
   l'activitat anterior dividirem els eixos entre 25. Mira el codi...
   */

  // Primera diagonal
  int i = 0;
  while (i < 25) {

    // Primera diagonal (cercles)
    int posX1 = (int)((640 / 25) * i + 25 / 2);
    int posY1 = (int)((480 / 25) * i + 25 / 2);
    circle(posX1, posY1, 25);

    // Segona diagonal (quadrats)
    int posX2 = (int)(640 - 25 / 2 - i * 25);
    int posY2 = (int)((480 / 25) * i + 25 / 2);
    rect(posX2, posY2, 25, 25);

    i++;
  }
}
/**
 * Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
 * @return void
 */
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
