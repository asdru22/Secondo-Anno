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

        String binaryString = readBinary(args[0]);

        List<String> l = decode(binaryString, dict);
        System.out.println(l.size());
        System.out.println(l);

    }

    public static List<String> decode(String binaryString, HashMap<String, Character> codes) {
        /*
        Complessità: O(n*k)
        n: lunghezza della stringa
        k: numero di elementi nel dizionario
        */

        // caso stringa vuota
        if (binaryString == null) return new ArrayList<>();

        int n = binaryString.length();

        // Mappa per memorizzare le sequenze di caratteri per ogni prefisso.
        // Integer corrisponde alla lunghezza della stringa e la lista sono
        // tutte le combinazioni possibili.
        HashMap<Integer, List<String>> sequences = new HashMap<>();
        sequences.put(0, new ArrayList<>());
        sequences.get(0).add("");  // La stringa vuota corrisponde a una sola sequenza di caratteri
        int keyLength, startIndex;
        // Itera su ogni posizione della stringa binaria
        for (int i = 1; i <= n; i++) {
            // Aggiunge una lista vuota alla chiave i
            sequences.put(i, new ArrayList<>());

            // Controlla tutti i codici disponibili
            for (String key : codes.keySet()) {
                keyLength = key.length();
                startIndex = i - keyLength;
                // Se "key" è sotto-stringa di "binaryString" ed esiste una sotto-stringa nell'intervallo
                // [i-keyLength, i] che corrisponde a un carattere del dizionario, creo una nuova
                // sotto-stringa che è formata da tutte quelle precedenti e quella nuova (con
                // lunghezze compatibili).
                if (i >= keyLength &&
                        binaryString.substring(startIndex, i).equals(key) &&
                        sequences.containsKey(startIndex)) {
                    // Aggiunge le sequenze precedenti a quelle correnti
                    for (String prefix : sequences.get(startIndex)) {
                        sequences.get(i).add(prefix + codes.get(key));
                    }
                }
            }
        }

        // Ritorna tutte le sequenze di caratteri per il prefisso di lunghezza n,
        // che corrisponde alla lunghezza della stringa in input. Quindi restituisce tutte
        // le combinazioni per la stringa in input.
        return sequences.get(n);
    }

    static String readBinary(String filename) {
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