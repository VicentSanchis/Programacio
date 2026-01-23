void setup () {
  size(640, 480);
}

void draw() {
  background (255);
  int hora = (int)random(0, 24);

  if (hora >= 7 && hora <= 9)
    println("Eres matiner");

  else if (hora > 9 && hora <= 12)
    println("Deuries haver esmorzat ja");

  else if (hora > 12 && hora <= 15)
    println("Es hora de dinar si no has dinat");

  else if (hora > 15 && hora <= 18)
    println("Si no has fet una migdiada oblidat");

  else if (hora > 18 && hora <= 20)
    println("Hora de la cervesa");

  else if (hora > 20 && hora <= 22)
    println ("Hora de sopar");

  else
  println("A dormir!");

  delay (1000);
}
