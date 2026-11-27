/*
Exactament cinc dígits:

    Expressió regular: ^\d{5}$ (o \b\d{5}\b per a paraula/token complet).

    Desglossament: ^ indica l'inici de la cadena, \d representa un dígit (0-9), {5} fixa la repetició exacta a 5 dígits i $ marca el final de la cadena.

Una lletra majúscula seguida de tres dígits:

    Expressió regular: ^[A-Z]\d{3}$.

    Desglossament: ^ marca l'inici, [A-Z] representa una única lletra majúscula de la A a la Z, \d{3} indica exactament tres dígits i $ marca el final.

Entre 4 i 6 lletres minúscules:

    Expressió regular: ^[a-z]{4,6}$.

    Desglossament: ^ indica l'inici, [a-z] representa una lletra minúscula de la a a la z, {4,6} estableix un mínim de 4 i un màxim de 6 repeticions i $ marca el final.

Exactament dues lletres majúscules, un guió i quatre dígits:

    Expressió regular: ^[A-Z]{2}-\d{4}$.

    Desglossament: ^ marca l'inici, [A-Z]{2} representa dues lletres majúscules seguides, - és el caràcter literal guió, \d{4} representa quatre dígits i $ marca el final.

Una paraula que comence per A:

    Expressió regular: \bA\w*.

    Desglossament: \b marca el límit d'inici de paraula, A és la lletra inicial literal A i \w* representa zero o més caràcters de paraula (lletres, dígits o guió baix) a continuació.

Una paraula que acabe en java:

    Expressió regular: \b\w*java\b.

    Desglossament: \b marca l'inici de paraula, \w* representa zero o més caràcters de paraula previs, java és la seqüència literal final i \b marca el final de la paraula.

El text DAW o DAM:

    Expressió regular: ^(DAW|DAM)$ (o \b(DAW|DAM)\b dins d'un text).

    Desglossament: ^ i $ delimiten la cadena completa, els parèntesis ( ... ) agrupen l'alternativa i | actua com a operador "o" lògic entre DAW i DAM.
*/

/*
 * Activitat 521. Construir expressions regulars
 * Comprova cada patró amb exemples vàlids i no vàlids en Java/Processing.
 */

import java.util.regex.Pattern;

void setup() {
  size(680, 220);
  background(245);

  println("1. 5 dígits ('12345'): " + Pattern.matches("^\\d{5}$", "12345"));
  println("2. Majúscula + 3 dígits ('B409'): " + Pattern.matches("^[A-Z]\\d{3}$", "B409"));
  println("3. 4-6 minúscules ('arbre'): " + Pattern.matches("^[a-z]{4,6}$", "arbre"));
  println("4. XX-9999 ('AB-1234'): " + Pattern.matches("^[A-Z]{2}-\\d{4}$", "AB-1234"));
  println("5. Comença per A ('Alumne'): " + Pattern.matches("^A\\w*", "Alumne"));
  println("6. Acaba en java ('holajava'): " + Pattern.matches("^\\w*java$", "holajava"));
  println("7. DAW o DAM ('DAW'): " + Pattern.matches("^(DAW|DAM)$", "DAW"));

  fill(25);
  textSize(18);
  text("Activitat 521 - Expressions regulars", 25, 40);

  textSize(14);
  text("Patrons comprovats per consola amb Pattern.matches().", 25, 85);
} 
