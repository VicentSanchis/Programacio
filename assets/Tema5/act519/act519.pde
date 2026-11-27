/*
 * Activitat 519. Dissenya una col·lecció (Gestió d'un grup d'alumnes)
 * Emmagatzema nom, edat i nota final de cada alumne amb col·leccions tipades
 * i permet: 1. Afegir alumnes, 2. Mostrar-los, 3. Consultar informació,
 * 4. Modificar nota, 5. Calcular nota mitjana i 6. Mostrar aprovats (>= 5.0).
 */

import java.util.HashMap;
import java.util.ArrayList;
import java.util.Map;

HashMap<String, Integer> edatsAlumnes;
HashMap<String, Double> notesAlumnes;
ArrayList<String> ordreAlumnes;

String ultimMissatge = "Prem una tecla d'opció (1-6 o 0 per eixir).";
int modeAccio = 0; // 0: menú | 1: afegir alumne | 3: consultar | 4: modificar nota
int pasEntrada = 0; // 1: nom | 2: edat | 3: nota
String textEntrada = "";
String nomTemporal = "";
int edatTemporal = 0;

void setup() {
  size(780, 440);
  edatsAlumnes = new HashMap<String, Integer>();
  notesAlumnes = new HashMap<String, Double>();
  ordreAlumnes = new ArrayList<String>();

  // Dades inicials d'exemple
  ordreAlumnes.add("Anna");
  edatsAlumnes.put("Anna", 19);
  notesAlumnes.put("Anna", 8.5);

  ordreAlumnes.add("Pau");
  edatsAlumnes.put("Pau", 20);
  notesAlumnes.put("Pau", 4.2);

  ordreAlumnes.add("Carla");
  edatsAlumnes.put("Carla", 18);
  notesAlumnes.put("Carla", 7.0);

  mostrarMenu();
  mostrarAlumnesConsola();
}

void draw() {
  background(245);

  fill(25);
  textSize(19);
  text("Activitat 519 - Gestió d'un grup d'alumnes (Col·leccions tipades)", 25, 35);

  fill(60);
  textSize(13);
  text("Total d'alumnes registrats: " + ordreAlumnes.size(), 25, 68);

  int yLlista = 98;
  fill(25);
  if (ordreAlumnes.isEmpty()) {
    fill(160, 40, 40);
    text("No hi ha cap alumne al grup.", 35, yLlista);
  } else {
    for (int i = 0; i < ordreAlumnes.size(); i++) {
      String nom = ordreAlumnes.get(i);
      int edat = edatsAlumnes.get(nom);
      double nota = notesAlumnes.get(nom);
      String estat = (nota >= 5.0) ? "APROVAT" : "SUSPÉS";
      text("• " + (i + 1) + ". " + nom + " | Edat: " + edat + " anys | Nota: " + nf((float) nota, 1, 1) + " (" + estat + ")", 35, yLlista);
      yLlista += 22;
    }
  }

  int yMenu = 245;
  fill(25);
  textSize(13);
  text("[1] Afegir alumne   [2] Mostrar-los   [3] Consultar alumne   [4] Modificar nota", 25, yMenu);
  text("[5] Nota mitjana    [6] Aprovats      [0] Eixir", 25, yMenu + 22);

  if (modeAccio != 0) {
    fill(140, 60, 10);
    textSize(14);
    String instruccio = "";
    if (modeAccio == 1 && pasEntrada == 1) instruccio = "Nou alumne -> escriu el NOM i prem ENTER: ";
    else if (modeAccio == 1 && pasEntrada == 2) instruccio = "Alumne '" + nomTemporal + "' -> escriu l'EDAT i prem ENTER: ";
    else if (modeAccio == 1 && pasEntrada == 3) instruccio = "Alumne '" + nomTemporal + "' (" + edatTemporal + "a) -> escriu la NOTA FINAL i prem ENTER: ";
    else if (modeAccio == 3) instruccio = "Consultar alumne -> escriu el NOM i prem ENTER: ";
    else if (modeAccio == 4 && pasEntrada == 1) instruccio = "Modificar nota -> escriu el NOM de l'alumne i prem ENTER: ";
    else if (modeAccio == 4 && pasEntrada == 2) instruccio = "Nova nota per a '" + nomTemporal + "' i prem ENTER: ";
    text(instruccio + textEntrada + "_", 25, 308);
  }

  fill(15, 80, 150);
  textSize(14);
  text("Estat: " + ultimMissatge, 25, 350, width - 50, 70);
}

void mostrarMenu() {
  println("\n=== MENÚ GRUP D'ALUMNES ===");
  println("1. Afegir alumnes");
  println("2. Mostrar-los");
  println("3. Consultar la informació d'un alumne");
  println("4. Modificar la seua nota");
  println("5. Calcular la nota mitjana");
  println("6. Mostrar els alumnes aprovats");
  println("0. Eixir");
}

void mostrarAlumnesConsola() {
  if (ordreAlumnes.isEmpty()) {
    println("No hi ha cap alumne registrat.");
  } else {
    println("--- LLISTAT D'ALUMNES ---");
    for (String nom : ordreAlumnes) {
      println("  • " + nom + " | Edat: " + edatsAlumnes.get(nom) + " | Nota: " + notesAlumnes.get(nom));
    }
  }
}

void keyPressed() {
  if (modeAccio != 0) {
    if (key == ENTER || key == RETURN) {
      String valor = textEntrada.trim();
      textEntrada = "";

      if (valor.length() == 0) {
        ultimMissatge = "El camp no pot estar buit.";
        println(ultimMissatge);
        return;
      }

      if (modeAccio == 1) {
        if (pasEntrada == 1) {
          if (notesAlumnes.containsKey(valor)) {
            ultimMissatge = "L'alumne '" + valor + "' ja existeix.";
            println(ultimMissatge);
            modeAccio = 0;
            pasEntrada = 0;
          } else {
            nomTemporal = valor;
            pasEntrada = 2;
            ultimMissatge = "Introdueix l'edat de " + nomTemporal + ".";
          }
        } else if (pasEntrada == 2) {
          edatTemporal = int(valor);
          pasEntrada = 3;
          ultimMissatge = "Introdueix la nota final de " + nomTemporal + ".";
        } else if (pasEntrada == 3) {
          double nota = double(valor);
          ordreAlumnes.add(nomTemporal);
          edatsAlumnes.put(nomTemporal, edatTemporal);
          notesAlumnes.put(nomTemporal, nota);
          ultimMissatge = "S'ha afegit " + nomTemporal + " (" + edatTemporal + " anys, nota " + nota + ").";
          println(ultimMissatge);
          modeAccio = 0;
          pasEntrada = 0;
        }
      } else if (modeAccio == 3) {
        if (notesAlumnes.containsKey(valor)) {
          ultimMissatge = "Informació de " + valor + " -> Edat: " + edatsAlumnes.get(valor) + " anys | Nota final: " + notesAlumnes.get(valor);
        } else {
          ultimMissatge = "No s'ha trobat l'alumne '" + valor + "'.";
        }
        println(ultimMissatge);
        modeAccio = 0;
        pasEntrada = 0;
      } else if (modeAccio == 4) {
        if (pasEntrada == 1) {
          if (!notesAlumnes.containsKey(valor)) {
            ultimMissatge = "No s'ha trobat l'alumne '" + valor + "'.";
            println(ultimMissatge);
            modeAccio = 0;
            pasEntrada = 0;
          } else {
            nomTemporal = valor;
            pasEntrada = 2;
            ultimMissatge = "Nota actual de " + nomTemporal + ": " + notesAlumnes.get(nomTemporal) + ". Introdueix la nova nota.";
          }
        } else if (pasEntrada == 2) {
          double novaNota = double(valor);
          notesAlumnes.put(nomTemporal, novaNota);
          ultimMissatge = "S'ha actualitzat la nota de " + nomTemporal + " a " + novaNota + ".";
          println(ultimMissatge);
          modeAccio = 0;
          pasEntrada = 0;
        }
      }
      return;
    } else if (key == BACKSPACE) {
      if (textEntrada.length() > 0) {
        textEntrada = textEntrada.substring(0, textEntrada.length() - 1);
      }
      return;
    } else if (key == ESC) {
      modeAccio = 0;
      pasEntrada = 0;
      textEntrada = "";
      ultimMissatge = "Operació cancel·lada.";
      key = 0;
      return;
    } else if (key != CODED && key >= 32) {
      textEntrada += key;
      return;
    }
  }

  if (key == '1') {
    modeAccio = 1;
    pasEntrada = 1;
    textEntrada = "";
    ultimMissatge = "Afegir alumne -> escriu el nom i prem ENTER.";
  } else if (key == '2') {
    mostrarAlumnesConsola();
    ultimMissatge = "Llistat d'alumnes mostrat per consola.";
  } else if (key == '3') {
    modeAccio = 3;
    pasEntrada = 1;
    textEntrada = "";
    ultimMissatge = "Consultar alumne -> escriu el nom i prem ENTER.";
  } else if (key == '4') {
    modeAccio = 4;
    pasEntrada = 1;
    textEntrada = "";
    ultimMissatge = "Modificar nota -> escriu el nom de l'alumne i prem ENTER.";
  } else if (key == '5') {
    if (notesAlumnes.isEmpty()) {
      ultimMissatge = "No hi ha notes per calcular la mitjana.";
    } else {
      double suma = 0.0;
      for (Map.Entry<String, Double> entrada : notesAlumnes.entrySet()) {
        suma += entrada.getValue();
      }
      double mitjana = suma / notesAlumnes.size();
      ultimMissatge = "La nota mitjana del grup és: " + nf((float) mitjana, 1, 2) + ".";
    }
    println(ultimMissatge);
  } else if (key == '6') {
    String llistaAprovats = "";
    int comptador = 0;
    for (String nom : ordreAlumnes) {
      double nota = notesAlumnes.get(nom);
      if (nota >= 5.0) {
        if (comptador > 0) llistaAprovats += ", ";
        llistaAprovats += nom + " (" + nf((float) nota, 1, 1) + ")";
        comptador++;
      }
    }
    if (comptador == 0) {
      ultimMissatge = "Cap alumne ha aprovat (nota >= 5.0).";
    } else {
      ultimMissatge = "Alumnes aprovats (" + comptador + "): " + llistaAprovats + ".";
    }
    println(ultimMissatge);
  } else if (key == '0') {
    ultimMissatge = "Eixint del programa...";
    println(ultimMissatge);
    exit();
  } else if (key != CODED) {
    ultimMissatge = "Opció no vàlida ('" + key + "').";
    println(ultimMissatge);
  }
}
