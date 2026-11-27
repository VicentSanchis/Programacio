/*
 * Activitat 520. Error de tipus (Versió corregida)
 * Corregeix les incompatibilitats de tipus genèrics en ArrayList<String>
 * i HashMap<String, Integer>.
 */

import java.util.ArrayList;
import java.util.HashMap;

void setup() {
  size(680, 240);
  background(245);

  ArrayList<String> noms = new ArrayList<String>();
  noms.add("Anna");
  noms.add("Pau");

  // Corregit: es recupera un String des d'un ArrayList<String>
  String primerNom = noms.get(0);

  // Corregit: s'afegeix un String (per exemple, "25" o un nom nou)
  noms.add("25");

  HashMap<String, Integer> edats = new HashMap<String, Integer>();

  // Corregit: clau String ("Anna") i valor Integer (20)
  edats.put("Anna", 20);

  // Corregit: clau String ("Pau") i valor Integer (30)
  edats.put("Pau", 30);

  println("Primer nom: " + primerNom);
  println("Llista de noms: " + noms);
  println("Mapa d'edats: " + edats);

  fill(25);
  textSize(18);
  text("Activitat 520 - Error de tipus (Corregit)", 25, 38);

  textSize(14);
  text("Primer nom (String): " + primerNom, 25, 88);
  text("ArrayList<String> noms: " + noms, 25, 118);
  text("HashMap<String, Integer> edats: " + edats, 25, 148);
}
