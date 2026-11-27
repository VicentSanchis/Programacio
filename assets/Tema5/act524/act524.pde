/*
 * Activitat 524. Introducció al DOM: Lectura, Consultes i Modificació d'un XML
 * Llegeix data/alumnes.xml amb DOM, mostra dades, filtres, mitjana i màxim,
 * modifica la nota d'un alumne (Anna -> 9.5) i guarda data/alumnes_modificat.xml.
 */

import java.io.File;
import java.io.StringWriter;
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

String resumPantalla = "";

void setup() {
  size(780, 340);
  background(245);

  try {
    File fitxerEntrada = new File(dataPath("alumnes.xml"));
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = factory.newDocumentBuilder();
    Document doc = builder.parse(fitxerEntrada);
    doc.getDocumentElement().normalize();

    NodeList llistaAlumnes = doc.getElementsByTagName("alumne");
    int totalAlumnes = llistaAlumnes.getLength();

    // 1. Nom, edat i nota de cada alumne
    println("=== 1. DADES COMPLETES DELS ALUMNES ===");
    for (int i = 0; i < totalAlumnes; i++) {
      Node node = llistaAlumnes.item(i);
      if (node.getNodeType() == Node.ELEMENT_NODE) {
        Element elem = (Element) node;
        String nom = elem.getElementsByTagName("nom").item(0).getTextContent().trim();
        String edat = elem.getElementsByTagName("edat").item(0).getTextContent().trim();
        double nota = Double.parseDouble(elem.getElementsByTagName("nota").item(0).getTextContent().trim());
        println("Nom: " + nom + " | Edat: " + edat + " | Nota: " + nota);
      }
    }

    // 2. Només els noms
    println("\n=== 2. NOMS DELS ALUMNES ===");
    for (int i = 0; i < totalAlumnes; i++) {
      Element elem = (Element) llistaAlumnes.item(i);
      String nom = elem.getElementsByTagName("nom").item(0).getTextContent().trim();
      println("- " + nom);
    }

    // 3. Alumnes amb nota >= 5.0
    println("\n=== 3. ALUMNES APROVATS (NOTA >= 5.0) ===");
    for (int i = 0; i < totalAlumnes; i++) {
      Element elem = (Element) llistaAlumnes.item(i);
      String nom = elem.getElementsByTagName("nom").item(0).getTextContent().trim();
      double nota = Double.parseDouble(elem.getElementsByTagName("nota").item(0).getTextContent().trim());
      if (nota >= 5.0) {
        println("- " + nom + " (" + nota + ")");
      }
    }

    // 4. Nota mitjana i alumne amb nota més alta
    double sumaNotes = 0.0;
    double notaMaxima = -1.0;
    String alumneMillorNota = "";

    for (int i = 0; i < totalAlumnes; i++) {
      Element elem = (Element) llistaAlumnes.item(i);
      String nom = elem.getElementsByTagName("nom").item(0).getTextContent().trim();
      double nota = Double.parseDouble(elem.getElementsByTagName("nota").item(0).getTextContent().trim());
      sumaNotes += nota;
      if (nota > notaMaxima) {
        notaMaxima = nota;
        alumneMillorNota = nom;
      }
    }

    double notaMitjana = (totalAlumnes > 0) ? (sumaNotes / totalAlumnes) : 0.0;
    println("\n=== 4. ESTADÍSTIQUES ===");
    println("Nota mitjana: " + nf((float) notaMitjana, 1, 2));
    println("Nota més alta: " + notaMaxima + " (" + alumneMillorNota + ")");

    // 5. Recompte total d'alumnes
    println("\n=== 5. RECOMPTE TOTAL ===");
    println("Nombre d'alumnes: " + totalAlumnes);

    // Part 2: Buscar alumne per nom ("Anna"), modificar nota a 9.5 i guardar
    String nomBuscat = "Anna";
    double novaNota = 9.5;
    boolean trobat = false;

    for (int i = 0; i < totalAlumnes; i++) {
      Element elem = (Element) llistaAlumnes.item(i);
      String nom = elem.getElementsByTagName("nom").item(0).getTextContent().trim();
      if (nom.equalsIgnoreCase(nomBuscat)) {
        elem.getElementsByTagName("nota").item(0).setTextContent(String.valueOf(novaNota));
        trobat = true;
      }
    }

    TransformerFactory tf = TransformerFactory.newInstance();
    Transformer transformer = tf.newTransformer();
    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
    transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

    StringWriter writer = new StringWriter();
    transformer.transform(new DOMSource(doc), new StreamResult(writer));
    String xmlModificatText = writer.toString();

    println("\n=== DOCUMENT XML MODIFICAT ===");
    println(xmlModificatText);

    File fitxerEixida = new File(dataPath("alumnes_modificat.xml"));
    transformer.transform(new DOMSource(doc), new StreamResult(fitxerEixida));

    resumPantalla = "Alumnes: " + totalAlumnes +
                    " | Mitjana: " + nf((float) notaMitjana, 1, 2) +
                    " | Màxima: " + notaMaxima + " (" + alumneMillorNota + ")" +
                    " | Modificat '" + nomBuscat + "' -> " + novaNota + (trobat ? " (guardat)" : " (no trobat)");
  } catch (Exception e) {
    e.printStackTrace();
    resumPantalla = "Error en processar l'XML: " + e.getMessage();
  }

  fill(25);
  textSize(18);
  text("Activitat 524 - Introducció al DOM (Lectura, Consultes i Modificació)", 25, 38);

  textSize(13);
  text(resumPantalla, 25, 92, width - 50, 80);

  fill(80);
  textSize(12);
  text("Fitxer generat: data/alumnes_modificat.xml  |  Detall complet a la consola.", 25, 195);
}
