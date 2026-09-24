/**
 * -------------------------------------------------------------------
 * TÍTOL: Activitat 214 - Taules de Veritat i Operadors Lògics
 * DESCRIPCIÓ: Implementació de les taules de veritat dels operadors lògics 
 *            bàsics (AND, OR, NOT) i extensió amb expressions compostes i 
 *            avaluació de curtcircuit (short-circuit evaluation).
 * -------------------------------------------------------------------
 */

void setup() {
  size(400, 200);
  background(245);

  // =========================================================
  // 1. CODI ORIGINAL: TAULES DE VERITAT BÀSIQUES
  // =========================================================
  println("=========================================");
  println("       TAULES DE VERITAT (ORIGINAL)      ");
  println("=========================================");
  
  println("--- OPERADOR && (AND lògic) ---");
  // Retorna cert només si AMBDUES condicions són certes.
  println(" V  &&  V  = " + (true && true));   // Cert
  println(" V  &&  F  = " + (true && false));  // Fals
  println(" F  &&  V  = " + (false && true));  // Fals
  println(" F  &&  F  = " + (false && false)); // Fals

  println("--- OPERADOR || (OR lògic) ---");
  // Retorna cert si ALMENYS UNA de les condicions és certes.
  println(" V  ||  V  = " + (true || true));   // Cert
  println(" V  ||  F  = " + (true || false));  // Cert
  println(" F  ||  V  = " + (false || true));  // Cert
  println(" F  ||  F  = " + (false || false)); // Fals

  println("--- OPERADOR ! (NOT / Negació) ---");
  // Inverteix el valor de veritat actual.
  println(" !V (invers de true)  = " + !true);   // Fals
  println(" !F (invers de false) = " + !false);  // Cert

  // =========================================================
  // 2. MODIFICACIONS CREATIVES I CASOS PRÀCTICS (AMPLIACIÓ)
  // =========================================================
  println("\n=========================================");
  println("   MODIFICACIONS I EXPRESSIONS COMPOSTES ");
  println("=========================================");

  // Modificació A: Variables booleanes per a la presa de decisions
  boolean teEntrada = true;
  boolean esMajorEdat = false;
  boolean autoritzacioPares = true;

  // Lògica d'accés a un recinte: Ser major d'edat OR (tenir entrada AND autorització)
  boolean potEntrar = esMajorEdat || (teEntrada && autoritzacioPares);
  println("Accés permès (amb condicions compostes): " + potEntrar); // Cert

  // Modificació B: Demostració de les Lleis de De Morgan
  // !(A && B) és equivalent a !A || !B
  boolean a = true, b = false;
  boolean llei1Esquerra = !(a && b);
  boolean llei1Dreta = !a || !b;
  println("Llei de De Morgan (!(A && B) == (!A || !B)): " + (llei1Esquerra == llei1Dreta)); // Cert

  // Modificació C: Avaluació de curtcircuit (Short-circuit evaluation)
  // En l'expressió (x != 0 && y / x > 1), si x = 0, la primera part evita una divisió per zero.
  int divisor = 0;
  // Si posem (divisor != 0 && (10 / divisor > 2)), el programa no falla perquè 
  // en ser la primera part 'false', Java ja no avalua la segona part.
  boolean segurDavantDivisio = (divisor != 0) && ((10 / divisor) > 2);
  println("Avaluació segura contra divisió per zero: " + segurDavantDivisio); // Fals (sense error d'execució)
}

void draw() {
  // Presentació gràfica d'informació a la finestra de Processing
  fill(40);
  textSize(14);
  text("Execució de l'Activitat 214 completada.", 30, 70);
  text("Comprova la consola per veure les taules i les modificacions.", 30, 100);
}
