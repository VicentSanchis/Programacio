/*
 * Activitat 516. Recorreguts avançats i Iteradors
 * 1. Recorregut lineal amb for-each i càlculs bàsics.
 * 2. Demostració de ConcurrentModificationException en modificar una llista
 *    dins d'un for-each i solució segura amb Iterator (.next() i .remove()).
 * 3. Recorregut d'un HashMap mitjançant keySet() i entrySet().
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

ArrayList<Integer> puntuacions;
ArrayList<Integer> llistaModificable;
HashMap<String, String> agenda;

boolean errorConcurrentCapturat = false;
String missatgeError = "";
ArrayList<Integer> eliminatsAmbIterator = new ArrayList<Integer>();

void setup() {
  size(780, 440);
  background(245);

  // =========================================================
  // PART 1: Recorregut lineal amb for-each i càlculs bàsics
  // =========================================================
  puntuacions = new ArrayList<Integer>();
  puntuacions.add(6);
  puntuacions.add(9);
  puntuacions.add(4);
  puntuacions.add(8);
  puntuacions.add(3);
  puntuacions.add(10);
  puntuacions.add(5);

  println("=== PART 1: RECORREGUT AMB FOR-EACH ===");
  int suma = 0;
  int aprovats = 0;

  print("Elements: ");
  for (Integer p : puntuacions) {
    print(p + " ");
    suma += p;
    if (p >= 5) {
      aprovats++;
    }
  }
  println();

  float mitjana = (puntuacions.size() > 0) ? (float) suma / puntuacions.size() : 0;
  println("Suma total: " + suma + " | Mitjana: " + nf(mitjana, 1, 2) + " | Aprovats (>=5): " + aprovats);

  // =========================================================
  // PART 2: Modificació concurrent i ús segur de l'Iterator
  // =========================================================
  println("\n=== PART 2: MODIFICACIÓ CONCURRENT I ITERATOR ===");
  llistaModificable = new ArrayList<Integer>(puntuacions);

  // Intent intencionat de modificar la llista dins d'un for-each (capturat amb try-catch)
  try {
    for (Integer num : llistaModificable) {
      if (num < 5) {
        llistaModificable.remove(num); // Provoca ConcurrentModificationException
      }
    }
  } catch (Exception e) {
    errorConcurrentCapturat = true;
    missatgeError = e.getClass().getSimpleName() + ": " + e.getMessage();
    println("Excepció en modificar dins de for-each -> " + missatgeError);
  }

  // Solució segura amb Iterator: eliminar valors menors de 5
  Iterator<Integer> it = llistaModificable.iterator();
  while (it.hasNext()) {
    Integer actual = it.next();
    if (actual < 5) {
      eliminatsAmbIterator.add(actual);
      it.remove(); // Eliminació segura sobre l'iterador
    }
  }
  println("Elements eliminats amb Iterator (< 5): " + eliminatsAmbIterator);
  println("Llista resultant després d'Iterator: " + llistaModificable);

  // =========================================================
  // PART 3: Recorregut de Mapes (HashMap) amb keySet() i entrySet()
  // =========================================================
  println("\n=== PART 3: RECORREGUT D'UN HASHMAP ===");
  agenda = new HashMap<String, String>();
  agenda.put("Marta", "611223344");
  agenda.put("Marc", "622334455");
  agenda.put("Núria", "633445566");
  agenda.put("Òscar", "644556677");

  // 3a. Recorregut per claus amb keySet()
  println("--- Recorregut per claus (keySet()) ---");
  for (String clau : agenda.keySet()) {
    String telefon = agenda.get(clau);
    println("  Clau (Nom): " + clau + " -> Valor (Telèfon): " + telefon);
  }

  // 3b. Recorregut directe per parelles clau-valor amb entrySet()
  println("--- Recorregut directe per parelles (entrySet()) ---");
  for (Map.Entry<String, String> parella : agenda.entrySet()) {
    println("  [" + parella.getKey() + "] : " + parella.getValue());
  }

  // =========================================================
  // REPRESENTACIÓ VISUAL AL CANVAS
  // =========================================================
  fill(25);
  textSize(19);
  text("Activitat 516 - Recorreguts avançats i Iteradors", 25, 35);

  textSize(13);
  text("1. for-each -> Puntuacions: " + puntuacions + " | Mitjana: " + nf(mitjana, 1, 2) + " | Aprovats: " + aprovats, 25, 75);

  fill(160, 40, 40);
  text("2a. for-each + remove() -> " + (errorConcurrentCapturat ? missatgeError : "Sense excepció"), 25, 112);

  fill(20, 110, 60);
  text("2b. Iterator.remove() (<5) -> Eliminats: " + eliminatsAmbIterator + " | Restants: " + llistaModificable, 25, 138);

  fill(25);
  text("3. HashMap (agenda) -> keySet() i entrySet() mostrats a la consola:", 25, 178);

  int yMapa = 205;
  for (Map.Entry<String, String> entrada : agenda.entrySet()) {
    text("• " + entrada.getKey() + " -> " + entrada.getValue(), 40, yMapa);
    yMapa += 22;
  }

  fill(80);
  textSize(12);
  text("Consulta la consola de Processing per veure el detall complet de les tres parts.", 25, 405);
}
