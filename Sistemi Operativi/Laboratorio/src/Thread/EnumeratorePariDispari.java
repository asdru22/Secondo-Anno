package Thread;

public class EnumeratorePariDispari extends Thread {
    private int limiteSuperiore;
    private boolean pari;

    public EnumeratorePariDispari(int n, boolean pari) {
        limiteSuperiore = n;
        this.pari = pari;
    }

    public void run() {
        for (int i = 0; i < limiteSuperiore; i++) {
            if (pari) { // stampa il numero solo se e’ pari
                if (i % 2 == 0)
                    System.out.println("pari " + i);
            } else { // stampa il numero solo se e’ dispari
                if (i % 2 == 1)
                    System.out.println("dispari " + i);
            }
        }
    }

    public static void main(String[] args) {
        int n = Integer.parseInt("1000");
        Thread tp = new EnumeratorePariDispari(n, true);
        Thread td = new EnumeratorePariDispari(n, false);

        System.out.println("Attivazione thread pari e dispari fino a " + n);
        tp.start();
        td.start();
        System.out.println("Attesa terminazione thread pari e dispari");

        try { // controllo fine processi
            tp.join();
            td.join();
        } catch (InterruptedException e) {
            System.out.println(e);
        }
        System.out.println("Thread pari e dispari terminati");
    }
}