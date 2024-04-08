package prod_cons_info_server.server;

import java.util.HashMap;

/*
 * Resource implementa una semplice HashMap con associazioni String->String. Ogni chiave ha una sola stringa associata.
 * 
 * La risorsa è accessibile da diversi thread, che possono inserire elementi o estrarli dalla mappa.
 * Se viene richiesto di inserire una chiave già esistente, il thread viene messo in attesa;
 * se viene richiesto di estrarre una chiave non esistente, il thread viene messo in attesa.
 * 
 */
public class Resource {
    private HashMap<String, String> information;

    public Resource() {
        this.information = new HashMap<>();
    }

    /*
     * Inserimento di un elemento nella mappa.
     * 
     * Se la chiave esiste già, rimaniamo in attesa, rilasciando il lock
     * sull'oggetto.
     * 
     * Una volta sbloccati e inserito il nuovo elemento, svegliamo eventuali thread
     * in attesa.
     */

    public synchronized void add(String key, String value) throws InterruptedException {
        while (this.information.get(key) != null) {
            wait();
        }

        this.information.put(key, value);
        notifyAll();
    }

    /*
     * Estrazione di una valore dalla mappa; una volta ottenuto il valore, la chiave
     * viene rimossa.
     * 
     * Duale di add(), rimaniamo in attesa finché la chiave non ha un valore
     * associato.
     */
    public synchronized String extract(String key) throws InterruptedException {
        while (this.information.get(key) == null) {
            wait();
        }
        String result = this.information.get(key);
        this.information.remove(key);
        notifyAll();

        return result;
    }

}
