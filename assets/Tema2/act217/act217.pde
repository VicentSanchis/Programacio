/**
 * -------------------------------------------------------------------
 * TÍTOL: Activitat 217 - Conversions de Tipus de Dades (Implícita i Explícita)
 * DESCRIPCIÓ: Programa per practicar l'ampliació automàtica de tipus (widening)
 *            i el cast explícit amb pèrdua de precisió per truncament (narrowing).
 * -------------------------------------------------------------------
 */

void setup() {
  size(650, 250);
  background(245);

  // =========================================================================
  // PAS 1: Declaració d'una variable int amb un valor qualsevol
  // =========================================================================
  int quantitatPunts = 150;

  // =========================================================================
  // PAS 2: Conversió implícita (de int a double)
  // =========================================================================
  // No cal fer cap operació especial (cast explícit) perquè el tipus double
  // té més capacitat que el tipus int. Java fa la conversió automàticament.
  double puntsTotalsDouble = quantitatPunts;

  // =========================================================================
  // PAS 3: Declaració d'una variable double i conversió explícita (de double a int)
  // =========================================================================
  double preuArticleOriginal = 49.99;
  
  // Per passar de double a int, OBLIGATÒRIAMENT hem de fer un cast explícit (int).
  // Això passa perquè estem intentant encabir un tipus més gran dins d'un de més petit.
  // Conseqüència: Es perd tota la part decimal per truncament (no s'arrodoneix, s'elimina).
  int preuEnterConvertit = (int) preuArticleOriginal;

  // =========================================================================
  // PAS 4: Mostrar els resultats per la consola (println)
  // =========================================================================
  println("==================================================");
  println("     RESULTATS DE LES CONVERSIONS DE DADES        ");
  println("==================================================");
  println("1. CONVERSIÓ IMPLÍCITA (int -> double):");
  println("   - Valor original enter (int): " + quantitatPunts);
  println("   - Valor convertit (double):   " + puntsTotalsDouble);
  println("--------------------------------------------------");
  println("2. CONVERSIÓ EXPLÍCITA / CAST (double -> int):");
  println("   - Valor original amb decimals (double): " + preuArticleOriginal);
  println("   - Valor convertit amb cast (int):       " + preuEnterConvertit);
  println("     * ATENCIÓ: S'ha perdut la part decimal (.99).");
  println("==================================================");
}

void draw() {
  // Representació gràfica d'informació a la finestra de Processing
  fill(40);
  textSize(15);
  text("Activitat 217 executada correctament.", 30, 60);
  textSize(13);
  text("Consulta la consola de Processing per veure els resultats detallats:", 30, 95);
  text("• int -> double: Conversió implícita (segura i automàtica).", 50, 130);
  text("• double -> int: Conversió explícita amb cast (produeix truncament).", 50, 160);
}
