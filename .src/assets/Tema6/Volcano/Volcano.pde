/**
* Volcano: un simple sistema de partícules
* ------------------------------------------------------------------------------------------------------------------
* @author: Vicent Sanchis
* @since: 10/01/2024
*/
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final static int INTERVAL = 5;
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int currentFrame;
Cono vesubio;
// ---------------------------------------------------------------------------------------------------------------
/**
 * Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació.
 * Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
 * @return void
 */
void setup () {
  size (640, 480);
  vesubio = new Cono();
}
/**
 * Metode draw: aquest mètode funciona com una espècies de bucle del joc.
 * S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
 * És en aquest mètode on s'aprofita per fer animacions
 */
void draw () {
  clear ();
  background (255);
  
  vesubio.display ();
  
  currentFrame = frameCount - INTERVAL*vesubio.getTotalPiroclasts();
  if (currentFrame >= INTERVAL)
    vesubio.expulsar ();
     
  //saveFrame("gif/img-####.png");
}

void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
