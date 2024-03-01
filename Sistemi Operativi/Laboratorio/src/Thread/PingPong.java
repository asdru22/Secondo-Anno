package Thread;


public class PingPong extends Thread {
    private String word; // what word to print
    private int delay; // how long to pause (in milliseconds)

    public PingPong(String whatToSay, int delayTime) {
        word = whatToSay;
        delay = delayTime;
    }

    public void run() {
        try {
            while (true) {
                System.out.println(word + " ");
                sleep(delay); // pause before printing next word
            }
        } catch (InterruptedException e) {
            return; // end this thread
        }
    }

    public static void main(String[] args) {
        PingPong p1 = new PingPong("ping", 33); // 1/30 second
        p1.start();
        new PingPong("PONG", 100).start(); // 1/10 second
        /*
        Queste due attività sono concorrenti
        il rapporto tra i ping e i pong non è esatto,
        perché quando i due processi eseguono
        ci sono altri processi in esecuzione.
        Quando scade la 33esima unità di tempo il processo
        va da waiting a ready, quindi è in competizione con gli
        atri processi per l'esecuzione e non è detto che venga eseguito
        immediatamente.

        Questa era una pratica vecchia usata per tentare di sincronizzare i
        processi, si usano quindi delle primitive per garantire la concorrenza
        tra i due processi.
         */
        try{
            p1.join(); // aspetta la fine dell'esecuzione del thread
            System.out.println("Fine thread");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}

