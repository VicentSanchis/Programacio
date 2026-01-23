int [] arrayNumeros; //<>//

void setup () {
  arrayNumeros = new int [20];
  for (int i=0; i < 20; i ++)
    arrayNumeros[i] = (int)random(1, 100);
    
  noLoop();
}

void draw () {
  println("Primer apartat: busquem el número 15");
  for (int i = 0; i < arrayNumeros.length; i ++) {
    if (arrayNumeros[i] == 15) {
      println("He trobat el número 15 a la posició " + i );
      break;
    }
  }
  
  println("Segon apartat: mostrem nombres senars");
  for (int i=0; i < arrayNumeros.length; i ++) { 
    if (arrayNumeros[i] % 2 == 0) 
      continue;
    
    println ("ArrayNumeros[" + i + "] = " + arrayNumeros[i]);
  }
  
  println("Tercer apartat: " );
  for (int i=0; i < arrayNumeros.length; i ++) {
    if (arrayNumeros[i] % 2 != 0)
      continue;
      
    else if (i >= 10 && arrayNumeros [i] % 2 == 0) {
      println ("El nombre parell " + arrayNumeros [i] + " es troba a la posició " + i + " (major que 10)");
      break;
    }
  }
}
