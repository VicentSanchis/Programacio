import de.looksgood.ani.*; //<>//
import Dibuixem.*;

Cercle c;

void setup () {
  size (640, 480, P3D);
  ortho ();
  Ani.init (this);
  c = new Cercle (this, width/2, height/2, 80);
}

void draw () {
  background (255);
  c.display ();
}

void keyPressed () {
  if (keyCode == 32) {
    Ani.to (c, 5, "ample", 220);
  }
  
  if (key == 'c')
    Ani.to (c, 5, "color", 0xFFFF0000);
}
