void setup () {
  size (500, 500);
}

void draw () {
  background (255);
  dibuixaCor (new PVector(150,250), 100, 0xFFFF0000);
}

void dibuixaCor (PVector pos, int tam, int col) {
  noStroke();
  fill(col);
  
  // Primer calculem els punts del triangle que formarà part del cor
  float t1x, t1y, t2x, t2y, t3x, t3y;
  t1x = pos.x-tam-1;
  t1y = pos.y-tam/2+2;
  t2x = pos.x+tam+1;
  t2y = pos.y-tam/2+2;
  t3x = pos.x;
  t3y = pos.y+tam;
  triangle (t1x, t1y, t2x, t2y, t3x, t3y);
  
  // Després  hem de calcular els centres dels dos cercles que formaran el nostre cor
  float c1x, c1y, c2x, c2y;
  c1x = pos.x-tam/2;
  c1y = pos.y-tam/2;
  c2x = pos.x+tam/2;
  c2y = pos.y-tam/2;
  circle(c1x, c1y, tam+3);
  circle(c2x, c2y, tam+3); 
  
  // Finalment dibuixem dos linies adicionals al triangle per que quede bé.
  stroke(255,0,0);
  strokeWeight(7);
  line(pos.x-tam+6, pos.y-tam/2+20, pos.x, pos.y+tam-5);
  line(pos.x+tam-6, pos.y-tam/2+20, pos.x, pos.y+tam-5);
}
