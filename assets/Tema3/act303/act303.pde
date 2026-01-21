import Dibuixem.*; //<>//

Cercle c1;

void setup () {
  size (640, 480);
  c1 = new Cercle(this, 320, 240, 40);
}

void draw () {
  background(120);
  c1.display();
}

void mouseClicked () {
  c1.setPosicio (mouseX, mouseY);
}
