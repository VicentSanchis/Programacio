import Dibuixem.*; //<>//

int totalFiguresCreades;
Figura f1, f2, f3, f4, f5, f6, f7, f8, f9, f10;

void setup () {
  size(1080, 920, P3D);
  ortho();
}

void draw () {
  background (255);
  if (f1 != null)
    f1.display ();

  if (f2 != null)
    f2.display ();

  if (f3 != null)
    f3.display ();

  if (f4 != null)
    f4.display ();

  if (f5 != null)
    f5.display ();

  if (f6 != null)
    f6.display ();

  if (f7 != null)
    f7.display ();

  if (f8 != null)
    f8.display ();

  if (f9 != null)
    f9.display ();

  if (f10 != null)
    f10.display ();
}

void keyPressed () {
  if (keyCode == 32) {
    if (f1 == null) {
      f1 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f1.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f2 == null) {
      f2 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f2.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f3 == null) {
      f3 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f3.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f4 == null) {
      f4 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f4.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f5 == null) {
      f5 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f5.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f6 == null) {
      f6 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f6.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f7 == null) {
      f7 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f7.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f8 == null) {
      f8 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f8.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f9 == null) {
      f9 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f9.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    } else if (f10 == null) {
      f10 = Figura.creaFiguraAleatoria (this);
      println ("S'ha creat una figura.\nTipus: " + f10.getTipus() + "\nTotal Creades: " + Figura.getTotalFigures());
    }
  }
  if (key == 'R' || key == 'r') {
    if (f1 != null)
      f1.reset ();

    if (f2 != null)
      f2.reset ();

    if (f3 != null)
      f3.reset ();

    if (f4 != null)
      f4.reset ();

    if (f5 != null)
      f5.reset ();

    if (f6 != null)
      f6.reset ();

    if (f7 != null)
      f7.reset ();

    if (f8 != null)
      f8.reset ();

    if (f9 != null)
      f9.reset ();

    if (f10 != null)
      f10.reset ();
  }
}

void mouseClicked () {
  if (f1 != null)
    if (dist (f1.getX (), f1.getY(), mouseX, mouseY) < f1.getWidth ()/2)
      f1.mostraOpcions ();

  if (f2 != null)
    if (dist (f2.getX (), f2.getY(), mouseX, mouseY) < f2.getWidth ()/2)
      f2.mostraOpcions ();

  if (f3 != null)
    if (dist (f3.getX (), f3.getY(), mouseX, mouseY) < f3.getWidth ()/2)
      f3.mostraOpcions ();

  if (f4 != null)
    if (dist (f4.getX (), f4.getY(), mouseX, mouseY) < f4.getWidth ()/2)
      f4.mostraOpcions ();

  if (f5 != null)
    if (dist (f5.getX (), f5.getY(), mouseX, mouseY) < f5.getWidth ()/2)
      f5.mostraOpcions ();

  if (f6 != null)
    if (dist (f6.getX (), f6.getY(), mouseX, mouseY) < f6.getWidth ()/2)
      f6.mostraOpcions ();

  if (f7 != null)
    if (dist (f7.getX (), f7.getY(), mouseX, mouseY) < f7.getWidth ()/2)
      f7.mostraOpcions ();

  if (f8 != null)
    if (dist (f8.getX (), f8.getY(), mouseX, mouseY) < f8.getWidth ()/2)
      f8.mostraOpcions ();

  if (f9 != null)
    if (dist (f9.getX (), f9.getY(), mouseX, mouseY) < f9.getWidth ()/2)
      f9.mostraOpcions ();

  if (f10 != null)
    if (dist (f10.getX (), f10.getY(), mouseX, mouseY) < f10.getWidth ()/2)
      f10.mostraOpcions ();
}

void mouseDragged () {
  if (f1 != null && dist (f1.getX (), f1.getY(), mouseX, mouseY) < f1.getWidth ()/2)
    f1.setPosicio (mouseX, mouseY);

  if (f2 != null && dist (f2.getX (), f2.getY(), mouseX, mouseY) < f2.getWidth ()/2)
    f2.setPosicio (mouseX, mouseY);

  if (f3 != null && dist (f3.getX (), f3.getY(), mouseX, mouseY) < f3.getWidth ()/2)
    f3.setPosicio (mouseX, mouseY);

  if (f4 != null && dist (f4.getX (), f4.getY(), mouseX, mouseY) < f4.getWidth ()/2)
    f4.setPosicio (mouseX, mouseY);

  if (f5 != null && dist (f5.getX (), f5.getY(), mouseX, mouseY) < f5.getWidth ()/2)
    f5.setPosicio (mouseX, mouseY);

  if (f6 != null && dist (f6.getX (), f6.getY(), mouseX, mouseY) < f6.getWidth ()/2)
    f6.setPosicio (mouseX, mouseY);

  if (f7 != null && dist (f7.getX (), f7.getY(), mouseX, mouseY) < f7.getWidth ()/2)
    f7.setPosicio (mouseX, mouseY);

  if (f8 != null && dist (f8.getX (), f8.getY(), mouseX, mouseY) < f8.getWidth ()/2)
    f8.setPosicio (mouseX, mouseY);

  if (f9 != null && dist (f9.getX (), f9.getY(), mouseX, mouseY) < f9.getWidth ()/2)
    f9.setPosicio (mouseX, mouseY);

  if (f10 != null && dist (f10.getX (), f10.getY(), mouseX, mouseY) < f10.getWidth ()/2)
    f10.setPosicio (mouseX, mouseY);
}
