import Dibuixem.*; //<>//

Cercle c1;
Quadrat q1;
Triangle t1;
PVector posCercle, posQuadrat, posTriangle;

void setup () {
  size (640, 480);
  posCercle = new PVector (160, 240);
  c1 = new Cercle (this, posCercle.x, posCercle.y, 100);
  c1.setColor (color (255, 0, 0));
  
  posQuadrat = new PVector (320, 240);
  q1 = new Quadrat (this, posQuadrat.x, posQuadrat.y, 100);
  q1.setColor (color (0, 255, 0));
  
  posTriangle = new PVector (480, 240);
  t1 = new Triangle (this, posTriangle.x, posTriangle.y, 100);
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
