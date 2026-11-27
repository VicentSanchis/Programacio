/*
 * Activitat 523. Validador de contrasenyes
 * Valida contrasenyes amb una expressió regular que exigeix:
 * - Entre 8 i 12 caràcters.
 * - Començar per una lletra.
 * - Contindre almenys un dígit.
 * - Només lletres i dígits.
 */

import java.util.regex.Pattern;

String patroContrasenya = "^(?=.*[0-9])[A-Za-z][A-Za-z0-9]{7,11}$";

void setup() {
  size(760, 340);
  background(245);

  String[] proves = {
    "Alumne2026",   // Vàlida: 10 caràcters, comença per lletra, té dígits, només lletres i dígits
    "daw12345",     // Vàlida: 8 caràcters, comença per lletra, té dígits
    "abcde1234567", // Vàlida: 12 caràcters al límit superior
    "Pass12",       // No vàlida: només 6 caràcters (< 8)
    "Contrasenya1234", // No vàlida: 14 caràcters (> 12)
    "1Password",    // No vàlida: comença per dígit
    "Contrasenya",  // No vàlida: no conté cap dígit
    "Alumne_2026"   // No vàlida: conté guió baix '_'
  };

  println("=== PROVES DEL VALIDADOR DE CONTRASENYES ===");
  for (int i = 0; i < proves.length; i++) {
    boolean valida = Pattern.matches(patroContrasenya, proves[i]);
    String resultat = valida ? "VÀLIDA" : "NO VÀLIDA";
    println((i + 1) + ". '" + proves[i] + "' -> " + resultat);
  }

  fill(25);
  textSize(18);
  text("Activitat 523 - Validador de contrasenyes (Regex)", 25, 36);

  textSize(12);
  text("Patró: ^(?!.*\\s)(?=.*[0-9])[A-Za-z][A-Za-z0-9]{7,11}$  (base: " + patroContrasenya + ")", 25, 64);

  int y = 96;
  for (int i = 0; i < proves.length; i++) {
    boolean valida = Pattern.matches(patroContrasenya, proves[i]);
    if (valida) {
      fill(20, 120, 50);
    } else {
      fill(170, 35, 35);
    }
    String estat = valida ? "VÀLIDA" : "NO VÀLIDA";
    text("• " + proves[i] + "  ->  " + estat, 35, y);
    y += 26;
  }
}
