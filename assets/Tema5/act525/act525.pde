/*
 * Activitat 526. Activitat final: gestor de dades XML (Catàleg de videojocs)
 * Flux bidireccional XML <-> DOM <-> Dades del programa en Processing IDE.
 */

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

Document docXML;
ArrayList<String> titols;
HashMap<String, String> generes;
HashMap<String, Double> preus;
HashMap<String, Double> valoracions;

String ultimMissatge = "Prem una tecla d'opció (1-7).";

// Estat d'entrada per teclat:
// 0: menú | 2: buscar | 3: afegir | 4: modificar | 5: eliminar
int modeAccio = 0;
int pasEntrada = 0;
String textEntrada = "";
String titolTemp = "";
String genereTemp = "";
String preuTemp = "";

void setup() {
  size(820, 460);

  titols = new ArrayList<String>();
  generes = new HashMap<String, String>();
  preus = new HashMap<String, Double>();
  valoracions = new HashMap<String, Double>();

  try {
    File fitxer = new File(dataPath("videojocs.xml"));
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = factory.newDocumentBuilder();
    docXML = builder.parse(fitxer);
    docXML.getDocumentElement().normalize();

    // XML -> Document DOM -> Dades del programa
    NodeList llista = docXML.getElementsByTagName("videojoc");
    for (int i = 0; i < llista.getLength(); i++) {
      Node n = llista.item(i);
      if (n.getNodeType() == Node.ELEMENT_NODE) {
        Element el = (Element) n;
        String titol = el.getElementsByTagName("titol").item(0).getTextContent().trim();
        String genere = el.getElementsByTagName("genere").item(0).getTextContent().trim();
        double preu = Double.parseDouble(el.getElementsByTagName("preu").item(0).getTextContent().trim());
        double valoracio = Double.parseDouble(el.getElementsByTagName("valoracio").item(0).getTextContent().trim());

        titols.add(titol);
        generes.put(titol, genere);
        preus.put(titol, preu);
        valoracions.put(titol, valoracio);
      }
    }

    ultimMissatge = "Catàleg carregat des de 'data/videojocs.xml' (" + titols.size() + " videojocs).";
  } catch (Exception e) {
    e.printStackTrace();
    ultimMissatge = "Error en carregar 'data/videojocs.xml': " + e.getMessage();
  }

  println("\n=== GESTOR DE DADES XML (CATÀLEG DE VIDEOJOCS) ===");
  println("1. Mostrar tots els videojocs");
  println("2. Buscar un videojoc");
  println("3. Afegir un videojoc");
  println("4. Modificar-ne les dades");
  println("5. Eliminar un videojoc");
  println("6. Calcular estadístiques");
  println("7. Guardar els canvis en el document XML");
}

void draw() {
  background(245);

  fill(25);
  textSize(19);
  text("Activitat 526 - Gestor de dades XML (Videojocs)", 25, 35);

  textSize(13);
  text("Videojocs al catàleg: " + titols.size(), 25, 65);

  int yLlista = 92;
  if (titols.isEmpty()) {
    fill(160, 40, 40);
    text("No hi ha cap videojoc al catàleg.", 35, yLlista);
  } else {
    fill(25);
    for (int i = 0; i < titols.size(); i++) {
      String t = titols.get(i);
      text("• " + (i + 1) + ". " + t +
           " | Gènere: " + generes.get(t) +
           " | Preu: " + nf((float) preus.get(t).doubleValue(), 1, 2) + " EUR" +
           " | Valoració: " + nf((float) valoracions.get(t).doubleValue(), 1, 1), 35, yLlista);
      yLlista += 22;
    }
  }

  int yMenu = 275;
  fill(25);
  text("[1] Mostrar tots   [2] Buscar   [3] Afegir   [4] Modificar", 25, yMenu);
  text("[5] Eliminar       [6] Estadístiques      [7] Guardar XML", 25, yMenu + 22);

  if (modeAccio != 0) {
    fill(140, 60, 10);
    textSize(14);
    String prompt = "";
    if (modeAccio == 2) prompt = "Buscar videojoc -> TÍTOL i ENTER: ";
    else if (modeAccio == 3 && pasEntrada == 1) prompt = "Afegir -> TÍTOL i ENTER: ";
    else if (modeAccio == 3 && pasEntrada == 2) prompt = "Afegir '" + titolTemp + "' -> GÈNERE i ENTER: ";
    else if (modeAccio == 3 && pasEntrada == 3) prompt = "Afegir '" + titolTemp + "' -> PREU i ENTER: ";
    else if (modeAccio == 3 && pasEntrada == 4) prompt = "Afegir '" + titolTemp + "' -> VALORACIÓ (0-10) i ENTER: ";
    else if (modeAccio == 4 && pasEntrada == 1) prompt = "Modificar -> TÍTOL i ENTER: ";
    else if (modeAccio == 4 && pasEntrada == 2) prompt = "Nou GÈNERE per a '" + titolTemp + "' i ENTER: ";
    else if (modeAccio == 4 && pasEntrada == 3) prompt = "Nou PREU per a '" + titolTemp + "' i ENTER: ";
    else if (modeAccio == 4 && pasEntrada == 4) prompt = "Nova VALORACIÓ per a '" + titolTemp + "' i ENTER: ";
    else if (modeAccio == 5) prompt = "Eliminar -> TÍTOL i ENTER: ";
    text(prompt + textEntrada + "_", 25, 335);
  }

  fill(15, 80, 150);
  textSize(14);
  text("Estat: " + ultimMissatge, 25, 378, width - 50, 65);
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

      if (modeAccio == 2) {
        String trobatTitol = null;
        for (String t : titols) {
          if (t.equalsIgnoreCase(valor)) {
            trobatTitol = t;
            break;
          }
        }
        if (trobatTitol != null) {
          ultimMissatge = "Trobat -> " + trobatTitol +
                         " | Gènere: " + generes.get(trobatTitol) +
                         " | Preu: " + preus.get(trobatTitol) +
                         " | Valoració: " + valoracions.get(trobatTitol);
        } else {
          ultimMissatge = "No s'ha trobat cap videojoc amb el títol '" + valor + "'.";
        }
        println(ultimMissatge);
        modeAccio = 0;
        pasEntrada = 0;
      } else if (modeAccio == 3) {
        if (pasEntrada == 1) {
          titolTemp = valor;
          pasEntrada = 2;
          ultimMissatge = "Introdueix el gènere de '" + titolTemp + "'.";
        } else if (pasEntrada == 2) {
          genereTemp = valor;
          pasEntrada = 3;
          ultimMissatge = "Introdueix el preu de '" + titolTemp + "'.";
        } else if (pasEntrada == 3) {
          preuTemp = valor;
          pasEntrada = 4;
          ultimMissatge = "Introdueix la valoració de '" + titolTemp + "'.";
        } else if (pasEntrada == 4) {
          double preuVal = Double.parseDouble(preuTemp);
          double valNum = Double.parseDouble(valor);

          titols.add(titolTemp);
          generes.put(titolTemp, genereTemp);
          preus.put(titolTemp, preuVal);
          valoracions.put(titolTemp, valNum);

          ultimMissatge = "Afegit '" + titolTemp + "' (prem [7] per guardar a l'XML).";
          println(ultimMissatge);
          modeAccio = 0;
          pasEntrada = 0;
        }
      } else if (modeAccio == 4) {
        if (pasEntrada == 1) {
          String trobatTitol = null;
          for (String t : titols) {
            if (t.equalsIgnoreCase(valor)) {
              trobatTitol = t;
              break;
            }
          }
          if (trobatTitol != null) {
            titolTemp = trobatTitol;
            pasEntrada = 2;
            ultimMissatge = "Modificant '" + titolTemp + "' -> escriu el nou GÈNERE.";
          } else {
            ultimMissatge = "No s'ha trobat el videojoc '" + valor + "'.";
            println(ultimMissatge);
            modeAccio = 0;
            pasEntrada = 0;
          }
        } else if (pasEntrada == 2) {
          genereTemp = valor;
          pasEntrada = 3;
          ultimMissatge = "Escriu el nou PREU per a '" + titolTemp + "'.";
        } else if (pasEntrada == 3) {
          preuTemp = valor;
          pasEntrada = 4;
          ultimMissatge = "Escriu la nova VALORACIÓ per a '" + titolTemp + "'.";
        } else if (pasEntrada == 4) {
          double preuVal = Double.parseDouble(preuTemp);
          double valNum = Double.parseDouble(valor);

          generes.put(titolTemp, genereTemp);
          preus.put(titolTemp, preuVal);
          valoracions.put(titolTemp, valNum);

          ultimMissatge = "Actualitzat '" + titolTemp + "' (prem [7] per guardar a l'XML).";
          println(ultimMissatge);
          modeAccio = 0;
          pasEntrada = 0;
        }
      } else if (modeAccio == 5) {
        String trobatTitol = null;
        for (String t : titols) {
          if (t.equalsIgnoreCase(valor)) {
            trobatTitol = t;
            break;
          }
        }
        if (trobatTitol != null) {
          titols.remove(trobatTitol);
          generes.remove(trobatTitol);
          preus.remove(trobatTitol);
          valoracions.remove(trobatTitol);
          ultimMissatge = "Eliminat '" + trobatTitol + "' del catàleg (prem [7] per guardar a l'XML).";
        } else {
          ultimMissatge = "No s'ha trobat cap videojoc amb el títol '" + valor + "'.";
        }
        println(ultimMissatge);
        modeAccio = 0;
        pasEntrada = 0;
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
    println("\n--- LLISTAT DE VIDEOJOCS ---");
    for (int i = 0; i < titols.size(); i++) {
      String t = titols.get(i);
      println((i + 1) + ". " + t + " | Gènere: " + generes.get(t) +
              " | Preu: " + preus.get(t) + " | Valoració: " + valoracions.get(t));
    }
    ultimMissatge = "Llistat mostrat per consola (" + titols.size() + " videojocs).";
  } else if (key == '2') {
    modeAccio = 2;
    pasEntrada = 1;
    textEntrada = "";
    ultimMissatge = "Buscar videojoc -> escriu el títol i prem ENTER.";
  } else if (key == '3') {
    modeAccio = 3;
    pasEntrada = 1;
    textEntrada = "";
    ultimMissatge = "Afegir videojoc -> escriu el títol i prem ENTER.";
  } else if (key == '4') {
    modeAccio = 4;
    pasEntrada = 1;
    textEntrada = "";
    ultimMissatge = "Modificar videojoc -> escriu el títol i prem ENTER.";
  } else if (key == '5') {
    modeAccio = 5;
    pasEntrada = 1;
    textEntrada = "";
    ultimMissatge = "Eliminar videojoc -> escriu el títol i prem ENTER.";
  } else if (key == '6') {
    if (titols.isEmpty()) {
      ultimMissatge = "No hi ha dades per calcular estadístiques.";
    } else {
      double sumaPreus = 0.0;
      double sumaValoracions = 0.0;
      double maxVal = -1.0;
      String millorJoc = "";

      for (String t : titols) {
        double p = preus.get(t);
        double v = valoracions.get(t);
        sumaPreus += p;
        sumaValoracions += v;
        if (v > maxVal) {
          maxVal = v;
          millorJoc = t;
        }
      }

      double preuMitja = sumaPreus / titols.size();
      double valMitjana = sumaValoracions / titols.size();
      ultimMissatge = "Preu mitjà: " + nf((float) preuMitja, 1, 2) + " EUR" +
                      " | Valoració mitjana: " + nf((float) valMitjana, 1, 2) +
                      " | Millor valorat: " + millorJoc + " (" + maxVal + ")";
    }
    println(ultimMissatge);
  } else if (key == '7') {
    // Dades del programa -> Document DOM -> XML
    try {
      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      DocumentBuilder builder = factory.newDocumentBuilder();
      Document nouDoc = builder.newDocument();

      Element arrel = nouDoc.createElement("videojocs");
      nouDoc.appendChild(arrel);

      for (String t : titols) {
        Element elJoc = nouDoc.createElement("videojoc");

        Element elTitol = nouDoc.createElement("titol");
        elTitol.setTextContent(t);

        Element elGenere = nouDoc.createElement("genere");
        elGenere.setTextContent(generes.get(t));

        Element elPreu = nouDoc.createElement("preu");
        elPreu.setTextContent(String.valueOf(preus.get(t)));

        Element elVal = nouDoc.createElement("valoracio");
        elVal.setTextContent(String.valueOf(valoracions.get(t)));

        elJoc.appendChild(elTitol);
        elJoc.appendChild(elGenere);
        elJoc.appendChild(elPreu);
        elJoc.appendChild(elVal);
        arrel.appendChild(elJoc);
      }

      docXML = nouDoc;

      TransformerFactory tf = TransformerFactory.newInstance();
      Transformer transformer = tf.newTransformer();
      transformer.setOutputProperty(OutputKeys.INDENT, "yes");
      transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

      File fitxerSortida = new File(dataPath("videojocs.xml"));
      transformer.transform(new DOMSource(docXML), new StreamResult(fitxerSortida));

      ultimMissatge = "Canvis guardats correctament a 'data/videojocs.xml'.";
    } catch (Exception e) {
      e.printStackTrace();
      ultimMissatge = "Error en guardar 'data/videojocs.xml': " + e.getMessage();
    }
    println(ultimMissatge);
  }
}
