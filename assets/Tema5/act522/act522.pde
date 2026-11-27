/*
 * Activitat 522. Buscar i substituir informació amb expressions regulars
 * 1. Cerca totes les seqüències de tres dígits amb Pattern, Matcher i find().
 * 2. Substitueix totes les aparicions de "DAW" per "1DAW" amb replaceAll().
 * 3. Substitueix només la primera aparició de "DAW" per "1DAW" amb replaceFirst().
 */

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

ArrayList<String> trobats;
String textTotsCanvis;
String textPrimerCanvi;

void setup() {
  size(760, 320);
  background(245);

  // 1. Cerca de seqüències de tres dígits amb Pattern, Matcher i find()
  String textCodis = "Els codis 123, 456 i 789 són vàlids.";
  Pattern patroDigits = Pattern.compile("\\b\\d{3}\\b");
  Matcher matcherDigits = patroDigits.matcher(textCodis);

  trobats = new ArrayList<String>();
  println("=== SEQÜÈNCIES DE TRES DÍGITS TROBADES ===");
  while (matcherDigits.find()) {
    String coincidència = matcherDigits.group();
    trobats.add(coincidència);
    println(coincidència);
  }

  // 2. Substitució global (replaceAll) i puntual (replaceFirst) de DAW -> 1DAW
  String textCurs = "El curs DAW és interessant. DAW és un cicle de programació.";
  Pattern patroDAW = Pattern.compile("\\bDAW\\b");
  Matcher matcherDAW = patroDAW.matcher(textCurs);

  textTotsCanvis = matcherDAW.replaceAll("1DAW");
  textPrimerCanvi = matcherDAW.replaceFirst("1DAW");

  println("\n=== SUBSTITUCIÓ DE 'DAW' PER '1DAW' ===");
  println("Original:       " + textCurs);
  println("replaceAll():   " + textTotsCanvis);
  println("replaceFirst(): " + textPrimerCanvi);

  // Representació visual al canvas
  fill(25);
  textSize(18);
  text("Activitat 522 - Buscar i substituir informació (Regex)", 25, 36);

  textSize(13);
  text("1. Tres dígits trobats (find()): " + trobats, 25, 82);
  text("2. replaceAll()   -> " + textTotsCanvis, 25, 122);
  text("3. replaceFirst() -> " + textPrimerCanvi, 25, 154);

  fill(85);
  textSize(12);
  text("replaceAll() modifica totes les coincidències; replaceFirst() modifica únicament la primera.", 25, 205);
}
