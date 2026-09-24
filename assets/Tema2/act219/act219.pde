/**
 * Classe principal per a la gestió d'operacions matemàtiques i 
 * representació gràfica bàsica dins de l'entorn de Processing.
 * 
 * @author Alumne de Programació
 * @version 1.0
 * @since 2026-06-01
 */
public class Activitat219 {

    /** Amplada per defecte del llenç gràfic. */
    public static final int AMPLADA = 800;
    
    /** Alçada per defecte del llenç gràfic. */
    public static final int ALCADA = 600;

    /**
     * Mètode principal encarregat de calcular l'àrea d'un rectangle 
     * a partir de la seua base i la seua altura.
     * 
     * @_param base L'amplada o base del rectangle (en píxels o unitats).
     * @_param altura L'alçada del rectangle (en píxels o unitats).
     * @return Retorna l'àrea total calculada com a nombre decimal (float).
     * @throws IllegalArgumentException si la base o l'altura són negatives.
     */
    public float calcularAreaRectangle(float base, float altura) {
        if (base < 0 || altura < 0) {
            throw new IllegalArgumentException("Els valors no poden ser negatius.");
        }
        return base * altura;
    }

    /**
     * Mètode auxiliar per comprovar si un nombre enter és parell.
     * 
     * @_param nombre El número enter que es vol avaluar.
     * @return Retorna {@code true} si el nombre és parell, o {@code false} si és senar.
     */
    public boolean esParell(int nombre) {
        return (nombre % 2 == 0);
    }
}
