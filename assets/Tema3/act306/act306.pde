import Dibuixem.*; //<>//

Cercle c1, c2;
Quadrat q1, q2;
Triangle t1, t2;
PVector posCercle1, posCercle2, posQuadrat1, posQuadrat2, posTriangle1, posTriangle2;

void setup () {
  size(640,480, P3D);
  ortho();
  
  // Configurem inicialment els cercles
  posCercle1 = new PVector (160, 110);
  c1 = new Cercle (this, posCercle1.x, posCercle1.y, 120);
  c1.setColor (color (255, 0, 0));
  c1.canvia3D ();
  
  posCercle2 = new PVector (320, 320);
  c2 = new Cercle (this, posCercle2.x, posCercle2.y, 90);
  c2.setColor (color (128, 0, 0));
  c2.mostraOpcions ();
  
  // Configurem inicialment els quadrats
  posQuadrat1 = new PVector (320, 110);
  q1 = new Quadrat (this, posQuadrat1.x, posQuadrat1.y, 100);
  q1.setColor(color(0,128,0));
  q1.mostraOpcions ();
  
  posQuadrat2 = new PVector (480, 320);
  q2 = new Quadrat (this, posQuadrat2.x, posQuadrat2.y, 60);
  q2.setColor (color (0, 255, 0));
  q2.canvia3D ();
  q2.mostraOpcions ();
  
  // Configurem incialment els triangles
  posTriangle1 = new PVector (480, 110);
  t1 = new Triangle (this, posTriangle1.x, posTriangle1.y, 80);
  t1.setColor (color (0, 0, 255));
  t1.canvia3D ();
  
  posTriangle2 = new PVector (160, 320);
  t2 = new Triangle (this, posTriangle2.x, posTriangle2.y, 100);
  t2.setColor (color (0, 0, 255));
  t2.mostraOpcions ();
}

void draw () {
  background(255);
  c1.display ();
  c2.display ();
  q1.display ();
  q2.display ();
  t1.display ();
  t2.display ();
}
void keyPressed () {

}

void mouseClicked () {
  if (c1.clicSobre(mouseX, mouseY))
    c1.activaOpcions();
    
  if (c2.clicSobre(mouseX, mouseY))
    c2.activaOpcions();
    
  if (q1.clicSobre(mouseX, mouseY))
    q1.activaOpcions();
    
  if (q2.clicSobre(mouseX, mouseY))
    q2.activaOpcions();
    
  if (t1.clicSobre(mouseX, mouseY))
   t1.activaOpcions();
   
  if (t2.clicSobre(mouseX, mouseY))
    t2.activaOpcions();
}

void mouseDragged () {
  if (c1.clicSobre(mouseX, mouseY))
    c1.setPosicio(mouseX, mouseY);
    
  if (c2.clicSobre(mouseX, mouseY))
    c2.setPosicio(mouseX, mouseY);
    
  if (q1.clicSobre(mouseX, mouseY))
    q1.setPosicio(mouseX, mouseY);
    
  if (q2.clicSobre(mouseX, mouseY))
    q2.setPosicio(mouseX, mouseY);
    
  if (t1.clicSobre(mouseX, mouseY))
    t1.setPosicio(mouseX, mouseY);
    
  if (t2.clicSobre(mouseX, mouseY))
    t2.setPosicio(mouseX, mouseY);
}
