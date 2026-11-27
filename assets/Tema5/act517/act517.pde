/*
 * Activitat 517. Gestió d'una acadèmia amb col·leccions tipades
 * Utilitza ArrayList<String>, HashSet<Integer> i HashMap<String, Double>
 * amb 10 alumnes i les seues notes, recorreguts amb for-each i entrySet(),
 * i càlcul de nota mitjana, nota màxima, nota mínima i nombre d'aprovats.
 */

import java.util.ArrayList;
import java.util.HashSet;
import java.util.HashMap;
import java.util.Map;

ArrayList<String> alumnes;
HashSet<Integer> notesDiferents;
HashMap<String, Double> notesAlumnes;

void setup() {
  size(780, 440);
  background(245);

  // 1. Inicialització de les tres col·leccions amb genèrics
  alumnes = new ArrayList<String>();
  notesDiferents = new HashSet<Integer>();
  notesAlumnes = new HashMap<String, Double>();

  String[] nomsInicials = {
    "Anna", "Pau", "Maria", "Marc", "Clara",
    "Jordi", "Laia", "Biel", "Núria", "Òscar"
  };
  double[] notesInicials = {
    8.5, 4.2, 9.0, 6.5, 4.2,
    7.5, 10.0, 3.8, 8.5, 5.5
  };

  for (int i = 0; i < nomsInicials.length; i++) {
    String nom = nomsInicials[i];
    double nota = notesInicials[i];

    alumnes.add(nom);
    notesAlumnes.put(nom, nota);
    notesDiferents.add(int(round((float) nota)));
  }

  // 2. Visualització per consola
  println("=== 2a. NOMS DELS ALUMNES (ArrayList<String> amb for-each) ===");
  for (String nom : alumnes) {
    println("  • " + nom);
  }

  println("\n=== 2b. NOTES DIFERENTS OBTINGUDES (HashSet<Integer> amb for-each) ===");
  for (Integer notaUnica : notesDiferents) {
    println("  • " + notaUnica);
  }

  println("\n=== 2c. ALUMNE I NOTA (HashMap<String, Double> amb entrySet()) ===");
  for (Map.Entry<String, Double> entrada : notesAlumnes.entrySet()) {
    println("  • " + entrada.getKey() + " -> " + entrada.getValue());
  }

  // 3. Estadístiques i resultats
  double sumaNotes = 0.0;
  double notaMaxima = -1.0;
  double notaMinima = 999.0;
  int aprovats = 0;

  for (Map.Entry<String, Double> entrada : notesAlumnes.entrySet()) {
    double n = entrada.getValue();
    sumaNotes += n;
    if (n > notaMaxima) {
      notaMaxima = n;
    }
    if (n < notaMinima) {
      notaMinima = n;
    }
    if (n >= 5.0) {
      aprovats++;
    }
  }

  double mitjana = (notesAlumnes.size() > 0) ? (sumaNotes / notesAlumnes.size()) : 0.0;

  println("\n=== 3. ESTADÍSTIQUES DEL GRUP ===");
  println("Nota mitjana: " + nf((float) mitjana, 1, 2));
  println("Nota més alta: " + nf((float) notaMaxima, 1, 1));
  println("Nota més baixa: " + nf((float) notaMinima, 1, 1));
  println("Alumnes aprovats (>= 5.0): " + aprovats + " de " + notesAlumnes.size());

  // Representació visual al canvas
  fill(25);
  textSize(19);
  text("Activitat 517 - Gestió d'una acadèmia (Genèrics)", 25, 35);

  textSize(13);
  String textNoms = "Alumnes (" + alumnes.size() + "): ";
  for (String nom : alumnes) {
    textNoms += nom + ", ";
  }
  text(textNoms.substring(0, textNoms.length() - 2), 25, 70, width - 50, 35);

  text("Notes diferents (HashSet<Integer>): " + notesDiferents, 25, 110);

  int col = 0;
  int fila = 0;
  for (Map.Entry<String, Double> entrada : notesAlumnes.entrySet()) {
    int x = 35 + col * 240;
    int y = 148 + fila * 22;
    text("• " + entrada.getKey() + ": " + nf((float) entrada.getValue().doubleValue(), 1, 1), x, y);
    fila++;
    if (fila == 5) {
      fila = 0;
      col++;
    }
  }

  fill(20, 100, 60);
  textSize(14);
  text(
    "Mitjana: " + nf((float) mitjana, 1, 2) +
    "   |   Màxima: " + nf((float) notaMaxima, 1, 1) +
    "   |   Mínima: " + nf((float) notaMinima, 1, 1) +
    "   |   Aprovats: " + aprovats + "/" + notesAlumnes.size(),
    25, 290
  );

  fill(80);
  textSize(12);
  text("El detall complet dels recorreguts i estadístiques s'ha imprés a la consola de Processing.", 25, 330);
}
