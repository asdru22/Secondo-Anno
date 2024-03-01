package Thread;

public class TreThread implements Runnable {
    @Override
    public void run() {
        System.out.println("Thread " + Thread.currentThread()); // <=
        for (int i = 0; i < 10; i++) {
            System.out.print(" " + (i + 1) + " ");
        }
        System.out.println(" ");
    }

    public static void main(String[] args) {
        TreThread t1 = new TreThread();
        System.out.println("Thread main " + Thread.currentThread()); // <=

        Thread threadContatore = new Thread(t1);
        threadContatore.start();
        System.out.println("Thread contatore attivato");

        TreThread t2 = new TreThread();
        Thread secondoContatore = new Thread(t2);
        secondoContatore.start();
    }
}