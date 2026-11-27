/*
 * Activitat 518. Autoboxing i unboxing
 * Comprovació pràctica de la conversió automàtica entre int i Integer
 * dins d'un ArrayList<Integer>.
 */

import java.util.ArrayList;

ArrayList<Integer> numeros;
int a = 10;
Integer b;
int c;

void setup() {
  size(680, 240);
  background(245);

  numeros = new ArrayList<Integer>();

  // Autoboxing: el primitiu int 'a' es converteix automàticament en Integer
  numeros.add(a);

  // Assignació entre referències Integer (sense unboxing)
  b = numeros.get(0);

  // Unboxing: l'objecte Integer retornat per get(0) es desempaqueta a primitiu int
  c = numeros.get(0);

  println("Valor primitiu inicial a: " + a);
  println("Objecte Integer b: " + b);
  println("Valor primitiu desempaquetat c: " + c);

  fill(25);
  textSize(18);
  text("Activitat 518 - Autoboxing i unboxing", 25, 38);

  textSize(14);
  text("1. numeros.add(a)  -> Autoboxing (int " + a + " -> Integer)", 25, 88);
  text("2. Integer b = numeros.get(0) -> Referència Integer (" + b + ")", 25, 118);
  text("3. int c = numeros.get(0) -> Unboxing (Integer -> int " + c + ")", 25, 148);
}
