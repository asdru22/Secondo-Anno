import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

/*
 Nanni Alessandro
 Matricola 0001027757
 alessandro.nanni17@studio.unibo.it

 Strutture usate:
    dizionario
 Metodi usati:
    decode, richiede tempo O(n*k)
 */
public class Esercizio2 {
    public static void main(String[] args) {

        HashMap<String, Character> dict = getInvDict();

        String binaryString = readFile(args[0]);

        List<String> l = decode(binaryString, dict);
        int len = l.size();
        System.out.println(l.size()+((len==0) ? "" : ","));
        if(len>=1){
            // sort ha costo O(n*log(n)  )
            Collections.sort(l);
            for(String s : l){
                System.out.println(s+",");
            }
        }

    }

    // trova le combinazioni di caratteri possibili per la stringa in input
    public static List<String> decode(String binaryString, HashMap<String, Character> dict) {
        /*
        Complessità: O(n*k*l)
        n: numero di caratteri nella stringa
        k: numero di elementi nel dizionario
        l: lunghezza massima della chiave più lunga
        Se non ci sono combinazioni possibili verrà restituita una lista vuota
        */

        // caso stringa vuota
        if (binaryString == null) return new ArrayList<>();

        int stringLength = binaryString.length();

        // Mappa per memorizzare le sequenze di caratteri per ogni prefisso.
        // Integer corrisponde alla lunghezza della stringa e la lista contiene
        // tutte le combinazioni possibili.
        HashMap<Integer, List<String>> combinations = new HashMap<>();
        // caso base
        combinations.put(0, new ArrayList<>());
        combinations.get(0).add("");  // La stringa vuota corrisponde a una sola sequenza di caratteri, quella nulla

        int startIndex;
        for (int substringLength = 1; substringLength <= stringLength; substringLength++) {
            combinations.put(substringLength, new ArrayList<>());

            // Controlla tutti i codici disponibili
            for (String key : dict.keySet()) {
                startIndex = substringLength - key.length();

                // Se "key" è sotto-stringa di "binaryString" ed esiste una sotto-stringa nell'intervallo
                // [substringLength-keyLength, substringLength] che corrisponde a un carattere del dizionario,
                // aggiungo una nuova stringa che è formata da quelle precedenti e quella nuova.
                if (startIndex >= 0 &&
                        binaryString.substring(startIndex, substringLength).equals(key) &&
                        combinations.containsKey(startIndex)) {
                    // Aggiunge le sequenze precedenti a quelle correnti
                    for (String prefix : combinations.get(startIndex)) {
                        combinations.get(substringLength).add(prefix + dict.get(key));
                    }
                }
            }
        }

        // Ritorna tutte le sequenze di caratteri per il prefisso di lunghezza uguale
        // a quella della stringa in input
        return combinations.get(stringLength);
    }

    // lettura file
    static String readFile(String filename) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            return reader.readLine();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // restituisce dizionario inverso
    static HashMap<String, Character> getInvDict() {
        HashMap<String, Character> dict = new HashMap<>();
        dict.put("0", 'A');
        dict.put("00", 'B');
        dict.put("001", 'C');
        dict.put("010", 'D');
        dict.put("0010", 'E');
        dict.put("0100", 'F');
        dict.put("0110", 'G');
        dict.put("0001", 'H');
        return dict;
    }
}