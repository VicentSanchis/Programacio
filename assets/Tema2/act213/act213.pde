/**
 * -------------------------------------------------------------------
 * TÍTOL: Activitat 213 - Expressions Relacionals i Comparacions
 * DESCRIPCIÓ: Anàlisi d'operadors relacionals bàsics, diferència entre 
 *            comparar referències i continguts (strings i arrays), i 
 *            aplicació de modificacions amb operadors lògics i decimals.
 * -------------------------------------------------------------------
 */

void setup() {
  size(500, 200); // Definim una finestra gràfica bàsica
  background(240);
  
  // ==========================================
  // 1. CODI ORIGINAL I ANÀLISI D'OPERADORS
  // ==========================================
  int a = 20, b = 10;
  String x = "Thank", y = "Thank";
  int ar[] = { 1, 2, 3 };
  int br[] = { 1, 2, 3 };
  boolean condicion = true;

  println("=== 1. RESULTATS DEL CODI ORIGINAL ==CH");
  println("a == b (20 == 10) : " + (a == b));       // Fals: valors diferents
  println("a < b  (20 < 10)  : " + (a < b));        // Fals: 20 no és menor
  println("a <= b (20 <= 10) : " + (a <= b));       // Fals
  println("a > b  (20 > 10)  : " + (a > b));        // Cert: 20 és major
  println("a >= b (20 >= 10) : " + (a >= b));       // Cert
  println("a != b (20 != 10) : " + (a != b));       // Cert: són diferents

  // Nota sobre Arrays: '==' comprova si apunten al mateix objecte en memòria, 
  // no el seu contingut. Per això s'utilitza Arrays.equals().
  println("ar == br (referències): " + (ar == br)); // Fals (són objectes diferents)
  println("Arrays.equals(ar, br): " + java.util.Arrays.equals(ar, br)); // Cert (mateix contingut)

  println("condicion == true  : " + (condicion == true)); // Cert

  // ==========================================
  // 2. MODIFICACIONS I CASOS NOUS (AMPLIACIÓ)
  // ==========================================
  println("\n=== 2. MODIFICACIONS I CASOS PRÀCTICS ===");

  // Modificació A: Comparació de Strings (Objectes en Java)
  // Utilitzar '==' en cadenes creades dinàmicament pot fallar perquè compara referències.
  String str1 = "Hola";
  String str2 = new String("Hola");
  println("str1 == str2 (amb operador ==): " + (str1 == str2)); // Fals (referències de memòria diferents)
  println("str1.equals(str2) (amb mètode): " + str1.equals(str2)); // Cert (compara el text intern)

  // Modificació B: Combinació d'operadors relacionals amb lògics (AND / OR)
  int notaExamen = 7;
  boolean entregaPuntual = true;
  // Aprovat si la nota és >= 5 I ha entregat a temps
  boolean notaFinalAprovada = (notaExamen >= 5) && entregaPuntual;
  println("Aprovat per nota i entrega: " + notaFinalAprovada); // Cert

  // Modificació C: Cas límit amb nombres decimals (Punt flotant)
  // Degut a com s'emmagatzemen els floats, 0.1 + 0.2 no és exactament 0.3
  float sumaDecimals = 0.1 + 0.2;
  float valorEsperat = 0.3;
  println("0.1 + 0.2 == 0.3 (directe): " + (sumaDecimals == valorEsperat)); // Fals!
  // Solució amb marge de tolerància (epsilon)
  boolean aproximacioValida = abs(sumaDecimals - valorEsperat) < 0.00001;
  println("Comparació amb tolerància (abs < epsilon): " + aproximacioValida); // Cert
}

void draw() {
  // Missatge informatiu a la pantalla gràfica
  fill(50);
  textSize(15);
  text("Execució finalitzada correctament.", 30, 80);
  text("Consulta la consola inferior per veure tots els resultats.", 30, 110);
}
