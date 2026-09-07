void setup () {
  size (500, 500);
}

void draw () {
  background (0, 230, 220);
  stroke (0);
  strokeWeight (2);
  fill (235);
  rect (0, 300, 500, 200);
  
  // Dibuixem la figura del ninot de neu
  fill (255);
  ellipse (250, 280, 180, 160);
  ellipse (250, 180, 130, 120);
  
  // Dibuixem la bufanda
  fill (255, 0, 0);
  rect (200, 125, 100, 25, 10);
  rect (215, 150, 25, 40, 30);
  rect (210, 120, 35, 35, 10);
 
  // Dibuixem el cap
  fill (255);
  ellipse (250, 100, 85, 80);
  
  // Dibuixem els braços del ninot de neu
  stroke (100, 70, 30);
  strokeWeight (3);
  line (200, 170, 140, 140);
  line (300, 170, 360, 160);
  line (350, 160, 355, 150);
  line (350, 160, 358, 170);
  line (145, 142, 140, 133);
  line (145, 142, 140, 150);
  
  // Dibuixem els ulls del ninot de neu
  fill (0);
  stroke (0);
  circle (233, 90, 10);
  circle (263, 90, 10);
  stroke (255);
  point (230, 87);
  point (260, 87);
  
  // Dibuixem el nas
  stroke (0);
  strokeWeight (1);
  fill (255, 128, 0);
  triangle (245, 100, 252, 100, 248, 112);
  
  // Dibuixem la boca
  strokeWeight (7);
  point (232, 115);
  point (238, 123);
  point (250, 127);
  point (260, 123);
  point (265, 115);
  
  // Dibuixem els botons
  strokeWeight (15);
  point (250, 185);
  point (250, 215);
  point (250, 260);
  point (250, 290);
  point (250, 320);
}

void mouseClicked () {
  println (mouseX + " - " + mouseY);
}
