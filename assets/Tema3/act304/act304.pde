import Dibuixem.*; //<>//

Cercle c1;
Quadrat q1;
Triangle t1;

void setup () {
  size (640, 480);
  c1 = new Cercle (this, 160, 240, 100);
  c1.setColor (color (255, 0, 0));
  
  q1 = new Quadrat (this, 320, 240, 100);
  q1.setColor (color (0, 255, 0));
  
  t1 = new Triangle (this, 480, 240, 100);
  t1.setColor (color (0, 0, 255));
}

void draw () {
  background (255);
  c1.display ();
  q1.display ();
  t1.display ();
}

void mouseClicked () {
  c1.setPosicio (mouseX, mouseY);
}
