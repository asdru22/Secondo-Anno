import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/*
 * Nanni Alessandro
 * Matricola 0001027757
 * alessandro.nanni17@studio.unibo.it
 */
public class Esercizio2 {
    public static void main(String[] args) {

        HashMap<String, Character> dict = getInvDict();

        String binaryString = readFile(args[0]);

        List<String> l = decode(binaryString, dict);
        int len = l.size();
        System.out.println(l.size());
        if(len>=1) System.out.println(l);

    }

    public static List<String> decode(String binaryString, HashMap<String, Character> codes) {
        /*
        Complessità: O(n*k)
        n: numero di caratteri nella stringa
        k: numero di elementi nel dizionario
        Se non ci sono combinazioni possibili verrà restituita una lista vuota
        */

        // caso stringa vuota
        if (binaryString == null) return new ArrayList<>();

        int stringLength = binaryString.length();

        // Mappa per memorizzare le sequenze di caratteri per ogni prefisso.
        // Integer corrisponde alla lunghezza della stringa e la lista sono
        // tutte le combinazioni possibili.
        HashMap<Integer, List<String>> sequences = new HashMap<>();
        // caso base
        sequences.put(0, new ArrayList<>());
        sequences.get(0).add("");  // La stringa vuota corrisponde a una sola sequenza di caratteri, quella nulla

        int startIndex;
        for (int substringLength = 1; substringLength <= stringLength; substringLength++) {
            sequences.put(substringLength, new ArrayList<>());

            // Controlla tutti i codici disponibili
            for (String key : codes.keySet()) {
                startIndex = substringLength - key.length();

                // Se "key" è sotto-stringa di "binaryString" ed esiste una sotto-stringa nell'intervallo
                // [substringLength-keyLength, substringLength] che corrisponde a un carattere del dizionario,
                // aggiungo una nuova stringa che è formata da quelle precedenti e quella nuova.
                if (startIndex >= 0 &&
                        binaryString.substring(startIndex, substringLength).equals(key) &&
                        sequences.containsKey(startIndex)) {
                    // Aggiunge le sequenze precedenti a quelle correnti
                    for (String prefix : sequences.get(startIndex)) {
                        sequences.get(substringLength).add(prefix + codes.get(key));
                    }
                }
            }
        }

        // Ritorna tutte le sequenze di caratteri per il prefisso di lunghezza uguale a quella della stringa in input
        return sequences.get(stringLength);
    }

    static String readFile(String filename) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            return reader.readLine();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    static HashMap<String, Character> getInvDict() {
        // Tabella inversa di quella fornita nella consegna
        HashMap<String, Character> dict = new HashMap<>();
        dict.put("0", 'a');
        dict.put("00", 'b');
        dict.put("001", 'c');
        dict.put("010", 'd');
        dict.put("0010", 'e');
        dict.put("0100", 'f');
        dict.put("0110", 'g');
        dict.put("0001", 'h');
        return dict;
    }
}