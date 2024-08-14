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
        Complessità: O(n*b)
        n: lunghezza della stringa
        b: dimensione del dizionario
        */
        int n = binaryString.length();
        int keyLength;
        // Lista di liste per memorizzare le sequenze di caratteri per ogni prefisso
        List<String>[] paths = new ArrayList[n + 1];
        for (int i = 0; i <= n; i++) {
            paths[i] = new ArrayList<>();
        }
        paths[0].add("");  // La stringa vuota corrisponde a una sola sequenza di caratteri

        // Itera su ogni posizione della stringa binaria
        for (int i = 1; i <= n; i++) {
            // Controlla tutti i codici disponibili
            for (String key : codes.keySet()) {
                keyLength = key.length();
               /*
               Se "code" è sottostringa di "binaryString" ed esiste una sottostringa nell'intervallo
               [i-codeLength, i] che corrisponde a un carattere del dizionario, creo una nuova
               sottostringa che è formata da tutte quelle precedenti e quella nuova (con
               lunghezze compatibili).
               */
                if (i >= keyLength && binaryString.substring(i - keyLength, i).equals(key)) {
                    // Aggiunge le sequenze precedenti a quello corrente
                    for (String prefix : paths[i - keyLength]) {
                        paths[i].add(prefix + codes.get(key));
                    }
                }
            }
        }

        // Ritorna tutte le sequenze di caratteri per il prefisso di lunghezza n,
        // che corrisponde alla lunghezza della stringa in input.
        return paths[n];
    }

    static String readBinary(String filename) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            StringBuilder out = new StringBuilder();
            if ((line = reader.readLine()) != null) {
                for (int i = 0; i < line.length(); i++) {
                    out.append(line.charAt(i));
                }
                return out.toString();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    static HashMap<String, Character> getInvDict() {
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

    static HashMap<Character, String> getDict() {
        HashMap<Character, String> dict = new HashMap<>();
        dict.put('a',"0");
        dict.put('b',"00");
        dict.put('c',"001");
        dict.put('d',"010");
        dict.put('e',"0010");
        dict.put('f',"0100");
        dict.put('g',"0110");
        dict.put('h',"0001");
        return dict;
    }
}